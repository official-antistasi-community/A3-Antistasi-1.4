private _variable = _this select 0;
private _description = _this select 1;
private _destinationX = _this select 2;
private _state = _this select 3;
_singleDestination = true;
if !([_variable] call BIS_fnc_taskExists) exitWith {};
private _descriptionOld = _variable call BIS_fnc_taskDescription;

if (((_descriptionOld select 1) select 0) != (_description select 1)) then
	{
	_singleDestination = false;
	[_variable,_description] call BIS_fnc_taskSetDescription;
	};
private _destinationOld = _variable call BIS_fnc_taskDestination;
if !(_destinationX isEqualType _destinationOld) then
	{
	[_variable,_destinationX] call BIS_fnc_taskSetDestination;
	}
else
	{
	if !(_destinationX isEqualTo _destinationOld) then
		{
		[_variable,_destinationX] call BIS_fnc_taskSetDestination;
		};
	};
if (count _this > 4) then
	{
	private _type = _this select 4;
	_typeOld = _variable call BIS_fnc_taskType;
	if (_type != _typeOld) then
		{
		[_variable,_type] call BIS_fnc_taskSetType;
		_singleDestination = false;
		};
	};
_stateOld = _variable call BIS_fnc_taskState;
if ((_stateOld != _state) or !(_singleDestination)) then
	{
	[_variable,_state] call BIS_fnc_taskSetState;
	if (count missionsX > 0) then
		{
		for "_i" from 0 to (count missionsX -1) do
			{
			_missionX = (missionsX select _i) select 0;
			if (_missionX == _variable) exitWith
				{
				missionsX deleteAt _i;
				missionsX pushBack [_variable,_state];
				publicVariable "missionsX"
				};
			};
		};
	};
true