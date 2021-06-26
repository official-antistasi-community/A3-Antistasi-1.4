/*
Author: Caleb Serafin
    Alternative macros for short ID functions.
    Remember to add a private to outVar if it's a new declaration!

Scope: Local.
Environment: Unscheduled.
Public: Yes.

Dependencies:
fn_ID_init.sqf

Example:
#include "ID_defines.hpp "                      // If sqf file in ID wanted to use this.
#include "..\ID\ID_defines.hpp"                 // If sqf file in Map wanted to use this.
#include "..\..\Collections\ID\ID_defines.hpp"  // If sqf file in functions\Utility wanted to use this.

*/
#ifndef Col_mac_ID_defines
#define Col_mac_ID_defines

// If both arrays have atleast one nil, isEqualTo will tell you wether they point to the same address in memory. Magic!
#define Col_mac_ID_LArray(outVar) outVar = [nil];
#define Col_mac_ID_LArray_isEqualTo(ID1,ID2) ID1 isEqualTo ID2;



// Will always be unique on any machine in same server. Use str on output array to get string for compairing. 0.0033ms.
// Col_ID_UUID_G1e3's limit is to shorten length. It will not be run fast enough to become depleted in a millisecond (alone = 833 KHz, with systemTimeUTC = 303 KHz, with code = far more, more than 3x speed boost would be required.).
#define Col_mac_ID_UUID(outVar) Col_ID_UUID_G1e3 = (Col_ID_UUID_G1e3 + 1) mod 1e3; outVar = systemTimeUTC + [Col_ID_UUID_G1e3,clientOwner];
// If a fixed width version is required. 24 decimal digits are emitted in a string without delimiters. eg: [2021,1,1,12,43,46,458,24,2] -> "202101011243464580240002". 0.0204ms
#define Col_mac_ID_UUID_toFixed(inVar,outVar) outVar = (((inVar select 0) / 1000 toFixed 3) + ((inVar select 1) / 10 toFixed 1) + ((inVar select 2) / 10 toFixed 1) + ((inVar select 3) / 10 toFixed 1) + ((inVar select 4) / 10 toFixed 1) + ((inVar select 5) / 10 toFixed 1) + ((inVar select 6) / 100 toFixed 2) + ((inVar select 7) / 1e2 toFixed 2) + ((inVar select 8) / 1e3 toFixed 3)) splitString "." joinString "";


/// Incrimenter functions for counter with an integer range of 10 million. G stands for Global as this is a global variable.
// Use an isNil block to guaranty thread-safety.
#define Col_mac_ID_G1e7_new(varName) Col_ID_G1e7_##varName = -1;
// Modifies global variable, and returns copy. 7 digit base 10 local unique identifier. Twice as fast as G1e14.
// If you left this running at 240 KHz for 41 seconds, you will almost wrap around to 0.
#define Col_mac_ID_G1e7_inc(varName,outVar) Col_ID_G1e7_##varName = (Col_ID_G1e7_##varName + 1) mod 1e7; outVar = Col_ID_G1e7_##varName;
// Use this to preserve an accurate respresentation of the floating point value. Format: "X.XXXXXX"
#define Col_mac_ID_G1e7_str(inVar,outVar) outVar = (inVar / 1e6 toFixed 6);
// Combines Col_mac_ID_G1e7_inc and Col_mac_ID_G1e7_str. Returns a formatted string. 0.0032ms. Format: "X.XXXXXX".
#define Col_mac_ID_G1e7_incStr(varName,outVar) Col_ID_G1e7_##varName = (Col_ID_G1e7_##varName + 1) mod 1e7; outVar = Col_ID_G1e7_##varName / 1e6 toFixed 6;

// Local version of G1e7. Stored in an array (so you can pass reffernces).
#define Col_mac_ID_LA1e7_new(outVar) outVar = [-1];
#define Col_mac_ID_LA1e7_inc(var) var set [1, ((var select 0) + 1) mod 1e7];
#define Col_mac_ID_LA1e7_str(var,outVar) outVar = (var select 0) / 1e6 toFixed 6;

// Local version of G1e7. (no reffernces).
#define Col_mac_ID_L1e7_new(outVar) outVar = -1;
#define Col_mac_ID_L1e7_inc(var,outVar) outVar = 1(var + 1) mod 1e7;
#define Col_mac_ID_L1e7_str(var,outVar) outVar = var / 1e6 toFixed 6;



/// Incrimenter functions for counter with an integer range of 100 trillion. G stands for Global as this is a global variable.
// Use an isNil block to guaranty thread-safety.
#define Col_mac_ID_G1e14_new(varName) Col_ID_G1e14_0##varName = 0; Col_ID_G1e14_1##varName = -1;
// Modifies global variable, and returns copy in an array.
// Will not wrap around to 0, unlikely to happen. If you left this running at 90 KHz for 4 years, you will still have space left.
#define Col_mac_ID_G1e14_inc(varName,outVar) Col_ID_G1e14_1##varName = Col_ID_G1e14_1##varName + 1; Col_ID_G1e14_0##varName = Col_ID_G1e14_0##varName + floor (Col_ID_G1e14_1##varName / 1e7); Col_ID_G1e14_1##varName = Col_ID_G1e14_1##varName mod 1e7; outVar = [Col_ID_G1e14_0##varName, Col_ID_G1e14_1##varName];
// Use this to preserve a standard method of string comparisons, brackets and comma are not added to increase speed and reduce size. Format: "X.XXXXXXX.XXXXXX"
#define Col_mac_ID_G1e14_str(inVar,outVar) outVar = ((inVar select 0) / 1e6 toFixed 6) + ((inVar select 1) / 1e6 toFixed 6);
// Combines Col_mac_ID_G1e14_inc and Col_mac_ID_G1e14_str. Returns a formatted string. 0.0070ms. Format: "X.XXXXXXX.XXXXXX".
#define Col_mac_ID_G1e14_incStr(varName,outVar) Col_ID_G1e14_1##varName = Col_ID_G1e14_1##varName + 1; Col_ID_G1e14_0##varName = Col_ID_G1e14_0##varName + floor (Col_ID_G1e14_1##varName / 1e7); Col_ID_G1e14_1##varName = Col_ID_G1e14_1##varName mod 1e7; outVar = (Col_ID_G1e14_0##varName / 1e6 toFixed 6) + (Col_ID_G1e14_1##varName / 1e6 toFixed 6);

// Local version of G1e14. Stored in an array (so you can pass reffernces).
#define Col_mac_ID_LA1e14_new(outVar) outVar = [0, -1];
#define Col_mac_ID_LA1e14_inc(var) var set [1, (var select 1) + 1]; var set [0, (var select 0) + floor ((var select 1) / 1e7)]; var set [1, (var select 1) mod 1e7];
#define Col_mac_ID_LA1e14_str(var,outVar) outVar = ((var select 0) / 1e6 toFixed 6) + ((var select 1) / 1e6 toFixed 6);

#endif
