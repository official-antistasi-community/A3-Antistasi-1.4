/*
	Author: Jeroen Notenbomer

	Description:
	Returns the nodes that the vehicle has, if the vehicle is not initilized it will be done as well

	Parameter(s):
	OBJECT vehicle,
	INT (optinal) type, if you only need specific node type

	Returns:
	ARRAY nodes
*/

params ["_vehicle",["_type",-1]];

private _nodes = _vehicle getVariable ["jnl_nodes",nil];

if(isNil "_nodes")then{
	_nodes = [];
	private _model = gettext (configfile >> "CfgVehicles" >> (typeOf _vehicle)  >> "model");
	{
		private _model2 = _x select 0;
		if(_model isEqualTo _model2)exitWith{
			_nodes = _x select 1;
		};
	} forEach jnl_vehicleHardpoints;

	_vehicle setVariable ["jnl_nodes",_nodes];
};

if(_type != -1)then{
	_nodesNew = [];
	{
		_type2 = _x select 0;
		if(_type == _type2)then{
			_location = _x select 1;
			_lockedSeats = _x select 2;
			_nodesNew pushBack [_location,_lockedSeats];
		};
	} forEach _nodes;
	_nodes = _nodesNew;
};

//return
_nodes