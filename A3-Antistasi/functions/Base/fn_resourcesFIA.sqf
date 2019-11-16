private ["_hr","_resourcesFIA","_hrT","_resourcesFIAT"];
waitUntil {!resourcesIsChanging};
resourcesIsChanging = true;
_hr = _this select 0;
_resourcesFIA = _this select 1;
if (isNil "_resourcesFIA") then {diag_log "Tienes algún costs sin definit en las tablas de FIA"};
if ((isNil "_hr") or (isNil "_resourcesFIA")) exitWith {};
if ((floor _resourcesFIA == 0) and (floor _hr == 0)) exitWith {resourcesIsChanging = false};
_hrT = server getVariable "hr";
_resourcesFIAT = server getVariable "resourcesFIA";

_hrT = _hrT + _hr;
_resourcesFIAT = round (_resourcesFIAT + _resourcesFIA);

if (_hrT < 0) then {_hrT = 0};
if (_resourcesFIAT < 0) then {_resourcesFIAT = 0};

server setVariable ["hr",_hrT,true];
server setVariable ["resourcesFIA",_resourcesFIAT,true];
resourcesIsChanging = false;

_textX = "";
_hrSim = "";
if (_hr > 0) then {_hrSim = "+"};
_resourcesFIASim = "";
if (_resourcesFIA > 0) then {_resourcesFIASim = "+"};
if ((_hr != 0) and (_resourcesFIA != 0)) then
	{
	_textX = format ["<t size='0.6' color='#C1C0BB'>%5 Resources.<br/> <t size='0.5' color='#C1C0BB'><br/>HR: %3%1<br/>Money: %4%2 €",_hr,_resourcesFIA,_hrSim,_resourcesFIASim,nameTeamPlayer]
	}
else
	{
	if (_hr != 0) then {_textX = format ["<t size='0.6' color='#C1C0BB'>%5 Resources.<br/> <t size='0.5' color='#C1C0BB'><br/>HR: %3%1",_hr,_resourcesFIA,_hrSim,nameTeamPlayer]} else {if (_resourcesFIA != 5) then {_textX = format ["<t size='0.6' color='#C1C0BB'>%5 Resources.<br/> <t size='0.5' color='#C1C0BB'><br/>Money: %4%2 €",_hr,_resourcesFIA,_hrSim,_resourcesFIASim,nameTeamPlayer]}};
	};

if (_textX != "") then
	{
	[petros,"income",_textX] remoteExec ["A3A_fnc_commsMP",theBoss];
	//[] remoteExec ["A3A_fnc_statistics",[teamPlayer,civilian]];
	};