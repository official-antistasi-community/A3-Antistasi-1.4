params["_vehicle","_object", ["_allowUnload", true],["_playAnimation",true]];

/*
Loads the _object on the _vehicle.
Author: Sparker and Jeroen
Returns:
	INTEGER node number where object can be loaded on to
	or -1 if a other type was already loaded
	or -2 if there was no more space
	or -3 if this vehicle can't have any cargo at all
*/

//Get the id of the node to load the _object

private _nodeID = [_vehicle, _object] call jn_fnc_logistics_canLoad;

if(_nodeID < 0) exitWith {_nodeID;}; //Can't load the _object

private _objectType = _object call jn_fnc_logistics_getCargoType;
_object setVariable ["jnl_cargo", [_objectType, _nodeID], true];


//disable the user action to disassable the weapon while its loaded
if(_objectType == 0)then{
	_object enableWeaponDisassembly false;//global
};


//attach objects with or without animation
if _playAnimation then{
	//create animation
	[_vehicle,_object] spawn {
		params ["_vehicle","_object"];
		_vehicle setVariable ["jnl_isUnloading",true, true];
		private _nodeArray = _object getVariable ["jnl_cargo",[0,0]];
		private _objectType = _nodeArray select 0;
		private _nodeID = _nodeArray select 1;

		/*
		if(_objectType == 0)then{//if its a weapon
			_object enableWeaponDisassembly true;
		};
		*/

		private _bbv = (boundingBoxReal _vehicle select 0 select 1) + ((boundingCenter _vehicle) select 1);
		private _bbo = (boundingBoxReal _object select 0 select 1) + ((boundingCenter _object) select 1);
		private _yEnd = _bbv + _bbo - 0.1; //Y end(rear) of the car
		private _cargoOffsetAndDir = [_vehicle, _object, _nodeID] call jn_fnc_logistics_getCargoOffsetAndDir;
		private _locEnd = _cargoOffsetAndDir select 0;
		private _locStart = [_locEnd select 0, _yEnd, _locEnd select 2];
		//Set initial position
		_object attachto [_vehicle, _locStart];
		if (_object isKindOf "CAManBase") then {_object setVectorDirAndUp [_cargoOffsetAndDir select 1, [0, 0, 0]]} else {_object setVectorDirAndUp [_cargoOffsetAndDir select 1, [0, 0, 1]]};
		private _step = 0.1;

		//lock seats
		//Need to call the function here, because it gets data from objects attached to the vehicle
		sleep 0.1;
		[_vehicle] remoteExec ["jn_fnc_logistics_lockSeats",0,_vehicle];

		//Push it in till it's in place!
		while {_locStart select 1 < _locEnd select 1}do{
			_locStart = _locStart vectorAdd [0, _step, 0];
			_object attachto [_vehicle, _locStart];
			//_object setVectorDirAndUp [_cargoOffsetAndDir select 1, [0, 0, 1]];
			if (_object isKindOf "CAManBase") then {_object setVectorDirAndUp [_cargoOffsetAndDir select 1, [0, 0, 0]]} else {_object setVectorDirAndUp [_cargoOffsetAndDir select 1, [0, 0, 1]]};
			sleep 0.1;
		};


		//lock seats
		//_vehicle call jn_fnc_logistics_lockSeats;//needs to be called after detach

		_vehicle setVariable ["jnl_isUnloading",false, true];
		
		[_vehicle, _object, false] call jn_fnc_logistics_addOrRemoveObjectMass;  											   
	};
}else{
	private _offsetAndDir = [_vehicle,_object,_nodeID] call jn_fnc_logistics_getCargoOffsetAndDir;
	_object hideObject true;//hide ugly rotation (to N and back to propper rotation)
	_object attachTo [_vehicle, _offsetAndDir select 0];
	_object SetVectorDirAndUp [_offsetAndDir select 1, [0, 0, 1]];
	_object hideObject false;
	
	[_vehicle, _object, false] call jn_fnc_logistics_addOrRemoveObjectMass;
};

//Add action to unload
if(_allowUnload) then
{
	[_vehicle] remoteExec ["jn_fnc_logistics_addActionUnload",0,_vehicle];
};

//Add getOut event hanldler and getin Action
if(_objectType == 0) then
{
	[_object] remoteExec ["jn_fnc_logistics_addEventGetoutWeapon",0,_object];

	[_vehicle,_object] remoteExec ["jn_fnc_logistics_addActionGetinWeapon",0,_vehicle];
};
[_object] spawn A3A_fnc_VEHdespawner;
//save ACE settings to we can reset them when we unload
_ace_dragging_canDrag = _object getVariable ["ace_dragging_canDrag",false];
_ace_dragging_canCarry = _object getVariable ["ace_dragging_canCarry",false];
_ace_cargo_canLoad = _object getVariable ["ace_cargo_canLoad",false];

_object setVariable ["ace_dragging_canDrag_old",_ace_dragging_canDrag, true];
_object setVariable ["ace_dragging_canCarry_old",_ace_dragging_canCarry, true];
_object setvariable ["ace_cargo_canLoad_old",_ace_cargo_canLoad, true];

//disable ACE dragging
_object setVariable ["ace_dragging_canDrag",false, true];
_object setVariable ["ace_dragging_canCarry",false, true];
_object setvariable ["ace_cargo_canLoad",false, true];

_nodeID