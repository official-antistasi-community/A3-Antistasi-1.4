#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

//Make sure logLevel is always initialised.
//This should be overridden by the server, as appropriate. Hence the nil check.
if (isNil "logLevel") then { logLevel = 2; A3A_logDebugConsole = 1 };

Info("initClient started");
Info_1("Client version: %1", QUOTE(VERSION));

// *************************** Client pre-setup init *******************************

if (call A3A_fnc_modBlacklist) exitWith {};

//Disables rabbits and snakes, because they cause the log to be filled with "20:06:39 Ref to nonnetwork object Agent 0xf3b4a0c0"
//Can re-enable them if we find the source of the bug.
enableEnvironment [false, true];

// TODO: May need to strip players?
// TODO: May need to disable damage, but tricky if we're not sure when the player exists?

if !(isServer) then {
    call A3A_fnc_initVarCommon;

    Info("Running client JNA preload");
    ["Preload"] call jn_fnc_arsenal;

    // Headless client navgrid init
    if (!hasInterface) then {
        Info("Headless client UPSMON init started");
        [] call compile preprocessFileLineNumbers QPATHTOFOLDER(Scripts\Init_UPSMON.sqf);
        Info("Headless client UPSMON init completed");

        call A3A_fnc_loadNavGrid;
        waitUntil { sleep 0.1; !isNil "serverInitDone" };			// addNodesNearMarkers needs marker lists
        call A3A_fnc_addNodesNearMarkers;
    };
};

waitUntil { sleep 0.1; !isNil "serverInitDone" };

//****************************************************************

Info("Server started, continuing with client init");

call A3A_fnc_installSchrodingersBuildingFix;

if (!isServer) then {
    // get server to send us the current destroyedBuildings list, hide them locally
    "destroyedBuildings" addPublicVariableEventHandler {
        { hideObject _x } forEach (_this select 1);
    };
    [clientOwner, "destroyedBuildings"] remoteExecCall ["publicVariableClient", 2];

    boxX call jn_fnc_arsenal_init;
    if (A3A_hasACEMedical) then { call A3A_fnc_initACEUnconsciousHandler };
};

// Headless clients register with server and bail out at this point
if (!isServer and !hasInterface) exitWith {
    [clientOwner] remoteExecCall ["A3A_fnc_addHC",2];
};

waitUntil {local player};

[] spawn A3A_fnc_briefing;

// Placeholders, should get replaced globally by the server
player setVariable ["score",0];
player setVariable ["moneyX",0];
player setVariable ["rankX",rank player];

player setVariable ["owner",player,true];
player setVariable ["punish",0,true];

player setVariable ["eligible",player call A3A_fnc_isMember,true];
player setVariable ["A3A_playerUID",getPlayerUID player,true];			// Mark so that commander routines know for remote-controlling

musicON = false;
recruitCooldown = 0;			//Prevents units being recruited too soon after being dismissed.
incomeRep = false;
autoHeal = true;				//Should AI in player squad automatically heal teammates

player setPos (getMarkerPos respawnTeamPlayer);
player setVariable ["spawner",true,true];

if (A3A_hasTFAR || A3A_hasTFARBeta) then {
    [] spawn A3A_fnc_radioJam;
};

[] spawn A3A_fnc_ambientCivs;

if (isMultiplayer && {playerMarkersEnabled}) then {
    [] spawn A3A_fnc_playerMarkers;
};

[player] spawn A3A_fnc_initRevive;		// with ACE medical, only used for helmet popping & TK checks
[] spawn A3A_fnc_outOfBounds;
[] spawn A3A_fnc_darkMapFix;
[] spawn A3A_fnc_clientIdleChecker;

if (!A3A_hasACE) then {
    [] spawn A3A_fnc_tags;
};


stragglers = creategroup teamPlayer;
(group player) enableAttack false;

if (isNil "ace_noradio_enabled" or {!ace_noradio_enabled}) then {
    [player, nil, selectRandom (A3A_faction_reb get "voices")] call BIS_fnc_setIdentity
};
//Give the player the base loadout.
[player] call A3A_fnc_dress;

player setvariable ["compromised",0];
player addEventHandler ["FiredMan", {
    _player = _this select 0;
    if (captive _player) then {
        //if ({((side _x== Invaders) or (side _x== Occupants)) and (_x knowsAbout player > 1.4)} count allUnits > 0) then
        if ({if (((side _x == Occupants) or (side _x == Invaders)) and (_x distance player < 300)) exitWith {1}} count allUnits > 0) then {
            [_player,false] remoteExec ["setCaptive",0,_player];
            _player setCaptive false;
        }
        else {
            _city = [citiesX,_player] call BIS_fnc_nearestPosition;
            _size = [_city] call A3A_fnc_sizeMarker;
            _dataX = server getVariable _city;
            if (random 100 < _dataX select 2) then {
                if (_player distance getMarkerPos _city < _size * 1.5) then {
                    [_player,false] remoteExec ["setCaptive",0,_player];
                    _player setCaptive false;
                    if (vehicle _player != _player) then {
                        {if (isPlayer _x) then {[_x,false] remoteExec ["setCaptive",0,_x]; _x setCaptive false}} forEach ((assignedCargo (vehicle _player)) + (crew (vehicle _player)) - [player]);
                    };
                };
            };
        };
    };
}];
player addEventHandler ["InventoryOpened", {
    private ["_playerX","_containerX","_typeX"];
    _control = false;
    _playerX = _this select 0;
    if (captive _playerX) then {
        _containerX = _this select 1;
        _typeX = typeOf _containerX;
        if (((_containerX isKindOf "Man") and (!alive _containerX)) or (_typeX in [A3A_faction_occ get "ammobox", A3A_faction_inv get "ammobox"])) then {
            if ({if (((side _x== Invaders) or (side _x== Occupants)) and (_x knowsAbout _playerX > 1.4)) exitWith {1}} count allUnits > 0) then{
                [_playerX,false] remoteExec ["setCaptive",0,_playerX];
                _playerX setCaptive false;
            }
            else {
                _city = [citiesX,_playerX] call BIS_fnc_nearestPosition;
                _size = [_city] call A3A_fnc_sizeMarker;
                _dataX = server getVariable _city;
                if (random 100 < _dataX select 2) then {
                    if (_playerX distance getMarkerPos _city < _size * 1.5) then {
                        [_playerX,false] remoteExec ["setCaptive",0,_playerX];
                        _playerX setCaptive false;
                    };
                };
            };
        };
    };
    _control
}];
/*
player addEventHandler ["InventoryClosed", {
    _control = false;
    _uniform = uniform player;
    _typeSoldier = getText (configfile >> "CfgWeapons" >> _uniform >> "ItemInfo" >> "uniformClass");
    _sideType = getNumber (configfile >> "CfgVehicles" >> _typeSoldier >> "side");
    if ((_sideType == 1) or (_sideType == 0) and (_uniform != "")) then {
        if !(player getVariable ["disguised",false]) then {
            hint "You are wearing an enemy uniform, this will make the AI attack you. Beware!";
            player setVariable ["disguised",true];
            player addRating (-1*(2001 + rating player));
        };
    }
    else {
        if (player getVariable ["disguised",false]) then {
            hint "You removed your enemy uniform";
            player addRating (rating player * -1);
        };
    };
    _control
}];
*/
player addEventHandler ["HandleHeal", {
    _player = _this select 0;
    if (captive _player) then {
        if ({((side _x== Invaders) or (side _x== Occupants)) and (_x knowsAbout player > 1.4)} count allUnits > 0) then {
            [_player,false] remoteExec ["setCaptive",0,_player];
            _player setCaptive false;
        }
        else {
            _city = [citiesX,_player] call BIS_fnc_nearestPosition;
            _size = [_city] call A3A_fnc_sizeMarker;
            _dataX = server getVariable _city;
            if (random 100 < _dataX select 2) then {
                if (_player distance getMarkerPos _city < _size * 1.5) then {
                    [_player,false] remoteExec ["setCaptive",0,_player];
                    _player setCaptive false;
                };
            };
        };
    };
}];

// notes:
// Static weapon objects are persistent through assembly/disassembly
// The bags are not persistent, object IDs change each time
// Static weapon position seems to follow bag1, but it's not an attached object
// Can use objectParent to identify backpack of static weapon

player addEventHandler ["WeaponAssembled", {
    private _veh = _this select 1;
    [_veh, teamPlayer] call A3A_fnc_AIVEHinit;		// will flip/capture if already initialized
    if (_veh isKindOf "StaticWeapon") then {
        if (not(_veh in staticsToSave)) then {
            staticsToSave pushBack _veh;
            publicVariable "staticsToSave";
        };
        _markersX = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
        _pos = position _veh;
        [_veh] call A3A_fnc_logistics_addLoadAction;
        if (_markersX findIf {_pos inArea _x} != -1) then {["Static Deployed", "Static weapon has been deployed for use in a nearby zone, and will be used by garrison militia if you leave it here the next time the zone spawns."] call A3A_fnc_customHint;};
    };
}];

player addEventHandler ["WeaponDisassembled", {
    private _bag1 = _this select 1;
    private _bag2 = _this select 2;
    //_bag1 = objectParent (_this select 1);
    //_bag2 = objectParent (_this select 2);
    [_bag1] remoteExec ["A3A_fnc_postmortem", 2];
    [_bag2] remoteExec ["A3A_fnc_postmortem", 2];
}];

player addEventHandler ["GetInMan", {
    private ["_unit","_veh"];
    _unit = _this select 0;
    _veh = _this select 2;
    _exit = false;
    if !([player] call A3A_fnc_isMember) then {
        if (!isNil {_veh getVariable "A3A_locked"}) then {
            _owner = _veh getVariable "ownerX";
            if ({getPlayerUID _x == _owner} count (units group player) == 0) then {
                ["Warning", "This Vehicle is locked, ask the Owner to unlock it."] call A3A_fnc_customHint;
                moveOut _unit;
                _exit = true;
            };
        };
    };
    if (!_exit) then {
        if ((typeOf _veh) in undercoverVehicles) then {
            if !(_veh getVariable ["A3A_reported", false]) then {
                [] spawn A3A_fnc_goUndercover;
            };
        };
    };
}];

if (A3A_hasACE) then {
    ["ace_explosives_place", {
        params ["_explosive","_dir","_pitch","_unit"];
        if (_unit == player) then { player setCaptive false };
    }] call CBA_fnc_addEventHandler;
};

// Prevent players getting shot by their own AIs. EH is respawn-persistent
player addEventHandler ["HandleRating", {0}];

call A3A_fnc_initUndercover;

["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;//Exec on client
if (membershipEnabled) then {
    if (player call A3A_fnc_isMember) exitWith {};

    private _isMember = false;
    if (isServer) then {
        _isMember = true;
    };
    if (serverCommandAvailable "#logout") then {
        _isMember = true;
        ["General Info", "You are not in the member's list, but as you are Server Admin, you have been added. Welcome!"] call A3A_fnc_customHint;
    };

    if (_isMember) then {
        membersX pushBack (getPlayerUID player);				// potential race condition, but there's only one admin so chance of hitting this is low
        publicVariable "membersX";
    } else {
        private _nonMembers = {_x call A3A_fnc_isMember} count (call A3A_fnc_playableUnits);
        if (_nonMembers >= (playableSlotsNumber teamPlayer) - bookedSlots) then {["memberSlots",false,1,false,false] call BIS_fnc_endMission};
        [] spawn A3A_fnc_playerLeash;

        ["General Info", "Welcome Guest<br/><br/>You have joined this server as guest."] call A3A_fnc_customHint;
    };
};

// Make player group leader, because if they disconnected with AI squadmates, they may not be
// In this case, the group will also no longer be local, so we need the remoteExec
if !(isPlayer leader group player) then {
    [group player, player] remoteExec ["selectLeader", groupOwner group player];
};

[] remoteExecCall ["A3A_fnc_assignBossIfNone", 2];


if (isServer || player isEqualTo theBoss || (call BIS_fnc_admin) > 0) then {  // Local Host || Commander || Dedicated Admin
    private _modsAndLoadText = [
        [A3A_hasTFAR || A3A_hasTFARBeta,"TFAR","Players will use TFAR radios. Unconscious players' radios will be muted."],
        [A3A_hasACRE,"ACRE","Players will use ACRE radios. Unconscious players' radios will be muted."],
        [A3A_hasACE,"ACE 3","ACE items added to arsenal and ammo-boxes."],
        [A3A_hasACEMedical,"ACE 3 Medical","Default revive system will be disabled."]
    ] select {_x#0};

    private _loadedTemplateInfoXML = A3A_loadedTemplateInfoXML apply {[true,_x#0,_x#1]};	// Remove and simplify when the list above is empty and can be deleted.
    _modsAndLoadText append _loadedTemplateInfoXML;

    if (count _modsAndLoadText isEqualTo 0) exitWith {};
    private _textXML = "<t align='left'>" + ((_modsAndLoadText apply { "<t color='#f0d498'>" + _x#1 + ":</t>" + _x#2 }) joinString "<br/>") + "</t>";
    ["Loaded Mods",_textXML] call A3A_fnc_customHint;
};

// uh, what's this for exactly? What are we doing that needs the main display?
waituntil {!isnull (finddisplay 46)};
GVAR(keys_battleMenu) = false; //initilize key flags to false


if (A3A_hasACE) then
{
    if (isNil "ace_interact_menu_fnc_compileMenu" || isNil "ace_interact_menu_fnc_compileMenuSelfAction") exitWith {
        Error("ACE non-public functions have changed, rebel group join/leave actions will not be removed.");
    };
    // Remove group join action from all rebel unit types
    // Need to compile the menus first, because ACE delays creating menus until a unit of that class is created
    private _unitTypes = ["I_G_soldier_F", "I_G_Soldier_TL_F", "I_G_Soldier_AR_F", "I_G_medic_F", "I_G_engineer_F", "I_G_Soldier_GL_F", "I_G_officer_F"];
    {
        [_x] call ace_interact_menu_fnc_compileMenu;
        [_x] call ace_interact_menu_fnc_compileMenuSelfAction;
        [_x, 0, ["ACE_ApplyHandcuffs"]] call ace_interact_menu_fnc_removeActionFromClass;
        [_x, 1, ["ACE_SelfActions", "ACE_TeamManagement", "ACE_LeaveGroup"]] call ace_interact_menu_fnc_removeActionFromClass;
        [_x, 0, ["ACE_MainActions", "ACE_JoinGroup"]] call ace_interact_menu_fnc_removeActionFromClass;
    } forEach _unitTypes;			// TODO: add raw unit types from new templates
};

boxX allowDamage false;			// hmm...
boxX addAction ["Transfer Vehicle cargo to Ammobox", {[] spawn A3A_fnc_empty;}, 4];
boxX addAction ["Move this asset", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)", 4];
if (A3A_hasACE) then { [boxX, boxX] call ace_common_fnc_claim;};	//Disables ALL Ace Interactions
flagX allowDamage false;
flagX addAction ["Unit Recruitment", {if ([getPosATL player] call A3A_fnc_enemyNearCheck) then {["Recruit Unit", "You cannot recruit units while there are enemies near you."] call A3A_fnc_customHint;} else { [] spawn A3A_fnc_unit_recruit; }},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)"];
flagX addAction ["Move this asset", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)", 4];

//Adds a light to the flag
private _flagLight = "#lightpoint" createVehicle (getPos flagX);
_flagLight setLightDayLight true;
_flagLight setLightColor [1, 1, 0.9];
_flagLight setLightBrightness 0.2;
_flagLight setLightAmbient [1, 1, 0.9];
_flagLight lightAttachObject [flagX, [0, 0, 4]];
_flagLight setLightAttenuation [7, 0, 0.5, 0.5];

vehicleBox allowDamage false;
vehicleBox addAction [localize "STR_A3A_actions_restore_units", A3A_fnc_vehicleBoxRestore,nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4];
vehicleBox addAction ["Vehicle Arsenal", JN_fnc_arsenal_handleAction, [], 0, true, false, "", "alive _target && vehicle _this != _this", 10];
[vehicleBox] call HR_GRG_fnc_initGarage;
if (A3A_hasACE) then { [vehicleBox, VehicleBox] call ace_common_fnc_claim;};	//Disables ALL Ace Interactions

vehicleBox addAction ["Buy Vehicle", {
    if ([getPosATL player] call A3A_fnc_enemyNearCheck) then {
        ["Purchase Vehicle", "You cannot buy vehicles while there are enemies near you."] call A3A_fnc_customHint;
    } else {
        if (A3A_GUIDevPreview) then {
            createDialog "A3A_BuyVehicleDialog";
        } else {
            createDialog "vehicle_option";
        };
    }
},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4];

vehicleBox addAction ["Move this asset", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)", 4];
vehicleBox addAction ["Buy Light for 25€", {[player, FactionGet(reb,"vehicleLightSource"), 25, [['A3A_fnc_initMovableObject', false]]] call A3A_fnc_buyItem},nil,0,false,true,"","true",4];
private _fuelDrum = FactionGet(reb,"vehicleFuelDrum");
private _fuelTank = FactionGet(reb,"vehicleFuelTank");
if (isClass (configFile/"CfgVehicles"/_fuelDrum # 0)) then {
    private _dispName = getText (configFile/"CfgVehicles"/_fuelDrum # 0/"displayName");
    vehicleBox addAction [format["Buy %1 for %2€",_dispName, _fuelDrum # 1], {[player, _this # 3 # 0, _this # 3 # 1, [['A3A_fnc_initMovableObject', true], ['A3A_fnc_logistics_addLoadAction', false]]] call A3A_fnc_buyItem},_fuelDrum,0,false,true,"","true",4];
};
if (isClass (configFile/"CfgVehicles"/_fuelTank # 0)) then {
    private _dispName = getText (configFile/"CfgVehicles"/_fuelTank # 0/"displayName");
    vehicleBox addAction [format["Buy %1 for %2€",_dispName, _fuelTank # 1], {[player, _this # 3 # 0, _this # 3 # 1, [['A3A_fnc_initMovableObject', true], ['A3A_fnc_logistics_addLoadAction', false]]] call A3A_fnc_buyItem},_fuelTank,0,false,true,"","_this == theBoss",4];
};
call A3A_fnc_dropObject;

if (LootToCrateEnabled) then {
    vehicleBox addAction ["Buy loot box for 10€", {player call A3A_fnc_spawnCrate},nil,0,false,true,"","true", 4];
    call A3A_fnc_initLootToCrate;
};

fireX allowDamage false;
[fireX, "fireX"] call A3A_fnc_flagaction;

mapX allowDamage false;
mapX addAction ["Game Options", {
    [
        "Game Options",
        "Version: "+ antistasiVersion +
        "<br/><br/>Enemy resource balance: "+ (A3A_enemyBalanceMul / 10 toFixed 1) + "x" +
        "<br/>Unlock Weapon Number: "+ str minWeaps +
        "<br/>Limited Fast Travel: "+ (["No","Yes"] select limitedFT) +
        "<br/>Spawn Distance: "+ str distanceSPWN + "m" +
        "<br/>Civilian Limit: "+ str civPerc +
        "<br/>Time since GC: " + ([[serverTime-A3A_lastGarbageCleanTime] call A3A_fnc_secondsToTimeSpan,1,0,false,2,false,true] call A3A_fnc_timeSpan_format)
    ] call A3A_fnc_customHint;
#ifdef UseDoomGUI
    ERROR("Disabled due to UseDoomGUI Switch.")
#else
    CreateDialog "game_options";
#endif
    nil;
},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4];
mapX addAction ["Map Info", A3A_fnc_cityinfo,nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4];
mapX addAction ["Move this asset", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)", 4];
if (isMultiplayer) then {mapX addAction ["AI Load Info", { [] remoteExec ["A3A_fnc_AILoadInfo",2];},nil,0,false,true,"","((_this == theBoss) || (serverCommandAvailable ""#logout""))"]};

[] spawn A3A_fnc_unitTraits;


disableSerialization;
//1 cutRsc ["H8erHUD","PLAIN",0,false];
_layer = ["statisticsX"] call bis_fnc_rscLayer;
#ifdef UseDoomGUI
    ERROR("Disabled due to UseDoomGUI Switch.")
#else
    _layer cutRsc ["H8erHUD","PLAIN",0,false];
#endif
[] spawn A3A_fnc_statistics;

//Load the player's personal save.
[] spawn A3A_fnc_createDialog_shouldLoadPersonalSave;

// Check if we need to relocate HQ. Might happen if we leave during placement?
// Should be replaced with server-side monitoring loop
if (isNil "placementDone") then {
    if (isNil "playerPlacingHQ" || {!(playerPlacingHQ in (call A3A_fnc_playableUnits))}) then {
        playerPlacingHQ = player;
        publicVariable "playerPlacingHQ";
        [] spawn A3A_fnc_placementSelection;
    };
};

Info("initClient completed");

if(!isMultiplayer) then
{
    [] spawn A3A_fnc_singlePlayerBlackScreenWarning;
};
