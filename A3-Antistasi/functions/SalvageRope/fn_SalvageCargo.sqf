params ["_target", "_caller", "_actionId"];
private _boat = ropeAttachedTo _caller;
if (_boat getVariable "ropeActive") then {
	//remove undercover
	[_caller, false] remoteExec["setCaptive"];
	[] spawn A3A_fnc_statistics;
	//
	private _distance = _boat distance _target;
	private _unwind = _distance - 0.5;
	private _time = 5 + (_unwind*2);
	removeAllActions _boat;
	_target removeAction _actionId;
	ropeDestroy (_boat getVariable "Rope");
	_boat setVariable ["Rope2", (ropeCreate [_boat, [0,-2.8,-0.8], _target, [0,0,0], _distance]), true];
	ropeUnwind [ropes _boat select 0, 0.5, -(_unwind), true];
	_boat lockCargo true;
	sleep _time;
	ropeDestroy (_boat getVariable "Rope2");
	[_boat, _target] call jn_fnc_logistics_load;
	[_boat] call A3A_fnc_SalvageRope; 
	_boat setVariable ["ropeActive", nil, true];
};