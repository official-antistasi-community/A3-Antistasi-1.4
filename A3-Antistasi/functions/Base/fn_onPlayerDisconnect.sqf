private _filename = "fn_onPlayerDisconnect";
private ["_unit","_resourcesX","_hr","_weaponsX","_ammunition","_items","_pos"];

_unit = _this select 0;
_uid = _this select 2;
_resourcesX = 0;
_hr = 0;

[2, format ["Player disconnected with id %1 and unit %2 on side %3", _uid, _unit, (side _unit)], _filename] call A3A_fnc_log;

if (side _unit == sideLogic || {_uid == ""}) exitWith {
	diag_log "[Antistasi] Exiting onPlayerDisconnect due to no UID or sideLogic unit. Possible Headless Client disconnect?";
};


// find original player unit in case of remote control
private _realUnit = _unit getVariable ["owner", _unit];

[2, format ["Player unit %1, player unit owner %2, boss %3", _unit, _realUnit, theBoss], _filename] call A3A_fnc_log;

if (_realUnit == theBoss) then
{

	// this should be done on persistent save, if anything, not commander disconnection. Removing for now.
	/*
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

						//if (_typeVehX in vehAAFnormal) then {_resourcesX = _resourcesX + 300};
						//if (_typeVehX in vehAAFAT) then
						//	{
						//	if ((_typeVehX == "I_APC_tracked_03_cannon_F") or (_typeVehX == "I_APC_Wheeled_03_cannon_F")) then {_resourcesX = _resourcesX + 1000} else {_resourcesX = _resourcesX + 5000};
						//	};

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

	if ((_hr > 0) or (_resourcesX > 0)) then {[_hr,_resourcesX] spawn A3A_fnc_resourcesFIA};
	*/

	if (group petros == group _realUnit) then { [] spawn A3A_fnc_buildHQ}; 

	// Remove our real unit from boss
	_realUnit setVariable ["eligible", false, true];
	[] call A3A_fnc_assignBossIfNone;
};

//Need to check the group's side, as player may be a civ. Unknown is in case they've been moved out of their group.
if (side group _unit == teamPlayer || side group _unit == sideUnknown) then
{
	if (membershipEnabled and pvpEnabled) then
	{
		if (_uid in membersX) then {playerHasBeenPvP pushBack [_uid,time]};
	};
};

[_uid, _realUnit] call A3A_fnc_savePlayer;

// Preventing duping due to weapon loadout saves
if (alive _realUnit && {!(_realUnit getVariable ["incapacitated", false])} ) then { deleteVehicle _realUnit }
else { _realUnit setDamage 1 };			// finish off, if incapped

//if (_realUnit != _unit) then { deleteVehicle _unit };

//diag_log format ["dataX de handledisconnect: %1",_this];

