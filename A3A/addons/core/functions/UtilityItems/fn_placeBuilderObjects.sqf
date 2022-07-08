/*
Author: [Killerswin2]
	create builds objects from array in the format, [classname, position, direction].
	hold actions are created for building. Cancel addActions allow for building cancellation. 
Arguments:
1. <array> array of objects, position, and direction for placement
Return Value:
NONE
Scope: Client
Environment: Unscheduled
Public: 
no
Example:
[_buildArray] call A3A_fnc_placeBuildObjects;
*/



params [["_objects",[],[[]]]];


private _constructionObjects = ["Land_WoodenPlanks_01_pine_F",
	"Land_WoodenPlanks_01_F",
	"Land_Pallets_F"];

//check if the buildList is empty or not?
if (isNil "A3A_notBuiltObjectList") then {
	A3A_notBuiltObjectList = [];
};
	
{
	private _className = _x # 0;
	private _position = _x # 1;
	private _direction = _x # 2;
	// private _holdTime = _x # 3;
	// private _buildTimeOut = time + 1200;
	
	private _constructionName = selectRandom _constructionObjects;
	
	private _vehicle = createVehicle [_constructionName, [0,0,0], [], 0, "CAN_COLLIDE"];
	_vehicle setPos _position;
	_vehicle setDir _direction;
	_vehicle setVariable ["position", _position, true];
	_vehicle setVariable ["direction", _direction, true];
	_vehicle setVariable ["className", _className, true];
	//_vehicle setVariable ["holdTimeOut", _buildTimeOut]

	A3A_notBuiltObjectList pushBack [_vehicle, _buildTimeOut];
	publicVariable "A3A_notBuiltObjectList"; //TODO check to see if the clients use this, maybe I can use publicVariableServer

	private _jipKey = "A3A_utilityItems_teamPlacer_" + ((str _vehicle splitString ":") joinString "");

	[_vehicle] remoteExec ["A3A_fnc_eachFrameEventHanderPlacer", 0];
	

	//Todo, call A3A_canFight, pushback Statics to save
	[_vehicle,
	"Build",
	"a3\ui_f\data\igui\cfg\actions\repair_ca.paa",
	"a3\ui_f\data\igui\cfg\actions\repair_ca.paa",
	'player getUnitTrait "engineer"',
	"[player] call A3A_fnc_canFight",
	{},
	{},
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		
		//kill eventHandler
		private _eachFrameEH = _target getVariable "eachFrameEH";
		["EachFrame", _eachFrameEH] remoteExec ["removeMissionEventHandler", 0];

		private _className = _target getVariable ["className", [0,0,0]];
		private _position = _target getVariable ["position", [0,0,0]];
		private _direction = _target getVariable ["direction", [0,0,0]];
		//private _objectTimeout = _target getVariable ["holdTimeOut", 10];

		private _vehicle = createVehicle [_className, [0,0,0], [], 0, "CAN_COLLIDE"];
		_vehicle setPos _position;
		_vehicle setDir _direction;
		deleteVehicle _target;

		//remove from list
		//A3A_notBuiltObjectList deleteAt (A3A_notBuiltObjectList find [_target, _objectTimeout]);
		//publicVariable "A3A_notBuiltObjectList";
		
		//save
		staticsToSave pushBackUnique _vehicle;
		publicVariable "staticsToSave"

	}] remoteExec ["BIS_fnc_holdActionAdd", 0, _jipKey];

	_vehicle addAction ["cancel",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];

		//private _objectTimeout = _target getVariable ["holdTimeOut", 10];
		//A3A_notBuiltObjectList deleteAt (A3A_notBuiltObjectList find [_target, _objectTimeout]);
		//publicVariable "A3A_notBuiltObjectList";

		private _eachFrameEH = _target getVariable "eachFrameEH";
		["EachFrame", _eachFrameEH] remoteExec ["removeMissionEventHandler", 0];
		deleteVehicle _target;
	},
	nil,
	1.5,
	true,
	true,
	"",
	'player getUnitTrait "engineer"',
	10
	]; 


	
} forEach _objects;

