
/*
Author: [Killerswin2]
	A prettier logistics placer 
Arguments:
0: vehicle class name to place down <STRING>

Return Value:
None

Scope: Clients
Environment: Unscheduled
Public: 
no
Example:
[] call A3A_fnc_utilityPlacer.sqf
*/

#include "\a3\ui_f\hpp\definedikcodes.inc"
#define E_PRESSED 0
#define Q_PRESSED 1
#define WAIT_TIME 2
#define VEHICLE_OBJ_DIR 3
#define VEHICLE_OBJ 4
#define INFO_TEXT 5
#define END_PLACEMENT 6
#define KEYDOWN_EH 7
#define EACHFRAME_EH 8
#define HINT_DISPLAY 9

params [["_vehicle", "", [""]]];

A3A_vehiclePos = screenToWorld [0.5, 0.5];
A3A_dispVehicle = _vehicle createVehicleLocal A3A_vehiclePos;
A3A_dispVehicle enableSimulation false;
A3A_objectIcon = "\A3\ui_f\data\map\markers\handdrawn\objective_CA.paa";
A3A_objectColor = [1,0,0,1];

A3A_boundingCircle = [];
for "_i" from 1 to 36 do {
	private _posStart = [50*(cos(10*_i)),50*(sin(10*_i)),0] vectorAdd getPos player;
	private _piece = "Sign_Sphere100cm_F" createVehicleLocal _posStart;
	_piece enableSimulation false;
	A3A_boundingCircle pushBack _piece;
};
if(!isNil "A3A_object_EHDB") exitwith {};

A3A_object_EHDB = [false,
false, time, getDir A3A_dispVehicle, A3A_dispVehicle, "", {
	findDisplay 46 displayRemoveEventHandler ["KeyDown", A3A_object_EHDB # KEYDOWN_EH ];
	removeMissionEventHandler ["EachFrame", A3A_object_EHDB # EACHFRAME_EH ];
	//terminate (A3A_object_EHDB # HINT_DISPLAY );
	(A3A_object_EHDB # VEHICLE_OBJ) setVariable ["A3A_rotatingObject", false, true];
	{deleteVehicle _x} forEach A3A_boundingCircle;
	A3A_vehiclePos = nil;
	A3A_dispVehicle = nil;
	A3A_objectIcon = nil;
	A3A_objectIcon = nil;
	A3A_objectColor = nil;
	A3A_boundingCircle = nil;
	A3A_placementLines = nil;	
	A3A_object_EHDB = nil;
}, -1, -1, controlNull];

(A3A_object_EHDB # VEHICLE_OBJ) setVariable ["A3A_rotatingObject", true, true];

private _boundingBoxArray = 0 boundingBoxReal (A3A_object_EHDB # VEHICLE_OBJ);


private ["_rightFrontBottom","_rightRearBottom","_leftRearBottom","_leftFrontBottom",
"_rightFrontTop","_rightRearTop","_leftRearTop","_leftFrontTop",
"_minx","_miny","_minz","_maxx","_maxy","_maxz"];

_minx = (_boundingBoxArray # 0 # 0);
_miny = (_boundingBoxArray # 0 # 1);
_minz = (_boundingBoxArray # 0 # 2) + 0.2; //too low to catch collison
_maxx = (_boundingBoxArray # 1 # 0);
_maxy = (_boundingBoxArray # 1 # 1);
_maxz = (_boundingBoxArray # 1 # 2);

//bottom
_rightFrontBottom = [_minx, _miny, _minz];
_rightRearBottom = [_minx, _maxy, _minz];
_leftRearBottom = [_maxx, _maxy, _minz];
_leftFrontBottom = [_maxx, _miny, _minz];

//top
_rightFrontTop = [_minx, _miny, _maxz];
_rightRearTop = [_minx, _maxy, _maxz];
_leftRearTop = [_maxx, _maxy, _maxz];
_leftFrontTop = [_maxx, _miny, _maxz];


A3A_placementLines = [
	[_rightFrontBottom,_rightRearBottom],[_rightRearBottom,_leftRearBottom],[_leftRearBottom,_leftFrontBottom],[_leftFrontBottom, _rightFrontBottom],
	[_rightFrontTop,_rightRearTop],[_rightRearTop,_leftRearTop],[_leftRearTop,_leftFrontTop],[_leftFrontTop,_rightFrontTop],
	[_rightFrontBottom,_rightFrontTop],[_rightRearBottom,_rightRearTop],[_leftRearBottom,_leftRearTop],[_leftFrontBottom,_leftFrontTop]	  
];



private _keyDownEH = findDisplay 46 displayAddEventHandler ["KeyDown", {
	params["","_key"];
	private _return = false;

	if (_key isEqualTo DIK_E && (A3A_object_EHDB # WAIT_TIME) < time) then {
		_return = true;
		A3A_object_EHDB set [E_PRESSED, true];
		A3A_object_EHDB set [ WAIT_TIME , (A3A_object_EHDB # WAIT_TIME ) + 0.01];
	};

	if (_key isEqualTo DIK_Q && (A3A_object_EHDB # WAIT_TIME) < time) then {
		_return = true;
		A3A_object_EHDB set [Q_PRESSED, true];
		A3A_object_EHDB set [WAIT_TIME , (A3A_object_EHDB # WAIT_TIME ) + 0.01];
	};

	if (_key in [DIK_SPACE,DIK_RETURN]) then{
		_return = true;

		//vehicle stats
		private _vehDir = (A3A_object_EHDB # VEHICLE_OBJ_DIR);
		private _vehPos = A3A_vehiclePos;
		private _vehClass = typeOf (A3A_object_EHDB # VEHICLE_OBJ);

		if(_vehPos distance player  > 50 ) exitWith {
			deleteVehicle (A3A_object_EHDB # VEHICLE_OBJ);
			call (A3A_object_EHDB # END_PLACEMENT);
		};

		//createVehicle
		deleteVehicle (A3A_object_EHDB # VEHICLE_OBJ);

		private _veh = _vehClass createVehicle _vehPos;
		_veh setDir _vehDir;
		_veh setPos _vehPos;
		_veh setVectorUp surfaceNormal getPos _veh;
		A3A_returnVehicle = _veh;
		
		
		call (A3A_object_EHDB # END_PLACEMENT);
	};
	_return;
}];
A3A_object_EHDB set [ KEYDOWN_EH , _keyDownEH];

private _eachFrameEH  = addMissionEventHandler ["EachFrame", {

	private _stateChange = false;
	private _pos = getPos (A3A_object_EHDB # VEHICLE_OBJ);	
	private _objectsThatAreInTheWay = [];
	_objectsThatAreInTheWay = (_pos nearObjects ["thingX", ((A3A_object_EHDB # VEHICLE_OBJ) call BIS_fnc_boundingCircle)]);
	_objectsThatAreInTheWay = _objectsThatAreInTheWay + (_pos nearObjects ["AllVehicles", ((A3A_object_EHDB # VEHICLE_OBJ) call BIS_fnc_boundingCircle)]);
	_objectsThatAreInTheWay = _objectsThatAreInTheWay + (_pos nearObjects ["CAManBase", ((A3A_object_EHDB # VEHICLE_OBJ) call BIS_fnc_boundingCircle)]);
	

	//making the icons on top of the placement.
	if(count _objectsThatAreInTheWay > 0) then {
		{
			if (alive _x && _x isNotEqualTo (A3A_object_EHDB # VEHICLE_OBJ)) then {
				drawIcon3D [A3A_objectIcon, A3A_objectColor,(getPos _x vectorAdd[0,0,2]),
				1,1,0,format["%1",getText(configFile >> "CfgVehicles" >> typeOf _x >> "displayName")],
				2,0.06,"RobotoCondensedLight"];
			};
			if(_x isEqualTo (A3A_object_EHDB # VEHICLE_OBJ)) then {
				drawIcon3D [A3A_objectIcon, [0,0,1,1],(getPos _x vectorAdd[0,0,2]),
				1,1,0,format["%1",getText(configFile >> "CfgVehicles" >> typeOf _x >> "displayName")],
				2,0.06,"RobotoCondensedLight"];
			}
		} forEach _objectsThatAreInTheWay;
	};

	//3d lines if wanted 
	if(A3A_debugLines) then {
		{
		_x params ["_start", "_end"];
		drawLine3D [(A3A_object_EHDB # VEHICLE_OBJ) modelToWorldVisual _start, (A3A_object_EHDB # VEHICLE_OBJ) modelToWorldVisual _end, [0.9,0,0,1]];
		} forEach A3A_placementLines;
	};

	//change in position
	if (A3A_vehiclePos distance screenToWorld [0.5, 0.5] > 0.1) then {
		A3A_vehiclePos = screenToWorld [0.5, 0.5];
		_stateChange = true;
	};

	// rotation
	if (A3A_object_EHDB # Q_PRESSED) then {
		A3A_object_EHDB set [Q_PRESSED, false];
		A3A_object_EHDB set [VEHICLE_OBJ_DIR, (A3A_object_EHDB # VEHICLE_OBJ_DIR) -1];
		_stateChange = true;
	};

	if (A3A_object_EHDB # E_PRESSED) then {
		A3A_object_EHDB set [E_PRESSED, false];
		A3A_object_EHDB set [VEHICLE_OBJ_DIR, (A3A_object_EHDB # VEHICLE_OBJ_DIR) +1];
		_stateChange = true;
	};

	private _hide = {
		(A3A_object_EHDB # VEHICLE_OBJ) hideObject _this;
	};

	if (_stateChange) then {
		//check if out of bounds 
		if (_pos distance player > 50) exitWith {true call _hide};

		private _exit = false;

		//check for collisons with lines / bounding box
		{
			_x params ["_start", "_end"];
			if (lineIntersects [(A3A_object_EHDB # VEHICLE_OBJ) modelToWorldVisualWorld _start, (A3A_object_EHDB # VEHICLE_OBJ) modelToWorldVisualWorld _end, (A3A_object_EHDB # VEHICLE_OBJ)]) then {
				_exit = true;
			};
		} forEach A3A_placementLines;
		if (_exit) exitWith {true call _hide};
		false call _hide;
	};

	//set dir and pos
	if (_stateChange) then {
		(A3A_object_EHDB # VEHICLE_OBJ) setPos A3A_vehiclePos;
		(A3A_object_EHDB # VEHICLE_OBJ) setDir (A3A_object_EHDB # VEHICLE_OBJ_DIR);
		(A3A_object_EHDB # VEHICLE_OBJ) setVectorUp surfaceNormal getPos (A3A_object_EHDB # VEHICLE_OBJ);
	};

	if ((player distance (A3A_object_EHDB # VEHICLE_OBJ)) > 5) then {
		A3A_object_EHDB set [INFO_TEXT, localize "STR_A3A_Utility_Items_Feedback_Far"];
	}else {
		A3A_object_EHDB set [INFO_TEXT, localize "STR_A3A_Utility_Items_Feedback_Normal"];
	};

	//private _control_Hint = [(A3A_object_EHDB # INFO_TEXT) , 0, 0.9, 0.2, 0, 0, 17001] spawn BIS_fnc_dynamicText;
	//A3A_object_EHDB set [HINT_DISPLAY, _control_Hint];

	if (!([player] call A3A_fnc_canFight)) then{
		call (A3A_object_EHDB # END_PLACEMENT);
	};

}];