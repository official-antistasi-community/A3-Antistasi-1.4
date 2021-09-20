#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
if (!isServer) exitWith { Error("Server-only function miscalled") };
params ["_attackDestination", "_attackOrigin"];

Info_2("Launching CSAT Punish Against %1 from %2", _attackDestination, _attackOrigin);

bigAttackInProgress = true;
publicVariable "bigAttackInProgress";

private _posDestination = getMarkerPos _attackDestination;
private _posOrigin = getMarkerPos _attackOrigin;
private _attackDir = _posOrigin getDir _posDestination;
private _size = [_attackDestination] call A3A_fnc_sizeMarker;
private _groups = [];
private _soldiers = [];
private _pilots = [];
private _vehiclesX = [];
private _civilians = [];
private _civGroups = [];
private _landingPads = [];

private _nameDestination = [_attackDestination] call A3A_fnc_localizar;
private _taskId = "invaderPunish" + str A3A_taskCount;
[[teamPlayer,civilian,Occupants],_taskId,[format ["%2 is attacking critical positions within %1! Defend the city at all costs",_nameDestination,nameInvaders],format ["%1 Punishment",nameInvaders],_attackDestination],getMarkerPos _attackDestination,false,0,true,"Defend",true] call BIS_fnc_taskCreate;
[_taskId, "invaderPunish", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

// give smaller player groups a bit more time to respond
private _playerScale = call A3A_fnc_getPlayerScale;
[_attackOrigin, (5 / _playerScale) + 10] call A3A_fnc_addTimeForIdle;        // Reserve airbase for this attack
sleep (60*5 / _playerScale);

private _reveal = [_posDestination, Invaders] call A3A_fnc_calculateSupportCallReveal;
[_posDestination, 4, ["MORTAR"], Invaders, _reveal] remoteExec ["A3A_fnc_sendSupport", 2];
private _missionExpireTime = time + 3600;
private _missionMinTime = time + 600;

private _invaderAirTransport = (vehCSATTransportHelis + vehCSATTransportPlanes) select {[_x] call A3A_fnc_vehAvailable};
private _invaderAttackHelis = vehCSATAttackHelis select {[_x] call A3A_fnc_vehAvailable};

// probably doesn't make much sense to aggro-scale this one as it's not a response
private _numVehicles = round (2 + random 1 + _playerScale);
private _numAttackHelis = if (count _invaderAttackHelis != 0) then { round (_numVehicles / 3) } else { 0 };

for "_i" from 1 to _numVehicles do
{
    if (_i > 3 and { [Invaders] call A3A_fnc_remUnitCount < 8 }) exitWith {};
    private _typeAirVehicle = if (_i <= _numAttackHelis) then {selectRandom _invaderAttackHelis} else {selectRandom _invaderAirTransport};
    private _spawnResult = [_posOrigin, _attackDir, _typeAirVehicle, Invaders] call A3A_fnc_spawnVehicle;
    private _veh = _spawnResult select 0;
    private _vehCrew = _spawnResult select 1;
    {[_x] call A3A_fnc_NATOinit} forEach _vehCrew;
    [_veh, Invaders] call A3A_fnc_AIVEHinit;
    private _crewGroup = _spawnResult select 2;
    _pilots append _vehCrew;
    _groups pushBack _crewGroup;
    _vehiclesX pushBack _veh;

    //If we're an attack vehicle.
    if (_typeAirVehicle in _invaderAttackHelis) then {
        _wp1 = _crewGroup addWaypoint [_posDestination, 0];
        _wp1 setWaypointType "SAD";
        //[_veh,"Air Attack"] spawn A3A_fnc_inmuneConvoy;
    } else {
        {_x setBehaviour "CARELESS";} forEach units _crewGroup;
        _typeGroup = [_typeAirVehicle,Invaders] call A3A_fnc_cargoSeats;
        _groupX = [_posOrigin, Invaders, _typeGroup, true, false] call A3A_fnc_spawnGroup;          // forced spawn
        {_x assignAsCargo _veh;_x moveInCargo _veh; _soldiers pushBack _x; [_x] call A3A_fnc_NATOinit; _x setVariable ["originX",_attackOrigin]} forEach units _groupX;
        _groups pushBack _groupX;
        //[_veh,"CSAT Air Transport"] spawn A3A_fnc_inmuneConvoy;

        if (_typeAirVehicle isKindOf "Plane") exitWith {
            [_veh,_groupX,_attackDestination,_attackOrigin] spawn A3A_fnc_paradrop;
        };

        private _landPos = _posDestination getPos [random (_size/2) + _size/2, random 360];
        _landPos = [_landPos, 0, _size/4, 10, 0, 0.20, 0,[],[[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos;

        if (_landPos isEqualTo [0,0,0]) exitWith {
            {_x disableAI "TARGET"; _x disableAI "AUTOTARGET"} foreach units _crewGroup;
            [_veh,_groupX,_posDestination,_posOrigin,_crewGroup] spawn A3A_fnc_fastrope;
        };

        _landPos set [2, 0];
        private _pad = createVehicle ["Land_HelipadEmpty_F", _landPos, [], 0, "NONE"];
        _landingPads pushBack _pad;

        // Combat landing setup
        _veh setVariable ["LandingPad", _pad, true];
        _veh setVariable ["PosDestination", _posDestination, true];
        _veh setVariable ["PosOrigin", _posOrigin, true];

        //Create the waypoints for the crewGroup
        private _vehWP0 = _crewGroup addWaypoint [_landPos, 0];
        _vehWP0 setWaypointType "MOVE";
        _vehWP0 setWaypointSpeed "FULL";
        _vehWP0 setWaypointCompletionRadius 150;
        _vehWP0 setWaypointBehaviour "CARELESS";

        // Hack for tree-dodging on landing path
        if(toLower worldName in tropicalmaps) then { _veh flyInHeight 250 };

        [_veh, _landPos] spawn
        {
            params ["_vehicle", "_landPos"];
            waitUntil {sleep 1; (_vehicle distance2D _landPos) < 600};
            [_vehicle] spawn A3A_fnc_combatLanding;
        };
    };
    sleep 20;
};

private _numCiv = (server getVariable _attackDestination) select 0;
_numCiv = 4 + round sqrt (_numCiv);
if (_numCiv > 30) then {_numCiv = 30};

while {count _civilians < _numCiv} do
{
    private _groupCivil = createGroup teamPlayer;
    _civGroups pushBack _groupCivil;
    private _pos = while {true} do {
        private _pos = _posDestination getPos [random _size / 2,random 360];
        if (!surfaceIsWater _pos) exitWith { _pos };
    };
    for "_i" from 1 to (4 min (_numCiv - count _civilians)) do
    {
        private _civ = [_groupCivil, SDKUnarmed, _pos, [], 0, "NONE"] call A3A_fnc_createUnit;
        _civ forceAddUniform selectRandom (A3A_faction_civ getVariable "uniforms");
        _civ addHeadgear selectRandom (A3A_faction_civ getVariable "headgear");
        [_civ, selectRandom (unlockedsniperrifles + unlockedmachineguns + unlockedshotguns + unlockedrifles + unlockedsmgs + unlockedhandguns), 5, 0] call BIS_fnc_addWeapon;
        _civ setSkill 0.5;
        _civilians pushBack _civ;
    };
    [leader _groupCivil, _attackDestination, "AWARE","SPAWNED","NOVEH2"] execVM "scripts\UPSMON.sqf";//TODO need delete UPSMON link
};


if (tierWar >= 5) then {
    for "_i" from 0 to round random 1 do {
        if ([vehCSATPlane] call A3A_fnc_vehAvailable) then {
            private _reveal = [_posDestination, Invaders] call A3A_fnc_calculateSupportCallReveal;
            [_posDestination, 4, ["AIRSTRIKE"], Invaders, _reveal] remoteExec ["A3A_fnc_sendSupport", 2];
            sleep 30;
        };
    };
};

waitUntil {
    sleep 10;
    ({_x call A3A_fnc_canFight} count _soldiers < count _soldiers / 3)
    or (time > _missionMinTime and ({alive _x} count _civilians < count _civilians / 4))
    or (time > _missionExpireTime)
};

private _fnc_adjustNearCities = {
    params ["_position", "_maxSupport", "_maxDist"];
    {
        private _dist = getMarkerPos _x distance2d _position;
        if (_dist > _maxDist) then { continue };
        private _suppChange = linearConversion [0, _maxDist, _dist, _maxSupport, 0, true];
        [0,_suppChange,_x,false] spawn A3A_fnc_citySupportChange;		// don't scale this by pop
    } forEach citiesX;
};

if (({_x call A3A_fnc_canFight} count _soldiers < count _soldiers / 3) or (time > _missionExpireTime)) then {
    Info_1("Rebels defeated a punishment attack against %1", _attackDestination);
    [_taskId, "invaderPunish", "SUCCEEDED"] call A3A_fnc_taskSetState;
    [_posDestination, 30, 3000] call _fnc_adjustNearCities;

    [Occupants, -10, 90] remoteExec ["A3A_fnc_addAggression",2];
    {if (isPlayer _x) then {[10,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_posDestination,teamPlayer] call A3A_fnc_distanceUnits);
    [10,theBoss] call A3A_fnc_playerScoreAdd;
} else {
    Info_1("Rebels lost a punishment attack against %1", _attackDestination);
    [_taskId, "invaderPunish", "FAILED"] call A3A_fnc_taskSetState;
    [_posDestination, -30, 3000] call _fnc_adjustNearCities;

    destroyedSites = destroyedSites + [_attackDestination];
    publicVariable "destroyedSites";
    private _mineTypes = A3A_faction_inv getVariable "minefieldAPERS";
    for "_i" from 1 to 60 do {
        private _mineX = createMine [selectRandom _mineTypes,_posDestination,[],_size];
        Invaders revealMine _mineX;
    };
    [_attackDestination] call A3A_fnc_destroyCity;
    // Putting this stuff here is a bit gross, but currently there's no cityFlip function. Usually done by resourceCheck.
    sidesX setVariable [_attackDestination, Invaders, true];
    garrison setVariable [_attackDestination, [], true];
    [_attackDestination] call A3A_fnc_mrkUpdate;
};

sleep 15;
[_taskId, "invaderPunish", 0] spawn A3A_fnc_taskDelete;
[3600, Invaders] remoteExec ["A3A_fnc_timingCA", 2];

bigAttackInProgress = false;
publicVariable "bigAttackInProgress";


// Order remaining aggressor units back to base, hand them to the group despawner
{
    private _wp = _x addWaypoint [_posOrigin, 50];
    _wp setWaypointType "MOVE";
    _x setCurrentWaypoint _wp;
    [_x] spawn A3A_fnc_groupDespawner;
} forEach _groups;

{ [_x] spawn A3A_fnc_VEHdespawner } forEach _vehiclesX;
{ deleteVehicle _x } forEach _landingPads;

// When the city marker is despawned, get rid of the civilians
waitUntil {sleep 5; (spawner getVariable _attackDestination == 2)};
{deleteVehicle _x} forEach _civilians;
{deleteGroup _x} forEach _civGroups;
