diag_log "Init JNG: Start";

//object to add garage to
params [["_object",objNull,[objNull]]];

//check if it was already initialised
if(!isnull (missionnamespace getVariable ["jng_object",objNull]))exitWith{};
if(isNull _object)exitWith{["Error: wrong input given '%1'",_object] call BIS_fnc_error;};
missionnamespace setVariable ["jng_object",_object];






//server
if(isServer)then{
	diag_log "Init JNG: server";

    //load default if it was not loaded from savegame
    if(isnil "jng_vehicleList" )then{jng_vehicleList = [[],[],[],[],[],[]]};
    if(isnil "jng_ammoList" )then{jng_ammoList = [[],[],[],[],[],[]]};
};

//player
if(hasInterface)then{
    diag_log "Init JNG: Player";

	//add garage button to object
    _object addaction [

        localize"STR_ACT_GARAGE",
        {
            //["jn_fnc_garage"] call bis_fnc_startloadingscreen;
            UINamespace setVariable ["jn_type","garage"];
            [clientOwner] remoteExecCall ["jn_fnc_garage_requestOpen",2];
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
            if(_type isEqualTo "garage")then{
                ["CustomInit", [uiNamespace getVariable "arsanalDisplay"]] call jn_fnc_garage;
            };
        };

    }] call BIS_fnc_addScriptedEventHandler;

	//add close event
    [missionNamespace, "arsenalClosed", {

        _type = UINamespace getVariable ["jn_type",""];
        if(_type isEqualTo "garage")then{
            [clientOwner] remoteExecCall ["jn_fnc_garage_requestClose",2];
        };

    }] call BIS_fnc_addScriptedEventHandler;
};

diag_log "Init JNG: done";