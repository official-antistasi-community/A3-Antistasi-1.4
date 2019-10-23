
params[["_name","",[""]],["_index",-1,[1]],["_locked",-1,[1]]];
with missionNamespace do{
	_array = jng_vehicleList select _index;

	{
		_data  = _x;
		_name2 = _x select 0;
		if(_name2 isEqualTo _name)exitWith{
			_data set [2,_locked]
			_array set [_foreachindex,_data];
		};
	} forEach _array;

	jng_vehicleList set [_index,_array];
};

//update all clients that are looking in the garage
["updateVehicleSingleData",[_name,_index,nil,_locked]] remoteExecCall ["jn_fnc_garage",server getVariable ["jng_playersInGarage",[]]];