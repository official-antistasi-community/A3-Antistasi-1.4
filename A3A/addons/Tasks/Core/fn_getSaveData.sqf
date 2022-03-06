#include "..\script_component.sqf"
FIX_LINE_NUMBERS()
private _saveData = [];
{
    private _cfg = _x get "Cfg";
    _saveData pushBack [configName _cfg, _x get "Params" ,_x getOrDefault ["__CurrentStage",1], getNumber (_cfg/"Version")];
} forEach GVAR(ActiveTasks);
_saveData;
