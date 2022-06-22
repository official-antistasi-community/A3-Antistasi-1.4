/*
Author: [Killerswin2, Hakon (Stole his bb code)]
	team leader structured placer. Allows teamleaders to gain access to a
	rts like camera to place objects. 
Arguments:
NONE
Return Value:
NONE
Scope: Clients
Environment: Unscheduled
Public: 
no
Example:
[] call A3A_fnc_teamLeaderRTSPlacer.sqf
*/


#include "\a3\ui_f\hpp\definedikcodes.inc"
#define E_PRESSED 0
#define R_PRESSED 1
#define UP_ARROW_KEY 2
#define DOWN_ARROW_KEY 3
#define WAIT_TIME 4
#define BUILD_OBJECTS_ARRAY 5
#define BUILD_OBJECT_LIST 6
#define BUILD_LIST_INDEX 7
#define BUILD_OBJECT_TEMP_OBJECT 8
#define BUILD_OBJECT_TEMP_OBJECT_ARRAY 9
#define END_BUILD_FUNC 10
#define BUILD_DISPLAY 11
#define MOUSE_DOWN_EH 12
#define KEY_DOWN_EH 13
#define EACH_FRAME_EH 14
#define UPDATE_BB 15
#define TELL_MOUSE_DOWN_TO_CHILL 16





if(!isNil "A3A_building_EHDB") exitwith {};

call A3A_fnc_initBuildingDB;
cam = "camcurator" camCreate (position player vectorAdd [0,0,2.5]);
cam cameraEffect ["Internal", "top"];
player enableSimulation false;

A3A_boundingCircle = [];
for "_i" from 1 to 36 do {
	private _posStart = [20*(cos(10*_i)),20*(sin(10*_i)),0] vectorAdd getPos player;
	private _piece = "Sign_Sphere100cm_F" createVehicleLocal _posStart;
	_piece enableSimulation false;
	A3A_boundingCircle pushBack _piece;
};


private _emptyDisplay = findDisplay 46 createDisplay "A3A_teamLeaderBuilder";

A3A_building_EHDB set [BUILD_DISPLAY, _emptyDisplay];
call (A3A_building_EHDB # UPDATE_BB);

private _mouseDownEH = _emptyDisplay displayAddEventHandler ["MouseButtonDown", {
	params ["_displayOrControl", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
	
	if( A3A_building_EHDB # TELL_MOUSE_DOWN_TO_CHILL) exitWith {};
	if ( _button isNotEqualTo 0) exitWith {};
	if (isObjectHidden (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT)) exitWith {};
	
	private _vehiclePos = screenToWorld [_xPos, _yPos]; 
	if(_vehiclePos distance player > 20) exitwith {};
	
	
	systemChat "Button Clicked!";
	private _object = (A3A_building_EHDB # BUILD_OBJECT_LIST);
	private _index = (A3A_building_EHDB # BUILD_LIST_INDEX);
	private _direction = getDir (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT);
	
	(A3A_building_EHDB # BUILD_OBJECTS_ARRAY) pushBack [_object # _index, _vehiclePos, _direction];
		
	//deleteVehicle vec;
	_vehicle = _object # _index createVehicleLocal [0,0,0];
	_vehicle setDir _direction;
	_vehicle setPos _vehiclePos;
	playSound3D[getMissionPath "Sounds\hammer.ogg", player];
	(A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT_ARRAY) pushBack _vehicle; 
	
	// we need to add an Action on the Pallets to cancel build later.
	
			 
}];


A3A_building_EHDB set [MOUSE_DOWN_EH, _mouseDownEH]; 

private _downKeyEH = _emptyDisplay displayAddEventHandler ["KeyDown", {
	params["_displayOrControl","_key"];
	if (_key in [DIK_ESCAPE,DIK_Y] && (A3A_building_EHDB # WAIT_TIME) < time) then {
		A3A_building_EHDB set [WAIT_TIME , (A3A_building_EHDB # WAIT_TIME ) + diag_deltaTime];
		systemChat "Escape Key Pressed";
		
		call (A3A_building_EHDB # END_BUILD_FUNC);
	};
	
	
	// arrow keys
	if (_key isEqualTo DIK_UP && (A3A_building_EHDB # WAIT_TIME) < time) then {
		systemChat "UP Arrow Key Pressed";
		A3A_building_EHDB set [UP_ARROW_KEY, true];
		A3A_building_EHDB set [WAIT_TIME , (A3A_building_EHDB # WAIT_TIME ) + diag_deltaTime];
		private _object = (A3A_building_EHDB # BUILD_OBJECT_LIST);
		private _index = (A3A_building_EHDB # BUILD_LIST_INDEX);
		_index = ((_index + 1 ) % count _object);
		
		private _vehPos =  getPos (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT);
		deleteVehicle (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT);
		A3A_building_EHDB set [BUILD_OBJECT_TEMP_OBJECT, (_object # _index) createVehicleLocal [0,0,0]];
		(A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) enableSimulationGlobal false;
		(A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) setPos _vehPos; 
		call (A3A_building_EHDB # UPDATE_BB);
		A3A_building_EHDB set [BUILD_LIST_INDEX, _index];
	};
	
	if (_key isEqualTo DIK_DOWN && (A3A_building_EHDB # WAIT_TIME) < time) then {
		systemChat "DOWN Arrow Key Pressed";
		A3A_building_EHDB set [DOWN_ARROW_KEY, true];
		A3A_building_EHDB set [WAIT_TIME , (A3A_building_EHDB # WAIT_TIME ) + diag_deltaTime];
		private _object = (A3A_building_EHDB # BUILD_OBJECT_LIST);
		private _index = (A3A_building_EHDB # BUILD_LIST_INDEX);
		_index = ((_index - 1 ) % 5);
		
		if(_index isEqualTo -1) then {
			_index = (count _object) -1;
		};
		
		private _vehPos =  getPos (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT);
		deleteVehicle (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT);
		A3A_building_EHDB set [BUILD_OBJECT_TEMP_OBJECT, (_object # _index) createVehicleLocal [0,0,0]];
		(A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) enableSimulationGlobal false;
		(A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) setPos _vehPos;
		call (A3A_building_EHDB # UPDATE_BB);
		A3A_building_EHDB set [BUILD_LIST_INDEX, _index];
	};
	
	if (_key isEqualTo DIK_E && (A3A_building_EHDB # WAIT_TIME) < time) then {
		systemChat "E Key Pressed";
		A3A_building_EHDB set [E_PRESSED, true];
		A3A_building_EHDB set [WAIT_TIME , (A3A_building_EHDB # WAIT_TIME ) + diag_deltaTime];
		(A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) setDir ((getDir (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT)) - 5);
		
	};
	
	if (_key isEqualTo DIK_R && (A3A_building_EHDB # WAIT_TIME) < time) then {
		systemChat "R Key Pressed";
		A3A_building_EHDB set [R_PRESSED, true];
		A3A_building_EHDB set [WAIT_TIME , (A3A_building_EHDB # WAIT_TIME ) + diag_deltaTime];
		(A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) setDir ((getDir (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT)) + 5);
	};	 
}];

A3A_building_EHDB set [KEY_DOWN_EH, _downKeyEH];


//TODO hide the object if the distance is less than 20
private _eventHanderEachFrame = addMissionEventHandler ["EachFrame", {
	//systemChat str position cam;
	private _stateChange = false;
	private _mousePosition = getMousePosition;
	private _vehiclePostion = screenToWorld[_mousePosition #0, _mousePosition#1];
	
	//change in position
	if ((A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) distance _vehiclePostion > 0.1) then {
		_stateChange = true;
	};
	
	// rotation
	if (A3A_building_EHDB # R_PRESSED) then {
		A3A_building_EHDB set [R_PRESSED, false];
		_stateChange = true;
	};
	
	if (A3A_building_EHDB # E_PRESSED) then {
		A3A_building_EHDB set [E_PRESSED, false];
		_stateChange = true;
	};
	
	// change vehicle keys
	if (A3A_building_EHDB # UP_ARROW_KEY) then {
		A3A_building_EHDB set [UP_ARROW_KEY, false];
		_stateChange = true;
	};
	
	if (A3A_building_EHDB # DOWN_ARROW_KEY) then {
		A3A_building_EHDB set [DOWN_ARROW_KEY, false];
		_stateChange = true;
	}; 
	
	
	private _hide = {
		(A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) hideObject _this;
	};
	
	if (_stateChange) then {
		if ((A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) distance player > 20) exitWith {true call _hide};
		
		private _exit = false;
		
		// collison check, god arma what I would give for collison trigers (looking at you unity, BGE had them and it was made by 20ish guys)
		
		if(isNil "A3A_buildingRays") then {
			call (A3A_building_EHDB # UPDATE_BB);
		};
		
		{
			_x params ["_start", "_end"];
			drawLine3D [(A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) modelToWorldVisual _start, (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) modelToWorldVisual _end, [0.9,0,0,1]];
			if (lineIntersects [(A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) modelToWorldVisualWorld _start, (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) modelToWorldVisualWorld _end, (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT)]) then {
				_exit = true;
			};
		} forEach A3A_buildingRays;
		if (_exit) exitWith {true call _hide};
		false call _hide;
	}; 
	
	private _camClampPosition = [0,0,0];
	
	private _playerX = (position player # 0);
	private _playerY = (position player # 1);
	private _playerZ = (position player # 2);
	
	private _cameraX = (position cam # 0);
	private _cameraY = (position cam # 1);
	private _cameraZ = (position cam # 2);
		
	_camClampPosition set  [0 ,[_cameraX, _playerX - 20, _playerX + 20] call BIS_fnc_clamp];
	_camClampPosition set  [1, [_cameraY, _playerY - 20, _playerY + 20] call BIS_fnc_clamp];
	_camClampPosition set  [2, [_cameraZ, _playerZ, _playerZ + 10] call BIS_fnc_clamp];
	
	//systemChat str _vehiclePostion;
	if (_stateChange) then {
	   (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) setPos _vehiclePostion; 
	};
	cam setPos _camClampPosition;
}];

A3A_building_EHDB set [EACH_FRAME_EH, _eventHanderEachFrame];