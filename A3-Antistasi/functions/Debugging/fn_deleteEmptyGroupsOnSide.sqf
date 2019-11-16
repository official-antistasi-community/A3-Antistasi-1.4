params ["_side"];

if (isNil "_side" || {typeName _side != "SIDE"}) exitWith {	diag_log "[Antistasi] Debugging: Cannot empty groups on bad side"; };

(allGroups select {side _x == _side && count units _x == 0 && local _x}) apply {deleteGroup _x};