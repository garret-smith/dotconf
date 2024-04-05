/* Copyright 2020 Josef Adamcik
 * Modification for VIA support and RGB underglow by Jens Bonk-Wiltfang
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

/* By default left side is selected as master,
see https://docs.qmk.fm/#/feature_split_keyboard?id=setting-handedness
for more options. */

#define CUSTOM_LAYER_READ //if you remove this it causes issues - needs better guarding

#ifdef ENCODER_RESOLUTION
  #undef ENCODER_RESOLUTION
  #define ENCODER_RESOLUTION 4
#endif

// #ifdef TAPPING_TERM
//   #undef TAPPING_TERM
//   #define TAPPING_TERM 200
// #endif
// #define QUICK_TAP_TERM 100
// #define HOLD_ON_OTHER_KEY_PRESS

#define OLED_FADE_OUT
#define OLED_FADE_OUT_INTERVAL 8
#define OLED_SCROLL_TIMEOUT 50000
#define OLED_TIMEOUT 60000

// Add RGB underglow and top facing lighting
#define WS2812_DI_PIN D3
#define RGBLIGHT_SLEEP
#define RGBLIGHT_SPLIT

#define RGBLED_NUM 70    // Number of LEDs
#define RGBLED_SPLIT { 35, 35 } // Number of LEDs on each half

#define RGBLIGHT_EFFECT_RAINBOW_MOOD
#define RGBLIGHT_EFFECT_RAINBOW_SWIRL
#define RGBLIGHT_EFFECT_BREATHING
#define RGBLIGHT_EFFECT_TWINKLE

#define RGBLIGHT_LIMIT_VAL 130
#define RGBLIGHT_HUE_STEP 10
#define RGBLIGHT_SAT_STEP 10
#define RGBLIGHT_VAL_STEP 10

