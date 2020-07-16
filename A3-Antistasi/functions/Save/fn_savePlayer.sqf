private _filename = "fn_savePlayer";
if (!isServer) exitWith {
	[1, "Miscalled server-only function", _filename] call A3A_fnc_log;
};

params ["_playerId", "_playerUnit", ["_globalSave", false]];

_playerUnit = _playerUnit getVariable ["owner", _playerUnit];		// save the real player, not remote controlled AIs

if (isNil "_playerId" || {_playerId == ""}) exitWith {
	[1, format ["Not saving player of unit %1 due to missing UID", _playerUnit], _filename] call A3A_fnc_log;
};

if (isNil "_playerUnit" || { isNull _playerUnit }) exitWith {
	[1, format ["Not saving player %1 due to missing unit", _playerId], _filename] call A3A_fnc_log;
};

if (isNil { _playerUnit getVariable "moneyX" }) exitWith {
	[1, format ["Not saving player %1 due to missing variables. What happened here?", _playerId], _filename] call A3A_fnc_log;
};

//Only save rebel players.
if (side group _playerUnit != teamPlayer && side group _playerUnit != sideUnknown) exitWith {
	[2, format ["Not saving player %1 due to them being on the wrong team.", _playerId], _filename] call A3A_fnc_log;
};

//Used to disable saving while the player initialises. Otherwise they might disconnect, and overwrite their own save prematurely.
if !(_playerUnit getVariable ['canSave', false]) exitWith {
	[2, format ["Not saving player %1 due to canSave being false.", _playerId], _filename] call A3A_fnc_log;
};

[2, format ["Saving player %1 on side %2", _playerId, side group _playerUnit], _filename] call A3A_fnc_log;

// Add player to saved list so that we can find the data for deletion
if !(_playerId in savedPlayers) then {
	savedPlayers pushBack _playerId;
	["savedPlayers", savedPlayers] call A3A_fnc_setStatVariable;
};

private _shouldStripLoadout = false;
if (!(alive _playerUnit) || (_playerUnit getVariable ["incapacitated", false])) then 
{
	_shouldStripLoadout = true;
	[2, format ["Stripping saved loadout of player %1 due to saving while dead or unconcious", _playerId], _filename] call A3A_fnc_log;
};

if (_shouldStripLoadout) then {
	[_playerId, "loadoutPlayer", (getUnitLoadout _playerUnit) call A3A_fnc_stripGearFromLoadout] call A3A_fnc_savePlayerStat;
} else {
	[_playerId, "loadoutPlayer", getUnitLoadout _playerUnit] call A3A_fnc_savePlayerStat;
};

if (isMultiplayer) then
{
	private _garage = [_playerUnit] call A3A_fnc_getPersonalGarage;
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

	[2, format ["Saved player %1: %2 rank, %3 money, %4 vehicles", _playerId, rank _playerUnit, _totalMoney, count _garage], _filename] call A3A_fnc_log;
};

if (!_globalSave) then { saveProfileNamespace };
true;
