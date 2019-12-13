params ["_convoyID", "_unitObjects", "_convoyPos", "_target", "_markerArray", "_convoyType", "_convoySide"];

[2, format ["Despawning convoy %1", _convoyID], "fn_despawnConvoy"] call A3A_fnc_log;

// Exit any vehicle's FSM if it's still running
{
	private _fsm = (_x select 0) getVariable "fsm";
	if !(isNil "_fsm" || {completedFSM _fsm}) then { _fsm setFSMVariable["_abort", true] };
} forEach _unitObjects;

private _convoyData = [];
for "_i" from 0 to ((count _unitObjects) - 1) do
{
	private _data = _unitObjects select _i;
	private _vehicle = _data select 0;
	private _convoyLine = [];

	private _cargoData = [];
	{
		if(alive _x) then
		{
			_cargoData pushBack (typeOf _x);
			(group _x) deleteGroupWhenEmpty true;
			deleteVehicle _x;
		};
	} forEach (_data select 2);
	_convoyLine set [2, _cargoData];
	
	private _crewData = [];
	{
		if(alive _x) then
		{
			_crewData pushBack (typeOf _x);
			(group _x) deleteGroupWhenEmpty true;
			deleteVehicle _x;
		};
	} forEach (_data select 1);
	_convoyLine set [1, _crewData];
	
	//Vehicle is alive, otherwise it would have been dropped from _unitObjects
	_convoyLine set [0, typeOf _vehicle];
	deleteVehicle _vehicle;
	
	_convoyData pushBack _convoyLine;
};

[_convoyID, _convoyData, _convoyPos, _target, _markerArray, _convoyType, _convoySide] spawn A3A_fnc_createConvoy;
