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
private _shotsPerVolley = _numberOfRounds / 3;

//A function to repeatedly fire onto a target without loops by using an EH
private _fn_executeMortarFire =
{
    params ["_mortar"];
	
	private _scudLaunchers = ["rhs_9k79","rhs_9k79_K","rhs_9k79_B"];
	if((typeOf _mortar) in _scudLaunchers) then {
		//Intercepted
		//Rhs scripts
		//\rhsafrf\addons\rhs_c_rva\scripts\WP_TochkaDeploy.sqf
		//\rhsafrf\addons\rhs_c_rva\scripts\WP_TochkaFire.sqf
		
        private _subTargets = _mortar getVariable ["FireOrder", []];
        private _shellTarget = _subTargets deleteAt 0;
		
		
		//private _relDir = [_mortar, _shellTarget] call BIS_fnc_relativeDirTo;
		//_mortar setDir ((getDir _mortar) + _relDir);
		
		[_mortar,1] spawn rhs_fnc_ss21_AI_prepare;
		_tochkaGrp = group _mortar;
		sleep 30;
		_wp = _tochkaGrp addWaypoint [ATLtoASL _shellTarget, 0];
		_wp setWaypointType "SCRIPTED"; 
		_wp setWaypointScript "\rhsafrf\addons\rhs_c_rva\scripts\WP_TochkaFire.sqf";
	};

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
                sleep 1;
                _mortar doArtilleryFire [_shellTarget, _mortar getVariable "shellType", 1];
            }
        }
    ];

    sleep 30;           // Give players a bit more warning before the shells land
    private _subTargets = _mortar getVariable ["FireOrder", []];
    private _target = _subTargets deleteAt 0;
    _mortar doArtilleryFire [_target, _mortar getVariable "shellType", 1];
};


private _fn_rotateToTarget =
{
    params ["_mortar", "_targPos"];

    private _change = (_mortar getDir _targPos) - getDir _mortar;
    _change = (_change + 540) % 360 - 180;
    if (abs _change < 1) exitWith {};

    addMissionEventHandler ["EachFrame", {
        _thisArgs params ["_mortar", "_startDir", "_change", "_startTime"];

        private _interval = 10 * (time - _startTime) / abs _change;        // 10 degree/sec turn
        private _newDir = _startDir + _change * (_interval min 1);
        _mortar setDir  _newDir;
        if (!alive _mortar or !alive gunner _mortar or _interval >= 1) exitWith {
            removeMissionEventHandler ["EachFrame", _thisEventHandler];
        };
    }, [_mortar, getDir _mortar, _change, time]];
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

	//Gets and rotates the mortar/vehicle towards target, allowing MLRS or similar limited artillery to fire upon their target
	//private _relDir = [_mortar, _targetPos] call BIS_fnc_relativeDirTo; 
	//_mortar setDir ((getDir _mortar) + _relDir);
	_mortar setDir ((getDir _mortar) + (_mortar getDir _targetPos));
	
	
    // 50m circular spread because it's easy
    private _subTargets = [];
    for "_i" from 1 to _shotsPerVolley do {
        _subTargets pushBack (_targetPos getPos [random 50, random 360]);
    };

    // Start shooting
    _mortar setVariable ["FireOrder", _subTargets];
    [_mortar, _targetPos] spawn _fn_rotateToTarget;
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
