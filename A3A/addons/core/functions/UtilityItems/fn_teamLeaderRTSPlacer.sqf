/*
Author: [Killerswin2, Hakon (Stole his bb code)]
	team leader structured placer. Allows teamleaders to gain access to a
	rts like camera to place objects. 
Arguments:
1. <object> object that will center placement
2. <number> number that is used for the radius of placement
Return Value:
NONE
Scope: Client
Environment: Unscheduled
Public: 
no
Example:
[player, 100] call A3A_fnc_teamLeaderRTSPlacer.sqf
*/


#include "\a3\ui_f\hpp\definedikcodes.inc"
#include "placerDefines.hpp"

params [["_centerObject", player, [objNull]], ["_buildingRadius", 20, [0]]];



if(!isNil "A3A_building_EHDB") exitwith {};

[_centerObject, _buildingRadius] call A3A_fnc_initBuildingDB;
cam = "camcurator" camCreate (position _centerObject vectorAdd [0,0,2.5]);
cam cameraEffect ["Internal", "top"];
player enableSimulation false;

A3A_boundingCircle = [];
for "_i" from 1 to 36 do {
	private _posStart = [_buildingRadius * (cos(10*_i)), _buildingRadius * (sin(10*_i)),0] vectorAdd getPos _centerObject;
	private _piece = "Sign_Sphere100cm_F" createVehicleLocal _posStart;
	_piece enableSimulation false;
	A3A_boundingCircle pushBack _piece;
};


private _emptyDisplay = findDisplay 46 createDisplay "A3A_teamLeaderBuilder";
A3A_building_EHDB set [BUILD_DISPLAY, _emptyDisplay];
call (A3A_building_EHDB # UPDATE_BB); 

private _downKeyEH = _emptyDisplay displayAddEventHandler ["KeyDown", {
	params["_displayOrControl","_key"];
	if (_key in [DIK_ESCAPE,DIK_Y]) then {
		call (A3A_building_EHDB # END_BUILD_FUNC);
	};

	if (_key isEqualTo DIK_SPACE) then {
		if (isObjectHidden (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT)) exitWith {};

		private _mousePosition = getMousePosition;
		private _vehiclePos = screenToWorld[_mousePosition #0, _mousePosition#1];
		if(_vehiclePos distance  (A3A_building_EHDB # BUILD_RADIUS_OBJECT_CENTER) > (A3A_building_EHDB # BUILD_RADIUS)) exitwith {};
	
	
		private _className = (A3A_building_EHDB # BUILD_OBJECT_SELECTED_STRING);
		private _direction = getDir (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT);
	
		(A3A_building_EHDB # BUILD_OBJECTS_ARRAY) pushBack [_className, _vehiclePos, _direction];
		
		_vehicle = _className createVehicleLocal [0,0,0];
		_vehicle setDir _direction;
		_vehicle setPos _vehiclePos;
		//playSound3D[getMissionPath "Sounds\hammer.ogg", player];
		(A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT_ARRAY) pushBack _vehicle; 
	};
	
	
	if (_key isEqualTo DIK_E) then {
		A3A_building_EHDB set [E_PRESSED, true];
	};
	
	if (_key isEqualTo DIK_R ) then {
		A3A_building_EHDB set [R_PRESSED, true];
	};	 
}];

A3A_building_EHDB set [KEY_DOWN_EH, _downKeyEH];

private _upKeyEH = _emptyDisplay displayAddEventHandler ["KeyUp", {
	params ["_displayOrControl", "_key"];

	if (_key isEqualTo DIK_E) then {
		A3A_building_EHDB set [E_PRESSED, false];
	};

	if (_key isEqualTo DIK_R) then {
		A3A_building_EHDB set [R_PRESSED, false];
	};
}];

A3A_building_EHDB set [KEY_UP_EH, _upKeyEH];


private _eventHanderEachFrame = addMissionEventHandler ["EachFrame", {
	private _stateChange = false;
	private _mousePosition = getMousePosition;
	private _vehiclePostion = screenToWorld[_mousePosition #0, _mousePosition#1];
	
	//change in position
	if ((A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) distance _vehiclePostion > 0.1) then {
		_stateChange = true;
	};
	
	// rotation
	if (A3A_building_EHDB # R_PRESSED) then {
		(A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) setDir ((getDir (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT)) + diag_deltaTime * 120);
		_stateChange = true;
	};
	
	if (A3A_building_EHDB # E_PRESSED) then {
		(A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) setDir ((getDir (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT)) - diag_deltaTime * 120);
		_stateChange = true;
	};

	if (A3A_building_EHDB # GUI_BUTTON_PRESSED) then {
		A3A_building_EHDB set [GUI_BUTTON_PRESSED, false];
		_stateChange = true;
	};
	
	
	private _hide = {
		(A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) hideObject _this;
	};
	
	if (_stateChange) then {
		if ((A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) distance (A3A_building_EHDB # BUILD_RADIUS_OBJECT_CENTER) > (A3A_building_EHDB # BUILD_RADIUS)) exitWith {true call _hide};
		
		private _exit = false;
		
		// collison check, god arma what I would give for collison trigers (looking at you unity, BGE had them and it was made by 20ish guys)
		
		if(isNil "A3A_buildingRays") then {
			call (A3A_building_EHDB # UPDATE_BB);
		};
		
		{
			_x params ["_start", "_end"];
			if (lineIntersects [(A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) modelToWorldVisualWorld _start, (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) modelToWorldVisualWorld _end, (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT)]) then {
				_exit = true;
			};
		} forEach A3A_buildingRays;
		if (_exit) exitWith {true call _hide};
		false call _hide;
	}; 
	
	private _camClampPosition = [0,0,0];
	
	private _objectCenterX = (position (A3A_building_EHDB # BUILD_RADIUS_OBJECT_CENTER) # 0);
	private _objectCenterY = (position (A3A_building_EHDB # BUILD_RADIUS_OBJECT_CENTER) # 1);
	private _objectCenterZ = (position (A3A_building_EHDB # BUILD_RADIUS_OBJECT_CENTER) # 2);
	
	private _cameraX = (position cam # 0);
	private _cameraY = (position cam # 1);
	private _cameraZ = (position cam # 2);
		
	_camClampPosition set  [0 ,[_cameraX, _objectCenterX - (A3A_building_EHDB # BUILD_RADIUS), _objectCenterX + (A3A_building_EHDB # BUILD_RADIUS)] call BIS_fnc_clamp];
	_camClampPosition set  [1, [_cameraY, _objectCenterY - (A3A_building_EHDB # BUILD_RADIUS), _objectCenterY + (A3A_building_EHDB # BUILD_RADIUS)] call BIS_fnc_clamp];
	_camClampPosition set  [2, [_cameraZ, _objectCenterZ, _objectCenterZ + 10] call BIS_fnc_clamp];
	
	if (_stateChange) then {
	   (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) setPos _vehiclePostion; 
	};
	cam setPos _camClampPosition;
}];

A3A_building_EHDB set [EACH_FRAME_EH, _eventHanderEachFrame];