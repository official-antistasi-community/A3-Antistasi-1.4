if(!isserver)exitWith{};

_data = _this select 0;
_index = _this select 1;

_name = _data select 0;

with missionNamespace do{
	_array = jng_vehicleList select _index;

	_nr = 1;
	_newName = (_name + " nr:"+ str _nr);

	//check if name is already in the list
	_nameExist = {
		_return = false;
		{
			_nameCheck = _x select 0;
			if(_newName isEqualTo _nameCheck)exitWith{
				_return = true;
			};
		} forEach _array;
		_return
	};

	//find a name that doesnt exist yet

	while {call _nameExist} do {
		 _nr = _nr + 1;
		 _newName = (_name + " nr:" + str _nr);
	};

	//update name and save
	_data set [0, _newName];

	_array pushback _data;
	jng_vehicleList set [_index,_array];
};

//update all clients that are looking in the garage
_clients = server getVariable ["jng_playersInGarage",[]];
if!(_clients isEqualTo [])then{
	["addVehicle",[_data,_index]] remoteExecCall ["jn_fnc_garage",_clients];
};