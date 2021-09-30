/*
Author: Håkon
Description:
    handles spawning in HC groups

Arguments:
0. <Array> Units types to spawn
1. <String> ID format for the group
2. <String> Special handling of group spawning
3. <Object> Vehicle to assign to the group (optional)

Return Value:
<Group> The spawned group

Scope: Any
Environment: Any
Public: Yes
Dependencies:

Example:

License: MIT License
*/
params [
    ["_unitTypes", [], [[]]]
    , ["_idFormat", "", [""]]
    , ["_special", "", [""]]
    , ["_vehicle", objNull, [objNull]]
];

//calculate base cost
private _cost = if (isNull _vehicle) then { 0 } else { [typeOf _vehicle] call A3A_fnc_vehiclePrice };
private _costHR = 0;
{
    _cost = _cost + (server getVariable _x); _costHR = _costHR +1
} forEach _unitTypes;

//spawn group
private _pos = [(getMarkerPos respawnTeamPlayer), 30, random 360] call BIS_Fnc_relPos;
private _group = [_pos, teamPlayer, _unitTypes, true] call A3A_fnc_spawnGroup;
_group setGroupIdGlobal [_idFormat + str ({side (leader _x) == teamPlayer} count allGroups)];

private _units = units _group;
{[_x] call A3A_fnc_FIAinit} forEach _units;
theBoss hcSetGroup [_group];

petros directSay "SentGenReinforcementsArrived";
["Recruit Squad", format ["Group %1 at your command.<br/><br/>Groups are managed from the High Command bar (Default: CTRL+SPACE)<br/><br/>If the group gets stuck, use the AI Control feature to make them start moving. Mounted Static teams tend to get stuck (solving this is WiP)<br/><br/>To assign a vehicle for this group, look at some vehicle, and use Vehicle Squad Mngmt option in Y menu.", groupID _group]] call A3A_fnc_customHint;

private _countUnits = count _units -1;
private _bypassAI = true;

//vehicle init funcs
private _initInfVeh = {
    if (isNull _vehicle) exitWith {};
    leader _group assignAsDriver _vehicle;
    call _initVeh;
    ["Recruit Squad", "Vehicle Purchased"] call A3A_fnc_customHint;
    petros directSay "SentGenBaseUnlockVehicle";
};

private _initVeh = {
    [_vehicle, teamPlayer] call A3A_fnc_AIVEHinit;
    [_vehicle] spawn A3A_fnc_vehDespawner;
    _group addVehicle _vehicle;
    _vehicle setVariable ["owner",_group,true];
    driver _vehicle action ["engineOn", _vehicle];
    {[_x] orderGetIn true; [_x] allowGetIn true} forEach units _group;
};

// special handling
switch _special do {
    //static squad
    case "staticAutoT": {
        private _staticType = switch _idFormat do {
            case "Mort-": {SDKMortar};
            case "MG-": {SDKMGStatic};
            default {""};
        };

        call _initInfVeh;
        _group setVariable ["staticAutoT",false,true];
        [_group, _staticType] spawn A3A_fnc_MortyAI;
        _cost = _cost + ([_staticType] call A3A_fnc_vehiclePrice);
    };

    //vehicle squad
    case "BuildAA": {
        private _static = ((attachedObjects _vehicle) select {typeOf _x isEqualTo staticAAteamPlayer})#0;
        (_units # (_countUnits -1)) assignAsDriver _vehicle;
        (_units # _countUnits) assignAsGunner _static;
        call _initVeh;
        _cost = _cost + ([staticAAteamPlayer] call A3A_fnc_vehiclePrice);

    };
    case "VehicleSquad": {
        (_units # (_countUnits -1)) assignAsDriver _vehicle;
        (_units # _countUnits) assignAsGunner _vehicle;
        call _initVeh;
    };

    //inf squad
    _bypassAI = false;
    call _initInfVeh;
    case "MG": {
        (_units # (_countUnits - 1)) addBackpackGlobal supportStaticsSDKB2;
        (_units # _countUnits) addBackpackGlobal MGStaticSDKB;
        _cost = _cost + ([SDKMGStatic] call A3A_fnc_vehiclePrice);
    };
    case "Mortar": {
        (_units # (_countUnits - 1)) addBackpackGlobal supportStaticsSDKB3;
        (_units # _countUnits) addBackpackGlobal MortStaticSDKB;
        _cost = _cost + ([SDKMortar] call A3A_fnc_vehiclePrice);
    };
};

[- _costHR, - _cost] remoteExec ["A3A_fnc_resourcesFIA", 2];

if !(_bypassAI) then {_group spawn A3A_fnc_attackDrillAI};

_group
