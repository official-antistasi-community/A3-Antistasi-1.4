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
	if (_key in [DIK_ESCAPE, DIK_Y]) then {
		call (A3A_building_EHDB # END_BUILD_FUNC);
	};

	if (_key isEqualTo DIK_SPACE) then {
		if (isObjectHidden (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT)) exitWith {};

		private _mousePosition = getMousePosition;
		private _vehiclePos = screenToWorld[_mousePosition # 0, _mousePosition # 1];
		_vehiclePos = _vehiclePos vectorAdd [0, 0, (A3A_building_EHDB # Z_BUFFER_POSITION)];
		if(_vehiclePos distance  (A3A_building_EHDB # BUILD_RADIUS_OBJECT_CENTER) > (A3A_building_EHDB # BUILD_RADIUS)) exitwith {};
	
	
		private _className = (A3A_building_EHDB # BUILD_OBJECT_SELECTED_STRING);
		private _direction = getDir (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT);
		private _vectorDirAndUp = A3A_building_EHDB # VECTOR_DIR_UP;

	
		(A3A_building_EHDB # BUILD_OBJECTS_ARRAY) pushBack [_className, _vehiclePos, _direction, _vectorDirAndUp];
		
		_vehicle = _className createVehicleLocal [0,0,0];
		_vehicle setDir _direction;
		_vehicle setPos _vehiclePos;
		_vehicle setVectorDirAndUp _vectorDirAndUp;
		//playSound3D[getMissionPath "Sounds\hammer.ogg", player];
		(A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT_ARRAY) pushBack _vehicle; 
	};

	

	if (_key isEqualTo DIK_LMENU) then {
		// we have enter raising mode
		A3A_building_EHDB set [RAISING_MODE_UP, true];
	};

	if (_key isEqualTo DIK_RALT) then {
		// we have enter raising mode
		A3A_building_EHDB set [RAISING_MODE_DOWN, true];
	};
	
	if (_key isEqualTo DIK_V) then {
		A3A_building_EHDB set [ROTATION_MODE_Z, true];
	};

	if (_key isEqualTo DIK_X) then {
		A3A_building_EHDB set [ROTATION_MODE_X, true];
	};

	if (_key isEqualTo DIK_C) then {
			A3A_building_EHDB set [ROTATION_MODE_Y, true];
	};	 
}];

A3A_building_EHDB set [KEY_DOWN_EH, _downKeyEH];

private _upKeyEH = _emptyDisplay displayAddEventHandler ["KeyUp", {
	params ["_displayOrControl", "_key"];


	if (_key isEqualTo DIK_V) then {
		A3A_building_EHDB set [ROTATION_MODE_Z, false];
	};

	if (_key isEqualTo DIK_X) then {
		A3A_building_EHDB set [ROTATION_MODE_X, false];
	};

	if (_key isEqualTo DIK_C) then {
		A3A_building_EHDB set [ROTATION_MODE_Y, false];
	};

	if (_key isEqualTo DIK_LMENU) then {
		// we have ended raising mode
		A3A_building_EHDB set [RAISING_MODE_UP, false];
	};

	if (_key isEqualTo DIK_RALT) then {
		// we have ended lower mode
		A3A_building_EHDB set [RAISING_MODE_DOWN, false];
	};

}];

A3A_building_EHDB set [KEY_UP_EH, _upKeyEH];



private _eventHanderEachFrame = addMissionEventHandler ["EachFrame", {
	private _stateChange = false;
	private _object = (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT);
	private _mousePosition = getMousePosition;
	private _vehiclePostion = screenToWorld[_mousePosition #0, _mousePosition#1];
	_vehiclePostion = _vehiclePostion vectorAdd [0, 0, (A3A_building_EHDB # Z_BUFFER_POSITION)];
	
	//change in position
	if (_object distance _vehiclePostion > 0.1) then {
		_stateChange = true;
	};

	if (A3A_building_EHDB # ROTATION_MODE_X) then {
		private _vectorDirAndUp = [[vectorDirVisual _object, vectorUpVisual _object], 0, (diag_deltaTime * 120), 0] call BIS_fnc_transformVectorDirAndUp;
		_object setVectorDirAndUp _vectorDirAndUp;
		A3A_building_EHDB set [VECTOR_DIR_UP, _vectorDirAndUp];
		_stateChange = true;
	};

	if (A3A_building_EHDB # ROTATION_MODE_Y) then {
		private _vectorDirAndUp = [[vectorDirVisual _object, vectorUpVisual _object], 0, 0, (diag_deltaTime * 120)] call BIS_fnc_transformVectorDirAndUp;
		_object setVectorDirAndUp _vectorDirAndUp;
		A3A_building_EHDB set [VECTOR_DIR_UP, _vectorDirAndUp];
		_stateChange = true;
	};

	if (A3A_building_EHDB # ROTATION_MODE_Z) then {
		private _vectorDirAndUp = [[vectorDirVisual _object, vectorUpVisual _object], (diag_deltaTime * 120), 0, 0] call BIS_fnc_transformVectorDirAndUp;
		_object setVectorDirAndUp _vectorDirAndUp;
		A3A_building_EHDB set [VECTOR_DIR_UP, _vectorDirAndUp];
		_stateChange = true;
	};

	if (A3A_building_EHDB # RAISING_MODE_UP) then {
		A3A_building_EHDB set [Z_BUFFER_POSITION,  (A3A_building_EHDB # Z_BUFFER_POSITION) + diag_deltaTime * 0.2]; 
		_stateChange = true;
	};

	if (A3A_building_EHDB # RAISING_MODE_DOWN) then {
		A3A_building_EHDB set [Z_BUFFER_POSITION,  (A3A_building_EHDB # Z_BUFFER_POSITION) - diag_deltaTime * 0.2]; 
		_stateChange = true;
	};
	

	if (A3A_building_EHDB # GUI_BUTTON_PRESSED) then {
		A3A_building_EHDB set [GUI_BUTTON_PRESSED, false];
		_stateChange = true;
	};
	
	
	private _hide = {
		_object hideObject _this;
	};
	
	if (_stateChange) then {
		if (_object distance (A3A_building_EHDB # BUILD_RADIUS_OBJECT_CENTER) > (A3A_building_EHDB # BUILD_RADIUS)) exitWith {true call _hide};
		
		private _exit = false;
		
		// collison check, god arma what I would give for collison trigers (looking at you unity, BGE had them and it was made by 20ish guys)
		
		if(isNil "A3A_buildingRays") then {
			call (A3A_building_EHDB # UPDATE_BB);
		};
		
		{
			_x params ["_start", "_end"];
			if (lineIntersects [_object modelToWorldVisualWorld _start, _object modelToWorldVisualWorld _end, _object]) then {
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
		_object setPos _vehiclePostion;
		_object setVectorDirAndUp (A3A_building_EHDB # VECTOR_DIR_UP);
	};
	cam setPos _camClampPosition;
}];

A3A_building_EHDB set [EACH_FRAME_EH, _eventHanderEachFrame];