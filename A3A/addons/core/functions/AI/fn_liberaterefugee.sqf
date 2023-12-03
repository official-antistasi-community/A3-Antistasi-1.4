params ["_unit", "_playerX"];

if (captive _playerX) then { _playerX setCaptive false };

_playerX globalChat [localize "STR_A3A_fn_libPOW"];
sleep 3;

[_unit] join group _playerX;
private _timeout = 10;
waituntil {sleep 1; _timeout = _timeout-1; _timeout < 0 or (local _unit and group _unit == group _playerX)};
if (_timeout < 0) exitWith {};

[_unit,"remove"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];

private _responseNum = str[(random 3) + 1];
_response = localize {"STR_A3A_fn_ai_captureX_libresponse" + _responseNum};
_unit globalChat "Thank you. I owe you my life!";
_unit enableAI "MOVE";
_unit enableAI "AUTOTARGET";
_unit enableAI "TARGET";
_unit enableAI "ANIM";
[_unit] spawn A3A_fnc_FIAInit;
if (captive _unit) then { _unit setCaptive false };
