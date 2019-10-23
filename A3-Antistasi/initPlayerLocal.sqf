if (hasInterface) then
	{
	waitUntil {!isNull player};
	waitUntil {player == player};
	player removeweaponGlobal "itemmap";
	player removeweaponGlobal "itemgps";
	};
if (isMultiplayer) then
	{
	if (!isServer) then
		{
		call compile preprocessFileLineNumbers "initFuncs.sqf";
		call compile preprocessFileLineNumbers "initVar.sqf";
		waitUntil {!isNil "initVar"}; diag_log format ["Antistasi MP Client. initVar is public. Version %1",antistasiVersion];
		}
	else
		{
		waitUntil {sleep 0.5;(!isNil "serverInitDone")};
		};
	[] execVM "briefing.sqf";
	};
if (!hasInterface) exitWith
	{
	if (worldName == "Tanoa") then {call compile preprocessFileLineNumbers "roadsDB.sqf"} else {if (worldName == "Altis") then {call compile preprocessFileLineNumbers "roadsDBAltis.sqf"}};
	[clientOwner] remoteExec ["A3A_fnc_addHC",2];
	};
_isJip = _this select 1;
if (isMultiplayer) then
	{
	if (side player == buenos) then {player setVariable ["elegible",true,true]};
	musicON = false;
	//waitUntil {scriptdone _introshot};
	disableUserInput true;
	cutText ["Waiting for Players and Server Init","BLACK",0];
	diag_log "Antistasi MP Client. Waiting for serverInitDone";
	waitUntil {(!isNil "serverInitDone")};
	cutText ["Starting Mission","BLACK IN",0];
	diag_log "Antistasi MP Client. serverInitDone is public";
	diag_log format ["Antistasi MP Client: JIP?: %1",_isJip];
	if (hayTFAR) then {[] execVM "orgPlayers\radioJam.sqf"};//reestablecer cuando controle las variables
	tkPunish = if (paramsArray select 5 == 1) then {true} else {false};
	if ((side player == buenos) and tkPunish) then
		{
		player addEventHandler ["Fired",
			{
			_tipo = _this select 1;
			if ((_tipo == "Put") or (_tipo == "Throw")) then
				{
				if (player distance petros < 50) then
					{
					deleteVehicle (_this select 6);
					if (_tipo == "Put") then
						{
						if (player distance petros < 10) then {[player,60] spawn A3A_fnc_castigo};
						};
					};
				};
			}];
		};
	if (!isNil "placementDone") then {_isJip = true};//workaround for BIS fail on JIP detection
	}
else
	{
	theBoss = player;
	grupo = group player;
	if (worldName == "Tanoa") then {grupo setGroupId ["Pulu","GroupColor4"]} else {grupo setGroupId ["Stavros","GroupColor4"]};
	player setIdentity "protagonista";
	player setUnitRank "COLONEL";
	player hcSetGroup [group player];
	waitUntil {/*(scriptdone _introshot) and */(!isNil "serverInitDone")};
	//_nul = addMissionEventHandler ["Loaded", {_nul = [] execVM "statistics.sqf";_nul = [] execVM "reinitY.sqf";}];
	};
[] execVM "CREATE\ambientCivs.sqf";
private ["_colorbuenos", "_colormuyMalos"];
_colorbuenos = buenos call BIS_fnc_sideColor;
_colormuyMalos = muyMalos call BIS_fnc_sideColor;
_posicion = if (side player == side (group petros)) then {position petros} else {getMarkerPos "respawn_west"};
{
_x set [3, 0.33]
} forEach [_colorbuenos, _colormuyMalos];
_introShot =
	[
    _posicion, // Target position
    format ["%1",worldName], // SITREP text
    50, //  altitude
    50, //  radius
    90, //  degrees viewing angle
    0, // clockwise movement
    [
    	["\a3\ui_f\data\map\markers\nato\o_inf.paa", _colorbuenos, markerPos "insertMrk", 1, 1, 0, "Insertion Point", 0],
        ["\a3\ui_f\data\map\markers\nato\o_inf.paa", _colormuyMalos, markerPos "towerBaseMrk", 1, 1, 0, "Radio Towers", 0]
    ]
    ] spawn BIS_fnc_establishingShot;

_titulo = if (worldName == "Tanoa") then {["Warlords of the Pacific","by Barbolani",antistasiVersion] spawn BIS_fnc_infoText} else {if (hayIFA) then {["Armia Krajowa","by Barbolani",antistasiVersion] spawn BIS_fnc_infoText} else {["Antistasi","by Barbolani",antistasiVersion] spawn BIS_fnc_infoText}};
disableUserInput false;
player addWeaponGlobal "itemmap";
if !(hayIFA) then {player addWeaponGlobal "itemgps"};
if (isMultiplayer) then
	{
	if (paramsArray select 8 == 1) then {[] execVM "playerMarkers.sqf"};
	};
if (!hayACE) then
	{
	[player] execVM "Revive\initRevive.sqf";
	tags = [] execVM "tags.sqf";
	}
else
	{
	if (hayACEhearing) then {player addItem "ACE_EarPlugs"};
	if (!hayACEMedical) then {[player] execVM "Revive\initRevive.sqf"};
	};

if (player getVariable ["pvp",false]) exitWith
	{
	moto = objNull;
	pvpEnabled = if (paramsArray select 7 == 1) then {true} else {false};
	if ((!_isJIP) or !pvpEnabled) then
		{
		["noPvP",false,1,false,false] call BIS_fnc_endMission;
		diag_log "Antistasi: PvP player kicked because he is not jipping or PvP slots are disabled";
		}
	else
		{
		if (not([player] call A3A_fnc_isMember)) then
			{
			["noPvP",false,1,false,false] call BIS_fnc_endMission;
			diag_log "Antistasi: PvP player kicked because he is not member";
			}
		else
			{
			if ({(side group _x != buenos)} count playableUnits > {(side group _x == buenos)} count playableUnits) then
				{
				["noPvP",false,1,false,false] call BIS_fnc_endMission;
				diag_log "Antistasi: PvP player kicked because PvP players number is equal to non PvP";
				}
			else
				{
				[player] remoteExec ["A3A_fnc_playerHasBeenPvPCheck",2];
				diag_log "Antistasi: PvP player logged in, doing server side checks if the player has been rebel recently";
				};
			};
		};
	if (side player == malos) then
		{
		player setVariable ["BLUFORSpawn",true,true];
		if (activeUSAF) then {[player] call A3A_fnc_RHSdress};
		}
	else
		{
		player setVariable ["OPFORSpawn",true,true]
		};
	if (hayACE) then {[] call A3A_fnc_ACEpvpReDress};
	respawnBuenos setMarkerAlphaLocal 0;
	player addEventHandler ["GetInMan",
		{
		private ["_unit","_veh"];
		_unit = _this select 0;
		_veh = _this select 2;
		if (_veh != moto) then
			{
			if !((typeOf _veh) in (vehNATOLightUnarmed + vehCSATLightUnarmed)) then
				{
				moveOut player;
				hint "PvP player are only allowed to use their own or other PvP player vehicles";
				};
			};
		}];
	player addEventHandler ["InventoryOpened",
		{
		_override = false;
		_caja = typeOf (_this select 1);
		if ((_caja == NATOAmmoBox) or (_caja == CSATAmmoBox)) then {_override = true};
		_override
		}];
	_nombre = if (side player == malos) then {nameMalos} else {nameMuyMalos};
	["TaskFailed", ["", format ["%1 joined %2 SpecOps",name player,_nombre]]] remoteExec ["BIS_fnc_showNotification",[buenos,civilian]];
	waituntil {!isnull (finddisplay 46)};
	gameMenu = (findDisplay 46) displayAddEventHandler ["KeyDown",
		{
		_handled = FALSE;
		if (_this select 1 == 207) then
			{
			if (!hayACEhearing) then
				{
				if (soundVolume <= 0.5) then
					{
					0.5 fadeSound 1;
					hintSilent "You've taken out your ear plugs.";
					}
				else
					{
					0.5 fadeSound 0.1;
					hintSilent "You've inserted your ear plugs.";
					};
				};
			}
		else
			{
			if (_this select 1 == 21) then
				{
				closedialog 0;
				_nul = createDialog "NATO_player";
				};
			};
		_handled
		}];
	};

player setVariable ["owner",player,true];
player setVariable ["punish",0,true];
player setVariable ["dinero",100,true];
player setVariable ["GREENFORSpawn",true,true];
player setVariable ["rango",rank player,true];

rezagados = creategroup buenos;
(group player) enableAttack false;
player setUnitTrait ["camouflageCoef",0.8];
player setUnitTrait ["audibleCoef",0.8];

if (activeGREF) then {[player] call A3A_fnc_RHSdress};
player setvariable ["compromised",0];
player addEventHandler ["FIRED",
	{
	_player = _this select 0;
	if (captive _player) then
		{
		//if ({((side _x== muyMalos) or (side _x== malos)) and (_x knowsAbout player > 1.4)} count allUnits > 0) then
		if ({if (((side _x == malos) or (side _x == muyMalos)) and (_x distance player < 300)) exitWith {1}} count allUnits > 0) then
			{
			[_player,false] remoteExec ["setCaptive",0,_player];
			_player setCaptive false;
			}
		else
			{
			_ciudad = [ciudades,_player] call BIS_fnc_nearestPosition;
			_size = [_ciudad] call A3A_fnc_sizeMarker;
			_datos = server getVariable _ciudad;
			if (random 100 < _datos select 2) then
				{
				if (_player distance getMarkerPos _ciudad < _size * 1.5) then
					{
					[_player,false] remoteExec ["setCaptive",0,_player];
					_player setCaptive false;
					if (vehicle _player != _player) then
						{
						{if (isPlayer _x) then {[_x,false] remoteExec ["setCaptive",0,_x]; _x setCaptive false}} forEach ((assignedCargo (vehicle _player)) + (crew (vehicle _player)) - [player]);
						};
					};
				};
			};
		}
	}
	];
player addEventHandler ["InventoryOpened",
	{
	private ["_jugador","_contenedor","_tipo"];
	_control = false;
	_jugador = _this select 0;
	if (captive _jugador) then
		{
		_contenedor = _this select 1;
		_tipo = typeOf _contenedor;
		if (((_contenedor isKindOf "Man") and (!alive _contenedor)) or (_tipo == NATOAmmoBox) or (_tipo == CSATAmmoBox)) then
			{
			if ({if (((side _x== muyMalos) or (side _x== malos)) and (_x knowsAbout _jugador > 1.4)) exitWith {1}} count allUnits > 0) then
				{
				[_jugador,false] remoteExec ["setCaptive",0,_jugador];
				_jugador setCaptive false;
				}
			else
				{
				_ciudad = [ciudades,_jugador] call BIS_fnc_nearestPosition;
				_size = [_ciudad] call A3A_fnc_sizeMarker;
				_datos = server getVariable _ciudad;
				if (random 100 < _datos select 2) then
					{
					if (_jugador distance getMarkerPos _ciudad < _size * 1.5) then
						{
						[_jugador,false] remoteExec ["setCaptive",0,_jugador];
						_jugador setCaptive false;
						};
					};
				};
			};
		};
	_control
	}];
/*
player addEventHandler ["InventoryClosed",
	{
	_control = false;
	_uniform = uniform player;
	_typeSoldier = getText (configfile >> "CfgWeapons" >> _uniform >> "ItemInfo" >> "uniformClass");
	_sideType = getNumber (configfile >> "CfgVehicles" >> _typeSoldier >> "side");
	if ((_sideType == 1) or (_sideType == 0) and (_uniform != "")) then
		{
		if !(player getVariable ["disfrazado",false]) then
			{
			hint "You are wearing an enemy uniform, this will make the AI attack you. Beware!";
			player setVariable ["disfrazado",true];
			player addRating (-1*(2001 + rating player));
			};
		}
	else
		{
		if (player getVariable ["disfrazado",false]) then
			{
			hint "You removed your enemy uniform";
			player addRating (rating player * -1);
			};
		};
	_control
	}];
*/
player addEventHandler ["HandleHeal",
	{
	_player = _this select 0;
	if (captive _player) then
		{
		if ({((side _x== muyMalos) or (side _x== malos)) and (_x knowsAbout player > 1.4)} count allUnits > 0) then
			{
			[_player,false] remoteExec ["setCaptive",0,_player];
			_player setCaptive false;
			}
		else
			{
			_ciudad = [ciudades,_player] call BIS_fnc_nearestPosition;
			_size = [_ciudad] call A3A_fnc_sizeMarker;
			_datos = server getVariable _ciudad;
			if (random 100 < _datos select 2) then
				{
				if (_player distance getMarkerPos _ciudad < _size * 1.5) then
					{
					[_player,false] remoteExec ["setCaptive",0,_player];
					_player setCaptive false;
					};
				};
			};
		}
	}
	];
player addEventHandler ["WeaponAssembled",
	{
	private ["_veh"];
	_veh = _this select 1;
	if (_veh isKindOf "StaticWeapon") then
		{
		if (not(_veh in staticsToSave)) then
			{
			staticsToSave pushBack _veh;
			publicVariable "staticsToSave";
			[_veh] call A3A_fnc_AIVEHinit;
			};
		_marcadores = marcadores select {lados getVariable [_x,sideUnknown] == buenos};
		_pos = position _veh;
		if (_marcadores findIf {_pos inArea _x} != -1) then {hint "Static weapon has been deployed for use in a nearby zone, and will be used by garrison militia if you leave it here the next time the zone spawns"};
		}
	else
		{
		_veh addEventHandler ["Killed",{[_this select 0] remoteExec ["A3A_fnc_postmortem",2]}];
		};
	}];
player addEventHandler ["WeaponDisassembled",
		{
		_bag1 = _this select 1;
		_bag2 = _this select 2;
		//_bag1 = objectParent (_this select 1);
		//_bag2 = objectParent (_this select 2);
		[_bag1] call A3A_fnc_AIVEHinit;
		[_bag2] call A3A_fnc_AIVEHinit;
		}
	];

player addEventHandler ["GetInMan",
	{
	private ["_unit","_veh"];
	_unit = _this select 0;
	_veh = _this select 2;
	_exit = false;
	if (isMultiplayer) then
		{
		if !([player] call A3A_fnc_isMember) then
			{
			_owner = _veh getVariable "duenyo";
			if (!isNil "_owner") then
				{
				if (_owner isEqualType "") then
					{
					if ({getPlayerUID _x == _owner} count (units group player) == 0) then
						{
						hint "You cannot board other player vehicle if you are not in the same group";
						moveOut _unit;
						_exit = true;
						};
					};
				};
			};
		};
	if (!_exit) then
		{
		if (((typeOf _veh) in arrayCivVeh) or ((typeOf _veh) in civBoats)) then
			{
			if (!(_veh in reportedVehs)) then
				{
				[] spawn A3A_fnc_undercover;
				};
			};
		};
	}
	];

if (isMultiplayer) then
	{
	["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;//Exec on client
	["InitializeGroup", [player,buenos,true]] call BIS_fnc_dynamicGroups;
	membershipEnabled = if (paramsArray select 3 == 1) then {true} else {false};
	personalGarage = [];
	if (membershipEnabled) then
		{
		if !([player] call A3A_fnc_isMember) then
			{
			if (isServer) then
				{
				miembros pushBack (getPlayerUID player);
				publicVariable "miembros";
				};
			_nonMembers = {(side group _x == buenos) and !([_x] call A3A_fnc_isMember)} count playableUnits;
			if (_nonMembers >= (playableSlotsNumber buenos) - bookedSlots) then {["memberSlots",false,1,false,false] call BIS_fnc_endMission};
			if (memberDistance != 16000) then {[] execVM "orgPlayers\nonMemberDistance.sqf"};
			};
		};
	};

waitUntil {scriptdone _introshot};
if (_isJip) then
	{
	_nul = [] execVM "modBlacklist.sqf";
	//player setVariable ["score",0,true];
	//player setVariable ["owner",player,true];
	player setVariable ["punish",0,true];
	player setUnitRank "PRIVATE";
	waitUntil {!isNil "posHQ"};
	player setPos posHQ;
	[true] execVM "reinitY.sqf";
	if (not([player] call A3A_fnc_isMember)) then
		{
		if ((serverCommandAvailable "#logout") or (isServer)) then
			{
			miembros pushBack (getPlayerUID player);
			publicVariable "miembros";
			hint "You are not in the member's list, but as you are Server Admin, you have been added up. Welcome!"
			}
		else
			{
			hint "Welcome Guest\n\nYou have joined this server as guest";
			//if ((count playableUnits == maxPlayers) and (({[_x] call A3A_fnc_isMember} count playableUnits) < count miembros) and (serverName in servidoresOficiales)) then {["serverFull",false,1,false,false] call BIS_fnc_endMission};
			};
		}
	else
		{
		hint format ["Welcome back %1", name player];
		if ({([_x] call A3A_fnc_isMember) and (side (group _x) == buenos)} count playableUnits == 1) then
			{
			[player] call A3A_fnc_theBossInit;
			[] remoteExec ["A3A_fnc_assigntheBoss",2];
			};
		};
	waitUntil {!(isNil "misiones")};
	if (count misiones > 0) then
		{
		{
		_tsk = _x select 0;
		if ([_tsk] call BIS_fnc_taskExists) then
			{
			_state = _x select 1;
			if ((_tsk call BIS_fnc_taskState) != _state) then
				{
				/*
				_tskVar = _tsk call BIS_fnc_taskVar;
				_tskVar setTaskState _state;
				*/
				[_tsk,_state] call bis_fnc_taskSetState;
				};
			};
		} forEach misiones;
		};
	if (isNil "placementDone") then
		{
		waitUntil {!isNil "theBoss"};
		if (player == theBoss) then
		    {
		    waitUntil {!(isNil"loadLastSave")};
		    if !(loadLastSave) then
	    		{
	    		_nul = [] spawn A3A_fnc_placementSelection;
	    		};
			};
		}
	else
		{
		_nul = [] execVM "Dialogs\firstLoad.sqf";
		};
	diag_log "Antistasi MP Client. JIP client finished";
	player setPos (getMarkerPos respawnBuenos);
	}
else
	{
	if (isNil "placementDone") then
		{
		waitUntil {!isNil "theBoss"};
		if (player == theBoss) then
		    {
		    player setVariable ["score", 25,true];
		    if (isMultiplayer) then
		    	{
		    	HC_comandante synchronizeObjectsAdd [player];
				player synchronizeObjectsAdd [HC_comandante];
		    	//_nul = [] execVM "Dialogs\initMenu.sqf";
		    	if !(loadLastSave) then
		    		{
		    		_nul = [] spawn A3A_fnc_placementSelection;
		    		}
		    	else
		    		{
		    		_nul = [true] execVM "Dialogs\firstLoad.sqf";
			    	};
		    	diag_log "Antistasi MP Client. Client finished";
		    	}
		    else
		    	{
		    	miembros = [];
		    	player setUnitTrait ["medic",true];
		    	player setUnitTrait ["engineer",true];
		    	 _nul = [] execVM "Dialogs\firstLoad.sqf";
		    	};
		    }
		else
			{
			player setVariable ["score", 0,true];
			_nul = [true] execVM "Dialogs\firstLoad.sqf";
			player setPos (getMarkerPos respawnBuenos);
			};
		}
	else
		{
		if !(isServer) then
			{
			_nul = [] execVM "Dialogs\firstLoad.sqf";
			player setPos (getMarkerPos respawnBuenos);
			};
		};
	};
waitUntil {scriptDone _titulo};

// _texto = [];

// if ((hayTFAR) or (hayACRE)) then
// 	{
// 	_texto = ["TFAR or ACRE Detected\n\nAntistasi detects TFAR or ACRE in the server config.\nAll players will start with addon default radios.\nDefault revive system will shut down radios while players are inconscious.\n\n"];
// 	};
// if (hayACE) then
// 	{
// 	_texto = _texto + ["ACE 3 Detected\n\nAntistasi detects ACE modules in the server config.\nACE items added to arsenal and ammoboxes. Default AI control is disabled\nIf ACE Medical is used, default revive system will be disabled.\nIf ACE Hearing is used, default earplugs will be disabled."];
// 	};
// if (hayRHS) then
// 	{
// 	_texto = _texto + ["RHS Detected\n\nAntistasi detects RHS in the server config.\nDepending on the modules will have the following effects.\n\nAFRF: Replaces CSAT by a mix of russian units\n\nUSAF: Replaces NATO by a mix of US units\n\nGREF: Recruited AI will count with RHS as basic weapons, replaces FIA with Chdk units. Adds some civilian trucks"];
// 	};
// if (hayFFAA) then
// 	{
// 	_texto = _texto + ["FFAA Detected\n\nAntistasi detects FFAA in the server config.\nFIA Faction will be replaced by Spanish Armed Forces"];
// 	};
//
// if (hayTFAR or hayACE or hayRHS or hayACRE or hayFFAA) then
// 	{
// 	[_texto] spawn
// 		{
// 		sleep 0.5;
// 		_texto = _this select 0;
// 		"Integrated Mods Detected" hintC _texto;
// 		hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
// 			0 = _this spawn {
// 				_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
// 				hintSilent "";
// 			};
// 			}];
// 		};
// 	};

waituntil {!isnull (finddisplay 46)};
gameMenu = (findDisplay 46) displayAddEventHandler ["KeyDown",A3A_fnc_teclas];
//removeAllActions caja;

if ((!isServer) and (isMultiplayer)) then {caja call jn_fnc_arsenal_init};

caja allowDamage false;
caja addAction ["Transfer Vehicle cargo to Ammobox", "[] call A3A_fnc_vaciar"];
caja addAction ["Move this asset", "moveHQObject.sqf",nil,0,false,true,"","(_this == theBoss)"];
bandera addAction ["HQ Management", {[] execVM "Dialogs\dialogHQ.sqf"},nil,0,false,true,"","(_this == theBoss) and (petros == leader group petros)"];
bandera allowDamage false;
bandera addAction ["Unit Recruitment", {if ([player,300] call A3A_fnc_enemyNearCheck) then {hint "You cannot recruit units while there are enemies near you"} else {nul=[] execVM "Dialogs\unit_recruit.sqf"}},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == buenos)"];
bandera addAction ["Buy Vehicle", {if ([player,300] call A3A_fnc_enemyNearCheck) then {hint "You cannot buy vehicles while there are enemies near you"} else {nul = createDialog "vehicle_option"}},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == buenos)"];
if (isMultiplayer) then {bandera addAction ["Personal Garage", {nul = [true] spawn A3A_fnc_garage},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == buenos)"]};
bandera addAction ["Move this asset", "moveHQObject.sqf",nil,0,false,true,"","(_this == theBoss)"];
cajaVeh allowDamage false;
cajaveh addAction ["Heal, Repair and Rearm", "healandrepair.sqf",nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == buenos)"];
cajaveh addAction ["Move this asset", "moveHQObject.sqf",nil,0,false,true,"","(_this == theBoss)"];

fuego allowDamage false;
fuego addAction ["Rest for 8 Hours", "skiptime.sqf",nil,0,false,true,"","(_this == theBoss)"];
fuego addAction ["Clear Nearby Forest", "clearForest.sqf",nil,0,false,true,"","_this == theBoss"];
fuego addAction ["On\Off Lamp", "onOffLamp.sqf",nil,0,false,true,"","(isPlayer _this) and (side (group _this) == buenos)"];
fuego addAction ["I hate the fog", "[10,0] remoteExec [""setFog"",2]",nil,0,false,true,"","(_this == theBoss)"];
mapa allowDamage false;
mapa addAction ["Game Options", {hint format ["Antistasi - %2\n\nVersion: %1\n\nDifficulty: %3\nUnlock Weapon Number: %4\nLimited Fast Travel: %5",antistasiVersion,worldName,if (skillMult == 1) then {"Normal"} else {if (skillMult == 0.5) then {"Easy"} else {"Hard"}},minWeaps,if (limitedFT) then {"Yes"} else {"No"}]; nul=CreateDialog "game_options";},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == buenos)"];
mapa addAction ["Map Info", {nul = [] execVM "cityinfo.sqf";},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == buenos)"];
mapa addAction ["Move this asset", "moveHQObject.sqf",nil,0,false,true,"","(_this == theBoss)"];
if (isMultiplayer) then {mapa addAction ["AI Load Info", "[] remoteExec [""A3A_fnc_AILoadInfo"",2]",nil,0,false,true,"","(_this == theBoss)"]};
_nul = [player] execVM "OrgPlayers\unitTraits.sqf";
grupoPetros = group petros;
grupoPetros setGroupIdGlobal ["Petros","GroupColor4"];
petros setIdentity "amiguete";
petros setName "Petros";
petros disableAI "MOVE";
petros disableAI "AUTOTARGET";
petros addAction ["Mission Request", {nul=CreateDialog "mission_menu";},nil,0,false,true,"","_this == theBoss"];

disableSerialization;
//1 cutRsc ["H8erHUD","PLAIN",0,false];
_layer = ["estadisticas"] call bis_fnc_rscLayer;
_layer cutRsc ["H8erHUD","PLAIN",0,false];
[] spawn A3A_fnc_statistics;