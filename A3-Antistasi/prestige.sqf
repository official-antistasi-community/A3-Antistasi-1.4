waitUntil {!prestigeIsChanging};
prestigeIsChanging = true;
private _govtAgressionChange = _this select 0;
private _invaderAgressionChange = _this select 1;

private _govtCalculatedAggression = prestigeNATO + _govtAgressionChange;
private _invaderCalculatedAggression = prestigeCSAT + _invaderAgressionChange;

if (_govtCalculatedAggression < 0) then {_govtCalculatedAggression = 0};
if (_govtCalculatedAggression > 100) then {_govtCalculatedAggression = 100};
	
if (_invaderCalculatedAggression < 0) then {_invaderCalculatedAggression = 0};
if (_invaderCalculatedAggression > 100) then {_invaderCalculatedAggression = 100};

if (_govtCalculatedAggression > 25*(tierWar + difficultyCoef)) then {_govtCalculatedAggression = 25*tierWar};
if (_invaderCalculatedAggression > 25*(tierWar + difficultyCoef)) then {_invaderCalculatedAggression = 25*tierWar};

if (_govtAgressionChange != 0) then {prestigeNATO = _govtCalculatedAggression; publicVariable "prestigeNATO"};
if (_invaderAgressionChange != 0) then {prestigeCSAT = _invaderCalculatedAggression; publicVariable "prestigeCSAT"};
prestigeIsChanging = false;

private _notificationText = "";
if ((_govtAgressionChange > 0.25) and (_invaderAgressionChange > 0.25)) then
	{
	_notificationText = format ["<t size='0.6' color='#C1C0BB'>Aggression Change.<br/> <t size='0.5' color='#C1C0BB'><br/>%3: ""+""%1<br/>%4: ""+""%2",_govtAgressionChange,_invaderAgressionChange,nameOccupants,nameInvaders]
	}
else
	{
	if (_govtAgressionChange > 0.25) then {_notificationText = format ["<t size='0.6' color='#C1C0BB'>Aggression Change.<br/> <t size='0.5' color='#C1C0BB'><br/>%2: ""+""%1",_govtAgressionChange,nameOccupants]} else {if (_invaderAgressionChange > 0.25) then {_notificationText = format ["<t size='0.6' color='#C1C0BB'>Aggression Change.<br/> <t size='0.5' color='#C1C0BB'><br/>%1: ""+""%2",nameInvaders,_invaderAgressionChange]}};
	};

if (_notificationText != "") then {[petros,"income",_notificationText] remoteExec ["A3A_fnc_commsMP",theBoss]};