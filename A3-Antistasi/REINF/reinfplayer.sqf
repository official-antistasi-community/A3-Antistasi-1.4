if (not([player] call A3A_fnc_isMember)) exitWith {hint "Only Server Members can recruit AI units"};
private ["_chequeo","_hr","_tipounidad","_coste","_resourcesFIA","_unit"];

//if (!allowPlayerRecruit) exitWith {hint "Server is very loaded. \nWait one minute or change FPS settings in order to fulfill this request"};

if (recruitCooldown > time) exitWith {hint format ["You need to wait %1 seconds to be able to recruit units again",round (recruitCooldown - time)]};

if (player != player getVariable ["owner",player]) exitWith {hint "Youy cannot buy units while you are controlling AI"};

// if ([player,300] call A3A_fnc_enemyNearCheck) exitWith {Hint "You cannot Recruit Units with enemies nearby"};

if (player != leader group player) exitWith {hint "You cannot recruit units as you are not your group leader"};

_hr = server getVariable "hr";

if (_hr < 1) exitWith {hint "You do not have enough HR for this request"};
_arraytipounidad = _this select 0;
_tipoUnidad = _arrayTipoUnidad select 0;
_coste = server getVariable _tipounidad;
if (!isMultiPlayer) then {_resourcesFIA = server getVariable "resourcesFIA"} else {_resourcesFIA = player getVariable "dinero";};

if (_coste > _resourcesFIA) exitWith {hint format ["You do not have enough money for this kind of unit (%1 € needed)",_coste]};


if ((count units group player) + (count units rezagados) > 9) exitWith {hint "Your squad is full or you have too many scattered units with no radio contact"};
if (random 20 <= skillFIA) then {_tipoUnidad = _arrayTipoUnidad select 1};
_unit = group player createUnit [_tipounidad, position player, [], 0, "NONE"];

if (!isMultiPlayer) then
	{
	_nul = [-1, - _coste] remoteExec ["A3A_fnc_resourcesFIA",2];
	}
else
	{
	_nul = [-1, 0] remoteExec ["A3A_fnc_resourcesFIA",2];
	[- _coste] call A3A_fnc_resourcesPlayer;
	["dinero",player getVariable ["dinero",0]] call fn_SaveStat;
	hint "Soldier Recruited.\n\nRemember: if you use the group menu to switch groups you will lose control of your recruited AI";
	};

[_unit] spawn A3A_fnc_FIAinit;
_unit disableAI "AUTOCOMBAT";
sleep 1;
petros directSay "SentGenReinforcementsArrived";



