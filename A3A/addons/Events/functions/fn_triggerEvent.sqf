/*
Author: Håkon
Description:
    Triggers an event

Arguments:
0. <String> Event identifier

Return Value:
<Nil|Bool> Nil if failed, otherwise true

Scope: Any
Environment: unscheduled
Public: Yes
Dependencies:

Example: ["AIVehInit", [_veh, _side]] call A3A_Events_fnc_triggerEvent;

License: MIT License
*/
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
params [
      ["_event", "", [""]]
    , ["_arguments", [], [[]]]
];

if (isNil QGVAR(EventRegistry)) exitWith { GVAR(EventRegistry) = createHashMap; };

if (!isClass (configFile/"A3A"/"Events"/_event)) exitWith { Warning_1("No event of type %1 exists", _event) };

#ifdef VALIDATE_EVENT_ARGUMENTS
if !(_this call FUNC(validateEventArguments)) exitWith {};
#endif

Verbose_2("Event triggered: %1 | Arguments: %2", _event, _arguments);
{
    Verbose_2("Event ID: %1 | Callback: %2", _x, _y);
    if (_y isEqualType {}) then {_arguments call _y} else {
        //config.cpp functions are stored in uiNamespace as missionNamespace is not available at compile time, most mods get around this by compiling on mission load with xeh preInit eh and functions prep file
        private _func = missionNamespace getVariable [_y, uiNamespace getVariable _y];
        if (isNil _func) then { Error_2("None existant callback function %1, event listener ID: %2", _y, _x) };
        if (_func isEqualType {}) then {_arguments call _func} else { Error_2("Callback not a function for event listener ID: %1 | Callback type: %2", _x, typeName _func) };
    };
} forEach (GVAR(EventRegistry) getOrDefault [_event, createHashMap]);
true
