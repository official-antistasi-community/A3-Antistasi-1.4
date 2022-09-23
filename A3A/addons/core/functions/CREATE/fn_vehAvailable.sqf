#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private ["_typeX","_cant"];
_typeX = _this select 0;
if (_typeX == "") exitWith {false};

// Function is obsolete, just leave this as a temp stub for garrison code
if (true) exitWith {true};

if ( _typeX in FactionGet(all,"vehiclesUnlimited") ) exitWith {true};
_cant = timer getVariable _typeX;
if (isNil "_cant") exitWith {true};
if (_cant <= 1) exitWith {false};
if ({typeOf _x == _typeX} count vehicles >= (floor _cant)) exitWith {false};
true
