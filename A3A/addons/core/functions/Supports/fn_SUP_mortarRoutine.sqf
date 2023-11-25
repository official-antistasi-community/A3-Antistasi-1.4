/*  Create and maintain mortar and artillery supports

Environment: Server, must be spawned

Arguments:
    <ARRAY> Active support data, see initSupports
    <OBJECT> Mortar/artillery vehicle
    <GROUP> Crew group of mortar/artillery vehicle
    <SCALAR> Delay time in seconds
    <SCALAR> Amount of information to reveal to rebels, 0-1

*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_suppData", "_mortar", "_crewGroup", "_sleepTime", "_reveal"];
_suppData params ["_supportName", "_side", "_suppType", "_suppCenter", "_suppRadius", "_target"];

//Sleep to simulate the time it would need to set the support up
sleep _sleepTime;

//Decrease number of rounds and time alive if aggro is low
private _sideAggression = if(_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
private _numberOfRounds = 24;
private _timeAlive = 1200;

//If the aggro is low, the mortar will shoot less and stay longer in one spot
if((30 + random 40) >_sideAggression) then
{
    _numberOfRounds = 12;
    _timeAlive = 1800;
};

if(_suppType == "ARTILLERY") then
{
    //Values derrived from vanilla 155mm artillery
    private _expectedArea = 30 * 30 * 3.14;
    private _expectedIndirect = 125;
    private _expectedHit = 340;
    private _expectedValue = _expectedHit + _expectedIndirect + _expectedArea;
    
    private _ammo = getText(configfile >> "CfgMagazines" >> _mortar getVariable ["shellType", []] >> "ammo");
    private _subMunitionMult = 1;
    if (getText (configfile >> "CfgAmmo" >> _ammo >> "submunitionAmmo") != "") then 
    {
        private _submunitionAmmo = (configfile >> "CfgAmmo" >> _ammo >> "submunitionAmmo");
        if (getArray (configfile >> "CfgAmmo" >> _ammo >> "submunitionConeType") select 0 == "custom") then 
        {
            _subMunitionMult = count ((getArray (configfile >> "CfgAmmo" >> _ammo >> "submunitionConeType")) select 1); //If custom, the number of pairs should be the number of munitions
        } else 
        {
            _subMunitionMult = (getArray (configfile >> "CfgAmmo" >> _ammo >> "submunitionConeType")) select 1;
        };
        systemChat format["number of submunition: %1", _subMunitionMult];
        if (isArray (_submunitionAmmo)) then 
        {
            _ammo = getText ((_submunitionAmmo) select 0); //Take the first ammo used, not ideal but don't have many assumptions to go on here
        } else 
        {
            _ammo = getText (_submunitionAmmo); //The ammo only transforms midflight, not cluster
        };
    };
    
    private _radius = getNumber (configfile >> "CfgAmmo" >> _ammo >> "indirectHitRange");
    private _area = _radius * _radius * 3.14;
    private _indirect = getNumber  (configfile >> "CfgAmmo" >> _ammo >> "indirectHit");
    private _hit = getNumber (configfile >> "CfgAmmo" >> _ammo >> "hit");
    private _value = ((_hit + _indirect + _area) * _subMunitionMult);
    
    systemChat format["%4 : _radius is %5, _area is %1, _hit is %2, _indirect is %3", _area, _hit, _indirect, _ammo, _radius];
    systemChat format["Evaluatd value is: %1, shot multiplier: %2", _value, _expectedValue / _value];
    
} else
{
    //Values derrived from vanilla 81mm mortar
    private _expectedArea = 30 * 30 * 3.14;
    private _expectedIndirect = 125;
    private _expectedHit = 340;
    private _expectedValue = _expectedHit + _expectedIndirect + _expectedArea;
};

private _shotsPerVolley = _numberOfRounds / 3;

//A function to repeatedly fire onto a target without loops by using an EH
_fn_executeMortarFire =
{
    params ["_mortar"];

    _mortar addEventHandler
    [
        "Fired",
        {
            params ["_mortar"];

            private _subTargets = _mortar getVariable ["FireOrder", []];
            if(count _subTargets == 0) exitWith
            {
                _mortar removeEventHandler ["Fired", _thisEventHandler];
                _mortar setVariable ["FireOrder", nil];
            };
            private _shellTarget = _subTargets deleteAt 0;

            [_shellTarget, _mortar] spawn
            {
                params ["_shellTarget", "_mortar"];
                sleep 0.5;
                _mortar doArtilleryFire [_shellTarget, _mortar getVariable "shellType", 1];
            }
        }
    ];

    sleep 30;           // Give players a bit more warning before the shells land
    private _subTargets = _mortar getVariable ["FireOrder", []];
    private _target = _subTargets deleteAt 0;
    _mortar doArtilleryFire [_target, _mortar getVariable "shellType", 1];
};

private _timeout = time + _timeAlive;
while {time < _timeout} do
{
    sleep 5;

    //Mortar somehow disabled/stolen
    if !(canFire _mortar && side _mortar == _side) exitWith {
        Info_1("%1 has been destroyed or crew killed, aborting routine", _supportName);
    };

    if !(isNil {_mortar getVariable "FireOrder"}) then { continue };        // mortar still firing at last target

    if (_numberOfRounds <= 0) exitWith {
        Info_1("%1 has no more rounds left to fire, aborting routine", _supportName);
    };

    // Read in new target if there is one
    if (_target isEqualTo []) then { continue };         // no new target added yet
    private _targetPos = _target select 1;                  // only use position here, not target object
    _target resize 0;                                       // clear target array so that a new one can be added externally
    Debug_2("%1 Next target is %2", _supportName, _targetPos);

    // 50m circular spread because it's easy
    private _subTargets = [];
    for "_i" from 1 to _shotsPerVolley do {
        _subTargets pushBack (_targetPos getPos [random 50, random 360]);
    };

    // Start shooting
    _mortar setVariable ["FireOrder", _subTargets];
    [_mortar] spawn _fn_executeMortarFire;
    _numberOfRounds = _numberOfRounds - _shotsPerVolley;
    _timeout = _timeout max (time + 60);                // don't cleanup until the volley is done

    //Makes sure that all units escape before attacking
    // [_side, _targetMarker] spawn A3A_fnc_clearTargetArea;

    [_reveal, _targetPos, _side, _suppType, 150, 5*60] spawn A3A_fnc_showInterceptedSupportCall;
};

_mortar removeAllEventHandlers "Fired";
_suppData set [4, 0];           // Set radius to zero to signal completion

{ unassignVehicle _x } forEach units _crewGroup;

[_crewGroup] spawn A3A_fnc_groupDespawner;
[_mortar] spawn A3A_fnc_VEHdespawner;
