if (player != theBoss) exitWith {hint "Only our Commander has access to this function"};

if (rebelTrainingLevel > 19) exitWith {hint "Your troops have the maximum training"};
if ((rebelTrainingLevel + 1) > (tierWar*2)) exitWith {hint "You cannot upgrade training in the current War Level"};
_rebelMoney = server getVariable "rebelMoney";
_costs = 1000 + (1.5*(rebelTrainingLevel *750));
if (_rebelMoney < _costs) exitWith {hint format ["You do not have enough money to afford additional training. %1 € needed",_costs]};

_rebelMoney = _rebelMoney - _costs;
rebelTrainingLevel = rebelTrainingLevel + 1;
hint format ["%2 Skill Level has been Upgraded\nCurrent level is %1",rebelTrainingLevel,rebelFactionName];
publicVariable "rebelTrainingLevel";
server setVariable ["rebelMoney",_rebelMoney,true];
[] spawn A3A_fnc_statistics;
{
_costs = server getVariable _x;
_costs = round (_costs + (_costs * (rebelTrainingLevel/280)));
server setVariable [_x,_costs,true];
} forEach rebelUnitsAll;
