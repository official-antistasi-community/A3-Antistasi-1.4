//Mission: Find dealer
if (!isServer and hasInterface) exitWith{};
private ["_markerX"]; // TODO: Fill privates

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

/** Spawn Dealer */
_dealerGroup = createGroup [civilian, true];
// TODO: Make sure he doesn't spawn right on the road, but preferrably next to it
_dealer = _dealerGroup createUnit ["C_Nikos", _positionX, [], 0.9, "NONE"];
_dealer allowDamage false;
sleep 2;
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
	_addActionParams = [localize "STR_antistasi_action_buy_exp", {nul=CreateDialog "exp_menu";},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];
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

_dealer removeAction _addActionID;
[_dealer, _addActionID] remoteExec ["removeAction", -2, true];

deleteMarker "Dealer";
deleteMarker "DevPat"; // TODO: What is this for? (give it a good name)
_nul = [60 * 15,"FND"] spawn A3A_fnc_deleteTask; // TODO: balance the delete time

sleep 30; // Make him able to walk away for 30 seconds (for realism)

deleteVehicle _dealer;
deleteGroup _dealerGroup;

// TODO: Show some sort of notification that the dealer has left?
/** END */