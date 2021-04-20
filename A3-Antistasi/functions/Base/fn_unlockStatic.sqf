params ["_target", "_caller", "_actionId", "_arguments"];

_target setVariable ["lockedForAI", nil, true];

[_target] remoteExec ["A3A_fnc_updateRebelStatics", 2];
