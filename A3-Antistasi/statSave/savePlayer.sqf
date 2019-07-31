private _playerId =	param [0];
private _playerUnit = param [1];

if (hasInterface) then {
	if (isNil "_playerId" || isNil "_playerUnit") then {
		_playerId = getPlayerUID player;
		_playerUnit = player;
	};
};

if (isMultiplayer && !isServer) exitwith {
	[_playerId, _playerUnit] remoteExec ["A3A_fnc_savePlayer", 2];
};

if (isNil "_playerId" || isNil "_playerUnit" || { isNull _playerUnit }) exitWith {
	diag_log format ["[Antistasi] Not saving player %1 due to missing unit", _playerId];
};

savingClient = true;
diag_log format ["[Antistasi] Saving player %1", _playerId];

private _canSaveLoadout = true;
if (hasACEMedical && {[_playerUnit] call ace_medical_fnc_getUnconsciousCondition}) then 
{
	_canSaveLoadout =	false;
};

if !(lifeState _playerUnit == "HEALTHY" || lifeState _playerUnit == "INJURED") then {
	_canSaveLoadout =	false;
};

if (_canSaveLoadout) then {
	[_playerId, "loadoutPlayer", getUnitLoadout _playerUnit] call fn_SavePlayerStat;
};

if (isMultiplayer) then
	{
	[_playerId, "scorePlayer", _playerUnit getVariable "score"] call fn_SavePlayerStat;
	[_playerId, "rankPlayer", rank _playerUnit] call fn_SavePlayerStat;
	[_playerId, "personalGarage",[_playerUnit] call A3A_fnc_getPersonalGarage] call fn_SavePlayerStat;
	_resourcesBackground = _playerUnit getVariable ["moneyX", 0];
	{
	_friendX = _x;
	if ((!isNull _friendX) and (!isPlayer _friendX) and (alive _friendX)) then
		{
		private _valueOfFriend = (server getVariable (typeOf _friendX));
		//If we don't get a number (which can happen if _friendX becomes null, for example) we lose the value of _resourcesBackground;
		if (typeName _valueOfFriend == typeName _resourcesBackground) then {
			_resourcesBackground = _resourcesBackground + (server getVariable (typeOf _friendX));
		};
		if (vehicle _friendX != _friendX) then
			{
			_veh = vehicle _friendX;
			_typeVehX = typeOf _veh;
			if (not(_veh in staticsToSave)) then
				{
					if ((_veh isKindOf "StaticWeapon") or (driver _veh == _friendX)) then
					{
						private _vehPrice = ([_typeVehX] call A3A_fnc_vehiclePrice);
						if (typeName _vehPrice == typeName _resourcesBackground) then {
							_resourcesBackground = _resourcesBackground + _vehPrice;
						};
						if (count attachedObjects _veh != 0) then {
							{
								private _attachmentPrice = ([typeOf _x] call A3A_fnc_vehiclePrice);
								if (typeName _vehPrice == typeName _resourcesBackground) then {
									_resourcesBackground = _resourcesBackground + _attachmentPrice;
								};
							} 
							forEach attachedObjects _veh;
						};
					};
				};
			};
		};
	} forEach (units group _playerUnit) - [_playerUnit]; //Can't have player unit in here, as it'll get nulled out if called on disconnect.
	[_playerId, "moneyX",_resourcesBackground] call fn_SavePlayerStat;
	};
	
savingClient = false;
true;