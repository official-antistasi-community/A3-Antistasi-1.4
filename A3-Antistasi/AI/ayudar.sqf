private ["_unit","_medico","_timeOut","_curado","_isPlayer","_smoked","_enemy","_cobertura","_dummyGrp","_dummy"];
_unit = _this select 0;///no usar canfight porque algunas tienen setcaptive true y te va a liar todo
if !(isNull (_unit getVariable ["ayudado",objNull])) exitWith {};
_medico = _this select 1;
if (isPlayer _medico) exitWith {};
if (_medico getVariable ["ayudando",false]) exitWith {};
_unit setVariable ["ayudado",_medico];
_medico setVariable ["ayudando",true];
_medico setVariable ["maniobrando",true];
_curado = false;
_isPlayer = if ({isPlayer _x} count units group _unit >0) then {true} else {false};
_smoked = false;

if (_medico != _unit) then
	{
	if !(_unit getVariable ["INCAPACITATED",false]) then
		{
		if (_isPlayer) then {_unit groupChat format ["Comrades, this is %1. I'm hurt",name _unit]};
		playSound3D [(selectRandom injuredSounds),_unit,false, getPosASL _unit, 1, 1, 50];
		};
	if (_isPlayer) then
		{
		[_medico,_unit] spawn
			{
			sleep 2;
			private ["_medico","_unit"];
			_medico = _this select 0;
			_unit = _this select 1;
			_medico groupChat format ["Wait a minute comrade %1, I will patch you up",name _unit]
			};
		};
	if (hasInterface) then {if (player == _unit) then {hint format ["%1 is on the way to help you",name _medico]}};
	_enemy = _medico findNearestEnemy _unit;
	_smoked = [_medico,_unit,_enemy] call A3A_fnc_cubrirConHumo;
	_medico stop false;
	_medico forceSpeed -1;
	_timeOut = time + 60;
	sleep 5;
	_medico doMove getPosATL _unit;
	while {true} do
		{
		if (!([_medico] call A3A_fnc_canFight) or (!alive _unit) or (_medico distance _unit <= 3) or (_timeOut < time) or (_unit != vehicle _unit) or (_medico != vehicle _medico) or (_medico != _unit getVariable ["ayudado",objNull]) or !(isNull attachedTo _unit) or (_medico getVariable ["cancelRevive",false])) exitWith {};
		sleep 1;
		};
	if ((isPlayer _unit) and !(isMultiplayer))  then
		{
		if (([_medico] call A3A_fnc_canFight) and (_medico distance _unit > 3) and (_medico == _unit getVariable ["ayudado",objNull]) and !(_unit getVariable ["llevado",false]) and (allUnits findIf {((side _x == malos) or (side _x == muyMalos)) and (_x distance2D _unit < 50)} == -1)) then {_medico setPos position _unit};
		};
	if ((_unit distance _medico <= 3) and (alive _unit) and ([_medico] call A3A_fnc_canFight) and (_medico == vehicle _medico) and (_medico == _unit getVariable ["ayudado",objNull]) and (isNull attachedTo _unit) and !(_medico getVariable ["cancelRevive",false])) then
		{
		if ((_unit getVariable ["INCAPACITATED",false]) and (!isNull _enemy) and (_timeOut >= time) and (_medico != _unit)) then
			{
			_cobertura = [_unit,_enemy] call A3A_fnc_cobertura;
			{if (([_x] call A3A_fnc_canFight) and (_x distance _medico < 50) and !(_x getVariable ["ayudando",false]) and (!isPlayer _x)) then {[_x,_enemy] call A3A_fnc_fuegoSupresor}} forEach units (group _medico);
			if (count _cobertura == 3) then
				{
				//if (_isPlayer) then {_unit setVariable ["llevado",true,true]};
				_medico setUnitPos "MIDDLE";
				_medico playAction "grabDrag";
				sleep 0.1;
				_timeOut = time + 5;
				waitUntil {sleep 0.3; ((animationState _medico) == "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2") or ((animationState _medico) == "AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_2") or !([_medico] call A3A_fnc_canFight) or (_timeOut < time)};
				if ([_medico] call A3A_fnc_canFight) then
					{
					[_unit,"AinjPpneMrunSnonWnonDb"] remoteExec ["switchMove"];
					_medico disableAI "ANIM";
					//_medico playMoveNow "AcinPknlMstpSrasWrflDnon";
					_medico stop false;
					_dummyGrp = createGroup civilian;
					_dummy = _dummyGrp createUnit ["C_man_polo_1_F", [0,0,20], [], 0, "FORM"];
					_dummy setUnitPos "MIDDLE";
					_dummy forceWalk true;
					_dummy setSkill 0;
					if (isMultiplayer) then {[_dummy,true] remoteExec ["hideObjectGlobal",2]} else {_dummy hideObject true};
					_dummy allowdammage false;
					_dummy setBehaviour "CARELESS";
					_dummy disableAI "FSM";
					_dummy disableAI "SUPPRESSION";
				    _dummy forceSpeed 0.2;
				    _dummy setPosATL (getPosATL _medico);
					_medico attachTo [_dummy, [0, -0.2, 0]];
					_medico setDir 180;
					//_unit attachTo [_dummy, [0, 1.1, 0.092]];
					_unit attachTo [_dummy, [0,-1.1, 0.092]];
					_unit setDir 0;
					_dummy doMove _cobertura;
					[_medico] spawn {sleep 4.5; (_this select 0) playMove "AcinPknlMwlkSrasWrflDb"};
					_timeOut = time + 30;
					while {true} do
						{
						sleep 0.2;
						if (!([_medico] call A3A_fnc_canFight) or (!alive _unit) or (_medico distance _cobertura <= 2) or (_timeOut < time) or (_medico != vehicle _medico) or (_medico getVariable ["cancelRevive",false])) exitWith {};
						if (_unit distance _dummy > 3) then
							{
							detach _unit;
							_unit setPos (position _dummy);
							_unit attachTo [_dummy, [0,-1.1, 0.092]];
							_unit setDir 0;
							};
						if (_medico distance _dummy > 3) then
							{
							detach _medico;
							_medico setPos (position _dummy);
							_medico attachTo [_dummy, [0, -0.2, 0]];
							_medico setDir 180;
							};
						};
					detach _unit;
					detach _medico;
					detach _dummy;
					deleteVehicle _dummy;
					deleteGroup _dummyGrp;
					_medico enableAI "ANIM";
					};
				if ((alive _unit) and ([_medico] call A3A_fnc_canFight) and (_medico == vehicle _medico) and !(_medico getVariable ["cancelRevive",false])) then
					{
					_medico playMove "amovpknlmstpsraswrfldnon";
					_medico stop true;
					_unit stop true;
					sleep 3;
					_curado = [_unit,_medico] call A3A_fnc_actionRevive;
					_unit playMoveNow "";
					if (_curado) then
						{
						if (_medico != _unit) then {if (_isPlayer) then {_medico groupChat format ["You are ready %1",name _unit]}};
						};
					sleep 5;
					_medico stop false;
					_unit stop false;
					_unit dofollow leader group _unit;
					_medico doFollow leader group _unit;
					}
				else
					{
					//if ([_medico] call A3A_fnc_canFight) then {_medico switchMove ""};
					[_medico,""] remoteExec ["switchMove"];
					if ((alive _unit) and (_unit getVariable ["INCAPACITATED",false])) then
						{
						_unit playMoveNow "";
						_unit setUnconscious false;
						_timeOut = time + 3;
						waitUntil {sleep 0.3; (lifeState _unit != "INCAPACITATED") or (_timeOut < time)};
						_unit setUnconscious true;
						};
					};
				//if (_isPlayer) then {_unit setVariable ["llevado",false,true]};
				}
			else
				{
				_medico stop true;
				//if (!_smoked) then {[_medico,_unit] call A3A_fnc_cubrirConHumo};
				_unit stop true;
				_curado = [_unit,_medico] call A3A_fnc_actionRevive;
				if (_curado) then
					{
					if (_medico != _unit) then {if (_isPlayer) then {_medico groupChat format ["You are ready %1",name _unit]}};
					sleep 10;
					};
				_medico stop false;
				_unit stop false;
				_unit dofollow leader group _unit;
				_medico doFollow leader group _unit;
				};
			if ((animationState _medico == "amovpknlmstpsraswrfldnon") or (animationState _medico == "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2") or (animationState _medico == "AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_2")) then {_medico switchMove ""};
			}
		else
			{
			_medico stop true;
			//if (!_smoked) then {[_medico,_unit] call A3A_fnc_cubrirConHumo};
			_unit stop true;
			if (_unit getVariable ["INCAPACITATED",false]) then {_curado = [_unit,_medico] call A3A_fnc_actionRevive} else {_medico action ["HealSoldier",_unit]; _curado = true};
			if (_curado) then
				{
				if (_medico != _unit) then {if (_isPlayer) then {_medico groupChat format ["You are ready %1",name _unit]}};
				sleep 10;
				};
			_medico stop false;
			_unit stop false;
			_unit dofollow leader group _unit;
			_medico doFollow leader group _unit;
			};
		};
	if (_medico == _unit getVariable ["ayudado",objNull]) then {_unit setVariable ["ayudado",objNull]};
	_medico setUnitPos "AUTO";
	if (_medico getVariable ["cancelRevive",false]) then
		{
		_medico stop false;
		_medico doFollow leader group _unit;
		sleep 15;
		};
	}
else
	{
	[_medico,_medico] call A3A_fnc_cubrirConHumo;
	if ([_medico] call A3A_fnc_canFight) then
		{
		_medico action ["HealSoldierSelf",_medico];
		sleep 10;
		};
	_unit setVariable ["ayudado",objNull];
	_curado = true;
	};
if (_medico getVariable ["cancelRevive",false]) then
	{
	_medico setVariable ["cancelRevive",false];
	sleep 15;
	};
_medico setVariable ["ayudando",false];
_medico setVariable ["maniobrando",false];
_curado