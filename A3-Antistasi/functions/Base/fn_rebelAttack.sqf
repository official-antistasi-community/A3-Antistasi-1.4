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
    "Starting large attack script, gathering targets now",
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



private _markersX = [];
private _countXFacil = 0;
private _natoIsFull = false;
private _csatIsFull = false;


//No AI vs AI, possible targets are only bases held by rebels
if (gameMode != 1) then
{
    _possibleTargets = _possibleTargets select
    {
        sidesX getVariable [_x,sideUnknown] == teamPlayer
    };
};

//For low level attacks only occupants are able to attack
if ((tierWar < 2) and (gameMode <= 2)) then
{
	_possibleStartBases = _possibleStartBases select {(sidesX getVariable [_x,sideUnknown] == Occupants)};
	_possibleTargets = _possibleTargets select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
}
else
{
    //If available and no airport is available, add the carriers
	if (gameMode != 4) then
    {
        if ({sidesX getVariable [_x,sideUnknown] == Occupants} count _possibleStartBases == 0) then
        {

        };
    };
	if (gameMode != 3) then
    {
        if ({sidesX getVariable [_x,sideUnknown] == Invaders} count _possibleStartBases == 0) then
        {
            _possibleStartBases pushBack "CSAT_carrier"
        };
    };
	if (([vehNATOPlane] call A3A_fnc_vehAvailable) and ([vehNATOMRLS] call A3A_fnc_vehAvailable) and ([vehNATOTank] call A3A_fnc_vehAvailable)) then
    {
        _natoIsFull = true
    };
	if (([vehCSATPlane] call A3A_fnc_vehAvailable) and ([vehCSATMRLS] call A3A_fnc_vehAvailable) and ([vehCSATTank] call A3A_fnc_vehAvailable)) then
    {
        _csatIsFull = true
    };
};

//On low level remove cities from target list
if (gameMode != 4) then
{
	if (tierWar < 3) then
    {
        _possibleTargets = _possibleTargets - citiesX;
    };
}
else
{
	if (tierWar < 5) then
    {
        _possibleTargets = _possibleTargets - citiesX;
    };
};

//lets keep the nearest targets for each AI airbase in the target list, so we ensure even when they are surrounded of friendly zones, they remain as target
private _nearestObjectives = [];
{
    private _airportSide = sidesX getVariable [_x,sideUnknown];
    private _airportTargets = _possibleTargets select {sidesX getVariable [_x,sideUnknown] != _airportSide};
    if !(_airportTargets isEqualTo []) then
    {
        _nearestTarget = [_airportTargets, getMarkerPos _x] call BIS_fnc_nearestPosition;
        _nearestObjectives pushBack _nearestTarget;
    };
} forEach _possibleStartBases;

//the following discards targets which are surrounded by friendly zones, excluding airbases and the nearest targets
//If one of the targets has only friendly locations arounds it (or none of our locations), the target gets discarded as it would be too strong
private _targetsForAreaCheck = _possibleTargets - airportsX - _nearestObjectives;
{
    private _targetPos = getMarkerPos _x;
    private _targetSide = sidesX getVariable [_x, sideUnknown];
    if (((markersX - controlsX - citiesX - outpostsFIA) select {sidesX getVariable [_x,sideUnknown] != _targetSide}) findIf {getMarkerPos _x distance2D _targetPos < 2000} == -1) then
    {
        _possibleTargets = _possibleTargets - [_x];
    };
} forEach _targetsForAreaCheck;

if (_possibleTargets isEqualTo []) exitWith
{
    [
        2,
        "No targets available for attack, aborting",
        _fileName,
        true
    ] call A3A_fnc_log;
};

[
    3,
    format ["Possible targets for attack are %1", _possibleTargets],
    _fileName,
    true
] call A3A_fnc_log;

private _finalTargets = [];
private _basesFinal = [];
private _countFinal = [];
private _objectiveFinal = [];
private _easyAttacks = [];
private _easyTargets = [];
private _invadersHaveSeaport = if ({(sidesX getVariable [_x,sideUnknown] == Invaders)} count seaports > 0) then {true} else {false};
private _occupantsHaveSeaport = if ({(sidesX getVariable [_x,sideUnknown] == Occupants)} count seaports > 0) then {true} else {false};
private _waves = 1;

{
    private _startAirport = _x;
    private _startAirportPos = getMarkerPos _startAirport;
    private _killZones = killZones getVariable [_startAirport, []];
    private _tmpTargets = [];
    private _airportIsOccupants = true;
    if (sidesX getVariable [_startAirport,sideUnknown] == Occupants) then
	{
        _tmpTargets = _possibleTargets select {sidesX getVariable [_x,sideUnknown] != Occupants};
        _tmpTargets = _tmpTargets - (citiesX select {([_x] call A3A_fnc_getSideRadioTowerInfluence) == teamPlayer});
	}
    else
	{
        _airportIsOccupants = false;
        _tmpTargets = _possibleTargets select {sidesX getVariable [_x,sideUnknown] != Invaders};
        //Why would the invaders care about support and radio tower influence?
        _tmpTargets = _tmpTargets - (citiesX select {(((server getVariable _x) select 2) + ((server getVariable _x) select 3) < 90) and ([_x] call A3A_fnc_getSideRadioTowerInfluence != Occupants)});
	};

    //Filter out everything that isn't in airport range
    _tmpTargets = _tmpTargets select {getMarkerPos _x distance2D _startAirportPos < distanceForAirAttack};
    if !(_tmpTargets isEqualTo []) then
	{
        //Isn't that just the nearest target? We already saved that
        private _nearestTmpTarget = [_tmpTargets,_startAirport] call BIS_fnc_nearestPosition;
        {
            private _target = _x;
            private _isCity = if (_target in citiesX) then {true} else {false};
            private _targetPos = getMarkerPos _target;
            private _rebelsHoldTarget = sidesX getVariable [_target, sideUnknown] == teamPlayer;
            private _isTheSameIsland = [_target,_startAirport] call A3A_fnc_isTheSameIsland;
            private _targetIsAirport = _x in airportsX;

            //Check for fog values, if no fog go on
            if ([_target, true] call A3A_fnc_fogCheck >= 0.3) then
            {
                //Check if the target is an easy to grab target
                if (_isTheSameIsland || {_rebelsHoldTarget || {!_targetIsAirport}}) then
                {
                    if ((!_isCity) && {!(_x in _killZones)) && {!(_x in _easyTargets) && {!(_startAirport in ["NATO_carrier","CSAT_carrier"])}}}) then
                    {
                        //This whole section here makes no sense at all
                		private _sideEnemy = if (_airportIsOccupants) then {Invaders} else {Occupants};
                		if ({(sidesX getVariable [_x,sideUnknown] == _sideEnemy) && {((getMarkerPos _x) distance2D _targetPos) < distanceSPWN}} count airportsX == 0) then
                		{
                			private _garrison = garrison getVariable [_target,[]];
                			private _nearbyStatics = staticsToSave select {_x distance _targetPos < distanceSPWN};
                			private _nearbyOutposts = outpostsFIA select {getMarkerPos _x distance2D _targetPos < distanceSPWN};
                			private _garrisonStrength = ((count _garrison) + (4 * (count _nearbyOutposts)) + (2 * (count _nearbyStatics)));
                			if (_garrisonStrength <= 8) then
                			{
                				if (!hasIFA || (_targetPos distance _startAirportPos < distanceForLandAttack)) then
                				{
                					_easyAttacks pushBack [_target,_startAirport];
                					_easyTargets pushBackUnique _target;
                				};
                			};
                		};
                	};
                    if !(_target in _easyTargets) then
                    {
                    	private _times = 1;
                    	if (_airportIsOccupants) then
                    	{
                    		if ({sidesX getVariable [_x,sideUnknown] == Occupants} count airportsX <= 1) then
                            {
                                _times = 2
                            };
                    		if (!_isCity) then
                    		{
                    			if ((_target in outposts) || (_target in seaports)) then
                    			{
                    				if (!_rebelsHoldTarget) then
                    				{
                                        //Isn't that like _natoIsFull?
                    					if (({[_x] call A3A_fnc_vehAvailable} count vehNATOAttack > 0) || ({[_x] call A3A_fnc_vehAvailable} count vehNATOAttackHelis > 0)) then
                                        {
                                            _times = 2*_times
                                        }
                                        else
                                        {
                                            _times = 0
                                        };
                    				}
                    				else
                    				{
                    					_times = 2*_times;
                    				};
                    			}
                    			else
                    			{
                    				if (_targetIsAirport) then
                    				{
                    					if (!_rebelsHoldTarget) then
                    					{
                    						if (([vehNATOPlane] call A3A_fnc_vehAvailable) or (!([vehCSATAA] call A3A_fnc_vehAvailable))) then {_times = 5*_times} else {_times = 0};
                    					}
                    					else
                    					{
                    						if (!_isTheSameIsland) then
                                            {
                                                _times = 5*_times
                                            }
                                            else
                                            {
                                                _times = 2*_times
                                            };
                    					};
                    				}
                    				else
                    				{
                    					if ((!_rebelsHoldTarget) && _natoIsFull) then
                                        {
                                            _times = 0
                                        };
                    				};
                                };
                    		};
                            if (_times > 0) then
                            {
                                _airportNear = [airportsX, _targetPos] call bis_fnc_nearestPosition;
                                if ((sidesX getVariable [_airportNear, sideUnknown] == Invaders) && (_x != _airportNear)) then
                                {
                                    _times = 0
                                };
                    		};
                    	}
                    	else
                    	{
                            _times = 2;
                    		if (!_isCity) then
                    		{
                    			if ((_target in outposts) || (_target in seaports)) then
                    			{
                    				if (!_rebelsHoldTarget) then
                    				{
                    					if (({[_x] call A3A_fnc_vehAvailable} count vehCSATAttack > 0) or ({[_x] call A3A_fnc_vehAvailable} count vehCSATAttackHelis > 0)) then {_times = 2*_times} else {_times = 0};
                    				}
                    				else
                    				{
                    					_times = 2*_times;
                    				};
                    			}
                    			else
                    			{
                    				if (_x in airportsX) then
                    				{
                    					if (!_rebelsHoldTarget) then
                    					{
                    						if (([vehCSATPlane] call A3A_fnc_vehAvailable) or (!([vehNATOAA] call A3A_fnc_vehAvailable))) then {_times = 5*_times} else {_times = 0};
                    					}
                    					else
                    					{
                                            if (!_isTheSameIsland) then {_times = 5*_times} else {_times = 2*_times};
                                        };
                    				}
                                    else
                                    {
                                        if ((!_rebelsHoldTarget) and _csatIsFull) then {_times = 0};
                                    };
                                };
                    			if (_times > 0) then
                    			{
                    				_airportNear = [airportsX,_targetPos] call bis_fnc_nearestPosition;
                    				if ((sidesX getVariable [_airportNear,sideUnknown] == Occupants) and (_x != _airportNear)) then {_times = 0};
                    			};
                    		};
                    		if (_times > 0) then
                    			{
                    			if ((!_rebelsHoldTarget) and (!_isCity)) then
                    				{
                    				//_times = _times + (floor((garrison getVariable [_x,0])/8))
                    				_numGarr = [_x] call A3A_fnc_garrisonSize;
                    				if ((_numGarr/2) < count (garrison getVariable [_x,[]])) then {if ((_numGarr/3) < count (garrison getVariable [_x,[]])) then {_times = _times + 6} else {_times = _times +2}};
                    				};
                    			if (_isTheSameIsland) then
                    				{
                    				if (_targetPos distance _startAirportPos < distanceForLandAttack) then
                    					{
                    					if  (!_isCity) then
                    						{
                    						_times = _times * 4
                    						};
                    					};
                    				};
                    			if (!_isCity) then
                    				{
                    				_isSea = false;
                    				if ((_airportIsOccupants and _occupantsHaveSeaport) or (!_airportIsOccupants and _invadersHaveSeaport)) then
                    					{
                    					for "_i" from 0 to 3 do
                    						{
                    						_pos = _targetPos getPos [1000,(_i*90)];
                    						if (surfaceIsWater _pos) exitWith {_isSea = true};
                    						};
                    					};
                    				if (_isSea) then {_times = _times * 2};
                    				};
                    			if (_x == _nearestTmpTarget) then {_times = _times * 5};
                    			if (_x in _killZones) then
                    				{
                    				private _target = _x;
                    				_times = _times / (({_x == _target} count _killZones) + 1);
                    				};
                    // don't do this because it may round down to zero, breaking selectRandomWeighted
                    //			_times = round (_times);
                    			_index = _finalTargets find _x;
                    			if (_index == -1) then
                    				{
                    				_finalTargets pushBack _x;
                    				_basesFinal pushBack _startAirport;
                    				_countFinal pushBack _times;
                    				}
                    			else
                    				{
                    				if ((_times > (_countFinal select _index)) or ((_times == (_countFinal select _index)) and (random 1 < 0.5))) then
                    					{
                    					_finalTargets deleteAt _index;
                    					_basesFinal deleteAt _index;
                    					_countFinal deleteAt _index;
                    					_finalTargets pushBack _x;
                    					_basesFinal pushBack _startAirport;
                    					_countFinal pushBack _times;
                    					};
                    				};
                    			};
                    		};
                    };

                };

            };

                    if (count _easyAttacks == 4) exitWith {};
                } forEach _tmpTargets;
        	};
            if (count _easyAttacks == 4) exitWith {};
} forEach _possibleStartBases;

//If we found four easy targets send four attacks to them
if (count _easyAttacks == 4) exitWith
{
    [
        2,
        format ["Found four easy targets instead of a single hard one, sending patrols to %1", _easyAttacks],
        _fileName,
        true
    ] call A3A_fnc_log;
	{
        [[_x select 0,_x select 1,"",false],"A3A_fnc_patrolCA"] remoteExec ["A3A_fnc_scheduler",2];
        sleep 30;
    } forEach _easyAttacks;
};

if ((count _finalTargets > 0) and (count _easyAttacks < 3)) then
{
	private _arrayFinal = [];
	for "_i" from 0 to (count _finalTargets) - 1 do
	{
		_arrayFinal pushBack [_finalTargets select _i,_basesFinal select _i];
	};
	//_objectiveFinal = selectRandom _arrayFinal;
	_objectiveFinal = _arrayFinal selectRandomWeighted _countFinal;
	_destinationX = _objectiveFinal select 0;
	_originX = _objectiveFinal select 1;

	private _isInvaderAttack = sidesX getVariable [_originX,sideUnknown] == Invaders;

	_waves =
		1
		+ ([0, 1] select (_destinationX in airportsX))
		+ (count allPlayers / 40)
		+ (tierWar / 10)
		+ ([0, 0.5] select _isInvaderAttack);

	_waves = floor _waves;

	if (not(_destinationX in citiesX)) then
		{
		///[[_destinationX,_originX,_waves],"A3A_fnc_wavedCA"] call A3A_fnc_scheduler;
		[_destinationX,_originX,_waves] spawn A3A_fnc_wavedCA;
		}
	else
		{
		//if (sidesX getVariable [_originX,sideUnknown] == Occupants) then {[[_destinationX,_originX,_waves],"A3A_fnc_wavedCA"] call A3A_fnc_scheduler} else {[[_destinationX,_originX],"A3A_fnc_invaderPunish"] call A3A_fnc_scheduler};
		if (sidesX getVariable [_originX,sideUnknown] == Occupants) then {[_destinationX,_originX,_waves] spawn A3A_fnc_wavedCA} else {[_destinationX,_originX] spawn A3A_fnc_invaderPunish};
		};
	};

if (_waves == 1) then
	{
	{[[_x select 0,_x select 1,"",false],"A3A_fnc_patrolCA"] remoteExec ["A3A_fnc_scheduler",2]} forEach _easyAttacks;
	};
