private ["_nato","_csat"];

waitUntil {!prestigeIsChanging};
prestigeIsChanging = true;
_nato = _this select 0;
_csat = _this select 1;

_natoT = prestigeNATO;
_csatT = prestigeCSAT;

_natoT = _natoT + _nato;
_csatT = _csatT + _csat;

if (_natoT < 0) then {_natoT = 0};
if (_natoT > 100) then {_natoT = 100};
if (_csatT < 0) then {_csatT = 0};
if (_csatT > 100) then {_csatT = 100};
if (_natoT > 25*(tierWar + difficultyCoef)) then {_natoT = 25*tierWar};
if (_csatT > 25*(tierWar + difficultyCoef)) then {_csatT = 25*tierWar};


if (_nato != 0) then {prestigeNATO = _natoT; publicVariable "prestigeNATO"};
if (_csat != 0) then {prestigeCSAT = _csatT; publicVariable "prestigeCSAT"};
prestigeIsChanging = false;
_textX = "";

if ((_nato > 0.25) and (_csat > 0.25)) then
	{
	_textX = format ["<t size='0.6' color='#C1C0BB'>Prestige Change.<br/> <t size='0.5' color='#C1C0BB'><br/>%3: +%1<br/>%4: +%2",_nato,_csat,nameOccupants,nameInvaders]
	}
else
	{
	if (_nato > 0.25) then {_textX = format ["<t size='0.6' color='#C1C0BB'>Prestige Change.<br/> <t size='0.5' color='#C1C0BB'><br/>%2: +%1",_nato,nameOccupants]} else {if (_csat > 0.25) then {_textX = format ["<t size='0.6' color='#C1C0BB'>Prestige Change.<br/> <t size='0.5' color='#C1C0BB'><br/>%1: +%2",nameInvaders,_csat]}};
	};

if (_textX != "") then {[petros,"income",_textX] remoteExec ["A3A_fnc_commsMP",theBoss]};
