/*
    Author: [Håkon]
    [Description]
        adds load (or unload) action to object, if it isnt already on it

    Arguments:
    0. <Object> Object to add action to
    1. <String> Which action to add ("load"/"unload")

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [_object , _action] remoteExec ["A3A_fnc_logistics_addAction", 0, _object];
*/
params ["_object", "_action"];

private _actions = [];
{_actions pushBack (_object actionParams _x)}forEach actionIDs _object;
private _loadText = format ["Load %1 into nearest vehicle", getText (configFile >> "CfgVehicles" >> typeOf _object >> "displayName")];

switch (_action) do {
    case "load":{
        if (_actions findIf {(_x#0) isEqualTo _loadText} != -1) exitWith {};
        private _loadActionID = _object addAction
        [
            _loadText,
            {
                params ["_target"];
                [_target] remoteExecCall ["A3A_fnc_logistics_tryLoad",2];
            },
            nil,
            1.5,
            true,
            true,
            "",
            "(
                ((attachedTo _target) isEqualTo objNull)
                and ((vehicle _this) isEqualTo _this)
                and (alive _target)
            )",
            5
        ];
        _object setUserActionText [
            _loadActionID,
            _loadText,
            "<t size='2'><img image='\A3\ui_f\data\IGUI\Cfg\Actions\arrow_up_gs.paa'/></t>"
        ];
    };
    case "unload": {
        private _text = "Unload Cargo";
        if (_actions findIf {(_x#0) isEqualTo _text} != -1) exitWith {};
        private _unloadActionID = _object addAction
        [
            _text,
            {
                params ["_target"];
                [_target] remoteExec ["A3A_fnc_logistics_unload",2];
            },
            nil,
            1.5,
            true,
            true,
            "",
            "(
                !((_target getVariable ['Cargo', []]) isEqualTo [])
                and !(_target getVariable ['LoadingCargo', false])
                and ((vehicle _this) isEqualTo _this)
            )",
            5
        ];
        _object setUserActionText [
            _unloadActionID,
            _text,
            "<t size='2'><img image='\A3\ui_f\data\IGUI\Cfg\Actions\arrow_down_gs.paa'/></t>"
        ];
    };
};
