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

	if (_key isEqualTo DIK_SPACE && !(A3A_building_EHDB # SPACE_PRESSED)) then {
		if (isObjectHidden (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT)) exitWith {};
		if ((A3A_building_EHDB # BUILD_OBJECT_SELECTED_STRING) isEqualTo "Land_Can_V2_F") exitwith {};	// temp objects not built.
		
		private _mousePosition = getMousePosition;
		private _vehiclePos = screenToWorld[_mousePosition # 0, _mousePosition # 1];
		if(_vehiclePos distance  (A3A_building_EHDB # BUILD_RADIUS_OBJECT_CENTER) > (A3A_building_EHDB # BUILD_RADIUS)) exitwith {};
		if(isOnRoad _vehiclePos) exitwith {};	// can't build on roads
		
		private _price = (A3A_building_EHDB # OBJECT_PRICE);
		//try to take money away 😞
		private _insufficientFunds = isNil {
    		if (player == theBoss && (server getVariable ["resourcesFIA", 0]) >= _price) then {
        		[0,(-_price)] remoteExec ["A3A_fnc_resourcesFIA",2];
        		true;
    		} else {
        		if ((player getVariable ["moneyX", 0]) >= _price) then {
            		[-_price] call A3A_fnc_resourcesPlayer;
            		true;
        		};
    		};
		};

		if (_insufficientFunds) exitwith {[localize "STR_antistasi_teamleader_placer_title", localize "STR_antistasi_teamleader_placer_insufficient_funds"] call A3A_fnc_customHint};

	
	
		private _className = (A3A_building_EHDB # BUILD_OBJECT_SELECTED_STRING);
		private _direction = getDir (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT);
		private _holdTime = (A3A_building_EHDB # HOLD_TIME);


	
		(A3A_building_EHDB # BUILD_OBJECTS_ARRAY) pushBack [_className, _vehiclePos, _direction, _holdTime, _price];
		
		

		_vehicle = _className createVehicleLocal [0,0,0];
		_vehicle setDir _direction;
		_vehicle setPos _vehiclePos;
		//playSound3D[getMissionPath "Sounds\hammer.ogg", player];
		(A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT_ARRAY) pushBack _vehicle; 

		A3A_building_EHDB set [SPACE_PRESSED, true];
	};

	if (_key isEqualTo DIK_LALT) then {
		A3A_building_EHDB set [UNSAFE_MODE, true];
	};

	if (_key isEqualTo DIK_E) then {
		A3A_building_EHDB set [ROTATION_MODE_E, true];
	};

	if (_key isEqualTo DIK_R) then {
			A3A_building_EHDB set [ROTATION_MODE_R, true];
	};	 
}];

A3A_building_EHDB set [KEY_DOWN_EH, _downKeyEH];

private _upKeyEH = _emptyDisplay displayAddEventHandler ["KeyUp", {
	params ["_displayOrControl", "_key"];

	if (_key isEqualTo DIK_LALT) then {
		A3A_building_EHDB set [UNSAFE_MODE, false];
	};

	if (_key isEqualTo DIK_SPACE) then {
		A3A_building_EHDB set [SPACE_PRESSED, false];
	};

	if (_key isEqualTo DIK_E) then {
		A3A_building_EHDB set [ROTATION_MODE_E, false];
	};

	if (_key isEqualTo DIK_R) then {
		A3A_building_EHDB set [ROTATION_MODE_R, false];
	};

}];

A3A_building_EHDB set [KEY_UP_EH, _upKeyEH];



private _eventHanderEachFrame = addMissionEventHandler ["EachFrame", {
	private _stateChange = false;
	private _object = (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT);
	private _mousePosition = getMousePosition;
	private _vehiclePostion = screenToWorld[_mousePosition #0, _mousePosition#1];
	
	//change in position
	if (_object distance _vehiclePostion > 0.1) then {
		_stateChange = true;
	};
	

	if (A3A_building_EHDB # ROTATION_MODE_E) then {
		_object setDir ((getDir _object) + diag_deltaTime * 120);
		_stateChange = true;
	};

	if (A3A_building_EHDB # ROTATION_MODE_R) then {
		_object setDir ((getDir _object) - diag_deltaTime * 120);
		_stateChange = true;
	};

	
	if (A3A_building_EHDB # GUI_BUTTON_PRESSED) then {
		A3A_building_EHDB set [GUI_BUTTON_PRESSED, false];
		_stateChange = true;
	};
	
	
	private _hide = {
		_object hideObject _this;
	};
	
	if (_stateChange && !(A3A_building_EHDB # UNSAFE_MODE)) then {
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
	};

	cam setPos _camClampPosition;
}];

A3A_building_EHDB set [EACH_FRAME_EH, _eventHanderEachFrame];