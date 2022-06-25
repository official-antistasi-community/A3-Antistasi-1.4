/*
Author: Håkon
Description:
    Sorts a controls group list, usefull after a mid list deletion to correct the positions

Arguments:
0. <Control> container controls group

Return Value:
<Bool> if successfull

Scope: Any
Environment: Any
Public: Yes
Dependencies:

Example:

License: MIT License
*/
#include "..\..\dialogues\defines.hpp"
#include "..\..\script_component.hpp"

if (!params [
    ["_ctrlGroup", controlNull, [controlNull]]
]) exitWith {false};

private _posY = 0;
{
    _x ctrlSetPositionY _posY;
    _posY = _posY + ((ctrlPosition _x) #3) + SPACER;
    _x ctrlCommit 0;
} forEach (_ctrlGroup call FUNC(directChildCtrls));

true;
