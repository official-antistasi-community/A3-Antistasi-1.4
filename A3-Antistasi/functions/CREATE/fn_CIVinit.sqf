private _unit = _this select 0;

_unit setSkill 0;
_unit forceAddUniform (selectRandom allCivilianUniforms);
_unit disableAI "TARGET";
_unit disableAI "AUTOTARGET";
//Stops civilians from shouting out commands.
[_unit,"NoVoice"] remoteExec ["setSpeaker",0,_unit];

_unit addEventHandler ["HandleDamage",{
	private _unit = _this select 0;
	private _damage = _this select 2;
	private _injurer = _this select 3;
	private _projectile = _this select 4;
	if (!isNil "_injurer" && isPlayer _injurer) then {
		_unit setVariable ["injuredByPlayer",_injurer,true];
		_unit setVariable ["lastInjuredByPlayer",time,true];
	};
	if (_projectile == "") then {
		if ((_damage > 0.95) and (!isPlayer _injurer)) then {_damage = 0.9};
	};
	_damage
}];

_unit addEventHandler ["killed",{
	private _victim = _this select 0;
	private _killer = _this select 1;
	if (time - (_victim getVariable ["lastInjuredByPlayer",0]) < 120) then {
		_killer = _victim getVariable ["injuredByPlayer",_killer];
	};
	if (isNull _killer) then	{
		_killer = _victim;
	};
	if (_victim == _killer) then {
		[-1,-1,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
	} else {
		if (isPlayer _killer) then {
			if (typeOf _victim == "C_man_w_worker_F") then {_killer addRating 1000};
			[-10,_killer] call A3A_fnc_playerScoreAdd;
		};
		private _multiplier = 1;
		if (typeOf _victim == "C_journalist_F") then {_multiplier = 10};
		//Must be group, in case they're undercover.
		if (side group _killer == teamPlayer) then {
			[1*_multiplier,0] remoteExec ["A3A_fnc_prestige",2];
			[1,0,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
		} else {
			if (side group _killer == Occupants) then {
				[0,1,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
			} else {
				if (side group _killer == Invaders) then {
					[-1,1,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
				};
			};
		};
	};
}];
