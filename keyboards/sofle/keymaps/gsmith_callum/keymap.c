#include QMK_KEYBOARD_H

#include "oneshot.h"

enum layers {
    DEF,
    SYM,
    NAV,
    NUM,
};

enum keycodes {
    // Custom oneshot mod implementation with no timers.
    OS_SHFT = SAFE_RANGE,
    OS_CTRL,
    OS_ALT,
    OS_GUI,

    SW_WIN,  // Switch to next window         (cmd-tab)
    SW_LANG, // Switch to next input language (ctl-spc)
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
	[DEF] = LAYOUT(
KC_NO,   KC_NO,   KC_NO,    KC_NO,   KC_NO,   KC_NO,              KC_NO,  KC_NO,  KC_NO, KC_NO, KC_NO, KC_NO,
KC_NO, KC_QUOT, KC_COMM,   KC_DOT,   KC_P,     KC_Y,               KC_F,   KC_G,   KC_C,  KC_R,  KC_L, KC_NO,
KC_NO,    KC_A,    KC_O,     KC_E,   KC_U,     KC_I,               KC_D,   KC_H,   KC_T,  KC_N,  KC_S, KC_NO,
KC_NO, KC_SCLN,    KC_Q,     KC_J,   KC_K,     KC_X, KC_NO, KC_NO, KC_B,   KC_M,   KC_W,  KC_V,  KC_Z, KC_NO,
                  KC_NO,    KC_NO,   MO(2), KC_LSFT, MO(2), MO(1), KC_SPC, MO(1), KC_NO, KC_NO
	), [SYM] = LAYOUT(
KC_NO,  KC_NO,    KC_NO,   KC_NO,   KC_NO,   KC_NO,                      KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO, KC_NO,
KC_NO, KC_ESC,  KC_LBRC, KC_LCBR, KC_LPRN, KC_TILD,                    KC_CIRC, KC_RPRN, KC_RCBR, KC_RBRC,  KC_GRV, KC_NO,
KC_NO, KC_MINS, KC_ASTR,  KC_EQL, KC_UNDS,  KC_DLR,                    KC_HASH,  OS_GUI,  OS_ALT, OS_CTRL, OS_SHFT, KC_NO,
KC_NO, KC_PLUS, KC_PIPE,   KC_AT, KC_SLSH,  KC_PERC,   KC_NO,   KC_NO,   KC_NO, KC_BSLS, KC_AMPR, KC_QUES, KC_EXLM, KC_NO,
                  KC_NO,   KC_NO, KC_TRNS,  KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS,   KC_NO,   KC_NO
	), [NAV] = LAYOUT(
KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,                     KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO, KC_NO,
KC_NO,  KC_TAB,   KC_NO,   KC_NO,   KC_NO, KC_VOLU,                    KC_DEL, KC_HOME,   KC_UP,  KC_END,  KC_DEL, KC_NO,
KC_NO, OS_SHFT, OS_CTRL,  OS_ALT,  OS_GUI, KC_VOLD,                   KC_BSPC, KC_LEFT, KC_DOWN, KC_RGHT, KC_BSPC, KC_NO,
KC_NO,   KC_NO,   KC_NO, KC_MRWD, KC_MFFD, KC_MPLY,   KC_NO,   KC_NO,  KC_ENT, KC_PGDN, KC_PGUP,   KC_NO,  KC_ENT, KC_NO,
                  KC_NO,   KC_NO, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS,   KC_NO,   KC_NO
    ), [NUM] = LAYOUT(
KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO, KC_NO,                       KC_NO,   KC_NO,  KC_NO,   KC_NO,   KC_NO, KC_NO,
KC_NO,    KC_7,    KC_5,    KC_3,    KC_1, KC_9,                         KC_8,    KC_0,   KC_2,    KC_4,    KC_6, KC_NO,
KC_NO, OS_SHFT, OS_CTRL,  OS_ALT,  OS_GUI, KC_F11,                     KC_F10,  OS_GUI, OS_ALT, OS_CTRL, OS_SHFT, KC_NO,
KC_NO,   KC_F7,   KC_F5,   KC_F3,   KC_F1, KC_F9,     KC_NO,   KC_NO,   KC_F8,  KC_F12,  KC_F2,   KC_F4,   KC_F6, KC_NO,
                  KC_NO,   KC_NO, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS,  KC_NO,   KC_NO
    ), [4] = LAYOUT(
KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,               KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO, KC_NO,
KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,               KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO, KC_NO,
KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,               KC_NO, KC_MPLY, KC_MSTP, KC_MUTE, KC_MNXT, KC_NO,
KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO, KC_NO,
              KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,   KC_NO,   KC_NO,   KC_NO
    ), [5] = LAYOUT(
KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO, KC_NO,               KC_NO,   KC_NO,   KC_NO,   KC_NO, KC_NO, KC_NO,
KC_NO, QK_BOOT,  EE_CLR,   KC_NO,   KC_NO, KC_NO,               KC_NO, DT_PRNT,   DT_UP, DT_DOWN, KC_NO, KC_NO,
KC_NO, RGB_TOG, RGB_MOD, RGB_VAD, RGB_VAI, KC_NO,               KC_NO,   KC_NO,   KC_NO,   KC_NO, KC_NO, KC_NO,
KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,   KC_NO,   KC_NO,   KC_NO, KC_NO, KC_NO,
                  KC_NO, KC_TRNS,   KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,   KC_NO, KC_TRNS,   KC_NO
    )
};

layer_state_t layer_state_set_user(layer_state_t state) {
    return update_tri_layer_state(state, SYM, NAV, NUM);
}

#if defined(ENCODER_ENABLE) && defined(ENCODER_MAP_ENABLE)
const uint16_t PROGMEM encoder_map[][NUM_ENCODERS][NUM_DIRECTIONS] = {

};
#endif // defined(ENCODER_ENABLE) && defined(ENCODER_MAP_ENABLE)





