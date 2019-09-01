diag_log format ["%1: [Antistasi] | INFO | loadServer Starting.",servertime];
if (isServer) then
{
diag_log format ["%1: [Antistasi] | INFO | Starting Persistent Load.",servertime];
petros allowdamage false;

["outpostsFIA"] call fn_LoadStat; publicVariable "outpostsFIA";
["mrkSDK"] call fn_LoadStat; /*if (isMultiplayer) then {sleep 5}*/;
["mrkCSAT"] call fn_LoadStat;
["difficultyX"] call fn_LoadStat;
["gameMode"] call fn_LoadStat;
["destroyedCities"] call fn_LoadStat;
["minesX"] call fn_LoadStat;
["countCA"] call fn_LoadStat;
["antennas"] call fn_LoadStat;
["prestigeNATO"] call fn_LoadStat;
["prestigeCSAT"] call fn_LoadStat;
["hr"] call fn_LoadStat;
["dateX"] call fn_LoadStat;
["weather"] call fn_LoadStat;
["prestigeOPFOR"] call fn_LoadStat;
["prestigeBLUFOR"] call fn_LoadStat;
["resourcesFIA"] call fn_LoadStat;
["garrison"] call fn_LoadStat;
["skillFIA"] call fn_LoadStat;
["distanceSPWN"] call fn_LoadStat;
["civPerc"] call fn_LoadStat;
["maxUnits"] call fn_LoadStat;
["membersX"] call fn_LoadStat;
["vehInGarage"] call fn_LoadStat;
["destroyedBuildings"] call fn_LoadStat;
["idlebases"] call fn_LoadStat;
["idleassets"] call fn_LoadStat;
["killZones"] call fn_LoadStat;
["controlsSDK"] call fn_LoadStat;
["bombRuns"] call fn_LoadStat;
waitUntil {!isNil "arsenalInit"};
["jna_dataList"] call fn_LoadStat;
//===========================================================================
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

unlockedWeapons = [];
unlockedBackpacks = [];
unlockedMagazines = [];
unlockedOptics = [];
unlockedItems = [];
unlockedRifles = [];
unlockedMG = [];
unlockedGL = [];
unlockedSN = [];
unlockedAA = [];
unlockedAT = [];

{unlockedWeapons pushBack (_x select 0)} forEach (((jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_HANDGUN) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON)) select {_x select 1 == -1}); publicVariable "unlockedWeapons";
{unlockedBackpacks pushBack (_x select 0)} forEach ((jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_BACKPACK) select {_x select 1 == -1}); publicVariable "unlockedBackpacks";
{unlockedMagazines pushBack (_x select 0)} forEach (((jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL)) select {_x select 1 == -1}); publicVariable "unlockedMagazines";
{unlockedOptics pushBack (_x select 0)} forEach ((jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC) select {_x select 1 == -1});
unlockedOptics = [unlockedOptics,[],{getNumber (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass")},"DESCEND"] call BIS_fnc_sortBy;
publicVariable "unlockedOptics";
{unlockedItems pushBack (_x select 0)} forEach ((((jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_VEST) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_GOGGLES) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_MAP) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_GPS) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_RADIO) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_COMPASS) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_WATCH) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMACC) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMBIPOD) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_BINOCULARS) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_NVGS)) select {_x select 1 == -1}));
unlockedItems = unlockedItems + unlockedOptics; publicVariable "unlockedItems";


//unlockedRifles = unlockedweapons -  hguns -  mlaunchers - rlaunchers - ["Binocular","Laserdesignator","Rangefinder"] - srifles - mguns; publicVariable "unlockedRifles";
//unlockedRifles = unlockedweapons select {_x in arifles}; publicVariable "unlockedRifles";

{
_weaponX = _x;
if (_weaponX in arifles) then
	{
	unlockedRifles pushBack _weaponX;
	if (count (getArray (configfile >> "CfgWeapons" >> _weaponX >> "muzzles")) == 2) then
		{
		unlockedGL pushBack _weaponX;
		};
	}
else
	{
	if (_weaponX in mguns) then
		{
		unlockedMG pushBack _weaponX;
		}
	else
		{
		if (_weaponX in srifles) then
			{
			unlockedSN pushBack _weaponX;
			}
		else
			{
			if (_weaponX in ((rlaunchers + mlaunchers) select {(getNumber (configfile >> "CfgWeapons" >> _x >> "lockAcquire") == 0)})) then
				{
				unlockedAT pushBack _weaponX;
				}
			else
				{
				if (_weaponX in (mlaunchers select {(getNumber (configfile >> "CfgWeapons" >> _x >> "lockAcquire") == 1)})) then {unlockedAA pushBack _weaponX};
				};
			};
		};
	};
} forEach unlockedWeapons;
if (hasIFA) then {unlockedRifles = unlockedRifles - ["LIB_M2_Flamethrower","LIB_PTRD"]};

publicVariable "unlockedRifles";
publicVariable "unlockedMG";
publicVariable "unlockedSN";
publicVariable "unlockedGL";
publicVariable "unlockedAT";
publicVariable "unlockedAA";
if ("NVGoggles" in unlockedItems) then {haveNV = true; publicVariable "haveNV"};
//Check if we have radios unlocked and update haveRadio.
call A3A_fnc_checkRadiosUnlocked;

{
if (sidesX getVariable [_x,sideUnknown] != teamPlayer) then
	{
	_positionX = getMarkerPos _x;
	_nearX = [(markersX - controlsX - outpostsFIA),_positionX] call BIS_fnc_nearestPosition;
	_sideX = sidesX getVariable [_nearX,sideUnknown];
	sidesX setVariable [_x,_sideX,true];
	};
} forEach controlsX;


{
if (sidesX getVariable [_x,sideUnknown] == sideUnknown) then
	{
	sidesX setVariable [_x,Occupants,true];
	};
} forEach markersX;

{[_x] call A3A_fnc_mrkUpdate} forEach (markersX - controlsX);
if (count outpostsFIA > 0) then {markersX = markersX + outpostsFIA; publicVariable "markersX"};

{if (_x in destroyedCities) then {[_x] call A3A_fnc_destroyCity}} forEach citiesX;

["chopForest"] call fn_LoadStat;
["destroyedBuildings"] call fn_LoadStat;
/*
{
_buildings = nearestObjects [_x, listMilBld, 25, true];
(_buildings select 1) setDamage 1;
} forEach destroyedBuildings;
*/
["posHQ"] call fn_LoadStat;
["nextTick"] call fn_LoadStat;
["staticsX"] call fn_LoadStat;//tiene que ser el último para que el sleep del borrado del contenido no haga que despawneen


if (!isMultiPlayer) then {player setPos getMarkerPos respawnTeamPlayer} else {{_x setPos getMarkerPos respawnTeamPlayer} forEach (playableUnits select {side _x == teamPlayer})};
_sites = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
tierWar = 1 + (floor (((5*({(_x in outposts) or (_x in resourcesX) or (_x in citiesX)} count _sites)) + (10*({_x in seaports} count _sites)) + (20*({_x in airportsX} count _sites)))/10));
if (tierWar > 10) then {tierWar = 10};
publicVariable "tierWar";

clearMagazineCargoGlobal boxX;
clearWeaponCargoGlobal boxX;
clearItemCargoGlobal boxX;
clearBackpackCargoGlobal boxX;

[] remoteExec ["A3A_fnc_statistics",[teamPlayer,civilian]];
diag_log format ["%1: [Antistasi] | INFO | Persistent Load Completed.",servertime];
diag_log format ["%1: [Antistasi] | INFO | Generating Map Markers.",servertime];
["tasks"] call fn_LoadStat;
if !(isMultiplayer) then
	{
	{
	_pos = getMarkerPos _x;
	_dmrk = createMarker [format ["Dum%1",_x], _pos];
	_dmrk setMarkerShape "ICON";
	[_x] call A3A_fnc_mrkUpdate;
	if (sidesX getVariable [_x,sideUnknown] != teamPlayer) then
		{
		_nul = [_x] call A3A_fnc_createControls;
		};
	} forEach airportsX;

	{
	_pos = getMarkerPos _x;
	_dmrk = createMarker [format ["Dum%1",_x], _pos];
	_dmrk setMarkerShape "ICON";
	_dmrk setMarkerType "loc_rock";
	_dmrk setMarkerText "Resources";
	[_x] call A3A_fnc_mrkUpdate;
	if (sidesX getVariable [_x,sideUnknown] != teamPlayer) then
		{
		_nul = [_x] call A3A_fnc_createControls;
		};
	} forEach resourcesX;

	{
	_pos = getMarkerPos _x;
	_dmrk = createMarker [format ["Dum%1",_x], _pos];
	_dmrk setMarkerShape "ICON";
	_dmrk setMarkerType "u_installation";
	_dmrk setMarkerText "Factory";
	[_x] call A3A_fnc_mrkUpdate;
	if (sidesX getVariable [_x,sideUnknown] != teamPlayer) then
		{
		_nul = [_x] call A3A_fnc_createControls;
		};
	} forEach factories;

	{
	_pos = getMarkerPos _x;
	_dmrk = createMarker [format ["Dum%1",_x], _pos];
	_dmrk setMarkerShape "ICON";
	_dmrk setMarkerType "loc_bunker";
	[_x] call A3A_fnc_mrkUpdate;
	if (sidesX getVariable [_x,sideUnknown] != teamPlayer) then
		{
		_nul = [_x] call A3A_fnc_createControls;
		};
	} forEach outposts;

	{
	_pos = getMarkerPos _x;
	_dmrk = createMarker [format ["Dum%1",_x], _pos];
	_dmrk setMarkerShape "ICON";
	_dmrk setMarkerType "b_naval";
	_dmrk setMarkerText "Sea Port";
	[_x] call A3A_fnc_mrkUpdate;
	if (sidesX getVariable [_x,sideUnknown] != teamPlayer) then
		{
		_nul = [_x] call A3A_fnc_createControls;
		};
	} forEach seaports;
	sidesX setVariable ["NATO_carrier",Occupants,true];
	sidesX setVariable ["CSAT_carrier",Invaders,true];
	};
statsLoaded = 0; publicVariable "statsLoaded";
placementDone = true; publicVariable "placementDone";
petros allowdamage true;
};
diag_log format ["%1: [Antistasi] | INFO | loadServer Completed.",servertime];