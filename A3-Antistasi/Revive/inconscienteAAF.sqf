private ["_unit","_grupo","_grupos","_isLeader","_dummyGroup","_bleedOut","_suicide","_saveVolume","_ayuda","_ayudado","_texto","_isPlayer","_camTarget","_saveVolumeVoice"];
_unit = _this select 0;
_injurer = _this select 1;
//if (_unit getVariable "inconsciente") exitWith {};
//if (damage _unit < 0.9) exitWith {};
//if (!local _unit) exitWith {};
//_unit setVariable ["inconsciente",true,true];
_bleedOut = if (surfaceIsWater (position _unit)) then {time + 60} else {time + 300};//300
_jugadores = false;
_lado = side (group _unit);
if ((side _injurer == buenos) and (_lado == malos)) then
	{
	_marcador = _unit getVariable ["marcador",""];
	if (_marcador != "") then
		{
		if (!([_marcador] call BIS_fnc_taskExists) and (lados getVariable [_marcador,sideUnknown] == malos)) then {[_marcador,side _injurer,_lado] remoteExec ["A3A_fnc_underAttack",2]};
		};
	};

if ({if ((isPlayer _x) and (_x distance _unit < distanciaSPWN2)) exitWith {1}} count allUnits != 0) then
	{
	_jugadores = true;
	[_unit,"heal"] remoteExec ["A3A_fnc_flagaction",0,_unit];
	[_unit,true] remoteExec ["setCaptive"];
	_unit setCaptive true;
	//_unit setVariable ["lado",_lado,true];
	};

_unit setFatigue 1;
_grupo = group _unit;
[_grupo,_injurer] spawn A3A_fnc_AIreactOnKill;

while {(time < _bleedOut) and (_unit getVariable ["INCAPACITATED",false]) and (alive _unit)} do
	{
	if (random 10 < 1) then {playSound3D [(injuredSounds call BIS_fnc_selectRandom),_unit,false, getPosASL _unit, 1, 1, 50];};
	_ayudado = _unit getVariable ["ayudado",objNull];
	if (isNull _ayudado) then {[_unit] call A3A_fnc_pedirAyuda;};
	sleep 3;
	};

_unit stop false;
if (_jugadores) then
	{
	[_unit,"remove"] remoteExec ["A3A_fnc_flagaction",0,_unit];
	};


if (time >= _bleedOut) exitWith
	{
	if (side _injurer == buenos) then
		{
		if (isPlayer _injurer) then
			{
			[1,_injurer] call A3A_fnc_playerScoreAdd;
			}
		else
			{
			_skill = skill _injurer;
			[_injurer,_skill + 0.05] remoteExec ["setSkill",_injurer];
			};
		[-1,1,getPos _unit] remoteExec ["A3A_fnc_citySupportChange",2];
		switch (_lado) do
			{
			case malos:
				{
				[0.1,0] remoteExec ["A3A_fnc_prestige",2];
				};
			case muyMalos:
				{
				[0,0.25] remoteExec ["A3A_fnc_prestige",2];
				};
			};
		};
	_unit setDamage 1;
	};

if (alive _unit) then
	{
	_unit setUnconscious false;
	_unit playMoveNow "AmovPpneMstpSnonWnonDnon_healed";
	_unit setVariable ["overallDamage",damage _unit];
	//debug
	//diag_log format ["Antistasi: Unidad %3 revivida está rendida:%1, está cautiva: %2",_unit getVariable "surrendered",captive _unit,_unit];
	if !(_unit getVariable ["surrendered",false]) then
		{
		if (captive _unit) then
			{
			[_unit,false] remoteExec ["setCaptive",0,_unit];
			_unit setCaptive false;
			};
		}
	else
		{
		[_unit] spawn A3A_fnc_surrenderAction;
		};
	/*
	if (captive _unit) then
		{
		if !(_unit getVariable ["surrendered",false]) then
			{
			[_unit,false] remoteExec ["setCaptive",0,_unit];
			_unit setCaptive false;
			diag_log "Y no se rinde y pierde setCaptive true";
			//_unit disableAI "ANIM";
			//sleep 120 + (random 120);
			//if ([_unit] call A3A_fnc_canFight) then {_unit enableAI "ANIM"};
			}
		else
			{
			[_unit] spawn A3A_fnc_surrenderAction;
			diag_log "Y se rinde";
			};
		};
	*/};
