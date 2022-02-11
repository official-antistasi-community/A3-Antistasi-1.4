#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
params [
      ["_event", "", [""]]
    , ["_id", "", [""]]
];

if (isNil QGVAR(EventRegistry)) exitWith { Warning_2("Attempt to remove listener for event: %1 with ID: %2 before Event registry is initilized", _event, _id) };

if (
    _event in GVAR(EventRegistry)
    && { !isNil { (GVAR(EventRegistry) get _event) get _id } }
) then {
    (GVAR(EventRegistry) get _event) deleteAt _id;
} else {
    Warning_2("No listner for event %1 with ID %2 exists", _event, _id)
};
