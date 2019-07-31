if (!isNil "placementDone") then
	{
	theBoss allowDamage false;
	format ["%1 is Dead",name petros] hintC format ["%1 has been killed. You lost part of your assets and need to select a new HQ position far from the enemies.",name petros];
	}
else
	{
	diag_log "Antistasi: New Game selected";
	"Initial HQ Placement Selection" hintC ["Click on the Map Position you want to start the Game.","Close the map with M to start in the default position.","Don't select areas with enemies nearby!!\n\nGame experience changes a lot on different starting positions."];
	};

hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload",
	{
	0 = _this spawn
		{
		_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
		};
	}];

private ["_positionTel","_markerX","_markersX"];
_markersX = markersX select {sidesX getVariable [_x,sideUnknown] != teamPlayer};
_positionTel = [];
if (isNil "placementDone") then
	{
	_markersX = _markersX - controlsX;
	openMap true;
	}
else
	{
	_markersX = _markersX - (controlsX select {!isOnRoad (getMarkerPos _x)});
	//openMap [true,true];
	openMap [true,true];
	};
_mrkDum = [];
{
_mrk = createMarkerLocal [format ["%1dumdum", count _mrkDum], getMarkerPos _x];
_mrk setMarkerShapeLocal "ELLIPSE";
_mrk setMarkerSizeLocal [500,500];
_mrk setMarkerTypeLocal "hd_warning";
_mrk setMarkerColorLocal "ColorRed";
_mrk setMarkerBrushLocal "DiagGrid";
_mrkDum pushBack _mrk;
} forEach _markersX;
while {true} do
	{
	positionTel = [];
	onMapSingleClick "positionTel = _pos;";
	waitUntil {sleep 1; (count positionTel > 0) or (not visiblemap)};
	onMapSingleClick "";
	if (not visiblemap) exitWith {};
	_positionTel = positionTel;
	_markerX = [_markersX,_positionTel] call BIS_fnc_nearestPosition;
	if (getMarkerPos _markerX distance _positionTel < 500) then {hint "Place selected is very close to enemy zones.\n\n Please select another position"};
	if (surfaceIsWater _positionTel) then {hint "Selected position cannot be in water"};
	_enemiesX = false;
	if (!isNil "placementDone") then
		{
		{
		if ((side _x == Occupants) or (side _x == Invaders)) then
			{
			if (_x distance _positionTel < 500) then {_enemiesX = true};
			};
		} forEach allUnits;
		};
	if (_enemiesX) then {hint "There are enemies in the surroundings of that area, please select another."};
	if ((getMarkerPos _markerX distance _positionTel >= 500) and (!surfaceIsWater _positionTel) and (!_enemiesX)) exitWith {};
	sleep 0.1;
	};
if (visiblemap) then
	{
	if (isNil "placementDone") then
		{
		{
		if (getMarkerPos _x distance _positionTel < distanceSPWN) then
			{
			sidesX setVariable [_x,teamPlayer,true];
			};
		} forEach controlsX;
		petros setPos _positionTel;
		}
	else
		{
		_controlsX = controlsX select {!(isOnRoad (getMarkerPos _x))};
		{
		if (getMarkerPos _x distance _positionTel < distanceSPWN) then
			{
			sidesX setVariable [_x,teamPlayer,true];
			};
		} forEach _controlsX;
		_oldPetros = petros;
		groupPetros = createGroup teamPlayer;
		publicVariable "groupPetros";
        petros = groupPetros createUnit [typePetros, _positionTel, [], 0, "NONE"];
        groupPetros setGroupId ["Maru","GroupColor4"];
        petros setIdentity "friendlyX";
        if (worldName == "Tanoa") then {petros setName "Maru"} else {petros setName "Petros"};
        petros disableAI "MOVE";
        petros disableAI "AUTOTARGET";
        if (group _oldPetros == groupPetros) then {[Petros,"mission"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],petros]} else {[Petros,"buildHQ"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],petros]};
        _nul= [] execVM "initPetros.sqf";
        deleteVehicle _oldPetros;
        publicVariable "petros";
		};
	respawnTeamPlayer setMarkerPos _positionTel;
	[respawnTeamPlayer,1] remoteExec ["setMarkerAlphaLocal",[teamPlayer,civilian]];
	[respawnTeamPlayer,0] remoteExec ["setMarkerAlphaLocal",[Occupants,Invaders]];
	if (isMultiplayer) then {hint "Please wait while moving HQ Assets to selected position";sleep 5};
	private _firePos = [_positionTel, 3, getDir petros] call BIS_Fnc_relPos;
	fireX setPos _firePos;
	_rnd = getdir Petros;
	if (isMultiplayer) then {sleep 5};
	_pos = [_firePos, 3, _rnd] call BIS_Fnc_relPos;
	boxX setPos _pos;
	_rnd = _rnd + 45;
	_pos = [_firePos, 3, _rnd] call BIS_Fnc_relPos;
	mapX setPos _pos;
	mapX setDir ([_firePos, mapX] call BIS_fnc_dirTo);
	_rnd = _rnd + 45;
	_pos = [_firePos, 3, _rnd] call BIS_Fnc_relPos;
	flagX setPos _pos;
	_rnd = _rnd + 45;
	_pos = [_firePos, 3, _rnd] call BIS_Fnc_relPos;
	vehicleBox setPos _pos;
	if (isNil "placementDone") then {if (isMultiplayer) then {{if ((side _x == teamPlayer) or (side _x == civilian)) then {_x setPos getPos petros}} forEach playableUnits} else {theBoss setPos (getMarkerPos respawnTeamPlayer)}};
	theBoss allowDamage true;
	if (isMultiplayer) then
		{
		boxX hideObjectGlobal false;
		vehicleBox hideObjectGlobal false;
		mapX hideObjectGlobal false;
		fireX hideObjectGlobal false;
		flagX hideObjectGlobal false;
		}
	else
		{
		boxX hideObject false;
		vehicleBox hideObject false;
		mapX hideObject false;
		fireX hideObject false;
		flagX hideObject false;
		};
	openmap [false,false];
	};
{deleteMarkerLocal _x} forEach _mrkDum;
"Synd_HQ" setMarkerPos (getMarkerPos respawnTeamPlayer);
posHQ = getMarkerPos respawnTeamPlayer; publicVariable "posHQ";
if (isNil "placementDone") then {placementDone = true; publicVariable "placementDone"};
chopForest = false; publicVariable "chopForest";