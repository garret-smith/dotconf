
#include <sys/resource.h>
#include <sys/types.h>
#include <sys/sysctl.h>

#include <netinet/tcp_var.h>

#include <err.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

static char cpuorder[CPUSTATES] = {CP_SYS, CP_INTR, CP_USER, CP_NICE, CP_IDLE};

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

int main(int argc, char ** argv) {
	struct timespec updateinterval;

	struct tcpstat tcpstat;
	long packets_in, packets_out;

	time_t tnow;
	struct tm tmnow;
	char time_buf[255];

	long cputime1[CPUSTATES];
	long cputime2[CPUSTATES];
	long cputimediff[CPUSTATES];
	float cpupercent[CPUSTATES];

	int battery;

	int tz0temp;
	float ftz0temp;
	int tz1temp;
	float ftz1temp;

	long totalcputime;

	int i;

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

	while(1) {
		nanosleep(&updateinterval, NULL);

		tnow = time(NULL);
		localtime_r(&tnow, &tmnow);
		strftime(time_buf, 255, "%a, %b %d %I:%M:%S %p", &tmnow);
		printf("%s        ", time_buf);

		/*
		getsysctl("hw.acpi.battery.life", &battery, sizeof(battery));
		printf("Battery: %d%%       ", battery);
		*/

		getsysctl("kern.cp_time", cputime2, sizeof(cputime2));
		// 5 entries: user nice sys interrupt idle
		for(i=0; i<CPUSTATES; i++)
			cputimediff[i] = cputime2[i] - cputime1[i];
		totalcputime = sumcputime(cputimediff);
		for(i=0; i<CPUSTATES; i++)
			cpupercent[i] = (float)cputimediff[i] / (float)totalcputime * 100.0;
		float worktime = cpupercent[0] + cpupercent[1] + cpupercent[2] + cpupercent[3];
		printf("%3.0f%%  ", worktime);
		//printf("^ca(1, \"echo user ^fg(green)nice ^fg(blue)sys ^fg(red)int\")");
		//printf("^ca(1, echo) ");
		printf("^r(1x10)^r(%.0fx8)^fg(green)^r(%.0fx8)^fg(blue)^r(%.0fx8)^fg(red)^r(%0.fx8)^p(%.0f)^fg()^r(1x10)", cpupercent[0], cpupercent[1], cpupercent[2], cpupercent[3], cpupercent[4]);
		//printf(" ^ca()");
		memmove(cputime1, cputime2, sizeof(cputime1));

		getsysctl("hw.acpi.thermal.tz0.temperature", &tz0temp, sizeof(tz0temp));
		ftz0temp = ((float)tz0temp - 2732.0) / 10.0;
		printf("      Temp0: %.1fC", ftz0temp);

		getsysctl("hw.acpi.thermal.tz1.temperature", &tz1temp, sizeof(tz1temp));
		ftz1temp = ((float)tz1temp - 2732.0) / 10.0;
		printf("      Temp1: %.1fC", ftz1temp);

		getsysctl("net.inet.tcp.stats", &tcpstat, sizeof(tcpstat));
		printf("      Packets in: %lu    Packets out: %lu", tcpstat.tcps_rcvtotal - packets_in, tcpstat.tcps_sndtotal - packets_out);
		packets_in = tcpstat.tcps_rcvtotal;
		packets_out = tcpstat.tcps_sndtotal;

		printf("\n");
		fflush(stdout);
	}
	return 0;
}

