#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
params [ ["_event", "", [""]] ];

if (isNil QGVAR(EventRegistry)) exitWith { Warning_1("Attempt to remove listeners for event: %1 before Event registry is initilized", _event) };

if (
    _event in GVAR(EventRegistry)
) then {
    GVAR(EventRegistry) deleteAt _event;
} else {
        Warning_1("No listners for event %1 exists", _event)
};
