params ["_crate", "_pickUp"];

if (_pickUp) then {
	_attachedObj = (attachedObjects player)select {!(_x isEqualTo objNull)};
	if !(count _attachedObj == 0) exitWith {systemChat "you are already carrying something."};
	_crate attachTo [player, [0, 1.5, 0], "Pelvis"];
	player setVariable ["carryingCrate", true];
	player forceWalk true;
	[player ,_crate] spawn { 
		params ["_player", "_crate"];
		waitUntil {(!alive _crate) or !(_player getVariable ["carryingCrate", false]) or !((vehicle _player) isEqualTo _player) or !([_player] call A3A_fnc_canFight)};
		[objNull, false] call A3A_fnc_carryCrate;
	};
} else {
	_attached = (attachedObjects player)select {(typeOf _x) isEqualTo "Box_IND_Wps_F"};
	_crate = _attached#0;
	if !(isNil "_crate") then {
		player setVelocity [0,0,0];
		detach _crate;
		_crate setVelocity [0,0,0.3];
	};
	player setVariable ["carryingCrate", nil];
	player forceWalk false;
};