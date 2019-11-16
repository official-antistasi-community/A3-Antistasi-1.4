#include "defineCommon.inc"

if(!isserver)exitWith{};

params["_data","_index"];
_name = _data select 0;
_data set [1,""];//set beingChanged to non so others can edit it
with missionNamespace do{
	_array = jng_vehicleList select _index;

	{
		_name2 = _x select 0;
		if(_name2 isEqualTo _name)exitWith{
			_array set [_foreachindex,_data];
		};
	} forEach _array;

	jng_vehicleList set [_index,_array];
};

//update all clients that are looking in the garage
["updateVehicle",[_data,_index]] remoteExecCall ["jn_fnc_garage",server getVariable ["jng_playersInGarage",[]]];