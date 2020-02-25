//Mission: Find dealer
if (!isServer and hasInterface) exitWith{};
private ["_markerX"]; // TODO: Fill privates

// TODO: Create dialog dealer_menu

_markerX = _this select 0;
_positionX = getMarkerPos _markerX;
_difficultX = if (random 10 < tierWar) then {true} else {false};

_timeLimit = if (_difficultX) then {30} else {60};
if (hasIFA) then {_timeLimit = _timeLimit * 2};
_dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
_dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum];//converts datenumber back to date array so that time formats correctly
_displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;//Converts the time portion of the date array to a string for clarity in hints

_nameDest = [_markerX] call A3A_fnc_localizar;

/** Spawn Objects */
_direction = 0; // TODO: Should be directed towards the road
_objects = [_positionX, _direction, [
	["Land_Money_F",[0.636719,0.349609,-9.53674e-007],360,1,0,[],"","",true,false],
	["Box_IED_Exp_F",[-0.973633,0.149414,0.0162439],260.747,1,0.00984005,[],"","",true,false],
	["Land_Suitcase_F",[0.755859,0.780273,0.000113964],291.007,1,0,[],"","",true,false],
	["Land_WoodenCounter_01_F",[-0.568848,1.0874,0.000607014],186.437,1,0.0135358,[],"","",true,false],
	["Box_Syndicate_Wps_F",[1.40918,0.457031,0],133.35,1,0,[],"","",true,false],
	["Oil_Spill_F",[-1.56055,-1.18994,0],0,1,0,[],"","",true,false],
	["Box_IED_Exp_F",[-1.87061,0.322266,-9.53674e-007],328.642,1,0.11798,[],"","",true,false],
	["Land_PlasticCase_01_medium_F",[-1.90674,-0.555664,0],307.385,1,0.00975709,[],"","",true,false],
	["Land_ClothShelter_02_F",[-1.62744,-0.431641,0.0836663],0,1,0,[],"","",true,false],
	["Land_Sign_Mines_F",[-2.52246,-0.0322266,0],293.566,1,0,[],"","",true,false],
	["Land_GasTank_01_blue_F",[-1.66797,-2.09961,5.67436e-005],359.973,1,0,[],"","",true,false],
	["Land_Sacks_goods_F",[-2.64063,1.04541,0],0,1,0,[],"","",true,false],
	["Land_FireExtinguisher_F",[-1.64453,-2.47803,0.000132561],359.969,1,0,[],"","",true,false],
	["Item_ToolKit",[-1.40576,-2.72314,0],64.2028,1,0,[],"","",true,false],
	["Land_Wreck_Van_F",[-3.37012,-1.62598,0],153.82,1,0,[],"","",true,false],
	["Land_WeldingTrolley_01_F",[-1.17236,-3.84766,1.19209e-005],0.00173577,1,0,[],"","",true,false]
]] call BIS_fnc_ObjectsMapper;

{
	call {
		if (str typeof _x find "Box_Syndicate_Wps_F" > -1) exitWith {
			dealerCrate = _x;
			clearMagazineCargoGlobal dealerCrate;
			clearWeaponCargoGlobal dealerCrate;
			clearItemCargoGlobal dealerCrate;
			clearBackpackCargoGlobal dealerCrate;
		};
		if (str typeof _x find "Box_IED_Exp_F" > -1) exitWith {
			clearMagazineCargoGlobal _x;
			clearWeaponCargoGlobal _x;
			clearItemCargoGlobal _x;
			clearBackpackCargoGlobal _x;
		};
	};
} forEach _objects;
/** END */

/** Spawn Dealer */
_dealerGroup = createGroup [civilian, true];
// TODO: Make sure he doesn't spawn right on the road, but preferrably next to it
_dealer = _dealerGroup createUnit ["C_Nikos", _positionX, [], 0.9, "NONE"];
_dealer allowDamage false;
sleep 2;
_dealer setDir _direction;
_dealer removeWeaponGlobal (primaryWeapon _dealer);
_dealer disableAI "move";
_dealer setunitpos "up";
/** END */

/** Create task */
_tskTitle = localize "STR_antistasi_task_title_FND_Dealer";
_tskDesc = localize "STR_antistasi_task_desc_FND_Dealer";
_posTsk = _positionX getPos [random 100, random 360];
[[teamPlayer,civilian],"FND",[format [_tskDesc,_nameDest,_displayTime],"Find the Crazy Irishman",_markerX],_posTsk,false,0,true,"Find",true] call BIS_fnc_taskCreate;
missionsX pushBack ["FND","CREATED"]; publicVariable "missionsX";
/** END */

/** TODO: (optional) Enemy QRF spawn near */
/** END */



// waitUntil {sleep 1; (dateToNumber date > _dateLimitNum) || !(alive _dealer) || ({(side _x isEqualTo Occupants) && (_x distance _dealer < 200)} count allPlayers > 0)};
// {if (isPlayer _x) then {[petros,"hint","Don't ask Devin about the Holy Handgrenade of Antioch. Just don't."] remoteExec ["commsMP",_x]}} forEach ([200,0,_dealer,"BLUFORSpawn"] call distanceUnits);

/** Finish task */
waitUntil {sleep 1; (dateToNumber date > _dateLimitNum) || !(alive _dealer) || ({((side _x isEqualTo Occupants) || (side _x isEqualTo civilian)) && (_x distance _dealer < 10)} count allPlayers > 0)};

if ({((side _x isEqualTo Occupants) || (side _x isEqualTo civilian)) && (_x distance _dealer < 10)} count allPlayers > 0) then {
	["FND",[format [_tskDesc,_nameDest,_displayTime],"Find the Crazy Irishman",_markerX],_posTsk,"SUCCEEDED"] call A3A_fnc_taskUpdate;
	_addActionParams = [localize "STR_antistasi_action_buy_dealer", {nul=CreateDialog "dealer_menu";},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];
	_addActionID = _dealer addAction _addActionParams; // We need the ID of the action to remove it later, we can't get this from `remoteExec`
	([_dealer] append _addActionParams) remoteExec ["addAction", -2, true];
	// TODO: Players undercover should not be able to buy stuff

	_dealerMarker = createMarker ["Dealer", _positionX];
	_dealerMarker setMarkerShape "ICON";
	_dealerMarker setMarkerType "flag_Croatia";

	_marker = createMarker ["DevPat", _positionX]; // TODO: What is this for? (give it a good name)
	_marker setMarkerSize [100,100];
    _marker setMarkerShape "RECTANGLE";
    _marker setMarkerBrush "SOLID";
    _marker setMarkerColor "ColorUNKNOWN";
    _marker setMarkerText "Devin";
    _marker setMarkerAlpha 0;

    _dealer allowDamage true;
}
else {
	["FND",[format [_tskDesc,_nameDest,_displayTime],"Find the Crazy Irishman",_markerX],_posTsk,"FAILED"] call A3A_fnc_taskUpdate;
};
/** END */

/** CLEANUP */
waitUntil {sleep 10; (dateToNumber date > _dateLimitNum) || !(alive _dealer)};

if (alive _dealer) then {
	_dealer enableAI "ANIM";
	_dealer enableAI "MOVE";
	_dealer stop false;
	_dealer doMove getMarkerPos (selectRandom citiesX); // Make it look like the dealer walks away
};

_dealer removeAction _addActionID; // TODO: _addActionID is undefined!
[_dealer, _addActionID] remoteExec ["removeAction", -2, true];

deleteMarker "Dealer";
deleteMarker "DevPat"; // TODO: What is this for? (give it a good name)
_nul = [60 * 15,"FND"] spawn A3A_fnc_deleteTask; // TODO: balance the delete time

sleep 10;

{
	deleteVehicle _x
} forEach _objects;

sleep 20; // Make him able to walk away for X seconds (for realism)

deleteVehicle _dealer;
deleteGroup _dealerGroup;

// TODO: Show some sort of notification that the dealer has left?
/** END */