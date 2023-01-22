/*
Author: Håkon
Description:
    creates a new control of specified type and places it at the bottom of a controls group list

Arguments:
0. <Control> the controls group container that is the list
0. <String> the class of the child you want to emplace back in the list

Return Value:
<Control> controlNull if failed otherwise the created control

Scope: Any
Environment: Any
Public: Yes
Dependencies:

Example:

License: MIT License
*/
#include "..\..\dialogues\defines.hpp"
#include "..\..\script_component.hpp"

//validate arguments
if (!params [
    ["_parent", controlNull, [controlNull]]
    , ["_ctrlClass", "", [""]]
]) exitWith {controlNull};

//get the position to place at the bottom of the list
private _children = _parent call FUNC(directChildCtrls);
private _count = count _children -1;
private _yNew = if (_count < 0 ) then {0} else {
    ctrlPosition (_children # _count) params ["", "_y", "", "_h"];
    SPACER + _y + _h;
};

// create new control and place it
private _ctrl = (ctrlParent _parent) ctrlCreate [_ctrlClass, -1, _parent];
_ctrl ctrlSetPositionY _yNew;
_ctrl ctrlCommit 0;

_ctrl;
