#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params [
    ["_taskTypes",[],[[], createHashMap]] //task types or task hm
];

#define TASKS_CFG (configFile/"A3A"/"Tasks")

if (!isServer) exitWith { Error("Server function called on client"); "10" };
if (isNil QGVAR(ActiveTasks)) then { GVAR(ActiveTasks) = [] };
if (isNil QGVAR(Settings)) then { call FUNC(getSettings)};
if (_taskTypes isEqualType createHashMap) exitWith { [_taskTypes] spawn FUNC(runTask); "13" }; //loading task from save

// select task type from the ones we can create more of atm
if (_taskTypes isEqualTo []) then {_taskTypes = "true" configClasses TASKS_CFG};
_taskTypes = _taskTypes select {
    // Task type missconfigured
    if (!isClass _x) then { Error_1("Invalid task type: %1", configName _x); continueWith false };

    //Common criterias
    private _cat = getText (_x/"Category");
    if !(
        { (_x get "Category") isEqualTo _cat } count GVAR(ActiveTasks)
        < ( GVAR(Settings) get ("MaxTasksOfCat_" + _cat) )
    ) then { Debug_1("Max tasks of type %1 active", configName _x); continueWith false};

    //parameters getters of the mission type should handle mission type specific criterias
    private _paramsGetter = missionNamespace getVariable getText (_x / "Params");
    if (isNil "_paramsGetter") then { Debug_1("No params getter for task %1", configName _x); continueWith false; };
    if ((call _paramsGetter) isEqualType false) then { Debug_1("No valid params for task %1",configName _x); continueWith false };

    true; //ToDo: add more criterias
};

private _selectedTask = selectRandom _taskTypes;
if (isNil "_selectedTask") exitWith { Info_1("Unable to start a task of types: ", if ((_this#0) isEqualTo []) then {"All", _this#0}); "38" };

// determine task parameters
private _taskHM = createHashMap;
_taskHM set ["Cfg", _selectedTask];
_taskHM set ["Params", call (missionNameSpace getVariable [getText (_selectedTask/"Params"), {[]}])];

// start task
[_taskHM] spawn FUNC(runTask);
true;
