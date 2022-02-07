#include "..\script_component.hpp"

params [ ["_event", "", [""]] ];

if (isNil QGVAR(EventRegistry)) exitWith { Warning_1("Attempt to remove listeners for event: %1 before Event registry is initilized", _event) };

if (
    _event in GVAR(EventRegistry)
) then {
    GVAR(EventRegistry) deleteAt _event;
};
