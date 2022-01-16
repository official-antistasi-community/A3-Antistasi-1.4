params ["_vUID", "_state", ["_stateIndex",1,[0]]];
if (isNil "_vUID" || isNil "_state") exitWith {false};

if (HR_GRG_Users isNotEqualTo []) then {
    private _recipiants = +HR_GRG_Users;
    _recipiants pushBackUnique 2;
    [_vUID, _stateIndex, _state] remoteExecCall ["HR_GRG_fnc_reciveStateUpdate", _recipiants];
};
