#include "..\script_component.hpp"

params [
      ["_event", "", [""]]
    , ["_arguments", [], [[]]]
    , ["_targets", 0, [0,sideUnknown,grpNull,objNull,"",[]]]
];

if (
    _targets isEqualType [] &&
    { _targets findIf { !(_x isEqualTypeAny [true,0,sideUnknown,grpNull,objNull,""]) } > -1 }
) exitWith {
    Error_2("Invalid targets passed for Event: %1 | Targets: %2 | Allowed types are: Boolean, Number, Side, Group, Object, String or array of the afformentioned", _event, _targets)
};

[_event, _arguments] remoteExecCall [QFUNC(triggerEventLocal), _targets];
