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

if (isNil "_playerId" || {_playerId == ""}) exitWith {
	diag_log format ["[Antistasi] Not saving player of unit %1 due to missing playerID", _playerUnit];
};

if (isNil "_playerUnit" || { isNull _playerUnit }) exitWith {
	diag_log format ["[Antistasi] Not saving player %1 due to missing unit", _playerId];
};

//Only save rebel players.
if (side group _playerUnit != teamPlayer && side group _playerUnit != sideUnknown) exitWith {
	diag_log format ["[Antistasi] Not saving player %1 due to them being on the wrong team.", _playerId];
};

//Used to disable saving while the player initialises. Otherwise they might disconnect, and overwrite their own save prematurely.
//Default to being able to save - better to save when we shouldn't, than not be able to save at all. Safer, in case there's any bugs.
if !(_playerUnit getVariable ['canSave', true]) exitWith {
	diag_log format ["[Antistasi] Not saving player %1 due to canSave being false.", _playerId];
};

savingClient = true;
diag_log format ["[Antistasi] Saving player %1 on side %2", _playerId, side group _playerUnit];

private _shouldStripLoadout = false;
if (hasACEMedical && {_playerUnit getVariable ["ACE_isUnconscious", false]}) then 
{
	_shouldStripLoadout = true;
	diag_log format ["[Antistasi] Stripping saved loadout of player %1 due to saving while being ACE unconscious", _playerId];
};

if !(lifeState _playerUnit == "HEALTHY" || lifeState _playerUnit == "INJURED") then {
	_shouldStripLoadout = true;
	diag_log format ["[Antistasi] Stripping saved loadout loadout of player %1 due to saving while not being healthy or injured", _playerId];
};

if (_shouldStripLoadout) then {
	[_playerId, "loadoutPlayer", (getUnitLoadout _playerUnit) call A3A_fnc_stripGearFromLoadout] call fn_SavePlayerStat;
} else {
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
		if (_valueOfFriend isEqualType _resourcesBackground) then {
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
						if (_vehPrice isEqualType _resourcesBackground) then {
							_resourcesBackground = _resourcesBackground + _vehPrice;
						};
						if (count attachedObjects _veh != 0) then {
							{
								private _attachmentPrice = ([typeOf _x] call A3A_fnc_vehiclePrice);
								if (_vehPrice isEqualType _resourcesBackground) then {
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