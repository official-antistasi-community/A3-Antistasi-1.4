//TODO remove me!

//main
jn_fnc_logistics_init = compile preProcessFileLineNumbers 			"JeroenArsenal\JNL\fn_logistics_init.sqf";
jn_fnc_logistics_load = compile preProcessFileLineNumbers 			"JeroenArsenal\JNL\fn_logistics_load.sqf";
jn_fnc_logistics_unLoad = compile preProcessFileLineNumbers 		"JeroenArsenal\JNL\fn_logistics_unLoad.sqf";
jn_fnc_logistics_addAction = compile preProcessFileLineNumbers 		"JeroenArsenal\JNL\fn_logistics_addAction.sqf";
jn_fnc_logistics_removeAction = compile preProcessFileLineNumbers 	"JeroenArsenal\JNL\fn_logistics_removeAction.sqf";

//functions
//jn_fnc_logistics_canLoad = compile preProcessFileLineNumbers 			"JeroenArsenal\JNL\functions\fn_logistics_canLoad.sqf";
//jn_fnc_logistics_getCargo = compile preProcessFileLineNumbers 		"JeroenArsenal\JNL\functions\fn_logistics_getCargo.sqf";
//jn_fnc_logistics_getCargoType = compile preProcessFileLineNumbers 	"JeroenArsenal\JNL\functions\fn_logistics_getCargoType.sqf";
//jn_fnc_logistics_getNodes = compile preProcessFileLineNumbers 		"JeroenArsenal\JNL\functions\fn_logistics_getNodes.sqf";

//Actions
jn_fnc_logistics_addActionGetInWeapon = compile preProcessFileLineNumbers 		"JeroenArsenal\JNL\Actions\fn_logistics_addActionGetInWeapon.sqf";
jn_fnc_logistics_addActionLoad = compile preProcessFileLineNumbers 				"JeroenArsenal\JNL\Actions\fn_logistics_addActionLoad.sqf";
jn_fnc_logistics_addActionUnload = compile preProcessFileLineNumbers 			"JeroenArsenal\JNL\Actions\fn_logistics_addActionUnload.sqf";
jn_fnc_logistics_addEventGetOutWeapon = compile preProcessFileLineNumbers 			"JeroenArsenal\JNL\Actions\fn_logistics_addEventGetOutWeapon.sqf";

jn_fnc_logistics_removeActionGetInWeapon = compile preProcessFileLineNumbers 	"JeroenArsenal\JNL\Actions\fn_logistics_removeActionGetInWeapon.sqf";
jn_fnc_logistics_removeActionLoad = compile preProcessFileLineNumbers 			"JeroenArsenal\JNL\Actions\fn_logistics_removeActionLoad.sqf";
jn_fnc_logistics_removeActionUnload = compile preProcessFileLineNumbers 		"JeroenArsenal\JNL\Actions\fn_logistics_removeActionUnload.sqf";
jn_fnc_logistics_removeEventGetOutWepon = compile preProcessFileLineNumbers 			"JeroenArsenal\JNL\Actions\fn_logistics_removeEventGetOutWeapon.sqf";

call jn_fnc_logistics_init;

/*
call compile preProcessFileLineNumbers "JeroenArsenal\JNL\recompile.sqf";
cursorObject call jn_fnc_logistics_addAction;
*/