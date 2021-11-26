/*
    A3A_fnc_taskSetState
    Worker function to set fail & success states for A3A and BIS tasks

    Parameters:
    <STRING> unique task ID
    <STRING> task type (eg. LOG, RES, CONVOY)
    <STRING> new state, should be FAILED or SUCCEEDED
    <BOOL> default false, if true, also sets reverse state for twin BIS task (taskID+"B")
*/

params ["_taskId", "_taskType", "_state", ["_isTwin", false]];

[_taskId, _taskType, _state] remoteExecCall ["A3A_fnc_taskUpdate", 2];
[_taskId, _state] call BIS_fnc_taskSetState;

if (!_isTwin) exitWith {};
private _state2 = switch (_state) do {
    case "SUCCEEDED": {"FAILED"};
    case "FAILED": {"SUCCEEDED"};
    default {_state};
};
[_taskId+"B", _state2] call BIS_fnc_taskSetState;
