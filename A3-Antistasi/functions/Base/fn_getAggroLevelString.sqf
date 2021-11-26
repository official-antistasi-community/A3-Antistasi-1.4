params ["_level"];
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

if(_level == 1) exitWith {"Low"};
if(_level == 2) exitWith {"Medium"};
if(_level == 3) exitWith {"High"};
if(_level == 4) exitWith {"Very High"};
if(_level == 5) exitWith {"Extreme"};

Error_1("Bad level recieved, cannot generate string, was %1", _level);
"None"
