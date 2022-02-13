#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
if !(params [
      ["_event", "", [""]]
    , ["_id", "", [""]]
    , ["_callback", {}, ["", {}]]
]) exitWith {
    Error_1("Invalid params passed: %1", _this)
};

if (isNil QGVAR(EventRegistry)) then {
    GVAR(EventRegistry) = createHashMap;
};

if !(_event in GVAR(EventRegistry)) exitWith {
    Error_2("%1 is not a registerd event | ID: %2", _event, _id)
};

if (!isNil ((GVAR(EventRegistry) get _event) get _id)) then {
    Info_4(
        "Event listener overwritten | Event: %1 ID: %2 | Old -> Callback: %3 | New -> CallBack: %4"
        , _event, _id, ((GVAR(EventRegistry) get _event) get _id), str _callback
    );
};

(GVAR(EventRegistry) get _event) set [_id, _callback];

[_event, _id];
