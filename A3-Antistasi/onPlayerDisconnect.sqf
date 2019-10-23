private ["_unit","_recursos","_hr","_armas","_municion","_items","_pos"];

_unit = _this select 0;
_uid = _this select 2;
_recursos = 0;
_hr = 0;

if (_unit == theBoss) then
	{
	{
	if (!(_x getVariable ["esNATO",false])) then
		{
		if ((leader _x getVariable ["GREENFORSpawn",false]) and ({isPlayer _x} count (units _x) == 0)) then
			{
			_uds = units _x;
				{
				if (alive _x) then
					{
					_recursos = _recursos + (server getVariable (typeOf _x));
					_hr = _hr + 1;
					};
				if (!isNull (assignedVehicle _x)) then
					{
					_veh = assignedVehicle _x;
					_tipoVeh = typeOf _veh;
					if ((_veh isKindOf "StaticWeapon") and (not(_veh in staticsToSave))) then
						{
						_recursos = _recursos + ([_tipoVeh] call A3A_fnc_vehiclePrice) + ([typeOf (vehicle leader _x)] call A3A_fnc_vehiclePrice);
						}
					else
						{
						if (_tipoVeh in vehFIA) then {_recursos = _recursos + ([_tipoVeh] call A3A_fnc_vehiclePrice);};
						/*
						if (_tipoVeh in vehAAFnormal) then {_recursos = _recursos + 300};
						if (_tipoVeh in vehAAFAT) then
							{
							if ((_tipoVeh == "I_APC_tracked_03_cannon_F") or (_tipoVeh == "I_APC_Wheeled_03_cannon_F")) then {_recursos = _recursos + 1000} else {_recursos = _recursos + 5000};
							};
						*/
						if (count attachedObjects _veh > 0) then
							{
							_subVeh = (attachedObjects _veh) select 0;
							_recursos = _recursos + ([(typeOf _subVeh)] call A3A_fnc_vehiclePrice);
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
	if (((count playableUnits > 0) and (!membershipEnabled)) or ({(getPlayerUID _x) in miembros} count playableUnits > 0)) then
		{
		[] spawn A3A_fnc_assigntheBoss;
		};
	if (group petros == group _unit) then {[] spawn A3A_fnc_buildHQ};
	};
//{if (groupOwner _x ==)} forEach allGroups select {(side _x == civilian) and (!isPlayer leader _x)};
if (side group _unit == buenos) then
	{
	if ((_hr > 0) or (_recursos > 0)) then {[_hr,_recursos] spawn A3A_fnc_resourcesFIA};
	if (membershipEnabled and pvpEnabled) then
		{
		if (_uid in miembros) then {playerHasBeenPvP pushBack [getPlayerUID _unit,time]};
		};
	//if ([_unit] call A3A_fnc_isMember) then {playerHasBeenPvP pushBack [getPlayerUID _unit,time]};
	};
if ((owner _unit) in hcArray) then
	{
	//["hcDown",true,true,true,true] remoteExec ["BIS_fnc_endMission"]
	_owner = owner _unit;
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
//diag_log format ["Datos de handledisconnect: %1",_this];