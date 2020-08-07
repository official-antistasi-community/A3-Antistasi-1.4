params ["_vehicle", "_cargo"];

//Remove action
private _id = _cargo getVariable ["getInAction", -1];
_cargo setVariable ["getInAction", nil, true];
remoteExecCall ["", _cargo]; //clear JIP addAction
_vehicle removeAction _id;

//remove weapon killed EH
private _killedEH = _cargo getVariable ["KilledEH", -1];
_cargo removeEventHandler ["Killed", _killedEH];
_cargo setVariable ["KilledEH", nil, true];

//remove GetOut EH
private _GetOutEH = _cargo getVariable ["GetOutEH", -1];
_cargo removeEventHandler ["GetOut", _GetOutEH];
_cargo setVariable ["GetOutEH", nil, true];

//remove Undercover break
private _undercoverBreak = _vehicle getVariable ["undercoverBreak", -1];
_vehicle removeEventHandler ["GetIn", _undercoverBreak];
_vehicle setVariable ["undercoverBreak", nil, true];
