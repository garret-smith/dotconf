
#include <sys/queue.h>
#include <sys/resource.h>
#include <sys/types.h>
#include <sys/sysctl.h>

#include <fcntl.h>
#include <unistd.h>

#include <netinet/tcp_var.h>

#include <err.h>
#include <errno.h>
#include <libutil.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// static char cpuorder[CPUSTATES] = {CP_SYS, CP_INTR, CP_USER, CP_NICE, CP_IDLE};

void getsysctl(const char *name, void *ptr, size_t len) {
    size_t _len = len;
    if(sysctlbyname(name, ptr, &_len, NULL, 0) != 0)
        printf("sysctl(%s...) failed: %s", name, strerror(errno));
    if(_len != len)
        printf("sysctl(%s...) expected %lu, got %lu", name, (unsigned long)len, (unsigned long)_len);
}

long sumcputime(const long cputime[]) {
    return cputime[0] + cputime[1] + cputime[2] + cputime[3] + cputime[4];
}

char* hscale(char* buf, int64_t n) {
    humanize_number(buf, 5, n, "", HN_AUTOSCALE, HN_B | HN_NOSPACE | HN_DECIMAL);
    return buf;
}

int main(int argc, char ** argv) {
    struct timespec updateinterval;

    struct loadavg sysload;
    double load_avg[3];

    struct tcpstat tcpstat;
    uint64_t packets_in, packets_out;
    uint64_t bytes_in, bytes_out;

    time_t tnow;
    struct tm tmnow;
    char time_buf[255];

    long cputime1[CPUSTATES];
    long cputime2[CPUSTATES];
    long cputimediff[CPUSTATES];
    float cpupercent[CPUSTATES];

    /*
    int battery;

    int num_cpu;
    getsysctl("hw.ncpu", &num_cpu, sizeof(num_cpu));

    char cputemp_sysctl_string[256];
    int cputemp;
    float fcputemp;
    */

    long totalcputime;

    u_int v_page_count;
    u_int v_free_count;
    u_int v_wire_count;
    u_int v_active_count;
    u_int v_inactive_count;
    u_int v_cache_count;

    int i;

    float worktime;

    char song_buffer[256];
    int song_fifo;
    int bytes_read;

    char number_buffer1[10];
    char number_buffer2[10];

    const char* const sep = "^fg(#dc322f)][^fg()";

    song_buffer[0] = 0;

    updateinterval.tv_sec = 0;
    updateinterval.tv_nsec = 0;

    if(argc > 1)
        updateinterval.tv_sec = atol(argv[1]);
    else
        updateinterval.tv_sec = 1;

    if(argc > 2)
        updateinterval.tv_nsec = atol(argv[2]);
    else
        updateinterval.tv_nsec = 0;

    // Initialize values
    getsysctl("kern.cp_time", cputime1, sizeof(cputime1));

    getsysctl("net.inet.tcp.stats", &tcpstat, sizeof(tcpstat));
    packets_in = tcpstat.tcps_rcvtotal;
    packets_out = tcpstat.tcps_sndtotal;
    bytes_in = tcpstat.tcps_rcvbyte;
    bytes_out = tcpstat.tcps_sndbyte;

    getsysctl("vm.stats.vm.v_page_count", &v_page_count, sizeof(v_page_count));

    song_fifo = open("/home/gsmith/.config/pianobar/song_fifo", O_RDONLY | O_NONBLOCK);

    while(1) {
        nanosleep(&updateinterval, NULL);

        tnow = time(NULL);
        localtime_r(&tnow, &tmnow);
        strftime(time_buf, 255, "%a, %b %d %I:%M:%S %p", &tmnow);
        printf(" %s", time_buf);

        /*
        getsysctl("hw.acpi.battery.life", &battery, sizeof(battery));
        printf("Battery: %d%%       ", battery);
        */

        getsysctl("vm.loadavg", &sysload, sizeof(sysload));
        for (i = 0; i < 3; i++)
            load_avg[i] = (double)sysload.ldavg[i] / sysload.fscale;
        printf(sep);
        printf("%.2f %.2f %.2f", load_avg[0], load_avg[1], load_avg[2]);

        getsysctl("kern.cp_time", cputime2, sizeof(cputime2));
        // 5 entries: user nice sys interrupt idle
        for(i=0; i<CPUSTATES; i++)
            cputimediff[i] = cputime2[i] - cputime1[i];
        totalcputime = sumcputime(cputimediff);
        for(i=0; i<CPUSTATES; i++)
            cpupercent[i] = (float)cputimediff[i] / (float)totalcputime * 100.0;
        worktime = cpupercent[0] + cpupercent[1] + cpupercent[2] + cpupercent[3];
        printf(sep);
        printf("%3.0f%%", worktime);
        printf("^r(2x12)^r(%.0fx10)^fg(green)^r(%.0fx10)^fg(blue)^r(%.0fx10)^fg(red)^r(%0.fx10)^p(%.0f)^fg()^r(2x12)", cpupercent[0], cpupercent[1], cpupercent[2], cpupercent[3], cpupercent[4]);
        //printf("^pa(380)u^fg(green)n^fg(blue)s^fg(red)i^fg()");
        memmove(cputime1, cputime2, sizeof(cputime1));

        getsysctl("vm.stats.vm.v_free_count", &v_free_count, sizeof(v_free_count));
        getsysctl("vm.stats.vm.v_wire_count", &v_wire_count, sizeof(v_wire_count));
        getsysctl("vm.stats.vm.v_active_count", &v_active_count, sizeof(v_active_count));
        getsysctl("vm.stats.vm.v_inactive_count", &v_inactive_count, sizeof(v_inactive_count));
        getsysctl("vm.stats.vm.v_cache_count", &v_cache_count, sizeof(v_cache_count));
        printf(sep);
        printf("mem: %u%% free (%u%% f %u%% i %u%% c) %u%% w %u%% a",
                100 * (v_free_count + v_inactive_count + v_cache_count) / v_page_count,
                100 * v_free_count / v_page_count,
                100 * v_inactive_count / v_page_count,
                100 * v_cache_count / v_page_count,
                100 * v_wire_count / v_page_count,
                100 * v_active_count / v_page_count);

        /*
        printf(sep);
        printf("CPU Temps(C):");
        for (i=0; i<num_cpu; i+=2) {
            sprintf(cputemp_sysctl_string, "dev.cpu.%d.temperature", i);
            getsysctl(cputemp_sysctl_string, &cputemp, sizeof(cputemp));
            fcputemp = ((float)cputemp - 2732.0) / 10.0;
            printf(" %.0f", fcputemp);
        }
        */

        getsysctl("net.inet.tcp.stats", &tcpstat, sizeof(tcpstat));
        /*
        printf(sep);
        printf("Packets in/out: %4lu/%4lu",
                tcpstat.tcps_rcvtotal - packets_in,
                tcpstat.tcps_sndtotal - packets_out);
        packets_in = tcpstat.tcps_rcvtotal;
        packets_out = tcpstat.tcps_sndtotal;
        */

        printf(sep);
        printf("Bytes in/out: %5s/%5s",
                hscale(number_buffer1, tcpstat.tcps_rcvbyte - bytes_in),
                hscale(number_buffer2, tcpstat.tcps_sndbyte - bytes_out));
        bytes_in = tcpstat.tcps_rcvbyte;
        bytes_out = tcpstat.tcps_sndbyte;

        if(song_fifo != -1 && (bytes_read = read(song_fifo, song_buffer,
                        sizeof(song_buffer))) > 0) {
            song_buffer[bytes_read-1] = 0;
        }

        printf(sep);
        printf("^ca(1, xscreensaver-command -lock)lock^ca()");
        printf(sep);
        printf("^ca(1, xfe)xfe^ca()");
        printf(sep);
        printf("Vol ^ca(1, mixer vol +5)Up^ca() / ^ca(1, mixer vol -5)Down^ca()");

        printf(sep);
        printf("^ca(1, pianobar_next.sh)Next^ca()");
        printf(" / ^ca(1, pianobar_love.sh)Love^ca()");
        printf(" / ^ca(1, pianobar_pause.sh)Pause^ca()");

        printf(sep);
        printf("%s", song_buffer);

        printf("\n");

        fflush(stdout);
    }
    return 0;
}

