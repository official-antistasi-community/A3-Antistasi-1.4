/*  Handles the large attack that also are missions

    Execution on: HC or Server

    Scope: Internal

    Params:
        None

    Returns:
        Nothing
*/

params [["_side", sideEnemy]];

private _fileName = "rebelAttack";
[
    2,
    format ["Starting large attack script for side %1", _side],
    _fileName,
    true
] call A3A_fnc_log;

if (hasIFA and (sunOrMoon < 1)) exitWith
{
    [
        2,
        "Aborting attack as IFA has no nightvision (at least thats what I assume)",
        _fileName,
        true
    ] call A3A_fnc_log;
};

private _possibleTargets = markersX - controlsX - outpostsFIA - ["Synd_HQ","NATO_carrier","CSAT_carrier"] - destroyedSites;;
private _possibleStartBases = airportsX select {([_x,false] call A3A_fnc_airportCanAttack) && (sidesX getVariable [_x,sideUnknown] != teamPlayer)};

if(_side != sideEnemy) then
{
    //A specific side should carry out the attack, use only them
    _possibleStartBases = _possibleStartBases select {(sidesX getVariable [_x,sideUnknown] == _side)};
    if((_side == Occupants) && (gameMode != 4)) then
    {
        _possibleStartBases pushBack "NATO_carrier";
    };
    if((_side == Invaders) && (gameMode != 3)) then
    {
        _possibleStartBases pushBack "CSAT_carrier";
    };
}
else
{
    //No specific side given, use whatever possible
    if(gameMode != 4) then
    {
        _possibleStartBases pushBack "NATO_carrier";
    };
    if(gameMode != 3) then
    {
        _possibleStartBases pushBack "CSAT_carrier";
    };
};

//No AI vs AI, possible targets are only bases held by rebels
if (gameMode != 1) then
{
    _possibleTargets = _possibleTargets select
    {
        sidesX getVariable [_x,sideUnknown] == teamPlayer
    };
};

//For low level attacks only occupants are able to attack only rebels
if ((tierWar < 2) and (gameMode <= 2)) then
{
	_possibleStartBases = _possibleStartBases select {(sidesX getVariable [_x,sideUnknown] == Occupants)};
	_possibleTargets = _possibleTargets select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
};

//On low level remove cities from target list
if (gameMode != 4) then
{
	if (tierWar < 3) then {_possibleTargets = _possibleTargets - citiesX;};
}
else
{
	if (tierWar < 5) then {_possibleTargets = _possibleTargets - citiesX;};
};

//Attacks on rebels or cities should be closer than mission range
_possibleTargets = _possibleTargets select {(sidesX getVariable [_x, sideUnknown] != teamPlayer && (!(_x in citiesX))) || {(getMarkerPos _x) distance2D (getMarkerPos "Synd_HQ") < distanceMission}};

if((count _possibleTargets == 0) || (count _possibleStartBases == 0)) exitWith
{
    [
        2,
        "Attack found no suitable targets or no suitable start bases, aborting!",
        _fileName
    ] call A3A_fnc_log;
};

[
    3,
    format ["%1 possible targets for attack found, possible start points are %2",count _possibleTargets, _possibleStartBases],
    _fileName,
    true
] call A3A_fnc_log;


private _easyTargets = [];
private _availableTargets = [];

{
    private _startAirport = _x;
    private _airportSide = sidesX getVariable [_startAirport, sideUnknown];
    private _airportTargets = [];

    //Find suitable targets for this airport
    if(_side == sideEnemy) then
    {
        _airportTargets = _possibleTargets select {sidesX getVariable [_x, sideUnknown] != _airportSide};
    }
    else
    {
        _airportTargets = _possibleTargets select {sidesX getVariable [_x, sideUnknown] != _side};
    };

    //Gather position and killzones of airport
    private _killZones = killZones getVariable [_startAirport, []];
    private _startAirportPos = getMarkerPos _startAirport;
    {
        //For each target, calculate the distance to the airport
        private _target = _x;
        private _distance = (getMarkerPos _target) distance2D _startAirportPos;
        //In air range, add to target list
        if(_distance < distanceForAirAttack) then
        {
            //If in land range, half the distance
            if(_distance < distanceForLandAttack && {[_startAirport, _target] call A3A_fnc_isTheSameIsland}) then
            {
                _distance = _distance * 0.5;
            };

            //If the target is surrounded by our friendly markers, remove points
            private _nearbyFriendlyMarkers = (markersX - controlsX - citiesX - outpostsFIA) select
            {
                (sidesX getVariable [_x,sideUnknown] == _airportSide) &&
                {(getMarkerPos _x) distance2D (getMarkerPos _target) < 1500}
            };
            _distance = _distance - (300 * (count _nearbyFriendlyMarkers));
            if (_distance < 0) then {_distance = 0};

            if(count _nearbyFriendlyMarkers >= 5 && {!(_target in citiesX)}) then
            {
                [3, format ["%1 is surrounded by us, considering easy target", _target], _fileName] call A3A_fnc_log;
                _easyTargets pushBack _target;
            };

            //If in killzones, double the distance
            if (_target in _killZones) then
            {
                _distance = _distance * 2;
            };

            //Add airport to the possible start bases for attack to this target, use distance as points (the lower the better)
            private _index = _availableTargets findIf {(_x select 0) == _target};
            if(_index == -1) then
            {
                _availableTargets pushBack [_target, [[_startAirport, _distance]]];
            }
            else
            {
                private _targetArray = _availableTargets select _index;
                (_targetArray select 1) pushBack [_startAirport, _distance];
            };
        };
    } forEach _airportTargets;
} forEach _possibleStartBases;

if (count _availableTargets == 0) exitWith
{
    [
        2,
        "Attack could not find available targets, aborting!",
        _fileName
    ] call A3A_fnc_log;
};

[3, "Logging available targets for attack", _fileName] call A3A_fnc_log;
[_availableTargets, "Available targets"] call A3A_fnc_logArray;

{
    _x params ["_target", "_baseArray"];
    //[3, format ["T: %1, A: %2", _target, _baseArray], _fileName] call A3A_fnc_log;

    //Multiplier is used as an overall multiplier based on types
    private _targetMultiplier = 1;
    //Additional points based on marker specific traits
    private _targetPoints = 0;
    private _targetSide = sidesX getVariable [_target, sideUnknown];

    //Selecting a multiplier based on target type (lowest is best)
    switch (true) do
    {
        case (_target in airportsX): {_targetMultiplier = 0.1};
        case (_target in outposts): {_targetMultiplier = 0.35};
        case (_target in resourcesX): {_targetMultiplier = 0.5};
        case (_target in factories): {_targetMultiplier = 0.6};
        case (_target in seaports): {_targetMultiplier = 0.7};
        case (_target in citiesX): {_targetMultiplier = 0.9};
        //If I have missed something, multiplier stays the same
        default {_targetMultiplier = 1};
    };

    //Adding points based on nearby friendly locations
    private _nearbyFriendlyMarkers = (markersX - controlsX - citiesX - outpostsFIA) select
    {
        (sidesX getVariable [_x,sideUnknown] == _targetSide) &&
        {(getMarkerPos _x) distance2D (getMarkerPos _target) < 1500}
    };
    _targetPoints = 500 * (count _nearbyFriendlyMarkers);

    if(count _nearbyFriendlyMarkers <= 3) then
    {
        //Thats a shitty method, it is better without it as airports are considered easy cause they are in the open ...
        //Only a few of their friendly markers nearby, consider it an easy target
        //[3, format ["%1 has only minimal friendly location around it, considering easy target", _target], _fileName] call A3A_fnc_log;
        //_easyTargets pushBackUnique _target;
    };

    //Adding points based on garrison and statics
    private _garrison = garrison getVariable [_target,[]];
    private _nearbyStatics = staticsToSave select {(_x distance2D (getMarkerPos _target)) < distanceSPWN};
    _targetPoints = _targetPoints + (50 * (count _garrison) + (200 * (count _nearbyStatics)));

    if((count _garrison <= 8) && {(count _nearbyStatics <= 2) && {!(_target in citiesX)}}) then
    {
        //Only minimal garrison, consider it an easy target
        [3, format ["%1 has only minimal garrison, considering easy target", _target], _fileName] call A3A_fnc_log;
        _easyTargets pushBackUnique _target;
    };

    //Apply the new points to the base array
    {
        _baseArray = _baseArray apply {[_x select 0, ((_x select 1) + _targetPoints) * _targetMultiplier]};
    } forEach _baseArray;
} forEach _availableTargets;

[3, "Logging final target values for attack", _fileName] call A3A_fnc_log;
[_availableTargets, "Target values"] call A3A_fnc_logArray;

/*
All targets are now having values which airport can attack them how efficient
We will check for easy targets first, if we have four of them we will attack them
instead of starting one large attack. In both cases we check which are the most efficient ones
to attack from which airport
*/

if(count _easyTargets >= 4) then
{
    //We got four easy targets, attacking them now
    private _attackList = [objNull, objNull, objNull, objNull];
    {
        private _target = _x;
        private _index = _availableTargets findIf {(_x select 0) == _target};
        private _startArray = (_availableTargets select _index) select 1;

        //Search for the best option for attacking this target (lowest number is best)
        private _attackParams = objNull;
        {
            if(!(_attackParams isEqualType []) || {(_attackParams select 1) > (_x select 1)}) then
            {
                _attackParams = _x;
            };
        } forEach _startArray;
        _attackParams pushBack _target;

        //Check if the attack is better than one of the current selected ones
        private _insertIndex = _attackList findIf {(!(_x isEqualType [])) || {(_x select 1) > (_attackParams select 1)}};
        if(_insertIndex != -1) then
        {
            if(_insertIndex == 3) then
            {
                _attackList set [3, _attackParams];
            }
            else
            {
                //Sort in and push all worse option down by one
                for "_i" from 3 to _insertIndex step -1 do
                {
                    _attackList set [_i + 1, _attackList select _i];
                };
                //Set attack and then cut of the last option
                _attackList set [_insertIndex, _attackParams];
                _attackList resize 4;
            };
        };
    } forEach _easyTargets;

    [3, "Found four targets to attack, these are:", _fileName] call A3A_fnc_log;
    [_attackList, "Target params"] call A3A_fnc_logArray;

    //Execute the attacks from the given bases to the targets
    {
        [[_x select 2, _x select 0, "", false],"A3A_fnc_patrolCA"] remoteExec ["A3A_fnc_scheduler",2];
        //[sidesX getVariable (_x select 0), (_x select 2)] call A3A_fnc_markerChange;
        sleep 30;
    } forEach _attackList;
}
else
{
    //Not enough easy targets, attack the best non easy target if available
    private _mainTarget = objNull;
    private _easyTarget = objNull;
    {
        _x params ["_target", "_startArray"];

        //Select the best attack option for the target
        private _attackParams = objNull;
        {
            if(!(_attackParams isEqualType []) || {(_attackParams select 1) > (_x select 1)}) then
            {
                _attackParams = _x;
            };
        } forEach _startArray;
        _attackParams pushBack _target;

        //It makes less sense to hit a weak target with a strong waved attack, save it seperated
        if (_target in _easyTargets) then
        {
            if (!(_easyTarget isEqualType []) || {(_easyTarget select 1) > (_attackParams select 1)}) then
            {
                _easyTarget = _attackParams;
            };
        }
        else
        {
            if(!(_mainTarget isEqualType []) || {(_mainTarget select 1) > (_attackParams select 1)}) then
            {
                _mainTarget = _attackParams;
            };
        };
    } forEach _availableTargets;

    [3, format ["Main target is %1, easy target is %2", _mainTarget, _easyTarget], _fileName] call A3A_fnc_log;

    //If one if the target is not set, use the other one
    private _finalTarget = objNull;
    if(!(_mainTarget isEqualType [])) then
    {
        [3, "Main target not set, selecting easy target", _fileName] call A3A_fnc_log;
        _finalTarget = _easyTarget;
    }
    else
    {
        if(!(_easyTarget isEqualType [])) then
        {
            [3, "Easy target not set, selecting main target", _fileName] call A3A_fnc_log;
            _finalTarget = _mainTarget;
        }
        else
        {
            //If both are set, select easy target only if it is 2 times better than the main target
            if(((_easyTarget select 1) * 2) < (_mainTarget select 1)) then
            {
                _finalTarget = _easyTarget;
            }
            else
            {
                _finalTarget = _mainTarget;
            };
        };
    };

    [3, format ["Selected target is %1!", _finalTarget], _fileName] call A3A_fnc_log;

    _finalTarget params ["_attackOrigin", "_attackPoints", "_attackTarget"];

    //Maybe have aggro play a role here?
    //Select the number of ways based on the points as higher points mean higher difficulty
    private _waves =
		_attackPoints / 2500
		+ ([0, 1] select (_attackTarget in airportsX))
		+ (count allPlayers / 40)
		+ (tierWar / 10);

	_waves = round _waves;
    if(_waves < 1) then {_waves = 1};

    //Send the actual attacks
    if (sidesX getVariable [_attackOrigin, sideUnknown] == Occupants || {!(_attackTarget in citiesX)}) then
    {
        [
            2,
            format ["Starting waved attack with %1 waves from %2 to %3", _waves, _attackOrigin, _attackTarget],
            _fileName
        ] call A3A_fnc_log;
        //For debug reasons
        //[sidesX getVariable _attackOrigin, _attackTarget] call A3A_fnc_markerChange;
        //Why not using the scheduler here?
		[_attackTarget, _attackOrigin, _waves] spawn A3A_fnc_wavedCA;
    }
    else
    {
        [
            2,
            format ["Starting punishment mission from %1 to %2", _attackOrigin, _attackTarget],
            _fileName
        ] call A3A_fnc_log;
        //Why not using the scheduler here?
        [_attackTarget, _attackOrigin] spawn A3A_fnc_invaderPunish;
    };
};
