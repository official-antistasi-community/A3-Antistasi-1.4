private ["_pos","_rnd","_posFire"];
_movedX = false;
if (petros != (leader group petros)) then
	{
	_movedX = true;
	groupPetros = createGroup teamPlayer;
	publicVariable "groupPetros";
	[petros] join groupPetros;
	};
[petros,"remove"] remoteExec ["A3A_fnc_flagaction",0,petros];
petros switchAction "PlayerStand";
petros disableAI "MOVE";
petros disableAI "AUTOTARGET";
respawnTeamPlayer setMarkerPos getPos petros;
posHQ = getMarkerPos respawnTeamPlayer; publicVariable "posHQ";
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
	if (_movedX) then {hint "Please wait while HQ assets are moved to selected position"};
	//sleep 5
	boxX hideObject false;
	vehicleBox hideObject false;
	mapX hideObject false;
	fireX hideObject false;
	flagX hideObject false;
	};
//fireX inflame true;
[respawnTeamPlayer,1] remoteExec ["setMarkerAlphaLocal",teamPlayer,true];
[respawnTeamPlayer,1] remoteExec ["setMarkerAlphaLocal",civilian,true];
_posFire = [getPos petros, 3, getDir petros] call BIS_Fnc_relPos;
fireX setPos _posFire;
_rnd = getdir Petros;
if (isMultiplayer) then {sleep 5};
_pos = [_posFire, 3, _rnd] call BIS_Fnc_relPos;
boxX setPos _pos;
_rnd = _rnd + 45;
_pos = [_posFire, 3, _rnd] call BIS_Fnc_relPos;
mapX setPos _pos;
mapX setDir ([fireX, mapX] call BIS_fnc_dirTo);
_rnd = _rnd + 45;
_pos = [_posFire, 3, _rnd] call BIS_Fnc_relPos;
_pos = _pos findEmptyPosition [0,50,(typeOf flagX)];
if (_pos isEqualTo []) then {_pos = getPos petros};
flagX setPos _pos;
_rnd = _rnd + 45;
_pos = [_posFire, 3, _rnd] call BIS_Fnc_relPos;
vehicleBox setPos _pos;
//if (_movedX) then {_nul = [] call A3A_fnc_empty};
petros setBehaviour "SAFE";
"Synd_HQ" setMarkerPos getPos petros;
if (isNil "placementDone") then {placementDone = true; publicVariable "placementDone"};
chopForest = false; publicVariable "chopForest";
sleep 5;
[Petros,"mission"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],petros];

