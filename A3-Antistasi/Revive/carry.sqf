private ["_llevador","_llevado","_timeOut","_action"];
_llevado = _this select 0;
_llevador = _this select 1;

//if (_llevado getVariable ["llevado",false]) exitWith {hint "This soldier is being carried and you cannot help him"};
if (!alive _llevado) exitWith {hint format ["%1 is dead",name _llevado]};
if !(_llevado getVariable ["INCAPACITATED",false]) exitWith {hint format ["%1 no longer needs your help",name _llevado]};
if !(isNull attachedTo _llevado) exitWith {hint format ["%1 is being carried or transported and you cannot carry him",name _llevado]};
if (captive _llevador) then {[_llevador,false] remoteExec ["setCaptive",0,_llevador]; _llevador setCaptive false};
_llevador playMoveNow "AcinPknlMstpSrasWrflDnon";
[_llevado,"AinjPpneMrunSnonWnonDb"] remoteExec ["switchMove"];
//_llevado setVariable ["llevado",true,true];
_llevado setVariable ["ayudado",_llevador,true];
[_llevado,"remove"] remoteExec ["A3A_fnc_flagaction",0,_llevado];
_llevado attachTo [_llevador, [0,1.1,0.092]];
_llevado setDir 180;
_timeOut = time + 60;
_action = _llevador addAction [format ["Release %1",name _llevado], {{detach _x} forEach (attachedObjects player)},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];

waitUntil {sleep 0.5; (!alive _llevado) or !([_llevador] call A3A_fnc_canFight) or !(_llevado getVariable ["INCAPACITATED",false]) or ({!isNull _x} count attachedObjects _llevador == 0) or (time > _timeOut) or (vehicle _llevador != _llevador)};

_llevador removeAction _action;
if (count attachedObjects _llevador != 0) then {detach _llevado};
_llevador playMove "amovpknlmstpsraswrfldnon";
sleep 2;
_llevado playMoveNow "";
if (_llevado getVariable ["INCAPACITATED",false]) then
	{
	[_llevado,false] remoteExec ["setUnconscious",_llevado];
	waitUntil {sleep 0.1; lifeState _llevado != "INCAPACITATED"};
	[_llevado,true] remoteExec ["setUnconscious",_llevado];
	};
//_llevado setVariable ["llevado",false,true];
[_llevado,"heal1"] remoteExec ["A3A_fnc_flagaction",0,_llevado];
sleep 5;
_llevado setVariable ["ayudado",objNull,true];
