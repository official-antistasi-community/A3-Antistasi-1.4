/*
	Author: Jeroen Notenbomer

	Description:
	Detach the last loaded cargo and places it behind the vehicle. It also removes the action on the vehicle if its not needed anymore

	Parameter(s):
	OBJECT vehicle

	Returns:
	BOOL true - if it was succesfully unloaded, otherwhise false
*/

params ["_vehicle"];

//find last attached cargo object
private _object = objNull;
private _nodeLast = -1;
{
	private _array = _x getVariable ["jnl_cargo",nil];//returns nr of node if the object was attached by JNL

	if(!isNil "_array")then{
		private _node = _array select 1;
		if(_node > _nodeLast)then{
			_nodeLast = _node;
			_object = _x;
		};
	};
} forEach attachedObjects _vehicle;

//todo add better location, maybe some moving animation
_return = false;

if(!isnull _object)then{

	//create animation
	[_vehicle,_object] spawn {
		params ["_vehicle","_object"];
		_vehicle setVariable ["jnl_isUnloading",true, true];
		private _nodeArray = _object getVariable ["jnl_cargo",[0,0]];
		private _objectType = _nodeArray select 0;
		private _nodeID = _nodeArray select 1;

		if(_objectType == 0)then{//if its a weapon
			_object enableWeaponDisassembly true;
		};

		private _loc1 = [_vehicle, _object, _nodeID] call jn_fnc_logistics_getCargoOffsetAndDir select 0;

		private _bbv = (boundingBoxReal _vehicle select 0 select 1) + ((boundingCenter _vehicle) select 1);
		private _bbo = (boundingBoxReal _object select 0 select 1) + ((boundingCenter _object) select 1);
		private _yEnd = _bbv + _bbo - 0.1;

		while {_loc1 select 1 > _yEnd}do{
			sleep 0.1;
			_loc1 = _loc1 vectorAdd [0,-0.1,0];
			_object attachto [_vehicle,_loc1];
		};

		//set speed incase vehicle was moving
		private _vel = velocity _vehicle;
		detach _object;
		_object setVelocity _vel;

		_vehicle setVariable ["jnl_isUnloading",false, true];
		//Clear object's jnl_cargo variable
		_object setVariable ["jnl_cargo", Nil];

		[_vehicle, _object, true] call jn_fnc_logistics_addOrRemoveObjectMass;
		//re-enable seats
		//need to call the function here, since it gets data from jnl_cargo!
		[_vehicle] remoteExec ["jn_fnc_logistics_lockSeats",0,_vehicle];
	};

	_return = true;
};

//remove action if it was the last peace of cargo on the vehicle
if(_nodeLast == 0)then{
	[_vehicle] remoteExec ["jn_fnc_logistics_removeActionUnload",0, _vehicle];
	[_vehicle] remoteExec ["jn_fnc_logistics_removeActionGetInWeapon", 0, _vehicle];
	[_object] remoteExec ["jn_fnc_logistics_removeEventGetOut", 0, _object];
};

//reset ACE carry if there was one
_ace_dragging_canDrag = _object getVariable ["ace_dragging_canDrag_old",nil];
_ace_dragging_canCarry = _object getVariable ["ace_dragging_canCarry_old",nil];
_ace_cargo_canLoad = _object getVariable ["ace_cargo_canLoad_old",nil];
if !(isNil "_ace_dragging_canDrag") then {_object setVariable ["ace_dragging_canDrag",_ace_dragging_canDrag]};
if !(isNil "_ace_dragging_canCarry") then {_object setVariable ["ace_dragging_canCarry",_ace_dragging_canCarry]};
if !(isNil "_ace_cargo_canLoad") then {_object setvariable ["ace_cargo_canLoad",_ace_cargo_canLoad]};

_return