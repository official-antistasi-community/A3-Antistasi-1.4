/*
Maintainer: Wurzel0701
    Activates undercover if possible and controls its status till undercover is broken/ended

Arguments:
    <NIL>

Return Value:
    <NIL>

Scope: Local
Environment: Scheduled
Public: Yes
Dependencies:
    <HashMap> A3A_faction_civ
    <HashMap> A3A_faction_reb
    <ARRAY> controlsX
    <ARRAY> airportsX
    <ARRAY> outposts
    <ARRAY> seaports
    <ARRAY> undercoverVehicles
    <BOOL> A3A_hasACE
    <SIDE> Occupants
    <SIDE> Invaders
    <ARRAY> detectionAreas
    <NAMESPACE> sidesX
    <SIDE> teamPlayer
    <NUMBER> aggressionOccupants
    <NUMBER> aggressionInvaders
    <NUMBER> tierWar

Example:
    [] call A3A_fnc_goUndercover;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _result = [] call A3A_fnc_canGoUndercover;

if(!(_result select 0)) exitWith
{
    if((_result select 1) == "Spotted by enemies") then
    {
        if !(isNull (objectParent player)) then
        {
            (objectParent player) setVariable ["A3A_reported", true, true];
            {
                if ((isPlayer _x) && (captive _x)) then
                {
                    [_x, false] remoteExec["setCaptive", _x];
                };
            } forEach ((crew(objectParent player)) + (assignedCargo(objectParent player)) - [player]);
        };
    };
};

private _layer = ["A3A_infoCenter"] call BIS_fnc_rscLayer;
["Undercover ON", 0, 0, 4, 0, 0, _layer] spawn bis_fnc_dynamicText;

player setCaptive true;
[] spawn A3A_fnc_statistics;
if (player == leader group player) then
{
    {
        if ((!isplayer _x) && (local _x) && (_x getVariable["owner", _x] == player)) then
        {
            [_x] spawn A3A_fnc_undercoverAI;
        };
    } forEach units group player;
};

private _roadblocks = controlsX select {isOnRoad(getMarkerPos _x)};
private _secureBases = airportsX + outposts + seaports + _roadblocks;
private _lastBaseInside = "";
private _reason = "";
["Undercover", [""]] call EFUNC(Events,triggerEvent);

while {_reason == ""} do
{
    private _healingTarget = objNull;
    if !(isNil {player getVariable "ace_medical_treatment_endInAnim"}) then
    {
        _healingTarget = currentAceTarget;
    };

    sleep 1;

    if (!captive player) exitWith
    {
        _reason = "Reported";
    };

    private _veh = objectParent player;
    if !(isNull _veh) then
    {
        private _vehType = typeOf _veh;
        if (!(_vehType in undercoverVehicles)) exitWith
        {
            _reason = "VNoCivil"
        };

        if (_veh getVariable ["A3A_reported", false]) exitWith
        {
            _reason = "VCompromised"
        };

        if (_veh getVariable ["SA_Tow_Ropes", []] isNotEqualTo []) exitWith
        {
            _reason = "VTowRopes"
        };

        if (A3A_hasACE) then
        {
            if (((position player nearObjects["DemoCharge_Remote_Ammo", 5]) select 0) mineDetectedBy Occupants) exitWith
            {
                _reason = "SpotBombTruck";
            };
            if (((position player nearObjects["SatchelCharge_Remote_Ammo", 5]) select 0) mineDetectedBy Occupants) exitWith
            {
                _reason = "SpotBombTruck";
            };
        };

        if(_reason != "") exitWith {};

        if(_veh getVariable ["NoFlyZoneDetected", ""] != "") exitWith
        {
            _reason = "NoFly";
        };

        if (_vehType isKindOf "Land") then
        {
            if (!(isOnRoad position _veh) && {count (_veh nearRoads 50) == 0}) then
            {
                if ({((side _x == Invaders) || (side _x == Occupants)) && ((_x knowsAbout player > 1.4) || (_x distance player < 350))} count allUnits > 0) then
                {
                    _reason = "Highway";
                };
            };
        };
    }
    else
    {
        if (_healingTarget != objNull && {side _healingTarget != civilian && {_healingTarget isKindOf "Man"}}) exitWith
        {
            if ({((side _x == Invaders) or(side _x == Occupants)) and((_x knowsAbout player > 1.4) or(_x distance player < 350))} count allUnits > 0) then
            {
                _reason = "BadMedic2";
            }
            else
            {
                _reason = "BadMedic";
            };
        };
        if ((primaryWeapon player != "") || (secondaryWeapon player != "") || (handgunWeapon player != "") || (vest player != "") || (getNumber(configfile >> "CfgWeapons" >> headgear player >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") > 2) || (hmd player != "") || (!(uniform player in (A3A_faction_civ get "uniforms")))) exitWith
        {
            if ({((side _x == Invaders) or (side _x == Occupants)) and ((_x knowsAbout player > 1.4) or (_x distance player < 350))} count allUnits > 0) then
            {
                _reason = "clothes2"
            }
            else
            {
                _reason = "clothes"
            };
        };
        if (dateToNumber date < (player getVariable ["compromised", 0])) exitWith
        {
            _reason = "Compromised";
        };
        if (!isNull (player getVariable ["SA_Tow_Ropes_Vehicle", objNull])) exitWith
        {
            _reason = "TowRopes";
        };
    };
    if (_reason != "") exitWith {};

    // Don't do location checks on air vehicles. AirspaceControl handles that.
    if (!isNull _veh and { _veh isKindOf "Air" }) then { continue };

    private _base = [_secureBases, player] call BIS_fnc_nearestPosition;
    private _onDetectionMarker = detectionAreas findIf {player inArea _x} != -1;
    private _onBaseMarker = player inArea _base;
    private _baseSide = sidesX getVariable [_base, sideUnknown];
    if ((_onBaseMarker || _onDetectionMarker) && (_baseSide != teamPlayer) && (_base != _lastBaseInside)) then
    {
        if (_base in airportsX || _onDetectionMarker) exitWith
        {
            _reason = "Airport";
        };

        private _aggro = if (_baseSide == Occupants) then {aggressionOccupants + (tierWar * 10)} else {aggressionInvaders + (tierWar * 10)};
        if (random 100 < _aggro) exitWith
        {
            _reason = ["Outpost", "Roadblock"] select (_base in _roadblocks);
        };
        _lastBaseInside = _base;            // Don't check this base again once we passed the check
    };
};

if (captive player) then
{
    player setCaptive false;
};

if !(isNull (objectParent player)) then
{
    {
        if (isPlayer _x) then
        {
            [_x, false] remoteExec["setCaptive", _x];
        }
    } forEach((assignedCargo(vehicle player)) + (crew(vehicle player)) - [player]);
};

private _layer = ["A3A_infoCenter"] call BIS_fnc_rscLayer;
["Undercover OFF", 0, 0, 4, 0, 0, _layer] spawn bis_fnc_dynamicText;
[] spawn A3A_fnc_statistics;

switch (_reason) do
{
    case "Reported":
    {
        ["Undercover", "You have been reported or spotted by the enemy!"] call A3A_fnc_customHint;
        if (vehicle player != player) then
        {
            (objectParent player) setVariable ["A3A_reported", true, true];
        }
        else
        {
            player setVariable["compromised", (dateToNumber[date select 0, date select 1, date select 2, date select 3, (date select 4) + 30])];
        };
    };
    case "VNoCivil":
    {
        ["Undercover", "You entered a non civilian vehicle!"] call A3A_fnc_customHint;
    };
    case "VCompromised":
    {
        ["Undercover", "You entered a reported vehicle!"] call A3A_fnc_customHint;
    };
    case "VTowRopes":
    {
        ["Undercover", "You cannot be undercover while tow ropes are attached to your vehicle!"] call A3A_fnc_customHint;
    };
    case "TowRopes":
    {
        ["Undercover", "You cannot be undercover and use tow ropes!"] call A3A_fnc_customHint;
    };
    case "SpotBombTruck":
    {
        ["Undercover", "Explosives have been spotted on your vehicle!"] call A3A_fnc_customHint;
        (objectParent player) setVariable ["A3A_reported", true, true];
    };
    case "Highway":
    {
        ["Undercover", "You went too far away from any roads and have been spotted!"] call A3A_fnc_customHint;
        (objectParent player) setVariable ["A3A_reported", true, true];
    };
    case "clothes":
    {
        ["Undercover", "You cannot stay Undercover while:<br/><br/>A weapon is visible<br/>Wearing a vest<br/>Wearing a helmet<br/>Wearing NVGs<br/>Wearing a mil uniform!"] call A3A_fnc_customHint;
    };
    case "clothes2":
    {
        ["Undercover", "You cannot stay Undercover while showing:<br/><br/>A weapon is visible<br/>Wearing a vest<br/>Wearing a helmet<br/>Wearing NVGs<br/>Wearing a mil uniform<br/><br/>The enemy added you to their Wanted List!"] call A3A_fnc_customHint;
        player setVariable["compromised", dateToNumber[date select 0, date select 1, date select 2, date select 3, (date select 4) + 30]];
    };
    case "BadMedic":
    {
        ["Undercover", "You cannot stay Undercover while healing a compromised resistance member!"] call A3A_fnc_customHint;
    };
    case "BadMedic2":
    {
        ["Undercover", "You cannot stay Undercover while healing a compromised resistance member<br/><br/>The enemy added you to their Wanted List!"] call A3A_fnc_customHint;
        player setVariable["compromised", dateToNumber[date select 0, date select 1, date select 2, date select 3, (date select 4) + 30]];
    };
    case "Compromised":
    {
        ["Undercover", "You left your vehicle and you are still on the Wanted List!"] call A3A_fnc_customHint;
    };
    case "Airport"; case "Roadblock"; case "Outpost":
    {
        private _text = switch (_reason) do {
            case "Airport": {"You have trespassed on an enemy airbase!"};
            case "Outpost": {"An enemy outpost or seaport has detected you!"};
            case "Roadblock": {"An enemy roadblock has detected you!"};
        };
        ["Undercover", _text] call A3A_fnc_customHint;

        if !(isNull objectParent player) then
        {
            (objectParent player) setVariable ["A3A_reported", true, true];
        }
        else
        {
            player setVariable["compromised", (dateToNumber[date select 0, date select 1, date select 2, date select 3, (date select 4) + 30])];
        };
    };
    case "NoFly":
    {
        private _veh = objectParent player;
        private _detectedBy = _veh getVariable "NoFlyZoneDetected";
        ["Undercover", format ["You have violated the airspace of %1!", [_detectedBy] call A3A_fnc_localizar]] call A3A_fnc_customHint;
        _veh setVariable ["A3A_reported", true, true];
        _veh setVariable ["NoFlyZoneDetected", nil, true];
    };
    default
    {
        Error_1("Unknown reason given, was %1", _reason);
        ["Undercover", "Unknown error occured in undercover execution routine!"] call A3A_fnc_customHint;
    };
};
["Undercover", [_reason]] call EFUNC(Events,triggerEvent);
