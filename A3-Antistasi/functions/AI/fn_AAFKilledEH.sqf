private ["_victim","_killer","_costs","_enemy","_groupX"];
_victim = _this select 0;
_killer = _this select 1;
if (_victim getVariable ["spawner",false]) then
	{
	_victim setVariable ["spawner",nil,true]
	};

[_victim] spawn A3A_fnc_postmortem;
_groupX = group _victim;
_sideX = side (group _victim);
if (hasACE) then
	{
	if ((isNull _killer) || (_killer == _victim)) then
		{
		_killer = _victim getVariable ["ace_medical_lastDamageSource", _killer];
		};
	};
//if (_killer isEqualType "") then {diag_log format ["Antistasi error in A3A_fnc_AAFKilledEH, params: %1",_this]};
if (side (group _killer) == teamPlayer) then
	{
	if (isPlayer _killer) then
		{
		[1,_killer] call A3A_fnc_playerScoreAdd;
		if (captive _killer) then
			{
			if (_killer distance _victim < distanceSPWN) then
				{
				[_killer,false] remoteExec ["setCaptive",0,_killer];
				_killer setCaptive false;
				};
			};
		_killer addRating 1000;
		}
	else
		{
		_skill = skill _killer;
		[_killer,_skill + 0.05] remoteExec ["setSkill",_killer];
		};
	if (vehicle _killer isKindOf "StaticMortar") then
		{
		if (isMultiplayer) then
			{
			{
			if ((_x distance _victim < 300) and (captive _x)) then {[_x,false] remoteExec ["setCaptive",0,_x]; _x setCaptive false};
			} forEach playableUnits;
			}
		else
			{
			if ((player distance _victim < 300) and (captive player)) then {player setCaptive false};
			};
		};
	if (count weapons _victim < 1 && !(_victim getVariable ["isAnimal", false])) then
		{
		if (_sideX == Occupants) then
			{
			[0,-2,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
			[1,0] remoteExec ["A3A_fnc_prestige",2];
			}
		else
			{
			[0,1] remoteExec ["A3A_fnc_prestige",2];
			};
		}
	else
		{
		[-1,1,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
		if (_sideX == Occupants) then
			{
			[0.1,0] remoteExec ["A3A_fnc_prestige",2];
			}
		else
			{
			[0,0.25] remoteExec ["A3A_fnc_prestige",2];
			};
		};
	}
else
	{
	if (_sideX == Occupants) then
		{
		[-0.25,0,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
		}
	else
		{
		[0.25,0,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
		};
	};
_markerX = _victim getVariable "markerX";
_garrisoned = true;
if (isNil "_markerX") then {_markerX = _victim getVariable ["originX",""]; _garrisoned = false};
if (_markerX != "") then
	{
	if (sidesX getVariable [_markerX,sideUnknown] == _sideX) then
		{
		[typeOf _victim,_sideX,_markerX,-1] remoteExec ["A3A_fnc_garrisonUpdate",2];
		if (_garrisoned) then {[_markerX,_sideX] remoteExec ["A3A_fnc_zoneCheck",2]};
		};
	};
[_groupX,_killer] spawn A3A_fnc_AIreactOnKill;

