diag_log format ["%1: [Antistasi] | INFO | loadServer Starting.",servertime];
if (isServer) then {
	diag_log format ["%1: [Antistasi] | INFO | Starting Persistent Load.",servertime];
	petros allowdamage false;

	["outpostsFIA"] call fn_LoadStat; publicVariable "outpostsFIA";
	["mrkSDK"] call fn_LoadStat;
	["mrkCSAT"] call fn_LoadStat;
	["difficultyX"] call fn_LoadStat;
	["gameMode"] call fn_LoadStat;
	["destroyedSites"] call fn_LoadStat;
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
	["usesWurzelGarrison"] call fn_LoadStat;
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

	//RESTORE THE STATE OF THE 'UNLOCKED' VARIABLES USING JNA_DATALIST
	{
		private _arsenalTabDataArray = _x;
		private _unlockedItemsInTab = _arsenalTabDataArray select { _x select 1 == -1 } apply { _x select 0 };
		{
			[_x, true] call A3A_fnc_unlockEquipment;
		} forEach _unlockedItemsInTab;
	} forEach jna_dataList;

	if !(unlockedNVGs isEqualTo []) then {
		haveNV = true; publicVariable "haveNV"
	};

	//Check if we have radios unlocked and update haveRadio.
	call A3A_fnc_checkRadiosUnlocked;

	{
		if (sidesX getVariable [_x,sideUnknown] != teamPlayer) then {
			_positionX = getMarkerPos _x;
			_nearX = [(markersX - controlsX - outpostsFIA),_positionX] call BIS_fnc_nearestPosition;
			_sideX = sidesX getVariable [_nearX,sideUnknown];
			sidesX setVariable [_x,_sideX,true];
		};
	} forEach controlsX;


	{
		if (sidesX getVariable [_x,sideUnknown] == sideUnknown) then {
			sidesX setVariable [_x,Occupants,true];
		};
	} forEach markersX;

	{
		[_x] call A3A_fnc_mrkUpdate
	} forEach (markersX - controlsX);

	if (count outpostsFIA > 0) then {
		markersX = markersX + outpostsFIA; publicVariable "markersX"
	};

	{
		if (_x in destroyedSites) then {
			[_x] call A3A_fnc_destroyCity
		};
	} forEach citiesX;

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
	["staticsX"] call fn_LoadStat;

	if (!isMultiPlayer) then {player setPos getMarkerPos respawnTeamPlayer} else {{_x setPos getMarkerPos respawnTeamPlayer} forEach (playableUnits select {side _x == teamPlayer})};
	_sites = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};

	//Isn't that just tierCheck.sqf?
	tierWar = 1 + (floor (((5*({(_x in outposts) or (_x in resourcesX) or (_x in citiesX)} count _sites)) + (10*({_x in seaports} count _sites)) + (20*({_x in airportsX} count _sites)))/10));
	if (tierWar > 10) then {tierWar = 10};
	publicVariable "tierWar";

	tierPreference = 1;
	publicVariable "tierPreference";
	//Updating the preferences based on war level
	for "_i" from 1 to tierWar do {
		[] call A3A_fnc_updatePreference;
	};

	if (isNil "usesWurzelGarrison") then {
		//Create the garrison new
		diag_log "No WurzelGarrison found, creating new!";
		[airportsX, "Airport", [0,0,0]] spawn A3A_fnc_createGarrison;	//New system
		[resourcesX, "Other", [0,0,0]] spawn A3A_fnc_createGarrison;	//New system
		[factories, "Other", [0,0,0]] spawn A3A_fnc_createGarrison;
		[outposts, "Outpost", [1,1,0]] spawn A3A_fnc_createGarrison;
		[seaports, "Other", [1,0,0]] spawn A3A_fnc_createGarrison;

	} else {
		//Garrison save in wurzelformat, load it
		diag_log "WurzelGarrison found, loading it!";
		["wurzelGarrison"] call fn_LoadStat;
	};

	clearMagazineCargoGlobal boxX;
	clearWeaponCargoGlobal boxX;
	clearItemCargoGlobal boxX;
	clearBackpackCargoGlobal boxX;

	[] remoteExec ["A3A_fnc_statistics",[teamPlayer,civilian]];
	diag_log format ["%1: [Antistasi] | INFO | Persistent Load Completed.",servertime];
	diag_log format ["%1: [Antistasi] | INFO | Generating Map Markers.",servertime];
	["tasks"] call fn_LoadStat;
	if !(isMultiplayer) then {
		{//Can't we go around this using the initMarker? And only switching marker?
			_pos = getMarkerPos _x;
			_dmrk = createMarker [format ["Dum%1",_x], _pos];
			_dmrk setMarkerShape "ICON";
			[_x] call A3A_fnc_mrkUpdate;
			if (sidesX getVariable [_x,sideUnknown] != teamPlayer) then {
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
			if (sidesX getVariable [_x,sideUnknown] != teamPlayer) then {
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
			if (sidesX getVariable [_x,sideUnknown] != teamPlayer) then {
				_nul = [_x] call A3A_fnc_createControls;
			};
		} forEach factories;

		{
			_pos = getMarkerPos _x;
			_dmrk = createMarker [format ["Dum%1",_x], _pos];
			_dmrk setMarkerShape "ICON";
			_dmrk setMarkerType "loc_bunker";
			[_x] call A3A_fnc_mrkUpdate;
			if (sidesX getVariable [_x,sideUnknown] != teamPlayer) then {
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
			if (sidesX getVariable [_x,sideUnknown] != teamPlayer) then {
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
