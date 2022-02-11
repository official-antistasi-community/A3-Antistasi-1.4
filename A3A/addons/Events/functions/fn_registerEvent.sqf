#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
params [["_event", "", [""]]];

if (isNil QGVAR(EventRegistry)) then {
    GVAR(EventRegistry) = createHashMap;
};

if (_event in GVAR(EventRegistry)) exitWith {
    Error_1("Event %1 already registerd", _event)
};

GVAR(EventRegistry) set [_event, createHashMap];
Debug_1("Event %1 registerd", _event)
