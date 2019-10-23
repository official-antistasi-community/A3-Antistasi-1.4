#include "\A3\ui_f\hpp\defineDIKCodes.inc"
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

///////////////////////////////////////////////////////////////////////////////////////////

diag_log "Init JNA: Start";

params [["_object",objNull,[objNull]]];

//check if it was already initialised
if(!isnull (missionnamespace getVariable ["jna_object",objNull]))exitWith{};
if(isNull _object)exitWith{["Error: wrong input given '%1'",_object] call BIS_fnc_error;};
missionnamespace setVariable ["jna_object",_object];

//change this for items that members can only take
//jna_minItemMember = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
jna_minItemMember = [24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,500,24,24,24,24,500];

//preload the ammobox so you dont need to wait the first time
["Preload"] call jn_fnc_arsenal;

//server
if(isServer)then{
	diag_log "Init JNA: server";

    //load default if it was not loaded from savegame
    if(isnil "jna_dataList" )then{jna_dataList = [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]];};
};

//player
if(hasInterface)then{
    diag_log "Init JNA: player";

    //add arsenal button
    _object addaction [
        localize "STR_A3_Arsenal",
        {
            //["jn_fnc_arsenal"] call bis_fnc_startloadingscreen;
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

diag_log "Init JNA: done";
arsenalInit = true;