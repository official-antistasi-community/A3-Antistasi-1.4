private ["_unit","_playerX"];

_unit = _this select 0;
_playerX = _this select 1;

[_unit,"remove"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];
//removeAllActions _unit;

_playerX globalChat "You are free. Come with us!";
if (captive _playerX) then
	{
	[_playerX,false] remoteExec ["setCaptive",0,_playerX];
	_playerX setCaptive false;
	};
sleep 3;
_unit globalChat "Thank you. I owe you my life!";
_unit enableAI "MOVE";
_unit enableAI "AUTOTARGET";
_unit enableAI "TARGET";
_unit enableAI "ANIM";
[_unit] join group _playerX;
[_unit] spawn A3A_fnc_FIAInit;
if (captive _unit) then {[_unit,false] remoteExec ["setCaptive",0,_unit]; _unit setCaptive false};