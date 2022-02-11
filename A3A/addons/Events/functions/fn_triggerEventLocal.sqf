#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
params [
      ["_event", "", [""]]
    , ["_arguments", [], [[]]]
];

if (isNil QGVAR(EventRegistry)) exitWith { Warning_1("Attempt to trigger event: %1 before Event registry is initilized", _event) };

if (isNil { GVAR(EventRegistry) get _event }) exitWith { Warning_1("No event of type %1 exists on this client", _event) };

Verbose_2("Event triggered: %1 | Arguments: %2", _event, _arguments);
{
    Verbose_2("Event ID: %1 | Callback: %2", _x, _y);
    if (_y isEqualType {}) then {_arguments call _y} else {
        //config.cpp functions are stored in uiNamespace as missionNamespace is not available at compile time, most mods get around this by compiling on mission load with xeh preInit eh and functions prep file
        private _func = missionNamespace getVariable [_y, uiNamespace getVariable _y];
        if (isNil _func) then { Error_2("None existant callback function %1, Event listener ID: %2", _y, _x) };
        if (_func isEqualType {}) then {_arguments call _func} else { Error_2("Callback not a function for Event listener ID: %1 | callback type: %2", _x, typeName _func) };
    };
} forEach (GVAR(EventRegistry) getOrDefault [_event, createHashMap]);
