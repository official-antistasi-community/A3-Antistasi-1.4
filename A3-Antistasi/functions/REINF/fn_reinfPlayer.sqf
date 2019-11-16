if !([player] call A3A_fnc_isMember) exitWith {hint "Only Server Members can recruit AI units"};

if (recruitCooldown > time) exitWith {hint format ["You need to wait %1 seconds to be able to recruit units again",round (recruitCooldown - time)]};

if (player != player getVariable ["owner",player]) exitWith {hint "You cannot buy units while you are controlling AI"};

if ([player,300] call A3A_fnc_enemyNearCheck) exitWith {Hint "You cannot Recruit Units with enemies nearby"};

if (player != leader group player) exitWith {hint "You cannot recruit units as you are not your group leader"};

private _hr = server getVariable "hr";

if (_hr < 1) exitWith {hint "You do not have enough HR for this request"};
private _arraytypeUnit = _this select 0;
private _typeUnit = _arraytypeUnit select 0;
private _costs = server getVariable _typeUnit;
private _resourcesFIA = 0;
if (!isMultiPlayer) then {_resourcesFIA = server getVariable "resourcesFIA"} else {_resourcesFIA = player getVariable "moneyX";};

if (_costs > _resourcesFIA) exitWith {hint format ["You do not have enough money for this kind of unit (%1 € needed)",_costs]};

if ((count units group player) + (count units stragglers) > 9) exitWith {hint "Your squad is full or you have too many scattered units with no radio contact"};

private _unit = group player createUnit [_typeUnit, position player, [], 0, "NONE"];

if (!isMultiPlayer) then {
	_nul = [-1, - _costs] remoteExec ["A3A_fnc_resourcesFIA",2];
} else {
	_nul = [-1, 0] remoteExec ["A3A_fnc_resourcesFIA",2];
	[- _costs] call A3A_fnc_resourcesPlayer;
	["moneyX",player getVariable ["moneyX",0]] call fn_SaveStat;
	hint "Soldier Recruited.\n\nRemember: if you use the group menu to switch groups you will lose control of your recruited AI";
};

[_unit] spawn A3A_fnc_FIAinit;
_unit disableAI "AUTOCOMBAT";
sleep 1;
petros directSay "SentGenReinforcementsArrived";
