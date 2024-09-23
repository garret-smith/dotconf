// Copyright 2023 QMK
// SPDX-License-Identifier: GPL-2.0-or-later

#include QMK_KEYBOARD_H

// See https://github.com/callum-oakley/qmk_firmware/tree/master/users/callum for callum-style features (one-shot mods and swappers)

// Represents the four states a oneshot key can be in
typedef enum {
    os_up_unqueued,
    os_up_queued,
    os_down_unused,
    os_down_used,
} oneshot_state;

enum layers {
    DVK,
    BKL,
    SYM,
    NAV,
    NUM,
    EXT,
};

enum keycodes {
    // Custom oneshot mod implementation with no timers.
    OS_SHFT = SAFE_RANGE,
    OS_CTRL,
    OS_ALT,
    OS_GUI,

    SW_WIN,  // Switch to next window         (alt-tab)
    SW_APP,  // Switch to next window of app  (cmd-`)
    SW_SWP,  // Switch windows, no dialog     (alt-esc)
};

#define ALT_TAB LALT(KC_TAB)

#define SP_NAV LT(NAV, KC_SPC)
#define ENT_NAV LT(NAV, KC_ENT)
#define ENT_SYM LT(SYM, KC_ENT)
#define BS_SYM LT(SYM, KC_BSPC)
#define BS_NAV LT(NAV, KC_BSPC)

// For HRMs
#define SFT_T_A LSFT_T(KC_A)
#define CTL_T_O LCTL_T(KC_O)
#define LALT_T_E LALT_T(KC_E)
#define GUI_T_U LGUI_T(KC_U)

#define GUI_T_H RGUI_T(KC_H)
#define ALT_T_T RALT_T(KC_T)
#define CTL_T_N RCTL_T(KC_N)
#define SFT_T_S RSFT_T(KC_S)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [DVK] = LAYOUT_split_3x5_3(
  //,--------------------------------------------.                    ,--------------------------------------------.
      KC_QUOT, KC_COMM,  KC_DOT,    KC_P,    KC_Y,                         KC_F,    KC_G,    KC_C,    KC_R,    KC_L,
  //|--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------|
         KC_A,    KC_O,    KC_E,    KC_U,    KC_I,                         KC_D,    KC_H,    KC_T,    KC_N,    KC_S,
  //|--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------|
      KC_SCLN,    KC_Q,    KC_J,    KC_K,    KC_X,                         KC_B,    KC_M,    KC_W,    KC_V,    KC_Z,
  //|--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------|
                                 MO(NAV), KC_LSFT, CW_TOGG,    MO(EXT),  KC_SPC, ENT_SYM
                             //`--------------------------'  `--------------------------'
  ),

    [BKL] = LAYOUT_split_3x5_3(
  //,--------------------------------------------.                    ,--------------------------------------------.
         KC_Q,    KC_H,    KC_O,    KC_U, KC_COMM,                         KC_G,    KC_L,    KC_R,    KC_F,    KC_B,
  //|--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------|
         KC_J,    KC_I,    KC_E,    KC_A,    KC_Y,                         KC_D,    KC_T,    KC_S,    KC_N,    KC_P,
  //|--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------|
         KC_X,    KC_K, KC_QUOT,  KC_DOT, KC_SCLN,                         KC_V,    KC_M,    KC_C,    KC_W,    KC_Z,
  //|--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------|
                                 MO(NAV), KC_LSFT, CW_TOGG,    MO(EXT),  KC_SPC, ENT_SYM
                             //`--------------------------'  `--------------------------'
// BEAKL-43 (ish) - create a SYM_BEAKL and NAV_BEAKL layer for better symbols and navigation
  ),

    [SYM] = LAYOUT_split_3x5_3(
  //,--------------------------------------------.                    ,--------------------------------------------.
       KC_ESC, KC_LBRC, KC_LCBR, KC_LPRN, KC_TILD,                      KC_CIRC, KC_RPRN, KC_RCBR, KC_RBRC,  KC_GRV,
  //|--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------|
      KC_MINS, KC_ASTR,  KC_EQL, KC_UNDS,  KC_DLR,                      KC_HASH,  OS_GUI,  OS_ALT, OS_CTRL, OS_SHFT,
  //|--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------|
      KC_PLUS, KC_BSLS,   KC_AT, KC_SLSH, KC_LABK,                      KC_RABK, KC_PERC, KC_AMPR, KC_QUES, KC_EXLM,
  //|--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------|
                                 MO(NAV), KC_LSFT, CW_TOGG,    MO(EXT),  KC_SPC, ENT_SYM
                             //`--------------------------'  `--------------------------'
  ),

    [NAV] = LAYOUT_split_3x5_3(
  //,--------------------------------------------.                    ,--------------------------------------------.
       KC_TAB,  SW_WIN,  SW_APP,  SW_SWP, KC_VOLU,                       KC_DEL, KC_HOME,   KC_UP,  KC_END,  KC_TAB,
  //|--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------|
      OS_SHFT, OS_CTRL,  OS_ALT,  OS_GUI, KC_VOLD,                      KC_BSPC, KC_LEFT, KC_DOWN, KC_RGHT, KC_LGUI,
  //|--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, KC_MRWD, KC_MFFD, KC_MPLY,                       KC_ENT, KC_PGUP, XXXXXXX, KC_PGDN,  KC_INS,
  //|--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------|
                                 MO(NAV), KC_LSFT, CW_TOGG,    MO(EXT),  KC_SPC, ENT_SYM
                             //`--------------------------'  `--------------------------'

  ),
    [NUM] = LAYOUT_split_3x5_3(
  //,--------------------------------------------.                    ,--------------------------------------------.
         KC_7,    KC_5,    KC_3,    KC_1,    KC_9,                         KC_8,    KC_0,    KC_2,    KC_4,    KC_6,
  //|--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------|
      OS_SHFT, OS_CTRL,  OS_ALT,  OS_GUI,  KC_F11,                       KC_F12,  OS_GUI,  OS_ALT, OS_CTRL, OS_SHFT,
  //|--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------|
        KC_F7,   KC_F5,   KC_F3,   KC_F1,   KC_F9,                        KC_F8,  KC_F10,   KC_F2,   KC_F4,   KC_F6,
  //|--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------|
                                 MO(NAV), KC_LSFT, CW_TOGG,    MO(EXT),  KC_SPC, ENT_SYM
                             //`--------------------------'  `--------------------------'
  ),

    [EXT] = LAYOUT_split_3x5_3(
  //,--------------------------------------------.                    ,--------------------------------------------.
      XXXXXXX, KC_PAUS, KC_SCRL, KC_PSCR, UG_SPDU,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, QK_BOOT,
  //|--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, UG_HUEU, UG_SATU, UG_VALU,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, DF(BKL),
  //|--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, XXXXXXX, UG_NEXT, UG_TOGG,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, DF(DVK),
  //|--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------|
                                 MO(NAV), KC_LSFT, CW_TOGG,    MO(EXT),  KC_SPC, ENT_SYM
                             //`--------------------------'  `--------------------------'
  )
};

layer_state_t layer_state_set_user(layer_state_t state) {
    return update_tri_layer_state(state, SYM, NAV, NUM);
}

// Implements cmd-tab like behaviour on a single key. On first tap of trigger
// cmdish is held and tabish is tapped -- cmdish then remains held until some
// other key is hit or released. For example:
//
//     trigger, trigger, a -> cmd down, tab, tab, cmd up, a
//     nav down, trigger, nav up -> nav down, cmd down, tab, cmd up, nav up
//
// This behaviour is useful for more than just cmd-tab, hence: cmdish, tabish.
void update_swapper(
    bool *active,
    uint16_t cmdish,
    uint16_t tabish,
    uint16_t trigger,
    uint16_t keycode,
    keyrecord_t *record
);

// Custom oneshot mod implementation that doesn't rely on timers. If a mod is
// used while it is held it will be unregistered on keyup as normal, otherwise
// it will be queued and only released after the next non-mod keyup.
void update_oneshot(
    oneshot_state *state,
    uint16_t mod,
    uint16_t trigger,
    uint16_t keycode,
    keyrecord_t *record
);

// To be implemented by the consumer. Defines keys to cancel oneshot mods.
bool is_oneshot_cancel_key(uint16_t keycode);

// To be implemented by the consumer. Defines keys to ignore when determining
// whether a oneshot mod has been used. Setting this to modifiers and layer
// change keys allows stacking multiple oneshot modifiers, and carrying them
// between layers.
bool is_oneshot_ignored_key(uint16_t keycode);

bool is_oneshot_cancel_key(uint16_t keycode) {
    switch (keycode) {
    case MO(SYM):
    case MO(NAV):
        return true;
    default:
        return false;
    }
}

bool is_oneshot_ignored_key(uint16_t keycode) {
    switch (keycode) {
    case MO(SYM):
    case MO(NAV):
    case KC_LSFT:
    case OS_SHFT:
    case OS_CTRL:
    case OS_ALT:
    case OS_GUI:
        return true;
    default:
        return false;
    }
}

oneshot_state os_shft_state = os_up_unqueued;
oneshot_state os_ctrl_state = os_up_unqueued;
oneshot_state os_alt_state = os_up_unqueued;
oneshot_state os_gui_state = os_up_unqueued;

bool sw_win_active = false;
bool sw_app_active = false;
bool sw_swp_active = false;

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    update_swapper(
        &sw_win_active, KC_LALT, KC_TAB, SW_WIN,
        keycode, record
    );
    update_swapper(
        &sw_app_active, KC_LGUI, KC_GRV, SW_APP,
        keycode, record
    );
    update_swapper(
        &sw_swp_active, KC_LALT, KC_ESC, SW_SWP,
        keycode, record
    );
    update_oneshot(
        &os_shft_state, KC_LSFT, OS_SHFT,
        keycode, record
    );
    update_oneshot(
        &os_ctrl_state, KC_LCTL, OS_CTRL,
        keycode, record
    );
    update_oneshot(
        &os_alt_state, KC_LALT, OS_ALT,
        keycode, record
    );
    update_oneshot(
        &os_gui_state, KC_LGUI, OS_GUI,
        keycode, record
    );

    return true;
}

void update_swapper(
    bool *active,
    uint16_t cmdish,
    uint16_t tabish,
    uint16_t trigger,
    uint16_t keycode,
    keyrecord_t *record
) {
    if (keycode == trigger) {
        if (record->event.pressed) {
            if (!*active) {
                *active = true;
                register_code(cmdish);
            }
            register_code(tabish);
        } else {
            unregister_code(tabish);
            // Don't unregister cmdish until some other key is hit or released.
        }
    } else if (*active) {
        unregister_code(cmdish);
        *active = false;
    }
}

void update_oneshot(
    oneshot_state *state,
    uint16_t mod,
    uint16_t trigger,
    uint16_t keycode,
    keyrecord_t *record
) {
    if (keycode == trigger) {
        if (record->event.pressed) {
            // Trigger keydown
            if (*state == os_up_unqueued) {
                register_code(mod);
            }
            *state = os_down_unused;
        } else {
            // Trigger keyup
            switch (*state) {
            case os_down_unused:
                // If we didn't use the mod while trigger was held, queue it.
                *state = os_up_queued;
                break;
            case os_down_used:
                // If we did use the mod while trigger was held, unregister it.
                *state = os_up_unqueued;
                unregister_code(mod);
                break;
            default:
                break;
            }
        }
    } else {
        if (record->event.pressed) {
            if (is_oneshot_cancel_key(keycode) && *state != os_up_unqueued) {
                // Cancel oneshot on designated cancel keydown.
                *state = os_up_unqueued;
                unregister_code(mod);
            }
        } else {
            if (!is_oneshot_ignored_key(keycode)) {
                // On non-ignored keyup, consider the oneshot used.
                switch (*state) {
                case os_down_unused:
                    *state = os_down_used;
                    break;
                case os_up_queued:
                    *state = os_up_unqueued;
                    unregister_code(mod);
                    break;
                default:
                    break;
                }
            }
        }
    }
}
