params ["_vehicle", "_cargo"];

//Remove action
private _id = _cargo getVariable ["getInAction", -1];
_cargo setVariable ["getInAction", nil];
remoteExecCall ["", _cargo]; //clear JIP addAction
_vehicle removeAction _id;

//remove weapon killed EH
private _killedEH = _cargo getVariable ["KilledEH", -1];
_cargo removeEventHandler ["Killed", _killedEH];
_cargo setVariable ["KilledEH", nil];

//remove GetOut EH
private _GetOutEH = _cargo getVariable ["GetOutEH", -1];
_cargo removeEventHandler ["GetOut", _GetOutEH];
_cargo setVariable ["GetOutEH", nil];

//remove Undercover break if last weapon
private _attachedObjects =  attachedObjects _vehicle;
_weaponCount = _attachedObjects findIf {
	private _model = getText (configFile >> "CfgVehicles" >> typeOf _x >> "model");
    _weapon = false;
    {
        if ((_x#0) isEqualTo _model) exitWith {_weapon = true}; 
    } forEach logistics_weapons;
	_weapon
}
if (_weaponCount isEqualTo -1) then {
	private _undercoverBreak = _vehicle getVariable ["undercoverBreak", -1];
	_vehicle removeEventHandler ["GetIn", _undercoverBreak];
_vehicle setVariable ["undercoverBreak", nil];
};
