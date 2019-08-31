if (hasInterface) then {
	if (!isNil "savingClient" && {savingClient}) exitWith {hint "Your personal stats are being saved"};
	[] call A3A_fnc_savePlayer;
};

//Server only from here on out.
if (!isServer) exitWith {};

if (savingServer) exitWith {"Server data save is still in progress" remoteExecCall ["hint",theBoss]};
savingServer = true;
private ["_garrison"];
["countCA", countCA] call fn_SaveStat;
["gameMode", gameMode] call fn_SaveStat;
["difficultyX", skillMult] call fn_SaveStat;
["bombRuns", bombRuns] call fn_SaveStat;
["smallCAmrk", smallCAmrk] call fn_SaveStat;
["membersX", membersX] call fn_SaveStat;
["antennas", antennasDead] call fn_SaveStat;
//["mrkNATO", (markersX - controlsX) select {sidesX getVariable [_x,sideUnknown] == Occupants}] call fn_SaveStat;
["rebelMarker", (markersX - controlsX - rebelWatchpostsAndRoadblocks) select {sidesX getVariable [_x,sideUnknown] == rebelSide}] call fn_SaveStat;
["mrkCSAT", (markersX - controlsX) select {sidesX getVariable [_x,sideUnknown] == Invaders}] call fn_SaveStat;
["posHQ", [getMarkerPos rebelRespawn,getPos fireX,[getDir boxX,getPos boxX],[getDir mapX,getPos mapX],getPos flagX,[getDir vehicleBox,getPos vehicleBox]]] call fn_Savestat;
["prestigeNATO", prestigeNATO] call fn_SaveStat;
["prestigeCSAT", prestigeCSAT] call fn_SaveStat;
["dateX", date] call fn_SaveStat;
["rebelTrainingLevel", rebelTrainingLevel] call fn_SaveStat;
["destroyedCities", destroyedCities] call fn_SaveStat;
["distanceSPWN", distanceSPWN] call fn_SaveStat;
["civPerc", civPerc] call fn_SaveStat;
["chopForest", chopForest] call fn_SaveStat;
["maxUnits", maxUnits] call fn_SaveStat;
["nextTick", nextTick - time] call fn_SaveStat;
/*
["unlockedWeapons", unlockedWeapons] call fn_SaveStat;
["unlockedItems", unlockedItems] call fn_SaveStat;
["unlockedMagazines", unlockedMagazines] call fn_SaveStat;
["unlockedBackpacks", unlockedBackpacks] call fn_SaveStat;
*/
["weather",[fogParams,rain]] call fn_SaveStat;
["destroyedBuildings",destroyedBuildings] call fn_SaveStat;
//["firstLoad",false] call fn_SaveStat;
private ["_hrBackground","_resourcesBackground","_veh","_typeVehX","_weaponsX","_ammunition","_items","_backpcks","_containers","_arrayEst","_posVeh","_dierVeh","_prestigeOPFOR","_rebelCitySupport","_city","_dataX","_markersX","_garrison","_arrayMrkMF","_rebelOutposts","_positionOutpost","_typeMine","_posMine","_detected","_typesX","_exists","_friendX"];

_hrBackground = (server getVariable "hr") + ({(alive _x) and (not isPlayer _x) and (_x getVariable ["spawner",false]) and ((group _x in (hcAllGroups theBoss) or (isPlayer (leader _x))) and (side group _x == rebelSide))} count allUnits);
_resourcesBackground = server getVariable "rebelMoney";
/*
_weaponsX = [];
_ammunition = [];
_items = [];
_backpcks = [];*/
_vehInGarage = [];
_vehInGarage = _vehInGarage + vehInGarage;
{
_friendX = _x;
if ((_friendX getVariable ["spawner",false]) and (side group _friendX == rebelSide))then
	{
	if ((alive _friendX) and (!isPlayer _friendX)) then
		{
		if (((isPlayer leader _friendX) and (!isMultiplayer)) or (group _friendX in (hcAllGroups theBoss)) and (not((group _friendX) getVariable ["esNATO",false]))) then
			{
			_resourcesBackground = _resourcesBackground + (server getVariable [(typeOf _friendX),0]);
			_backpck = backpack _friendX;
			if (_backpck != "") then
				{
				switch (_backpck) do
					{
					case rebelStaticMortarBag: {_resourcesBackground = _resourcesBackground + ([rebelMortar] call A3A_fnc_vehiclePrice)};
					case rebelStaticSupportAA: {_resourcesBackground = _resourcesBackground + ([rebelStaticAA] call A3A_fnc_vehiclePrice)};
					case rebelStaticTallMG: {_resourcesBackground = _resourcesBackground + ([rebelStaticMG] call A3A_fnc_vehiclePrice)};
					case rebelStaticSupportAT: {_resourcesBackground = _resourcesBackground + ([rebelStaticAT] call A3A_fnc_vehiclePrice)};
					};
				};
			if (vehicle _friendX != _friendX) then
				{
				_veh = vehicle _friendX;
				_typeVehX = typeOf _veh;
				if (not(_veh in staticsToSave)) then
					{
					if ((_veh isKindOf "StaticWeapon") or (driver _veh == _friendX)) then
						{
						if ((group _friendX in (hcAllGroups theBoss)) or (!isMultiplayer)) then
							{
							_resourcesBackground = _resourcesBackground + ([_typeVehX] call A3A_fnc_vehiclePrice);
							if (count attachedObjects _veh != 0) then {{_resourcesBackground = _resourcesBackground + ([typeOf _x] call A3A_fnc_vehiclePrice)} forEach attachedObjects _veh};
							};
						};
					};
				};
			};
		};
	};
} forEach allUnits;


["rebelMoney", _resourcesBackground] call fn_SaveStat;
["hr", _hrBackground] call fn_SaveStat;
["vehInGarage", _vehInGarage] call fn_SaveStat;

_arrayEst = [];
{
_veh = _x;
_typeVehX = typeOf _veh;
if ((_veh distance getMarkerPos rebelRespawn < 50) and !(_veh in staticsToSave) and !(_typeVehX in ["ACE_SandbagObject","Land_PaperBox_01_open_boxes_F","Land_PaperBox_01_open_empty_F"])) then
	{
	if (((not (_veh isKindOf "StaticWeapon")) and (not (_veh isKindOf "ReammoBox")) and (not (_veh isKindOf "FlagCarrier")) and (not(_veh isKindOf "Building"))) and (not (_typeVehX == "C_Van_01_box_F")) and (count attachedObjects _veh == 0) and (alive _veh) and ({(alive _x) and (!isPlayer _x)} count crew _veh == 0) and (not(_typeVehX == "WeaponHolderSimulated"))) then
		{
		_posVeh = getPos _veh;
		_dirVeh = getDir _veh;
		_arrayEst pushBack [_typeVehX,_posVeh,_dirVeh];
		};
	};
} forEach vehicles - [boxX,flagX,fireX,vehicleBox,mapX];

_sites = markersX select {sidesX getVariable [_x,sideUnknown] == rebelSide};
{
_positionX = position _x;
if ((alive _x) and !(surfaceIsWater _positionX) and !(isNull _x)) then
	{
	_arrayEst pushBack [typeOf _x,getPos _x,getDir _x];
	/*
	_nearX = [_sites,_positionX] call BIS_fnc_nearestPosition;
	if (_positionX inArea _nearX) then
		{
		_arrayEst pushBack [typeOf _x,getPos _x,getDir _x]
		};
	*/
	};
} forEach staticsToSave;

["staticsX", _arrayEst] call fn_SaveStat;
[] call A3A_fnc_arsenalManage;

_jna_dataList = [];
_jna_dataList = _jna_dataList + jna_dataList;
["jna_dataList", _jna_dataList] call fn_SaveStat;

_prestigeOPFOR = [];
_rebelCitySupport = [];

{
_city = _x;
_dataX = server getVariable _city;
_prestigeOPFOR = _prestigeOPFOR + [_dataX select 2];
_rebelCitySupport = _rebelCitySupport + [_dataX select 3];
} forEach citiesX;

["prestigeOPFOR", _prestigeOPFOR] call fn_SaveStat;
["rebelCitySupport", _rebelCitySupport] call fn_SaveStat;

_markersX = markersX - rebelWatchpostsAndRoadblocks - controlsX;
_garrison = [];
{
_garrison pushBack [_x,garrison getVariable [_x,[]]];
} forEach _markersX;

["garrison",_garrison] call fn_SaveStat;
/*
_arrayMrkMF = [];

{
_posMineF = getMarkerPos _x;
_arrayMrkMF = _arrayMrkMF + [_posMineF];
} forEach minefieldMrk;

["mineFieldMrk", _arrayMrkMF] call fn_SaveStat;
*/
_arrayMines = [];
{
_typeMine = typeOf _x;
_posMine = getPos _x;
_dirMine = getDir _x;
_detected = [];
if (_x mineDetectedBy rebelSide) then
	{
	_detected pushBack rebelSide
	};
if (_x mineDetectedBy Occupants) then
	{
	_detected pushBack Occupants
	};
if (_x mineDetectedBy Invaders) then
	{
	_detected pushBack Invaders
	};
_arrayMines = _arrayMines + [[_typeMine,_posMine,_detected,_dirMine]];
} forEach allMines;

["minesX", _arrayMines] call fn_SaveStat;

_rebelOutposts = [];

{
_positionOutpost = getMarkerPos _x;
_rebelOutposts pushBack [_positionOutpost,garrison getVariable [_x,[]]];
} forEach rebelWatchpostsAndRoadblocks;

["rebelWatchpostsAndRoadblocks", _rebelOutposts] call fn_SaveStat;

if (!isDedicated) then
	{
	_typesX = [];
	{
	if ([_x] call BIS_fnc_taskExists) then
		{
		_state = [_x] call BIS_fnc_taskState;
		if (_state == "CREATED") then
			{
			_typesX pushBackUnique _x;
			};
		};
	} forEach ["AS","CON","DES","LOG","RES","CONVOY","DEF_HQ","aiAttack"];

	["tasks",_typesX] call fn_SaveStat;
	};

_dataX = [];
{
_dataX pushBack [_x,server getVariable _x];
} forEach airportsX + outposts;

["idlebases",_dataX] call fn_SaveStat;

_dataX = [];
{
_dataX pushBack [_x,timer getVariable _x];
} forEach (vehAttack + vehNATOAttackHelis + vehPlanes + vehCSATAttackHelis);

["idleassets",_dataX] call fn_SaveStat;

_dataX = [];
{
_dataX pushBack [_x,killZones getVariable [_x,[]]];
} forEach airportsX + outposts;

["killZones",_dataX] call fn_SaveStat;

_controlsX = controlsX select {(sidesX getVariable [_x,sideUnknown] == rebelSide) and (controlsX find _x < defaultControlIndex)};
["rebelControlPoints",_controlsX] call fn_SaveStat;

savingServer = false;
[[petros,"hint",format ["Savegame Done.\n\nYou won't lose your stats in the event of a game update.\n\nRemember: if you want to preserve any vehicle, it must be near the HQ Flag with no AI inside.\nIf AI are inside, you will save the funds you spent on it.\n\nAI will be refunded\n\nStolen and purchased Static Weapons need to be ASSEMBLED in order to be saved. You can save disassembled Static Weapons in the ammo box.\n\nMounted Statics (Mortar/AA/AT squads) won't get saved, but you will be able to recover the cost.\n\nSame for assigned vehicles more than 50m away from HQ.\n\n%1 fund count:\nHR: %2\nMoney: %3 €",rebelFactionName,_hrBackground,_resourcesBackground]],"A3A_fnc_commsMP"] call BIS_fnc_MP;
diag_log format ["%1: [Antistasi] | INFO | Persistent Save Completed.",servertime];