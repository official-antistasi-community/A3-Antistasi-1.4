private ["_unit","_resourcesX","_hr","_weaponsX","_ammunition","_items","_pos"];

_unit = _this select 0;
_uid = _this select 2;
_resourcesX = 0;
_hr = 0;

diag_log format ["[Antistasi] Player disconnected with id %1 and unit %2 on side %3", _uid, _unit, (side _unit)];

if (side _unit == sideLogic || {_uid == ""}) exitWith {
	diag_log "[Antistasi] Exiting onPlayerDisconnect due to no UID or sideLogic unit. Possible Headless Client disconnect?";
};

if (_unit == theBoss) then
	{
	{
	if (!(_x getVariable ["esNATO",false])) then
		{
		if ((leader _x getVariable ["spawner",false]) and ({isPlayer _x} count (units _x) == 0) and (side _x == teamPlayer)) then
			{
			_uds = units _x;
				{
				//Once a player has disconnected, they no longer count as a player - so isPlayer doesn't filter them out.
				if (_x isEqualTo _unit)	exitWith {};
				if (alive _x) then
					{
					_resourcesX = _resourcesX + (server getVariable (typeOf _x));
					_hr = _hr + 1;
					};
				if (!isNull (assignedVehicle _x)) then
					{
					_veh = assignedVehicle _x;
					_typeVehX = typeOf _veh;
					if ((_veh isKindOf "StaticWeapon") and (not(_veh in staticsToSave))) then
						{
						_resourcesX = _resourcesX + ([_typeVehX] call A3A_fnc_vehiclePrice) + ([typeOf (vehicle leader _x)] call A3A_fnc_vehiclePrice);
						}
					else
						{
						if (_typeVehX in vehFIA) then {_resourcesX = _resourcesX + ([_typeVehX] call A3A_fnc_vehiclePrice);};
						/*
						if (_typeVehX in vehAAFnormal) then {_resourcesX = _resourcesX + 300};
						if (_typeVehX in vehAAFAT) then
							{
							if ((_typeVehX == "I_APC_tracked_03_cannon_F") or (_typeVehX == "I_APC_Wheeled_03_cannon_F")) then {_resourcesX = _resourcesX + 1000} else {_resourcesX = _resourcesX + 5000};
							};
						*/
						if (count attachedObjects _veh > 0) then
							{
							_subVeh = (attachedObjects _veh) select 0;
							_resourcesX = _resourcesX + ([(typeOf _subVeh)] call A3A_fnc_vehiclePrice);
							deleteVehicle _subVeh;
							};
						};
					if (!(_veh in staticsToSave)) then {deleteVehicle _veh};
					};
				deleteVehicle _x;
				} forEach _uds;
			};
		};
	} forEach allGroups;
	//Empty 'theBoss' variable, so it doesn't remain assigned to the player's dead body.
	theBoss = objNull;
	//Broadcast as a public variable, otherwise new players joining will have theBoss assigned to the dead body still.
	publicVariable "theBoss";
	[] remoteExec ["A3A_fnc_assignBossIfNone", 2];
	if (group petros == group _unit) then { [] spawn A3A_fnc_buildHQ}; };

//Need to check the group's side, as player may be a civ. Unknown is in case they've been moved out of their group.
if (side group _unit == teamPlayer || side group _unit == sideUnknown) then
	{
	if ((_hr > 0) or (_resourcesX > 0)) then {[_hr,_resourcesX] spawn A3A_fnc_resourcesFIA};
	if (membershipEnabled and pvpEnabled) then
		{
		if (_uid in membersX) then {playerHasBeenPvP pushBack [_uid,time]};
		};
	};

[_uid, _unit] call A3A_fnc_savePlayer;

_pos = getPosATL _unit;
_wholder = nearestObjects [_pos, ["weaponHolderSimulated", "weaponHolder"], 2];
{deleteVehicle _x} forEach _wholder + [_unit];
if !(isNull _unit) then
{
	_unit setVariable ["owner",_unit,true];
	_unit setDamage 1;
};
//diag_log format ["dataX de handledisconnect: %1",_this];