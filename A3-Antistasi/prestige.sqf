private ["_DEFENDERchange","_INVADERchange"];

waitUntil {!prestigeIsChanging};
prestigeIsChanging = true;
_DEFENDERchange = _this select 0;
_INVADERchange = _this select 1;

_aggressionDEFENDERfinal = prestigeNATO;
_aggressionINVADERfinal = prestigeCSAT;

_aggressionDEFENDERfinal = _aggressionDEFENDERfinal + _DEFENDERchange;
_aggressionINVADERfinal = _aggressionINVADERfinal + _INVADERchange;

if (_aggressionDEFENDERfinal < 0) then {_aggressionDEFENDERfinal = 0};
if (_aggressionDEFENDERfinal > 100) then {_aggressionDEFENDERfinal = 100};
if (_aggressionINVADERfinal < 0) then {_aggressionINVADERfinal = 0};
if (_aggressionINVADERfinal > 100) then {_aggressionINVADERfinal = 100};
if (_aggressionDEFENDERfinal > 25*(tierWar + difficultyCoef)) then {_aggressionDEFENDERfinal = 25*tierWar};
if (_aggressionINVADERfinal > 25*(tierWar + difficultyCoef)) then {_aggressionINVADERfinal = 25*tierWar};


if (_DEFENDERchange != 0) then {prestigeNATO = _aggressionDEFENDERfinal; publicVariable "prestigeNATO"};
if (_INVADERchange != 0) then {prestigeCSAT = _aggressionINVADERfinal; publicVariable "prestigeCSAT"};
//if ((_aggressionDEFENDERfinal == floor _aggressionDEFENDERfinal) or (_aggressionINVADERfinal == floor _aggressionINVADERfinal)) then {[] remoteExec ["A3A_fnc_statistics",[teamPlayer,civilian]]};
prestigeIsChanging = false;
_textX = "";
_DEFENDERsim = "";
if (_DEFENDERchange > 0.25) then {_DEFENDERsim = "+"};

_INVADERsim = "";
if (_INVADERchange > 0.25) then {_INVADERsim = "+"};
if ((_DEFENDERchange > 0.25) and (_INVADERchange > 0.25)) then
	{
	_textX = format ["<t size='0.6' color='#C1C0BB' shadow='2'>Aggression Change.<br/> <t size='0.5' color='#C1C0BB' shadow='2'><br/>%5: %3%1<br/>%6: %4%2",_DEFENDERchange,_INVADERchange,_DEFENDERsim,_INVADERsim,nameOccupants,nameInvaders]
	}
else
	{
	if (_DEFENDERchange > 0.25) then {_textX = format ["<t size='0.6' color='#C1C0BB' shadow='2'>Agression Change.<br/> <t size='0.5' color='#C1C0BB' shadow='2'><br/>%2: %3%1",_DEFENDERchange,nameOccupants,_DEFENDERsim]} else {if (_INVADERchange > 0.25) then {_textX = format ["<t size='0.6' color='#C1C0BB' shadow='2'>Prestige Change.<br/> <t size='0.5' color='#C1C0BB' shadow='2'><br/>%1: %4%2",nameInvaders,_INVADERchange,_DEFENDERsim,_INVADERsim]}};
	};

if (_textX != "") then {[petros,"income",_textX] remoteExec ["A3A_fnc_commsMP",theBoss]};
