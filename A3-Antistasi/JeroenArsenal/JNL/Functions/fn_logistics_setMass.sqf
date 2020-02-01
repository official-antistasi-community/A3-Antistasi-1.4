params["_vehicle","_object", ["_Unload", false]];

/*
Sets the mass of the _vehicle.
Author: Ayla (Alsekwolf)
*/

// Enable or disable changing vehicle mass
AdjustVehicleMass = true;

Logistics_SetMass =
{
	params["_veh","_new_veh_mass"];
	if ((getMass _veh) != _new_veh_mass) then
	{
		_veh setMass _new_veh_mass;
	};
};

_Vehicle_Message =
{
	private["_veh", "_msg", "_mass_info", "_text", "_cargo_mass", "_v_def_mass"];
	_veh = _this select 0;
	_msg = _this select 1;
	_cargo_mass = _this select 2;

	_veh vehicleChat _msg;
	_v_def_mass = _vehicle getVariable "default_mass";
	
	_text = Format["<img image='%1' size='2' align='left'/>", getText(configFile >> "cfgVehicles" >> typeOf _veh >> "picture")];
	_text = _text + Format ["<t color='#a02e69' size='1.2' shadow='1' shadowColor='#000000' align='center'>%1</t><br/>", getText(configFile >> "cfgVehicles" >> typeOf _veh >> "displayName")];

	_text = _text + "<t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>Default mass: </t>";
	_text = _text + Format ["<t color='#00ff59' size='1.2' shadow='1' shadowColor='#000000' align='left'>%1</t><br/>", _v_def_mass];

	_text = _text + "<t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>Cargo mass: </t>";
	_text = _text + Format ["<t color='#00ff59' size='1.2' shadow='1' shadowColor='#000000' align='left'>%1</t><br/>", _cargo_mass];

	_text = _text + "<t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>Current mass: </t>";
	_text = _text + Format ["<t color='#00ff59' size='1.2' shadow='1' shadowColor='#000000' align='left'>%1</t><br/>", _v_def_mass + _cargo_mass];
	if (vehicle Player != _veh) then
	{
		_text = _text + _msg;
		hint parseText (_text);
	}
	else
	{
		hint parseText (_text);
	};
};
	
_adjustVehicleMassFunction = 
{
	_default_mass = 0;
	_new_vehicle_mass = 0;
	_cargo_mass = 0;
	if (!_Unload) then
	{
		if (isNil {_vehicle getVariable "default_mass"}) then
		{
			_default_mass = getMass _vehicle;
			_vehicle setVariable["default_mass", _default_mass, true];
		}
		else
		{
			_default_mass = _vehicle getVariable "default_mass";
		};
	}
	else
	{
		if (isNil {_vehicle getVariable "default_mass"}) then
		{
			Player globalChat Format ["Default mass wasn't set on unloading, this is an error"];
		}
		else
		{
			_default_mass = _vehicle getVariable "default_mass";
		};
	};

	if (count(attachedObjects _vehicle) > 0) then
	{
		{
			_cargo_mass = _cargo_mass + getMass _x; 
		} forEach attachedObjects _vehicle;
	};
	_cargo_mass;
	_new_vehicle_mass = _cargo_mass + _default_mass;
	
	if ((getMass _vehicle) != _new_vehicle_mass) then
	{
		//should run on all clients? can't test right now.
		[_vehicle, _new_vehicle_mass] remoteExecCall ["Logistics_SetMass",0];
	};
	
	//check current load
	private _typeLoaded = -1;
	private _nodesLoaded = 0;
	{
		private _array = _x getVariable ["jnl_cargo",nil];//returns nr of node if the object was attached by JNL
	
		if(!isNil "_array")then{
			private _type = _array select 0;
			private _node = (_array select 1)+1;
	
			_typeLoaded = _type;
			if(_node > _nodesLoaded)then{_nodesLoaded = _node};
		};
	} forEach attachedObjects _vehicle;
	
	private _typeObject  = _object call jn_fnc_logistics_getCargoType; //get _object type
	
	//==== Get available nodes ====
	private _nodeTotal = 0;
	{
		private _type = _x select 0;
		private _location = _x select 1;
		if(_type == _typeObject)then{_nodeTotal = _nodeTotal + 1;};
	} forEach (_vehicle call jn_fnc_logistics_getNodes);
	
	_available_nodes = _nodeTotal - _nodesLoaded;
	
	if (!_Unload) then
	{
		if (_available_nodes == 0) then
		{
			[_vehicle, Format ["<t color='#00fff3'>""%1"" is loaded onto ""%2"" There is no more space.</t>", getText(configFile >> "cfgVehicles" >> typeOf _object >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName"), _available_nodes], _cargo_mass] call _Vehicle_Message;
		}
		else
		{
			[_vehicle, Format ["<t color='#00fff3'>""%1"" is loaded onto ""%2"". Free slots: ""%3"".</t>", getText(configFile >> "cfgVehicles" >> typeOf _object >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName"), _available_nodes], _cargo_mass] call _Vehicle_Message;
		};
	}
	else
	{
		[_vehicle, Format ["<t color='#00fff3'>""%1"" was unloaded from ""%2"". Free slots: ""%3"".</t>", getText(configFile >> "cfgVehicles" >> typeOf _object >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName"), _available_nodes], _cargo_mass] call _Vehicle_Message;
	};
};

if (AdjustVehicleMass) then
{
	[] call _adjustVehicleMassFunction;
};