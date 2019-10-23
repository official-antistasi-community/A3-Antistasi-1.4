private _variable = _this select 0;
private _description = _this select 1;
private _destino = _this select 2;
private _state = _this select 3;
_soloDestino = true;
if !([_variable] call BIS_fnc_taskExists) exitWith {};
private _descriptionOld = _variable call BIS_fnc_taskDescription;

if (((_descriptionOld select 1) select 0) != (_description select 1)) then
	{
	_soloDestino = false;
	[_variable,_description] call BIS_fnc_taskSetDescription;
	};
private _destinoOld = _variable call BIS_fnc_taskDestination;
if (typeName _destino != typeName _destinoOld) then
	{
	[_variable,_destino] call BIS_fnc_taskSetDestination;
	}
else
	{
	if !(_destino isEqualTo _destinoOld) then
		{
		[_variable,_destino] call BIS_fnc_taskSetDestination;
		};
	};
if (count _this > 4) then
	{
	private _type = _this select 4;
	_typeOld = _variable call BIS_fnc_taskType;
	if (_type != _typeOld) then
		{
		[_variable,_type] call BIS_fnc_taskSetType;
		_soloDestino = false;
		};
	};
_stateOld = _variable call BIS_fnc_taskState;
if ((_stateOld != _state) or !(_soloDestino)) then
	{
	[_variable,_state] call BIS_fnc_taskSetState;
	if (count misiones > 0) then
		{
		for "_i" from 0 to (count misiones -1) do
			{
			_mision = (misiones select _i) select 0;
			if (_mision == _variable) exitWith
				{
				misiones deleteAt _i;
				misiones pushBack [_variable,_state];
				publicVariable "misiones"
				};
			};
		};
	};
true