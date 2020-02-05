_unit = _this select 0;
_playerX = _this select 1;

//[_unit,"remove"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];

// Remove interrogate action but leave release/recruit actions
{
	private _actparams = _unit actionParams _x;
	if (_actparams select 0 == "Interrogate") then { _unit removeAction _x };
} forEach (actionIDs _unit);

if (!alive _unit) exitWith {};
if (_unit getVariable ["interrogated", false]) exitWith {};
_unit setVariable ["interrogated", true, true];

_playerX globalChat "You imperialist! Tell me what you know!";
_chance = 0;
_sideX = side (group _unit);
if (_sideX == Occupants) then
	{
	_chance = 100 - prestigeNATO;
	}
else
	{
	_chance = 100 - (prestigeCSAT);
	};

_chance = _chance + 20;

if (_chance < 20) then {_chance = 20};

sleep 5;

if (round random 100 < _chance) then
	{
	_unit globalChat "Okay, I'll tell you everything I know";
	[_unit] call A3A_fnc_intelFound;
	}
else
	{
	_unit globalChat "Screw you!";
	};

