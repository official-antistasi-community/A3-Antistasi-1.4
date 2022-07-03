#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params [
    ["_taskTypes",[],[[]]] //task types or task save
];

#define TASKS_CFG (configFile/"A3A"/"Tasks")

if (!isServer) exitWith { Error("Server function called on client"); false };
if (isNil QGVAR(ActiveTasks)) then { GVAR(ActiveTasks) = [] };
if (isNil QGVAR(Settings)) then { call FUNC(getSettings)};

//Task loading from save, format: TaskName, Params, stage, task version
if (_taskTypes isEqualTypeParams ["",[],0,0]) exitWith {
    private _cfg = TASK_CFG/(_taskTypes#0);
    private _version = getNumber (_cfg/"Version");

    if (_version isNotEqualTo (_taskTypes#3)) exitWith { false; };

    private _taskHM = createHashMapFromArray [
          ["Cfg", _cfg]
        , ["Params", _taskTypes#1]
    ];

    [_taskHM] spawn FUNC(runTask);
    true
}; //loading task from save

// gather tasks pool
private _allTasks = ("true" configClasses TASKS_CFG) apply {configName _x};
private _tasksOfCat = _allTasks select {
    getText (TASKS_CFG/_x/"Category") in _taskTypes;
};
if (_taskTypes isEqualTo []) then { _taskTypes = _allTasks };
{
    _taskTypes deleteAt (_taskTypes find (getText (TASKS_CFG/_x/"Category")));
    _taskTypes pushBackUnique _x;
} forEach _tasksOfCat;

//filter task that can be run
private _fnc_requirementMeet = { getArray (_this/"requiredAddons") findIf { !(isClass (configFile/"CfgPatches"/_x)) } == -1 };
private _taskParams = createHashMap;
_taskTypes = _taskTypes select {
    private _cfg = TASKS_CFG / _x;

    //Common criterias
<<<<<<< HEAD
    if !(_cfg call _fnc_requirementMeet) then {
=======
    if (_cfg call _fnc_requirementMeet) then {
>>>>>>> 31aff5b4 (fixed bad arguments for requiredAddons check)
        Debug_2("Task %1 is missing one or more required addons: %2", _x, getArray (_cfg/_requiredAddons)); continueWith false;
    };

    private _cat = getText (_cfg/"Category");
    if !(
        { (_x get "Category") isEqualTo _cat } count GVAR(ActiveTasks)
        < ( GVAR(Settings) getOrDefault ["MaxTasksOfCat_" + _cat, 1, true] )
    ) then { Debug_1("Max tasks of type %1 active", _x); continueWith false; };

    //chained tasks
    if (isClass (_cfg/"chain")) then {
        private _chain = getText (_cfg/"chain"/"name");
        if (_chain isEqualTo "") then { Error_1("Misconfigured task %1, lacking name of chain", _x); continueWith false; };
        private _requiredStage = getNumber (_cfg/"chain"/"stage");
        if (_requiredStage < 1) then { Error_1("Misconfigured task %1, chain stage requirement: >=1", _x); continueWith false; };

        private _stage = GVAR(ChainStates) getOrDefault [_chain, 1];
        if (_stage isNotEqualTo _requiredStage) then {
            Debug_4("%1 chain not at the required stage for task %2 | Current: %3 | Required: %4", _chain, _x, _stage, _requiredStage);
            continueWith false;
        };
    };

    //parameters getters of the mission type should handle mission type specific criterias
    private _paramsGetter = missionNamespace getVariable getText (_cfg / "Params");
    if (isNil "_paramsGetter") then { Debug_1("No params getter for task %1", _x); continueWith false; };
    private _taskParam = call _paramsGetter;
    _taskParams set [_x, _taskParam];

    if (_taskParam isEqualType false) then { Debug_1("No valid params for task %1", _x); continueWith false; };

    true;
};

private _selectedTask = _taskTypes selectRandomWeighted (_taskTypes apply {getNumber (TASKS_CFG/_x/"Weight")});
if (isNil "_selectedTask") exitWith { Info_1("Unable to start a task of types: ", if ((_this#0) isEqualTo []) then {"All", _this#0}); false };

// determine task parameters
private _taskHM = createHashMap;
_taskHM set ["Cfg", TASKS_CFG/_selectedTask];
_taskHM set ["Params", _taskParams get _selectedTask];

// start task
[_taskHM] spawn FUNC(runTask);
true;
