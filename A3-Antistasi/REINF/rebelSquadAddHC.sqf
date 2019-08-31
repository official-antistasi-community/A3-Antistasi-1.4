
if (player != theBoss) exitWith {hint "Only our Commander has access to this function"};
//if (!allowPlayerRecruit) exitWith {hint "Server is very loaded. \nWait one minute or change FPS settings in order to fulfill this request"};
if (markerAlpha rebelRespawn == 0) exitWith {hint "You cant recruit a new squad while you are moving your HQ"};
if (!([player] call A3A_fnc_hasRadio)) exitWith {if !(hasIFA) then {hint "You need a radio in your inventory to be able to give orders to other squads"} else {hint "You need a Radio Man in your group to be able to give orders to other squads"}};
_checkX = false;
{
	if (((side _x == Invaders) or (side _x == Occupants)) and (_x distance petros < 500) and ([_x] call A3A_fnc_canFight) and !(isPlayer _x)) exitWith {_checkX = true};
} forEach allUnits;

if (_checkX) exitWith {Hint "You cannot Recruit Squads with enemies near your HQ"};

private ["_typeGroup","_esinf","_typeVehX","_costs","_costHR","_exit","_formatX","_pos","_hr","_rebelMoney","_groupX","_roads","_road","_groupX","_truckX","_vehicle","_mortarX","_morty"];


_typeGroup = _this select 0;
_exit = false;
if (_typeGroup isEqualType "") then
	{
	if (_typeGroup == "not_supported") then {_exit = true; hint "The group or vehicle type you request is not supported in your modset"};
	if (hasIFA and ((_typeGroup == rebelMortar) or (_typeGroup == rebelStaticMG)) and !debug) then {_exit = true; hint "The group or vehicle type you request is not supported in your modset"};
	};

if (activeGREF) then
	{
	if (_typeGroup isEqualType objNull) then
		{
		if (_typeGroup == rebelStaticAT) then {hint "AT trucks are disabled in RHS - GREF"; _exit = true};
		};
	};
if (_exit) exitWith {};
_esinf = false;
_typeVehX = "";
_costs = 0;
_costHR = 0;
_formatX = [];
_format = "Squd-";

_hr = server getVariable "hr";
_rebelMoney = server getVariable "rebelMoney";

private ["_groupX","_roads","_truckX","_withBackpck"];
_withBackpck = "";
if (_typeGroup isEqualType []) then
	{
	{
	_typeUnit = if (random 20 <= rebelTrainingLevel) then {_x select 1} else {_x select 0};
	_formatX pushBack _typeUnit;
	_costs = _costs + (server getVariable _typeUnit); _costHR = _costHR +1
	} forEach _typeGroup;
	if (count _this > 1) then
		{
		_withBackpck = _this select 1;
		if (_withBackpck == "MG") then {_costs = _costs + ([rebelStaticMG] call A3A_fnc_vehiclePrice)};
		if (_withBackpck == "Mortar") then {_costs = _costs + ([rebelMortar] call A3A_fnc_vehiclePrice)};
		};
	_esinf = true;
	}
else
	{
	_costs = _costs + (2*(server getVariable rebelStaticCrew)) + ([_typeGroup] call A3A_fnc_vehiclePrice);
	_costHR = 2;
	//if (_typeGroup == rebelMortar) then {_costs = _costs + ([rebelVehQuadbike] call A3A_fnc_vehiclePrice)} else {_costs = _costs + ([rebelVehTransport] call A3A_fnc_vehiclePrice)};
	if ((_typeGroup == rebelMortar) or (_typeGroup == rebelStaticMG)) then
		{
		_esInf = true;
		_formatX = [rebelStaticCrew,rebelStaticCrew];
		}
	else
		{
		_costs = _costs + ([rebelVehTransport] call A3A_fnc_vehiclePrice)
		};
	};
if ((_withBackpck != "") and hasIFA) exitWith {hint "Your current modset does not support packing / unpacking static weapons";};

if (_hr < _costHR) then {_exit = true;hint format ["You do not have enough HR for this request (%1 required)",_costHR]};

if (_rebelMoney < _costs) then {_exit = true;hint format ["You do not have enough money for this request (%1 € required)",_costs]};

if (_exit) exitWith {};

_nul = [- _costHR, - _costs] remoteExec ["A3A_fnc_rebelResources",2];

_pos = getMarkerPos rebelRespawn;

_road = [_pos] call A3A_fnc_findNearestGoodRoad;
_bypassAI = false;
if (_esinf) then
	{
	_pos = [(getMarkerPos rebelRespawn), 30, random 360] call BIS_Fnc_relPos;
	if (_typeGroup isEqualType []) then
		{
		_groupX = [_pos, rebelSide, _formatX,true] call A3A_fnc_spawnGroup;
		//if (_typeGroup isEqualTo rebelGroupSquad) then {_format = "Squd-"};
		if (_typeGroup isEqualTo rebelGroupFireteam) then {_format = "Tm-"};
		if (_typeGroup isEqualTo rebelGroupAT) then {_format = "AT-"};
		if (_typeGroup isEqualTo rebelGroupSniperTeam) then {_format = "Snpr-"};
		if (_typeGroup isEqualTo rebelGroupSentryTeam) then {_format = "Stry-"};
		if (_withBackpck == "MG") then
			{
			((units _groupX) select ((count (units _groupX)) - 2)) addBackpackGlobal rebelStaticSupportTallMG;
			((units _groupX) select ((count (units _groupX)) - 1)) addBackpackGlobal rebelStaticTallMG;
			_format = "SqMG-";
			}
		else
			{
			if (_withBackpck == "Mortar") then
				{
				((units _groupX) select ((count (units _groupX)) - 2)) addBackpackGlobal rebelStaticSupportMortar;
				((units _groupX) select ((count (units _groupX)) - 1)) addBackpackGlobal rebelStaticMortarBag;
				_format = "SqMort-";
				};
			};
		}
	else
		{
		_groupX = [_pos, rebelSide, _formatX,true] call A3A_fnc_spawnGroup;
		_groupX setVariable ["staticAutoT",false,true];
		if (_typeGroup == rebelMortar) then {_format = "Mort-"};
		if (_typeGroup == rebelStaticMG) then {_format = "MG-"};
		[_groupX,_typeGroup] spawn A3A_fnc_MortyAI;
		_bypassAI = true;
		};
	_format = format ["%1%2",_format,{side (leader _x) == rebelSide} count allGroups];
	_groupX setGroupId [_format];
	}
else
	{
	_pos = position _road findEmptyPosition [1,30,rebelVehTransport];
	_vehicle = if (_typeGroup == rebelStaticAA) then
		{
		if (activeGREF) then {[_pos, 0,"rhsgref_ins_g_ural_Zu23", rebelSide] call bis_fnc_spawnvehicle} else {[_pos, 0,rebelVehTransport, rebelSide] call bis_fnc_spawnvehicle};
		}
	else
		{
		[_pos, 0,_typeGroup, rebelSide] call bis_fnc_spawnvehicle
		};
	_truckX = _vehicle select 0;
	_groupX = _vehicle select 2;
	//_mortarX attachTo [_truckX,[0,-1.5,0.2]];
	//_mortarX setDir (getDir _truckX + 180);

	if ((!activeGREF) and (_typeGroup == rebelStaticAA)) then
		{
		_pos = _pos findEmptyPosition [1,30,rebelMortar];
		_morty = _groupX createUnit [rebelStaticCrew, _pos, [],0, "NONE"];
		_mortarX = _typeGroup createVehicle _pos;
		_nul = [_mortarX] call A3A_fnc_AIVEHinit;
		_mortarX attachTo [_truckX,[0,-1.5,0.2]];
		_mortarX setDir (getDir _truckX + 180);
		_morty moveInGunner _mortarX;
		};
	if (_typeGroup == rebelVehLiteAT) then {_groupX setGroupId [format ["M.AT-%1",{side (leader _x) == rebelSide} count allGroups]]};
	if (_typeGroup == rebelStaticAA) then {_groupX setGroupId [format ["M.AA-%1",{side (leader _x) == rebelSide} count allGroups]]};

	driver _truckX action ["engineOn", vehicle driver _truckX];
	_nul = [_truckX] call A3A_fnc_AIVEHinit;
	_bypassAI = true;
	};

{[_x] call A3A_fnc_rebelCreateUnit} forEach units _groupX;
//leader _groupX setBehaviour "SAFE";
theBoss hcSetGroup [_groupX];
petros directSay "SentGenReinforcementsArrived";
hint format ["Group %1 at your command.\n\nGroups are managed from the High Command bar (Default: CTRL+SPACE)\n\nIf the group gets stuck, use the AI Control feature to make them start moving. Mounted Static teams tend to get stuck (solving this is WiP)\n\nTo assign a vehicle for this group, look at some vehicle, and use Vehicle Squad Mngmt option in Y menu", groupID _groupX];

if (!_esinf) exitWith {};
if !(_bypassAI) then {_groupX spawn A3A_fnc_attackDrillAI};

if (count _formatX == 2) then
	{
	_typeVehX = rebelVehQuadbike;
	}
else
	{
	if (count _formatX > 4) then
		{
		_typeVehX = rebelVehTransport;
		}
	else
		{
		_typeVehX = rebelVehLiteUnarmed;
		};
	};

_costs = [_typeVehX] call A3A_fnc_vehiclePrice;
private ["_display","_childControl"];
if (_costs > server getVariable "rebelMoney") exitWith {};

_nul = createDialog "veh_query";

sleep 1;
disableSerialization;

_display = findDisplay 100;

if (str (_display) != "no display") then
	{
	_ChildControl = _display displayCtrl 104;
	_ChildControl  ctrlSetTooltip format ["Buy a vehicle for this squad for %1 €",_costs];
	_ChildControl = _display displayCtrl 105;
	_ChildControl  ctrlSetTooltip "Barefoot Infantry";
	};

waitUntil {(!dialog) or (!isNil "vehQuery")};
if ((!dialog) and (isNil "vehQuery")) exitWith {};

//if (!vehQuery) exitWith {vehQuery = nil};

vehQuery = nil;
//_rebelMoney = server getVariable "rebelMoney";
//if (_rebelMoney < _costs) exitWith {hint format ["You do not have enough money for this vehicle: %1 € required",_costs]};
_pos = position _road findEmptyPosition [1,30,"B_G_Van_01_transport_F"];
_mortarX = _typeVehX createVehicle _pos;
_nul = [_mortarX] call A3A_fnc_AIVEHinit;
_groupX addVehicle _mortarX;
_mortarX setVariable ["owner",_groupX,true];
_nul = [0, - _costs] remoteExec ["A3A_fnc_rebelResources",2];
leader _groupX assignAsDriver _mortarX;
{[_x] orderGetIn true; [_x] allowGetIn true} forEach units _groupX;
hint "Vehicle Purchased";
petros directSay "SentGenBaseUnlockVehicle";
