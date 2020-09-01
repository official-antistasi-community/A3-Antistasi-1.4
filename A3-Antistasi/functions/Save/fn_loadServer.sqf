diag_log format ["%1: [Antistasi] | INFO | loadServer Starting.",servertime];
if (isServer) then {
	diag_log format ["%1: [Antistasi] | INFO | Starting Persistent Load.",servertime];
	petros allowdamage false;

	["savedPlayers"] call A3A_fnc_getStatVariable;
	["outpostsFIA"] call A3A_fnc_getStatVariable; publicVariable "outpostsFIA";
	["mrkSDK"] call A3A_fnc_getStatVariable;
	["mrkCSAT"] call A3A_fnc_getStatVariable;
	["difficultyX"] call A3A_fnc_getStatVariable;
	["gameMode"] call A3A_fnc_getStatVariable;
	["destroyedSites"] call A3A_fnc_getStatVariable;
	["minesX"] call A3A_fnc_getStatVariable;
	["attackCountdownOccupants"] call A3A_fnc_getStatVariable;
    ["attackCountdownInvaders"] call A3A_fnc_getStatVariable;
    ["countCA"] call A3A_fnc_getStatVariable;
	["antennas"] call A3A_fnc_getStatVariable;
	["hr"] call A3A_fnc_getStatVariable;
	["dateX"] call A3A_fnc_getStatVariable;
	["weather"] call A3A_fnc_getStatVariable;
	["prestigeOPFOR"] call A3A_fnc_getStatVariable;
	["prestigeBLUFOR"] call A3A_fnc_getStatVariable;
	["resourcesFIA"] call A3A_fnc_getStatVariable;
	["garrison"] call A3A_fnc_getStatVariable;
	["usesWurzelGarrison"] call A3A_fnc_getStatVariable;
	["skillFIA"] call A3A_fnc_getStatVariable;
	["distanceSPWN"] call A3A_fnc_getStatVariable;
	["civPerc"] call A3A_fnc_getStatVariable;
	["maxUnits"] call A3A_fnc_getStatVariable;
	["membersX"] call A3A_fnc_getStatVariable;
	["vehInGarage"] call A3A_fnc_getStatVariable;
	["destroyedBuildings"] call A3A_fnc_getStatVariable;
	["idlebases"] call A3A_fnc_getStatVariable;
	["idleassets"] call A3A_fnc_getStatVariable;
	["killZones"] call A3A_fnc_getStatVariable;
	["controlsSDK"] call A3A_fnc_getStatVariable;
	["bombRuns"] call A3A_fnc_getStatVariable;
	waitUntil {!isNil "arsenalInit"};
	["jna_dataList"] call A3A_fnc_getStatVariable;
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

	//Sort optics list so that snipers pick the right sight
	unlockedOptics = [unlockedOptics,[],{getNumber (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass")},"DESCEND"] call BIS_fnc_sortBy;

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

    //Load aggro stacks and level and calculate current level
    ["aggressionOccupants"] call A3A_fnc_getStatVariable;
	["aggressionInvaders"] call A3A_fnc_getStatVariable;
    [true] call A3A_fnc_calculateAggression;

	["chopForest"] call A3A_fnc_getStatVariable;

	/*
	{
	_buildings = nearestObjects [_x, listMilBld, 25, true];
	(_buildings select 1) setDamage 1;
	} forEach destroyedBuildings;
	*/

	["posHQ"] call A3A_fnc_getStatVariable;
	["nextTick"] call A3A_fnc_getStatVariable;
	["staticsX"] call A3A_fnc_getStatVariable;

	{_x setPos getMarkerPos respawnTeamPlayer} forEach ((call A3A_fnc_playableUnits) select {side _x == teamPlayer});
	_sites = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};

	//Isn't that just tierCheck.sqf?
//	tierWar = 1 + (floor (((5*({(_x in outposts) or (_x in resourcesX) or (_x in citiesX)} count _sites)) + (10*({_x in seaports} count _sites)) + (20*({_x in airportsX} count _sites)))/10));
//	if (tierWar > 10) then {tierWar = 10};
//	publicVariable "tierWar";

	tierPreference = 1;
	publicVariable "tierPreference";
	//Updating the preferences based on war level
//	[] call A3A_fnc_updatePreference;

	// update war tier silently, calls updatePreference if changed
	[true] call A3A_fnc_tierCheck;

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
		["wurzelGarrison"] call A3A_fnc_getStatVariable;
	};

    //Load state of testing timer
    ["testingTimerIsActive"] call A3A_fnc_getStatVariable;

	clearMagazineCargoGlobal boxX;
	clearWeaponCargoGlobal boxX;
	clearItemCargoGlobal boxX;
	clearBackpackCargoGlobal boxX;

	[] remoteExec ["A3A_fnc_statistics",[teamPlayer,civilian]];
	diag_log format ["%1: [Antistasi] | INFO | Persistent Load Completed.",servertime];
	diag_log format ["%1: [Antistasi] | INFO | Generating Map Markers.",servertime];
	["tasks"] call A3A_fnc_getStatVariable;
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
	};
	statsLoaded = 0; publicVariable "statsLoaded";
	placementDone = true; publicVariable "placementDone";
	petros allowdamage true;
};
diag_log format ["%1: [Antistasi] | INFO | loadServer Completed.",servertime];
