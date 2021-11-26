#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
// convert killzones into [base, target] array
private _allKillzones = [];
{
	private _base = _x;
	private _kzlist = killZones getVariable [_base, []];
	{ _allKillzones pushBack [_base, _x] } forEach _kzlist;
} forEach (outposts + airportsX);

// Remove random killzones if the aggression-based accumulator hits >1
if (isNil "killZoneRemove") then {killZoneRemove = 0};
private _kzAggroMult = 0.2 + 0.4 * (aggressionOccupants + aggressionInvaders) / 100;
killZoneRemove = killZoneRemove + _kzAggroMult * (0.5 + 0.1 * count _allKillzones);
if (count _allKillzones == 0) then { killZoneRemove = 0 };

while {killZoneRemove >= 1} do
{
	// Remove a random killzone entry from the real killzones.
	// May attempt to remove the same killzone multiple times. This is safe.
	(selectRandom _allKillzones) params ["_base", "_target"];
	private _kzlist = killZones getVariable [_base, []];
	_kzlist deleteAt (_kzlist find _target);
	killZones setVariable [_base, _kzlist, true];
	killZoneRemove = killZoneRemove - 1;
};

// Handle the old reinforcements

private _playerScale = call A3A_fnc_getPlayerScale;
private _totalReinf = 4 * round (3 * (1 + tierWar/10) * _playerScale * (0.5 + random 1));
Debug_1("Sending %1 total troops to reinforce", _totalReinf);

private _airportsX = airportsX select {(sidesX getVariable [_x,sideUnknown] != teamPlayer) and (spawner getVariable _x != 0)};
if (gameMode == 3) then { _airportsX pushBack "NATO_carrier" } else { _airportsX append ["NATO_carrier", "CSAT_carrier"] };

// build list of markers that need reinforcement
private _reinfTargets = [];			// elements are [troopsNeeded, marker]
{
	private _site = _x;
	private _troopsNeeded = ([_site] call A3A_fnc_garrisonSize) - count (garrison getVariable [_site, []]);
	if (_troopsNeeded <= 0) then { continue };
	if (_site in forcedSpawn) then { continue };

	// Don't reinforce if marker has enemy-controlled airfields within spawn distance
	private _siteSide = sidesX getVariable [_site, sideUnknown];
	if (-1 != airportsX findIf {(markerPos _x distance2d markerPos _site < distanceSPWN) and (sidesX getVariable [_x,sideUnknown] != _siteSide)}) then { continue };

	_reinfTargets pushBack [_troopsNeeded, _site];
} forEach (outposts + seaports + resourcesX + factories);

// prioritize bases with most troops needed
_reinfTargets sort false;

private _fnc_pickSquadType = {
	params ["_count", "_side"];
	if (_numTroops == 8) exitWith { selectRandom ([groupsNATOSquad, groupsCSATSquad] select (_side == Invaders))};
	selectRandom ([groupsNATOmid, groupsCSATmid] select (_side == Invaders));
};

while {_totalReinf > 0} do
{
	if (_airportsX isEqualTo [] or _reinfTargets isEqualTo []) exitWith {};
	private _airport = selectRandom _airportsX;
	private _side = sidesX getVariable [_airport, sideUnknown];

	//Self reinforce the airport if needed
	if !("carrier" in _airport) then {
		private _numNeeded = ([_airport] call A3A_fnc_garrisonSize) - count (garrison getVariable [_airport, []]);
		if (_numNeeded <= 0) exitWith {};

		private _numTroops = [4, 8] select (_numNeeded > 4 and _totalReinf >= 8 and random 1 > 0.3);
		[[_numTroops, _side] call _fnc_pickSquadType, _side, _airport, 0] remoteExec ["A3A_fnc_garrisonUpdate",2];
		Debug_2("Airport %1 self-reinforced with %2 troops", _airport, _numTroops);
		_totalReinf = _totalReinf - _numTroops;
		continue;
	};

	//Find a suitable site to reinforce
	private _killZones = killzones getVariable [_airport, []];
	private _targIndex = _reinfTargets findIf {
		(getMarkerPos (_x#1) distance2d getMarkerPos _airport < distanceForAirAttack)
		and (sidesX getVariable [_x#1, sideUnknown] == _side)
		and !((_x#1) in _killZones)
	};
	if (_targIndex == -1) then {
		// Airport has nothing to do, remove it from the list
		_airportsX deleteAt (_airportsX find _airport);
		continue;
	};

	(_reinfTargets deleteAt _targIndex) params ["_numNeeded", "_target"];
	private _numTroops = [4, 8] select (_numNeeded > 4 and _totalReinf >= 8 and random 1 > 0.3);
	_totalReinf = _totalReinf - _numTroops;

	Debug_3("Reinforcing garrison %1 from %2 with %3 troops", _target, _airport, _numTroops);
	if ([distanceSPWN1, 1, getMarkerPos _target, teamPlayer] call A3A_fnc_distanceUnits) then {
		// If rebels are near the target, send a real reinforcement
		[[_target, _airport, _numTroops, _side], "A3A_fnc_patrolReinf"] call A3A_fnc_scheduler;
		sleep 10;		// Might re-use this marker shortly, avoid collisions
	} else {
		// Otherwise just add troops directly
		[[_numTroops, _side] call _fnc_pickSquadType, _side, _target, 2] remoteExec ["A3A_fnc_garrisonUpdate", 2];
	};
};

// If there aren't too many road patrols around already, generate about 1.5 * playerScale per hour
if (AAFpatrols < round (3 * _playerScale) and (random 4 < _playerScale)) then {
	[] spawn A3A_fnc_AAFroadPatrol;
};

// Reduce loot crate cooldown if garrison is complete
{
	call {
		private _lootCD = garrison getVariable [_x + "_lootCD", 0];
		if (_lootCD == 0) exitWith {};							// don't update unless changed
		private _realSize = count (garrison getVariable [_x, []]);
		if (_realSize < [_x] call A3A_fnc_garrisonSize) exitWith {};
		garrison setVariable [_x + "_lootCD", 0 max (_lootCD - 10), true];
	};
} forEach (airportsX + outposts + seaports);


{
		//Setting the number of recruitable units per ticks per airport
    garrison setVariable [format ["%1_recruit", _x], 12, true];
} forEach airportsX;

{
    //Setting the number of recruitable units per ticks per outpost
		garrison setVariable [format ["%1_recruit", _x], 0, true];
} forEach outposts;

//New reinf system (still reactive, so a bit shitty)
{
	_side = _x;
  _reinfMarker = if(_x == Occupants) then {reinforceMarkerOccupants} else {reinforceMarkerInvader};
	_canReinf = if(_x == Occupants) then {canReinforceOccupants} else {canReinforceInvader};
    Debug_3("Side %1, needed %2, possible %3", _x, count _reinfMarker, count _canReinf);
	_reinfMarker sort true;
	{
		_target = (_x select 1);
		[_target, "Reinforce", _side, [_canReinf]] remoteExec ["A3A_fnc_createAIAction", 2];
		sleep 10;		// prevents convoys spawning on top of each other
		//TODO add a feedback if something was send or not
	} forEach _reinfMarker;
} forEach [Occupants, Invaders];
//hint "Reinforce AI done!";

//Replenish airports if possible
{
	[_x] call A3A_fnc_replenishGarrison;
} forEach airportsX;
