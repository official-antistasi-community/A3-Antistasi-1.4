if (player != theBoss) exitWith {hint "Only our Commander has access to this function"};

if (skillFIA > 20) exitWith {hint "Your troops have the maximum training"};
if (skillFIA > (tierWar*2)) exitWith {hint "You cannot upgrade training in the current War Level"};
_resourcesFIA = server getVariable "resourcesFIA";
_costs = 1000 + (1.5*(skillFIA *750));
if (_resourcesFIA < _costs) exitWith {hint format ["You do not have enough money to afford additional training. %1 € needed",_costs]};

_resourcesFIA = _resourcesFIA - _costs;
skillFIA = skillFIA + 1;
hint format ["%2 Skill Level has been Upgraded\nCurrent level is %1",skillFIA,nameTeamPlayer];
publicVariable "skillFIA";
server setVariable ["resourcesFIA",_resourcesFIA,true];
[] spawn A3A_fnc_statistics;
{
_costs = server getVariable _x;
_costs = round (_costs + (_costs * (skillFIA/280)));
server setVariable [_x,_costs,true];
} forEach soldiersSDK;
