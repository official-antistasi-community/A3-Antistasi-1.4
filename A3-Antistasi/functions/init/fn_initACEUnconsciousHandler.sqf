scriptName "initACEUnconsciousHandler.sqf";
private _fileName = "initACEUnconsciousHandler.sqf";
[2,"initACEUnconsciousHandler started",_fileName] call A3A_fnc_log;

["ace_unconscious", {
	params["_unit", "_knockout"];
	private _realSide = side group _unit;		// setUnconscious in ACE often breaks this otherwise
	if (_knockout) exitWith {
//		[3, format ["Unit type %1, side %2, realside %3, captive %4 knocked out", typeof _unit, side _unit, _realSide, str (captive _unit)], "ace_unconscious handler"] call A3A_fnc_log;
		_unit setVariable ["incapacitated", true, true];	// for canFight tests
	};

//	[3, format ["Unit type %1, side %2, realside %3, captive %4 waking up", typeof _unit, side _unit, _realSide, str (captive _unit)], "ace_unconscious handler"] call A3A_fnc_log;
	_unit setVariable ["incapacitated", false, true];

	if (isPlayer _unit) exitWith {};					// don't force surrender with players
	if (_realSide != Occupants && _realSide != Invaders) exitWith {};
	if (unit getVariable ["surrendered", false]) exitWith {};		// don't surrender twice

	// surrender if we don't have a primary weapon
	if (primaryWeapon _unit == "") exitWith {
		_unit setVariable ["surrendered", true, true];
		[_unit] remoteExec ["A3A_fnc_surrenderAction", _unit];		// execute where unit is local
	};

	// find closest fighting unit within 50m
	private _nearestUnit = objNull;
	private _minDist = 999;
	{
		private _dist = _x distance _unit;
		if (side _x != civilian && _x != _unit && _dist < _minDist && {[_x] call A3A_fnc_canFight}) then {
			_minDist = _dist;
			_nearestUnit = _x;
		};
	} forEach (_unit nearEntities ["Man", 50]);

//	[3, format ["Nearest unit side = %1", str (side _nearestUnit)], "ace_unconscious handler"] call A3A_fnc_log;

	if (side _nearestUnit == teamPlayer) then {
		_unit setVariable ["surrendered", true, true];
		[_unit] remoteExec ["A3A_fnc_surrenderAction", _unit];
	};

}] call CBA_fnc_addEventHandler;


[2,"initACEUnconsciousHandler completed",_fileName] call A3A_fnc_log;