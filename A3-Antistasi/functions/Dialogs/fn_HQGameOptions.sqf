/*
Maintainer: Caleb Serafin
    Contains the backing methods to the HQ spawn options dialogue.
    See the `// ADD NEW OPTIONS HERE //` tag for adding options.
    Cannot be called from server.
    Authenticated caller must be theBoss or an admin.

Arguments:
    <STRING> Spawn Option
    <STRING> Action

Return Value:
    <ANY> nil.

Scope: Server, Global Arguments, Global Effect
Environment: Any
Public: Yes

Example:
    [player,"maxUnits","increase"] remoteExecCall ["A3A_fnc_HQGameOptions",2];
    [player,"civPerc","decrease"] remoteExecCall ["A3A_fnc_HQGameOptions",2];
*/
params [
    ["_player",objNull,[objNull]],
    ["_option","",[""]],
    ["_action","",[""]]
];
private _filename = "fn_HQSpawnOptions.sqf";

//////////////////////////
// DON'T TOUCH THIS BIT //
//////////////////////////
private _clientID = remoteExecutedOwner max 3;  // Avoids calling from server.
private _hintTitle = "HQ Spawn Options";
private _authenticate = _option in ["maxUnits","distanceSPWN","civPerc"];

if (_authenticate && {_player == theBoss || admin owner _player > 0}) exitWith {
    [_hintTitle, "Only our Commander or admin has access to "+_option] remoteExecCall ["A3A_fnc_customHint",_player];
    [1," ACCESS VIOLATION | "+ name _player + " ["+(getPlayerUID _player) + "] ["+ str _clientID +"] attempted calling restricted backing method "+str _this,_filename] call A3A_fnc_log;
    nil;
};
if (owner _player != _clientID) exitWith {
    private _allPlayers = allPlayers;
    private _index = _allPlayers findIf {owner _x == _clientID};
    private _realPlayer = objNull;
    if (_index != -1) then {
        _realPlayer = _allPlayers#_index;
    };
    [1," HACKING | "+ name _realPlayer + " ["+(getPlayerUID _realPlayer) + "] ["+ str _clientID +"] attempted impersonating "+name _player + " ["+(getPlayerUID _player) + "] ["+ str owner _player +"] while calling "+str _this,_filename] call A3A_fnc_log;
    nil;
};

private _optionLocalisationTable = [];
private _processAction = {
    params["_option","_action","_upperLimit","_lowerLimit","_amountAdjustment"];
    private _inRange = true;
    private _invalid = false;
    switch (_action) do {
        case "increase": { _inRange = maxUnits <= _upperLimit - _adjustmentAmount; };
        case "decrease": { _inRange = maxUnits >= _lowerLimit + _adjustmentAmount; _adjustmentAmount = -_adjustmentAmount; };
        default {
            _invalid = true;
            [1,"INVALID METHOD | "+ name _player + " ["+(getPlayerUID _player) + "] ["+ str _clientID +"] called invalid backing method "+str _this,_filename] call A3A_fnc_log;
        };
    };
    if (_invalid) exitWith {};
    private _optionName = _optionLocalisationTable#1#(_optionLocalisationTable#0 find _option);
    if (_inRange) then {
        private _originalAmount = missionNamespace getVariable _option;
        private _finalAmount = _originalAmount + _adjustmentAmount;
        missionNamespace setVariable [_option,_finalAmount,true];

        [_hintTitle, _optionName+" set to "+str _finalAmount] remoteExecCall ["A3A_fnc_customHint",_player];
        [2,(name _player)+"["+(getPlayerUID _player)+"] ["+ str _clientID +"] changed "+_optionName+" from " + str _originalAmount +" to " + str _finalAmount,_filename] call A3A_fnc_log;
    } else {
        [_hintTitle, _optionName+" must be between "+str _upperLimit + " and "+ str _lowerLimit] remoteExecCall ["A3A_fnc_customHint",_player];
    };
};

//////////////////////////
// ADD NEW OPTIONS HERE //
//////////////////////////
_optionLocalisationTable = [["maxUnits","distanceSPWN","civPerc"],["AI Limit","Spawn Distance","Civilian Limit"]];
switch (_option) do {
    case "maxUnits": { [_option,_action,200,80,10] call _processAction; };
    case "civPerc": { [_option,_action,150,0,1] call _processAction; };
    case "distanceSPWN": {  // So close to generalising all of this away 😥, but then:
        [_option,_action,2000,600,100] call _processAction;
        distanceSPWN1 = distanceSPWN * 1.3;
        distanceSPWN2 = distanceSPWN /2;
        publicVariable "distanceSPWN1";
        publicVariable "distanceSPWN2";
    };
    default {[1,"INVALID METHOD | "+ name _player + " ["+(getPlayerUID _player) + "] ["+ str _clientID +"] called invalid backing method "+str _this,_filename] call A3A_fnc_log;};
};

nil;
