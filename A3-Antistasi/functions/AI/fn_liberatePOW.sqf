_unit = _this select 0;
_playerX = _this select 1;

[_unit,"remove"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];

//removeAllActions _unit;

if (captive _playerX) then
	{
	[_playerX,false] remoteExec ["setCaptive",0,_playerX];
	_playerX setCaptive false;
	};

_playerX globalChat "You are free. Come with us!";
_unit setDir (getDir _playerX);
_playerX playMove "MountSide";
sleep 3;
_unit sideChat "Thank you. I owe you my life!";

_unit enableAI "MOVE";
_unit enableAI "AUTOTARGET";
_unit enableAI "TARGET";
_unit enableAI "ANIM";
sleep 5;
_playerX playMove "";
//_unit playMove "SitStandUp";
[_unit,false] remoteExec ["setCaptive",0,_unit];
_unit setCaptive false;
[_unit] join group _playerX;
[_unit] spawn A3A_fnc_FIAInit;
