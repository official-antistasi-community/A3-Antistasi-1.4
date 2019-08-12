#include "\A3\ui_f\hpp\defineDIKCodes.inc"
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

///////////////////////////////////////////////////////////////////////////////////////////
diag_log format ["%1: [Antistasi]: JNA Init Started.",servertime];

params [["_object",objNull,[objNull]]];

//check if it was already initialised
if(!isnull (missionnamespace getVariable ["jna_object",objNull]))exitWith{};
if(isNull _object)exitWith{["Error: wrong input given '%1'",_object] call BIS_fnc_error;};
missionnamespace setVariable ["jna_object",_object];

//change this for items that members can only take
/* Indexes in the array correspond to these tabs:
DO NOT UNCOMMENT THIS BIT. THESE ARE ALREADY DEFINED
IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON		0
IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON	1
IDC_RSCDISPLAYARSENAL_TAB_HANDGUN		2
IDC_RSCDISPLAYARSENAL_TAB_UNIFORM		3
IDC_RSCDISPLAYARSENAL_TAB_VEST			4
IDC_RSCDISPLAYARSENAL_TAB_BACKPACK		5
IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR		6
IDC_RSCDISPLAYARSENAL_TAB_GOGGLES		7
IDC_RSCDISPLAYARSENAL_TAB_NVGS			8
IDC_RSCDISPLAYARSENAL_TAB_BINOCULARS		9
IDC_RSCDISPLAYARSENAL_TAB_MAP			10
IDC_RSCDISPLAYARSENAL_TAB_GPS			11
IDC_RSCDISPLAYARSENAL_TAB_RADIO			12
IDC_RSCDISPLAYARSENAL_TAB_COMPASS		13
IDC_RSCDISPLAYARSENAL_TAB_WATCH			14
IDC_RSCDISPLAYARSENAL_TAB_FACE			15
IDC_RSCDISPLAYARSENAL_TAB_VOICE			16
IDC_RSCDISPLAYARSENAL_TAB_INSIGNIA		17
IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC		18
IDC_RSCDISPLAYARSENAL_TAB_ITEMACC		19
IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE		20
IDC_RSCDISPLAYARSENAL_TAB_ITEMBIPOD		25
IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG		21
IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW		22
IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT		23
IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC		24
IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL		26
*/
//jna_minItemMember = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
jna_minItemMember = [24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,memberOnlyMagLimit,24,24,24,24,memberOnlyMagLimit];

//preload the ammobox so you dont need to wait the first time
["Preload"] call jn_fnc_arsenal;

//server
if(isServer)then{
    diag_log format ["%1: [Antistasi]: JNA Server Detected.",servertime];

    //load default if it was not loaded from savegame
    if(isnil "jna_dataList" )then{jna_dataList = [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]];};
};

//player
if(hasInterface)then{
    diag_log format ["%1: [Antistasi]: JNA Loading Player Data.",servertime];

    //add arsenal button
    _object addaction [
        localize "STR_A3_Arsenal",
        {
            //start loading screen
	    ["jn_fnc_arsenal", "Loading Nutz™ Arsenal"] call bis_fnc_startloadingscreen;
	    [] spawn {
	        uisleep 5;
          private _ids = missionnamespace getvariable ["BIS_fnc_startLoadingScreen_ids",[]];
		      if("jn_fnc_arsenal" in _ids)then{
		        private _display =  uiNamespace getVariable ["arsanalDisplay","No display"];
		        titleText["ERROR DURING LOADING ARSENAL", "PLAIN"];
		        _display closedisplay 2;
		        ["jn_fnc_arsenal"] call BIS_fnc_endLoadingScreen;
		      };

		      //TODO this is a temp fix for rhs because it freezes the loading screen if no primaryWeapon was equiped. This will be fix in rhs 0.4.9
	      	if("bis_fnc_arsenal" in _ids)then{
		        private _display =  uiNamespace getVariable ["arsanalDisplay","No display"];
		        titleText["Non Fatal Error, RHS?", "PLAIN"];
		        diag_log "JNA: Non Fatal Error, RHS?";
		        ["bis_fnc_arsenal"] call BIS_fnc_endLoadingScreen;
	       	};
	    };
	    
            //save proper ammo because BIS arsenal rearms it, and I will over write it back again
            missionNamespace setVariable ["jna_magazines_init",  [
                magazinesAmmoCargo (uniformContainer player),
                magazinesAmmoCargo (vestContainer player),
                magazinesAmmoCargo (backpackContainer player)
            ]];

            //Save attachments in containers, because BIS arsenal removes them
            _attachmentsContainers = [[],[],[]];
            {
                _container = _x;
                _weaponAtt = weaponsItemsCargo _x;
                _attachments = [];

                if!(isNil "_weaponAtt")then{

                    {
                        _atts = [_x select 1,_x select 2,_x select 3,_x select 5];
                        _atts = _atts - [""];
                        _attachments = _attachments + _atts;
                    } forEach _weaponAtt;
                    _attachmentsContainers set [_foreachindex,_attachments];
                }
            } forEach [uniformContainer player,vestContainer player,backpackContainer player];
            missionNamespace setVariable ["jna_containerCargo_init", _attachmentsContainers];

            //set type
            UINamespace setVariable ["jn_type","arsenal"];

            //request server to open arsenal
            [clientOwner] remoteExecCall ["jn_fnc_arsenal_requestOpen",2];
        },
        [],
        6,
        true,
        false,
        "",
        "alive _target && {_target distance _this < 5}"
    ];




    //add open event
    [missionNamespace, "arsenalOpened", {
        disableSerialization;
        UINamespace setVariable ["arsanalDisplay",(_this select 0)];

        //spawn this to make sure it doesnt freeze the game
        [] spawn {
            disableSerialization;

            _type = UINamespace getVariable ["jn_type",""];
            if(_type isEqualTo "arsenal")then{
                _veh = vehicle player;
                if((_veh != player) && driver _veh == player)then{
                    ["CustomInit", [uiNamespace getVariable "arsanalDisplay"]] call jn_fnc_vehicleArsenal;
                    UINamespace setVariable ["jn_type","vehicleArsenal"];
                }else{
                    ["CustomInit", [uiNamespace getVariable "arsanalDisplay"]] call jn_fnc_arsenal;
                };
            };

        };
    }] call BIS_fnc_addScriptedEventHandler;

	//add close event
    [missionNamespace, "arsenalClosed", {

        _type = UINamespace getVariable ["jn_type",""];

        if(_type isEqualTo "arsenal")then{
            [clientOwner] remoteExecCall ["jn_fnc_arsenal_requestClose",2];
        };

        if(_type isEqualTo "vehicleArsenal")then{
            ["Close"] call jn_fnc_vehicleArsenal;
            [clientOwner] remoteExecCall ["jn_fnc_arsenal_requestClose",2];
        };
    }] call BIS_fnc_addScriptedEventHandler;
};
diag_log format ["%1: [Antistasi]: JNA Completed.",servertime];
arsenalInit = true;
