params [["_crate", objNull], "_pickUp", ["_player", player]];

if (_pickUp) then {
	private _attachedObj = (attachedObjects _player)select {!(_x isEqualTo objNull)};
	if !(count _attachedObj == 0) exitWith {systemChat "you are already carrying something."};
	_crate attachTo [_player, [0, 1.5, 0], "Pelvis"];
	_player setVariable ["carryingCrate", true];
	_player forceWalk true;
	[_player ,_crate] spawn {
		params ["_player", "_crate"];
		waitUntil { !alive _crate or !(_player getVariable ["carryingCrate", false]) or !(vehicle _player isEqualTo _player) or _player getVariable ["incapacitated",false] or !alive _player or !(isPlayer attachedTo _crate) };
		[_crate, false, _player] call A3A_fnc_carryCrate;
	};
} else {
    if (isNull _crate) then {
        private _attached = (attachedObjects _player)select {(typeOf _x) isEqualTo "Box_IND_Wps_F"};
        if (_attached isEqualTo []) exitWith {};
        _crate = _attached#0;
    };
	if !(isNull _crate) then {
		_player setVelocity [0,0,0];
		detach _crate;
		_crate setVelocity [0,0,0.3];
	};
	_player setVariable ["carryingCrate", nil];
	_player forceWalk false;
};
