if(!isserver)exitWith{};

params ["_name","_index"];

private _vehicleList = (jng_vehicleList select _index);
{
	private _data = _x;
	private _name2 = _data select 0;
	if(_name isEqualTo _name2)exitWith{
		_vehicleList deleteAt _foreachindex;
		jng_vehicleList set [_index, _vehicleList];
	};
} forEach _vehicleList;

//update all clients that are looking in the garage
private _clients = server getVariable ["jng_playersInGarage",[]];
if!(_clients isEqualTo [])then{
	["removeVehicle",[_data,_index]] remoteExecCall ["jn_fnc_garage",_clients];
};