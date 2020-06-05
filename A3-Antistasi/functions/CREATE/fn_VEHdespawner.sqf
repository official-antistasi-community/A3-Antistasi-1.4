_filename = "fn_VEHdespawner";
params ["_veh", ["_checkNonRebel", false]];

if (!isNil {_veh getVariable "inDespawner"}) exitWith {};
_veh setVariable ["inDespawner", true, true];

// despawnBlockTime should be increased when a rebel exits a vehicle
private _blockTime = _veh getVariable ["despawnBlockTime", 0];
while {alive _veh} do
{
	sleep (60 max (_blockTime - time));
	if !(alive _veh) exitWith {};
	_blockTime = _veh getVariable ["despawnBlockTime", 0];

	private _despawn = call {
		if ({ alive _x } count crew _veh > 0) exitWith {false};
		if (_veh distance getMarkerPos respawnTeamPlayer < 100) exitWith {false};
		if (_blockTime > time) exitWith {false};
		if !(isNull attachedTo _veh) exitWith {false};		// don't despawn attached objects
		if ([distanceSPWN,1,_veh,teamPlayer] call A3A_fnc_distanceUnits) exitWith {false};
		if !(_checkNonRebel) exitWith {true};
		if ([distanceSPWN,1,_veh,Occupants] call A3A_fnc_distanceUnits) exitWith {false};
		if ([distanceSPWN,1,_veh,Invaders] call A3A_fnc_distanceUnits) exitWith {false};
		true;
	};

	if (_despawn) exitWith {
		if (_veh in reportedVehs) then {reportedVehs = reportedVehs - [_veh]; publicVariable "reportedVehs"};
		deleteVehicle _veh;
	};
};
