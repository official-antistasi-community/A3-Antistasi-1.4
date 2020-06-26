params ["_playerId", "_playerUnit", ["_globalSave", false]];

if (isMultiplayer && !isServer) exitwith {
	[_playerId, _playerUnit, _globalSave] remoteExec ["A3A_fnc_savePlayer", 2];
};

_playerUnit = _playerUnit getVariable ["owner", _playerUnit];		// save the real player, not remote controlled AIs

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

// Add player to saved list so that we can find the data for deletion
if !(_playerId in savedPlayers) then {
	savedPlayers pushBack _playerId;
	["savedPlayers", savedPlayers] call A3A_fnc_setStatVariable;
};

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
	[_playerId, "loadoutPlayer", (getUnitLoadout _playerUnit) call A3A_fnc_stripGearFromLoadout] call A3A_fnc_savePlayerStat;
} else {
	[_playerId, "loadoutPlayer", getUnitLoadout _playerUnit] call A3A_fnc_savePlayerStat;
};

if (isMultiplayer) then
{
	[_playerId, "scorePlayer", _playerUnit getVariable "score"] call A3A_fnc_savePlayerStat;
	[_playerId, "rankPlayer", rank _playerUnit] call A3A_fnc_savePlayerStat;
	[_playerId, "personalGarage", [_playerUnit] call A3A_fnc_getPersonalGarage] call A3A_fnc_savePlayerStat;

	_totalMoney = _playerUnit getVariable ["moneyX", 0];
	if (_shouldStripLoadout) then { _totalMoney = round (_totalMoney * 0.85) };

	if (_globalSave) then 
	{
		// Add value of live AIs owned by player
		// plus cost of vehicles driven by player-owned units, including self
		// plus cost of unsaved static weapons aimed by player-owned units, including self
		{
			if (alive _x && (_x getVariable ["owner", objNull] == _playerUnit)) then
			{
				if (_x != _playerUnit) then {
					private _unitPrice = server getVariable [typeOf _x, 0];
					_totalMoney = _totalMoney + _unitPrice;
				};
				private _veh = vehicle _x;
				if (_veh == _x || {_veh in staticsToSave}) exitWith {};
				if (_x == driver _veh || {_x == gunner _veh && _veh isKindOf "StaticWeapon"}) then {
					private _vehPrice = [typeof _veh] call A3A_fnc_vehiclePrice;
					_totalMoney = _totalMoney + _vehPrice;
				};
			};

		} forEach (units group _playerUnit);
	};

	[_playerId, "moneyX", _totalMoney] call A3A_fnc_savePlayerStat;
};

if (!_globalSave) then { saveProfileNamespace };
savingClient = false;
true;
