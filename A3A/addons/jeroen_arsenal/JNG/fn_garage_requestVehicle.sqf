if(!isserver)exitWith{};

params["_name","_index","_namePlayer","_uid","_id"];

with missionNamespace do{
	_array = jng_vehicleList select _index;

	{
		_data = _x;
		_name2 = _data select 0;
		_beingChanged2 = _data select 1;
		_message = false;
		if(_name2 isEqualTo _name)exitWith{

			if(_beingChanged2 isEqualTo "" || _beingChanged2 isEqualTo _namePlayer)then{//check if someone is already changing this vehicle
				_locked = _data select 2;
				if(_locked isEqualTo "" ||_locked isEqualTo _uid || player isEqualTo slowhand)then{//check if vehicle is unlocked or locked by requesting person
					_message = true;

					//update datalist
					_data set [1,_namePlayer];
					_array set [_foreachindex,_data];
					jng_vehicleList set [_index,_array];

					//update all clients that are looking in the garage
					["updateVehicleSingleData",[_name,_index,_namePlayer,nil]] remoteExecCall ["jn_fnc_garage",server getVariable ["jng_playersInGarage",[]]];
				};
			};

			//tell client he can take vehicle
			[_message] remoteExecCall ["jn_fnc_garage_requestVehicleMessage",[_id]];

		};
	} forEach _array;
};
