/*
Author: [Killerswin2]
    rotates an item
Arguments:
	0.<Object> object that will be rotated;
Return Value:
    <nil>

Scope: Clients
Environment: Unscheduled
Public: No
Dependencies: 

Example:
    [cursorObject] call A3A_fnc_rotateItem; 
*/

#include "\a3\ui_f\hpp\definedikcodes.inc"
params[["_light", objNull, [objNull]]];

//globals
PRESSED_E = false;
PRESSED_Q = false;
WAIT_TIME = time;
DIR_OBJECT = getDir _light;
LIGHT = _light;
INFO_TEXT = "";


//clean up items
endRotating = {
	findDisplay 46 displayRemoveEventHandler ["KeyDown", DISPLAY_HANDLER_UTILITY];
	removeMissionEventHandler ["EachFrame", FRAME_HANDLER_UTILITY];
	terminate CONTROL_HINT;

	//variables
	PRESSED_E = nil;
	PRESSED_Q = nil;
	WAIT_TIME = nil;
	DIR_OBJECT = nil;
	LIGHT = nil;
	INFO_TEXT = nil;
	CONTROL_HINT = nil;
};

//event handlers

DISPLAY_HANDLER_UTILITY = findDisplay 46 displayAddEventHandler ["KeyDown", {
	params["","_key"];
	private _return = false;

	if(_key isEqualTo DIK_E && WAIT_TIME < time) then {
		_return = true;
		PRESSED_E = true;
		WAIT_TIME = time + 0.01;
	};

	if(_key isEqualTo DIK_Q && WAIT_TIME < time) then {
		_return = true;
		PRESSED_Q = true;
		WAIT_TIME = time + 0.01;
	};

	if(_key in [DIK_SPACE,DIK_RETURN]) then{
		_return = true;
		call endRotating;
	};
	_return;
}];

FRAME_HANDLER_UTILITY= addMissionEventHandler ["EachFrame", {
    private _directionChanged = false;

	// rotation
    if (PRESSED_Q) then {
        PRESSED_Q = false;
        DIR_OBJECT  = DIR_OBJECT  - 1;
        _directionChanged = true;
    };

    if (PRESSED_E) then {
        PRESSED_E = false;
        DIR_OBJECT  = DIR_OBJECT  + 1;
        _directionChanged = true;
    };

	//set dir
	if(_directionChanged) then {
		LIGHT setDir DIR_OBJECT;
	};

	if(player distance LIGHT > 5) then {
		INFO_TEXT = "Your Too Far";
	}else{
		INFO_TEXT = "Q/E to rotate." + endl + "Space/Enter to stop.";
	};

	CONTROL_HINT = [INFO_TEXT, 0, 0.9, 0.2, 0, 0, 17001] spawn BIS_fnc_dynamicText;

	if(!([player] call A3A_fnc_canFight)||(player distance LIGHT > 6)) then{
		call endRotating;
	};

}];

