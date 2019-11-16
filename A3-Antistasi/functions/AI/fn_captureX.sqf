_unit = _this select 0;
_playerX = _this select 1;

[_unit,"remove"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];

if (!alive _unit) exitWith {};
_sideX = side (group _unit);
_chance = 80;
if ((_sideX == Occupants) and (faction _unit != factionFIA)) then
	{
	_playerX globalChat "Go back to your base and tell your comrades we are not enemies. We just want to live in peace";
	}
else
	{
	_playerX globalChat "Why not join us and make profitable business?";
	_chance = if (faction _unit != factionFIA) then {100 - prestigeCSAT} else {100 - prestigeNATO};
	};

_chance = _chance + 20;

sleep 5;
if (round random 100 < _chance) then
	{
	if (isMultiplayer) then {[_unit,true] remoteExec ["enableSimulationGlobal",2]} else {_unit enableSimulation true};
	if ((_sideX == Occupants) and (faction _unit != factionFIA)) then
		{
		_unit globalChat "Okay, thank you. I owe you my life";
		}
	else
		{
		if (faction _unit != factionFIA) then {_unit globalChat "Allah bless you!"} else {_unit globalChat "Thank you. I swear you won't regret it!"};
		};
	_unit enableAI "ANIM";
	_unit enableAI "MOVE";
	_unit stop false;
	[_unit,""] remoteExec ["switchMove"];
	_unit doMove (getMarkerPos respawnOccupants);
	if (_unit getVariable ["spawner",false]) then {_unit setVariable ["spawner",nil,true]};
	sleep 100;
	if (alive _unit) then
		{
		if ((_sideX == Occupants) and (faction _unit != factionFIA)) then
			{
			[-0.5,0] remoteExec ["A3A_fnc_prestige",2];
			}
		else
			{
			[1,0] remoteExec ["A3A_fnc_resourcesFIA",2];
			[1,1] remoteExec ["A3A_fnc_prestige",2];
			};
		};
	deleteVehicle _unit;
	}
else
	{
	_unit globalChat "Screw you!";
	};
