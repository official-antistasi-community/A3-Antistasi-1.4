params ["_occupantsChanged","_invadersChanged"];

/*  Adds a new aggro spike to the current stack

    Execution on: Server

    Scope: External

    Params:
        _occupantsChanged: NUMBER : The amount the aggro is gonna change for occupants
        _invadersChanged: NUMBER : The amount the aggro is gonna change for invaders

    Returns:
        Nothing
*/

//Wait until all other aggro change operations are done
waitUntil {!prestigeIsChanging};
prestigeIsChanging = true;

//Negating effect for vs Gov or vs Inv only modes
if(gameMode == 4) then {_occupantsChanged = 0;};
if(gameMode == 3) then {_invadersChanged = 0;};

if(_occupantsChanged != 0) then
{
    //The current formula is not that punishing, for really punishing results use
    // ((0.4/(100000000)) * (aggro - 100) * (aggro - 100) * (aggro - 100) * (aggro - 100)) + 0.1
    private _decayRate = ((1/25000) * (aggressionOccupants - 100) * (aggressionOccupants - 100)) + 0.1;
    if (_occupantsChanged > 0) then {_decayRate = _decayRate * -1};
    aggressionStackOccupants pushBack [_occupantsChanged, _decayRate];
};

if(_invadersChanged != 0) then
{
    //The current formula is not that punishing, for really punishing results use
    // ((0.4/(100000000)) * (aggro - 100) * (aggro - 100) * (aggro - 100) * (aggro - 100)) + 0.1
    private _decayRate = ((1/25000) * (aggressionInvaders - 100) * (aggressionInvaders - 100)) + 0.1;
    if (_invadersChanged > 0) then {_decayRate = _decayRate * -1};
    aggressionStackInvaders pushBack [_invadersChanged, _decayRate];
};

[] call A3A_fnc_calculateAggression;
prestigeIsChanging = false;


/*
_natoT = aggressionOccupants;
_csatT = aggressionInvaders;

_natoT = _natoT + _occupantsChanged;
_csatT = _csatT + _invadersChanged;

if (_natoT < 0) then {_natoT = 0};
if (_natoT > 100) then {_natoT = 100};
if (_csatT < 0) then {_csatT = 0};
if (_csatT > 100) then {_csatT = 100};
if (_natoT > 25*(tierWar + difficultyCoef)) then {_natoT = 25*tierWar};
if (_csatT > 25*(tierWar + difficultyCoef)) then {_csatT = 25*tierWar};


if (_occupantsChanged != 0) then {aggressionOccupants = _natoT; publicVariable "aggressionOccupants"};
if (_invadersChanged != 0) then {aggressionInvaders = _csatT; publicVariable "aggressionInvaders"};
//if ((_natoT == floor _natoT) or (_csatT == floor _csatT)) then {[] remoteExec ["A3A_fnc_statistics",[teamPlayer,civilian]]};

_textX = "";
_natoSim = "";
if (_occupantsChanged > 0.25) then {_natoSim = "+"};

_csatSim = "";
if (_invadersChanged > 0.25) then {_csatSim = "+"};
if ((_occupantsChanged > 0.25) and (_invadersChanged > 0.25)) then
	{
	_textX = format ["<t size='0.6' color='#C1C0BB'>Prestige Change.<br/> <t size='0.5' color='#C1C0BB'><br/>%5: %3%1<br/>%6: %4%2",_occupantsChanged,_invadersChanged,_natoSim,_csatSim,nameOccupants,nameInvaders]
	}
else
	{
	if (_occupantsChanged > 0.25) then {_textX = format ["<t size='0.6' color='#C1C0BB'>Prestige Change.<br/> <t size='0.5' color='#C1C0BB'><br/>%2: %3%1",_occupantsChanged,nameOccupants,_natoSim]} else {if (_invadersChanged > 0.25) then {_textX = format ["<t size='0.6' color='#C1C0BB'>Prestige Change.<br/> <t size='0.5' color='#C1C0BB'><br/>%1: %4%2",nameInvaders,_invadersChanged,_natoSim,_csatSim]}};
	};

if (_textX != "") then {[petros,"income",_textX] remoteExec ["A3A_fnc_commsMP",theBoss]};
*/
