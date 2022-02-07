#include "..\script_component.hpp"

params [
      ["_event", "", [""]]
    , ["_id", "", [""]]
    , ["_callback", {}, ["", {}]]
];

if (isNil QGVAR(EventRegistry)) then {
    GVAR(EventRegistry) = createHashMap;
};

if !(_event in GVAR(EventRegistry)) then {
    GVAR(EventRegistry) set [
        _event, createHashMapFromArray [[_id, _callback]]
    ];
} else {
    Info_4(
        "Event listener overwritten | Event: %1 ID: %2 | Old -> Callback: %3 | New -> CallBack: %4"
        , _event, _id, ((GVAR(EventRegistry) get _event) get _id), _callback
    );

    (GVAR(EventRegistry) get _event) set [_id, _callback];
};

[_event, _id];
