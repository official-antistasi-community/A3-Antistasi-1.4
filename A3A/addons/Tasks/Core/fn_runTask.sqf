#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
private _emptyHM = createHashMap;
params [["_taskHM", _emptyHM, [_emptyHM]]];

//validation
if (_taskHM isEqualTo _emptyHM) exitWith { Error_1("Invalid parameters passed: %1", _this) };
if (!canSuspend) exitWith { Error_1("Tasks needs to run in scheduled environment") };

_taskHM set ["taskID", call FUNC(genTaskUID)];

//load task
private _taskData = missionNameSpace getVariable getText ((_taskHM get "cfg") / "func");
if (isNil "_taskData") exitWith { Error_1("Function does not exist: %1", _taskData) };
_taskHM call _taskData;

//run task
_taskHM call FUNC(updateTaskState);
if !("constructor" in _taskHM) exitWith { Error_1("Task %1 lacks a constructor", configName (_taskHM get "cfg")) };
GVAR(activeTasks) pushBackUnique _taskHM;
_taskHM call (_taskHM get "constructor");

private _stage = _taskHM getOrDefault ["__CurrentStage", 1];
private _stages = (_taskHM get "stages") select [_stage-1, count (_taskHM get "stages")];
if (_stage > 1) then { _taskHM call ((_stages#0) getOrDefault ["Init",{}]) };

_taskHM set ["rewards",[]];
{
    _taskHM call FUNC(updateTaskState);
    if !("action" in _x) exitWith { Error_1("Stage %1 is missing the action",_x) };
    if !("condition" in _x) exitWith { Error_1("Stage %1 is missing the condition",_x) };

    private _endTime = time + (_x getOrDefault ["timeout", 1e12]);
    _taskHM call (_x get "action");
    _taskHM call FUNC(updateTaskState);

    waitUntil {
        sleep 1;
        (if ("timeout" in _x) then {time >= _endTime} else {false})
        || _taskHM call (_x get "condition")
        || (_taskHM getOrDefault ["cancellationToken", false])
        || (_x getOrDefault ["cancellationToken", false])
    };
    _taskHM set ["__CurrentStage", (_taskHM get "__CurrentStage") +1]; //increment stage count (for saving/loading)

    if (_taskHM getOrDefault ["cancellationToken", false]) exitWith {
        _taskHM set ["successful", false];
        _taskHM set ["state", "CANCELED"];
    };

    private _successful = (if ("timeout" in _x) then {time < _endTime} else {true}) && !(_x getOrDefault ["cancellationToken", false]);
    _x set ["successful", _successful];
    if (_successful) then {
        if (_x getOrDefault ["rewardInstant",false]) then (_x getOrDefault ["reward",{}]) else {
            if ("reward" in _x) then {
                (_taskHM get "rewards") pushBack (_x get "reward");
            };
        };
        _x set ["state", "SUCCEEDED"];
    } else {
        if (_x getOrDefault ["cancellationToken", false]) then {
            _x set ["state", "CANCELED"]
        } else {
            _x set ["state", "FAILED"]
        };
    };

    if (!_successful && (_x getOrDefault ["required", true])) exitWith {
        _taskHM set ["successful", false];
        _taskHM set ["state", "FAILED"];
    };
} forEach _stages;

if (_taskHM getOrDefault ["successful", true]) then {
    _taskHM set ["state", "SUCCEEDED"];

    if (isClass ((_taskHM get "cfg")/"chain")) then {
        private _chain = (_taskHM get "cfg")/"chain";
        private _name = _chain/"name";

        if (getNumber (_chain/"blockProgress") < 1) then {
            GVAR(chainStates) set [_name, (GVAR(chainStates) getOrDefault [_name, 1]) +1];
        };

        if (getNumber (_chain/"lastStage") > 0) then { //reset chain when last stage hit
            GVAR(chainStates) deleteAt _name;
        };
    };
};

_taskHM call (_taskHM getOrDefault ["destructor", {}]);
{_taskHM call _x} forEach (_taskHM get "rewards");

_taskHM call FUNC(updateTaskState);
GVAR(activeTasks) deleteAt ( GVAR(activeTasks) findIf {(_x get "taskID") isEqualTo (_taskHM get "taskID")} );
