private ["_lider","_static","_grupo","_maxCargo"];

if (count hcSelected player != 1) exitWith {hint "You must select one group on the HC bar"};

_grupo = (hcSelected player select 0);

_static = objNull;

{
if (vehicle _x isKindOf "staticWeapon") then {_static = vehicle _x;}
} forEach units _grupo;
if (isNull _static) exitWith {hint "Selected squad is not a mounted static type"};

if ((typeOf _static == SDKMortar) and (isMultiPlayer)) exitWith {hint "Static Auto Target is not available for Mortar Squads in Multiplayer"};
if (_grupo getVariable "staticAutoT") exitWith
	{
	_grupo setVariable ["staticAutoT",false,true];
	if (typeOf _static == SDKMortar) then {_grupo setvariable ["UPSMON_Removegroup",true]};
	sleep 5;
	hint format ["Mounted Static Squad %1 set to Auto Target Mode OFF", groupID _grupo];
	};

hint format ["Mounted Static Squad %1 set to Auto Target Mode ON", groupID _grupo];
_grupo setVariable ["staticAutoT",true,true];

if (typeOf _static == SDKMortar) exitWith {_nul=[_static] execVM "scripts\UPSMON\MON_artillery_add.sqf";};
_lider = leader _grupo;
_camion = vehicle _lider;
_chico = gunner _static;
while {(count (waypoints _grupo)) > 0} do
	{
  	deleteWaypoint ((waypoints _grupo) select 0);
 	};

while {true} do
	{
	if ((!alive _lider) or (!alive _camion) or (!alive _chico) or (!alive _static) or (!someAmmo _static) or (!canMove _camion) or (not(_grupo getVariable "staticAutoT"))) exitWith {};
	_enemigo = assignedTarget _static;
	if (!isNull _enemigo) then
		{
		_dirRel = [_enemigo,_camion] call BIS_fnc_dirTo;
		_dirCam = getDir _camion;
		_dirMax = ((_dirRel + 45) % 360);
		_dirMin = ((_dirRel - 45) % 360);
		if ((_dirCam > _dirMax) or (_dirCam < _dirMin)) then
			{
			_mts = 5*(round (0.28*(speed _enemigo)));
			_exitpos = [getPos _enemigo, _mts, getDir _enemigo] call BIS_Fnc_relPos;
			_dirRel = [_exitPos,_camion] call BIS_fnc_dirTo;
			_pos = [_exitPos,(40+(_exitPos distance _camion)),_dirRel] call BIS_fnc_relPos;
			_camion stop false;
			_camion doMove _pos;
			}
		else
			{
			_camion stop true;
			};
		};
	sleep 5;
	};
_camion stop true;