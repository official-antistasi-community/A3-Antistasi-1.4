#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
private _emptyHM = createHashMap;
params [["_taskHM", _emptyHM, [_emptyHM]]];

//validation
if (_taskHM isEqualTo _emptyHM) exitWith { Error_1("Invalid parameters passed: %1", _this) };
if (!canSuspend) exitWith { Error_1("Tasks needs to run in scheduled environment") };

_taskHM set ["TaskID", call FUNC(genTaskID)];

//load task
private _taskData = missionNameSpace getVariable getText ((_taskHM get "Cfg") / "Func");
if (isNil "_taskData") exitWith { Error_1("Function does not exist: %1", _taskData) };
_taskHM call _taskData;

//run task
_taskHM call FUNC(updateTaskState);
if !("Constructor" in _taskHM) exitWith { Error_1("Task %1 lacks a constructor", configName (_taskHM get "Cfg")) };
GVAR(ActiveTasks) pushBackUnique _taskHM;
_taskHM call (_taskHM get "Constructor");

private _stage = _taskHM getOrDefault ["__CurrentStage", 1];
private _stages = (_taskHM get "Stages") select [_stage-1, count (_taskHM get "Stages")];
if (_stage > 1) then { _taskHM call ((_stages#0) getOrDefault ["Init",{}]) };

_taskHM set ["Rewards",[]];
{
    _taskHM set ["__CurrentStage", (_taskHM get "__CurrentStage") +1]; //increment stage count (for saving/loading)
    _taskHM call FUNC(updateTaskState);
    if !("Action" in _x) exitWith { Error_1("Stage %1 is missing the action",_x) };
    if !("Condition" in _x) exitWith { Error_1("Stage %1 is missing the condition",_x) };

    private _endTime = time + (_x getOrDefault ["Timeout", 1e12]);
    _taskHM call (_x get "Action");
    _taskHM call FUNC(updateTaskState);

    waitUntil {
        sleep 1;
        (if ("Timeout" in _x) then {time >= _endTime} else {false})
        || _taskHM call (_x get "Condition")
        || (_taskHM getOrDefault ["cancellationToken", false])
        || (_x getOrDefault ["cancellationToken", false])
    };

    if (_taskHM getOrDefault ["cancellationToken", false]) exitWith {
        _taskHM set ["Successful", false];
        _taskHM set ["state", "CANCELED"];
    };

    private _successful = (if ("Timeout" in _x) then {time < _endTime} else {true}) && !(_x getOrDefault ["cancellationToken", false]);
    _x set ["Successful", _successful];
    if (_successful) then {
        if (_x getOrDefault ["Reward-instant",false]) then (_x getOrDefault ["Reward",{}]) else {
            if ("Reward" in _x) then {
                (_taskHM get "Rewards") pushBack (_x get "Reward");
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

    if (!_successful && (_x getOrDefault ["Required", true])) exitWith {
        _taskHM set ["Successful", false];
        _taskHM set ["state", "FAILED"];
    };
} forEach _stages;

if (_taskHM getOrDefault ["Successful", true]) then {
    _taskHM set ["state", "SUCCEEDED"];

    if (isClass ((_taskHM get "Cfg")/"chain")) then {
        private _chain = (_taskHM get "Cfg")/"chain";
        private _name = _chain/"name";

        if (getNumber (_chain/"blockProgress") < 1) then {
            GVAR(ChainStates) set [_name, (GVAR(ChainStates) getOrDefault [_name, 1]) +1];
        };

        if (getNumber (_chain/"lastStage") > 0) then { //reset chain when last stage hit
            GVAR(ChainStates) deleteAt _name;
        };
    };
};

_taskHM call (_taskHM getOrDefault ["Destructor", {}]);
{_taskHM call _x} forEach (_taskHM get "Rewards");

_taskHM call FUNC(updateTaskState);
GVAR(ActiveTasks) deleteAt ( GVAR(ActiveTasks) findIf {(_x get "TaskID") isEqualTo (_taskHM get "TaskID")} );
