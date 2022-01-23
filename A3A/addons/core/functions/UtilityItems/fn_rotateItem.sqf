/*
Author: Killerswin2, Hakon
    rotates an item
Arguments:
    0.<Object> object that will be rotated
Return Value:
    <nil>

Scope: Clients
Environment: Unscheduled
Public: No
Dependencies: 

Example:
    [cursorObject] call A3A_fnc_rotateItem; 

Note: 
*/

#include "\a3\ui_f\hpp\definedikcodes.inc"
params[["_object", objNull, [objNull]]];

#define E_PRESSED 0
#define Q_PRESSED 1
#define WAIT_TIME 2
#define LIGHT_DIR 3
#define LIGHT 4
#define INFO_TEXT 5
#define END_ROTATING 6
#define KEYDOWN_EH 7
#define EACHFRAME_EH 8
#define HINT_DISPLAY 9

if(!isNil "A3A_objectRotate_EHDB") exitwith {};

A3A_objectRotate_EHDB = [false, false, time, getDir _object, _object, "", {
    findDisplay 46 displayRemoveEventHandler ["KeyDown", A3A_objectRotate_EHDB # KEYDOWN_EH ];
    removeMissionEventHandler ["EachFrame", A3A_objectRotate_EHDB # EACHFRAME_EH ];
    terminate (A3A_objectRotate_EHDB # HINT_DISPLAY );
    _object setVariable ["A3A_rotatingObject", false, true];
    A3A_objectRotate_EHDB = nil;
}, -1, -1, controlNull];

_object setVariable ["A3A_rotatingObject", true, true];

//event handlers    
private _keyDownEH = findDisplay 46 displayAddEventHandler ["KeyDown", {
    params["","_key"];
    private _return = false;

    if (_key isEqualTo DIK_E && (A3A_objectRotate_EHDB # WAIT_TIME) < time) then {
        _return = true;
        A3A_objectRotate_EHDB set [E_PRESSED, true];
        A3A_objectRotate_EHDB set [ WAIT_TIME , (A3A_objectRotate_EHDB # WAIT_TIME ) + 0.01];
    };

    if (_key isEqualTo DIK_Q && (A3A_objectRotate_EHDB # WAIT_TIME) < time) then {
        _return = true;
        A3A_objectRotate_EHDB set [Q_PRESSED, true];
        A3A_objectRotate_EHDB set [WAIT_TIME , (A3A_objectRotate_EHDB # WAIT_TIME ) + 0.01];
    };

    if (_key in [DIK_SPACE,DIK_RETURN]) then{
        _return = true;
        call (A3A_objectRotate_EHDB # END_ROTATING);
    };
    _return;
}];
A3A_objectRotate_EHDB set [ KEYDOWN_EH , _keyDownEH];

private _eachFrameEH  = addMissionEventHandler ["EachFrame", {
    private _directionChanged = false;

    // rotation
    if (A3A_objectRotate_EHDB # Q_PRESSED) then {
        A3A_objectRotate_EHDB set [Q_PRESSED, false];
        A3A_objectRotate_EHDB set [LIGHT_DIR, (A3A_objectRotate_EHDB # LIGHT_DIR) -1];
        _directionChanged = true;
    };

    if (A3A_objectRotate_EHDB # E_PRESSED) then {
        A3A_objectRotate_EHDB set [E_PRESSED, false];
        A3A_objectRotate_EHDB set [LIGHT_DIR, (A3A_objectRotate_EHDB # LIGHT_DIR) +1];
        _directionChanged = true;
    };

    //set dir
    if (_directionChanged) then {
        (A3A_objectRotate_EHDB # LIGHT) setDir (A3A_objectRotate_EHDB # LIGHT_DIR);
        (A3A_objectRotate_EHDB # LIGHT) setVectorUp surfaceNormal getPos (A3A_objectRotate_EHDB # LIGHT);
    };

    if ((player distance (A3A_objectRotate_EHDB # LIGHT)) > 5) then {
        A3A_objectRotate_EHDB set [INFO_TEXT, localize "STR_A3A_Utility_Items_Feedback_Far"];
    }else {
        A3A_objectRotate_EHDB set [INFO_TEXT, localize "STR_A3A_Utility_Items_Feedback_Normal"];
    };

    private _control_Hint = [A3A_objectRotate_EHDB # INFO_TEXT , 0, 0.9, 0.2, 0, 0, 17001] spawn BIS_fnc_dynamicText;
    A3A_objectRotate_EHDB set [HINT_DISPLAY, _control_Hint];

    if (!([player] call A3A_fnc_canFight)||((player distance (A3A_objectRotate_EHDB # LIGHT)) > 6)) then{
        call (A3A_objectRotate_EHDB # END_ROTATING);
    };

}];
A3A_objectRotate_EHDB set [EACHFRAME_EH , _eachFrameEH];
