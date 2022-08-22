/*
Author: Håkon
Description:
    Add a listener to an event, allowing you to trigger functions when that event occurs

Arguments:
0. <String> Event identifier, as registered in configFile >> A3A >> Events
1. <String> Unique identifier of listener
2. <String|Code> Code block or name of function to excecute on event occurance

Return Value:
<Array<Event, ID>> data needed to remove listener

Scope: Any
Environment: unscheduled
Public: Yes
Dependencies:

Example:
["AIVehInit", "A3A_Events_example", "someFuncName"] call A3A_Events_fnc_addEventListener;
["AIVehInit", "A3A_Events_example", {systemChat "Example event listener triggered!"}] call A3A_Events_fnc_addEventListener;
["AIVehInit", "A3A_Events_example", someFunc] call A3A_Events_fnc_addEventListener;

License: MIT License
*/
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

if !(_event in GVAR(EventRegistry)) then {
    GVAR(EventRegistry) set [_event, createHashMap];
};

if (!isNil ((GVAR(EventRegistry) get _event) get _id)) then {
    Info_4(
        "Event listener overwritten | Event: %1 ID: %2 | Old -> Callback: %3 | New -> CallBack: %4"
        , _event, _id, ((GVAR(EventRegistry) get _event) get _id), str _callback
    );
};

(GVAR(EventRegistry) get _event) set [_id, _callback];

[_event, _id];
