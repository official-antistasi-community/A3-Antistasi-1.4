private ["_hrGain","_rebelMoneyGain","_hrCurrent","_rebelMoneyCurrent"];
waitUntil {!resourcesIsChanging};
resourcesIsChanging = true;
_hrGain = _this select 0;
_rebelMoneyGain = _this select 1;
if (isNil "_rebelMoneyGain") then {diag_log "Tienes algún costs sin definit en las tablas de Rebels"};
if ((isNil "_hrGain") or (isNil "_rebelMoneyGain")) exitWith {};
if ((floor _rebelMoneyGain == 0) and (floor _hrGain == 0)) exitWith {resourcesIsChanging = false};
_hrCurrent = server getVariable "hr";
_rebelMoneyCurrent = server getVariable "rebelMoney";

_hrCurrent = _hrCurrent + _hrGain;
_rebelMoneyCurrent = round (_rebelMoneyCurrent + _rebelMoneyGain);

if (_hrCurrent < 0) then {_hrCurrent = 0};
if (_rebelMoneyCurrent < 0) then {_rebelMoneyCurrent = 0};

server setVariable ["hr",_hrCurrent,true];
server setVariable ["rebelMoney",_rebelMoneyCurrent,true];
resourcesIsChanging = false;

_textX = "";
_hrChange = "";
if (_hrGain > 0) then {_hrChange = "+"};
_rebelMoneyChange = "";
if (_rebelMoneyGain > 0) then {_rebelMoneyChange = "+"};
if ((_hrGain != 0) and (_rebelMoneyGain != 0)) then
	{
	_textX = format ["<t size='0.6' color='#C1C0BB'>%5 Resources.<br/> <t size='0.5' color='#C1C0BB'><br/>HR: %3%1<br/>Money: %4%2 €",_hrGain,_rebelMoneyGain,_hrChange,_rebelMoneyChange,rebelFactionName]
	}
else
	{
	if (_hrGain != 0) then {_textX = format ["<t size='0.6' color='#C1C0BB'>%4 Resources.<br/> <t size='0.5' color='#C1C0BB'><br/>HR: %3%1",_hrGain,_rebelMoneyGain,_hrChange,rebelFactionName]} else {if (_rebelMoneyGain != 5) then {_textX = format ["<t size='0.6' color='#C1C0BB'>%4 Resources.<br/> <t size='0.5' color='#C1C0BB'><br/>Money: %4%2 €",_hrGain,_rebelMoneyGain,_hrChange,_rebelMoneyChange,rebelFactionName]}};
	};

if (_textX != "") then
	{
	[petros,"income",_textX] remoteExec ["A3A_fnc_commsMP",theBoss];
	//[] remoteExec ["A3A_fnc_statistics",[rebelSide,civilian]];
	};