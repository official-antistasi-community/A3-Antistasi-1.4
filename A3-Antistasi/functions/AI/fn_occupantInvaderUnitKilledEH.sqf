private ["_victim","_killer","_costs","_enemy","_victimGroup"];
_victim = _this select 0;
_killer = _this select 1;
if (_victim getVariable ["spawner",false]) then
	{
	_victim setVariable ["spawner",nil,true]
	};

[_victim] spawn A3A_fnc_postmortem;
_victimGroup = group _victim;
_victimSide = side (group _victim);
if (hasACE) then
	{
	if ((isNull _killer) || (_killer == _victim)) then
		{
		_killer = _victim getVariable ["ace_medical_lastDamageSource", _killer];
		};
	};
//if (_killer isEqualType "") then {diag_log format ["Antistasi error in A3A_fnc_occupantInvaderUnitKilledEH, params: %1",_this]};
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
		};
	//Killing someone does not make you a better soldier
	/*
	else
		{
		_skill = skill _killer;
		[_killer,_skill + 0.05] remoteExec ["setSkill",_killer];
		};
	*/
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
		if (_victimSide == Occupants) then
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
		if (_victimSide == Occupants) then
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
	if (_victimSide == Occupants) then
		{
		[-0.25,0,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
		}
	else
		{
		[0.25,0,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
		};
	};
_victimLocation = _victim getVariable "markerX";
_victimAssignedToGarrison = true;
if (isNil "_victimLocation") then {_victimLocation = _victim getVariable ["originX",""]; _victimAssignedToGarrison = false};
if (_victimLocation != "") then
	{
	if (sidesX getVariable [_victimLocation,sideUnknown] == _victimSide) then
		{
		[typeOf _victim,_victimSide,_victimLocation,-1] remoteExec ["A3A_fnc_garrisonUpdate",2];
		if (_victimAssignedToGarrison) then {[_victimLocation,_victimSide] remoteExec ["A3A_fnc_zoneCheck",2]};
		};
	};
[_victimGroup,_killer] spawn A3A_fnc_AIreactOnKill;

