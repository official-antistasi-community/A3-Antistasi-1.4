private ["_unit","_resourcesX","_hr","_weaponsX","_ammunition","_items","_pos"];

_unit = _this select 0;
_uid = _this select 2;
_owner = _this select 4;
_resourcesX = 0;
_hr = 0;

diag_log format ["[Antistasi] Player disconnected with id %1 and unit %2 on side %3", _uid, _unit, (side _unit)];

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
	if (((count playableUnits > 0) and (!membershipEnabled)) or ({(getPlayerUID _x) in membersX} count playableUnits > 0)) then
		{
		[] spawn A3A_fnc_assigntheBoss;
		};
	if (group petros == group _unit) then {[] spawn A3A_fnc_buildHQ};
	};
//{if (groupOwner _x ==)} forEach allGroups select {(side _x == civilian) and (!isPlayer leader _x)};
if (side _unit == teamPlayer) then
	{
	if ((_hr > 0) or (_resourcesX > 0)) then {[_hr,_resourcesX] spawn A3A_fnc_resourcesFIA};
	if (membershipEnabled and pvpEnabled) then
		{
		if (_uid in membersX) then {playerHasBeenPvP pushBack [getPlayerUID _unit,time]};
		};
	[_uid, _unit] call A3A_fnc_savePlayer;
	//if ([_unit] call A3A_fnc_isMember) then {playerHasBeenPvP pushBack [getPlayerUID _unit,time]};
	};
if (_owner in hcArray) then
	{
	//["hcDown",true,true,true,true] remoteExec ["BIS_fnc_endMission"]
	if ({owner _x == _owner} count allUnits > 0) then
		{
		[] spawn
			{
			while {true} do
				{
				[petros,"hint","A Headless Client has been disconnected. This will cause malfunctions. Head back to HQ for saving ASAP and ask and Admin for a restart"] remoteExec ["A3A_fnc_commsMP"];
				sleep 30;
				};
			};
		}
	else
		{
		hcArray = hcArray - [_owner];
		};
	}
else
	{
	_pos = getPosATL _unit;
	_wholder = nearestObjects [_pos, ["weaponHolderSimulated", "weaponHolder"], 2];
	{deleteVehicle _x} forEach _wholder + [_unit];
	if !(isNull _unit) then
		{
		_unit setVariable ["owner",_unit,true];
		_unit setDamage 1;
		};
	};
//diag_log format ["dataX de handledisconnect: %1",_this];