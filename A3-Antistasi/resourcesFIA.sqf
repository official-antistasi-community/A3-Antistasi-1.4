private ["_hrREBELSchange","_moneyREBELSchange","_hrREBELSfinal","_moneyREBELSfinal"];
waitUntil {!resourcesIsChanging};
resourcesIsChanging = true;
_hrREBELSchange = _this select 0;
_moneyREBELSchange = _this select 1;
if (isNil "_moneyREBELSchange") then {diag_log "Barbolani says you broke unit costs!"};
if ((isNil "_hrREBELSchange") or (isNil "_moneyREBELSchange")) exitWith {};
if ((floor _moneyREBELSchange == 0) and (floor _hrREBELSchange == 0)) exitWith {resourcesIsChanging = false};
_hrREBELSfinal = server getVariable "hr";
_moneyREBELSfinal = server getVariable "resourcesFIA";

_hrREBELSfinal = _hrREBELSfinal + _hrREBELSchange;
_moneyREBELSfinal = round (_moneyREBELSfinal + _moneyREBELSchange);

if (_hrREBELSfinal < 0) then {_hrREBELSfinal = 0};
if (_moneyREBELSfinal < 0) then {_moneyREBELSfinal = 0};

server setVariable ["hr",_hrREBELSfinal,true];
server setVariable ["resourcesFIA",_moneyREBELSfinal,true];
resourcesIsChanging = false;

_textX = "";
_hrSim = "";
if (_hrREBELSchange > 0) then {_hrSim = "+"};
_moneySim = "";
if (_moneyREBELSchange > 0) then {_moneySim = "+"};
if ((_hrREBELSchange != 0) and (_moneyREBELSchange != 0)) then
	{
	_textX = format ["<t size='0.6' color='#C1C0BB'>%5 Resources.<br/> <t size='0.5' color='#C1C0BB' shadow='2'><br/>HR: %3%1<br/>Money: %4%2 €",_hrREBELSchange,_moneyREBELSchange,_hrSim,_moneySim,nameTeamPlayer]
	}
else
	{
	if (_hrREBELSchange != 0) then {_textX = format ["<t size='0.6' color='#C1C0BB' shadow='2'>%4 Resources.<br/> <t size='0.5' color='#C1C0BB'><br/>HR: %3%1",_hrREBELSchange,_moneyREBELSchange,_hrSim,nameTeamPlayer]} else {if (_moneyREBELSchange != 5) then {_textX = format ["<t size='0.6' color='#C1C0BB' shadow='2'>%4 Resources.<br/> <t size='0.5' color='#C1C0BB'><br/>Money: %4%2 €",_hrREBELSchange,_moneyREBELSchange,_hrSim,_moneySim,nameTeamPlayer]}};
	};

if (_textX != "") then
	{
	[petros,"income",_textX] remoteExec ["A3A_fnc_commsMP",theBoss];
	//[] remoteExec ["A3A_fnc_statistics",[teamPlayer,civilian]];
	};