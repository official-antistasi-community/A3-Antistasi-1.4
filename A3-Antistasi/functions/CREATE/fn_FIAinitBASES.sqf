private ["_unit","_skill"];
_unit = _this select 0;
if (debug) then {
	diag_log format ["%1: [Antistasi] | DEBUG | FIAinitBASES.sqf | _unit:%2.",servertime,_unit];
};
if ((isNil "_unit") || (isNull _unit)) exitWith {
	diag_log format ["%1: [Antistasi] | ERROR | FIAinitBases.sqf | Problem with NATO Param: %2",servertime,_this];
	};
_markerX = "";
if (count _this > 1) then
	{
	_markerX = _this select 1;
	_unit setVariable ["markerX",_markerX,true];
	if ((spawner getVariable _markerX != 0) and (vehicle _unit != _unit)) then
		{
		if (!isMultiplayer) then
			{
			_unit enableSimulation false
			}
		else
			{
			[_unit,false] remoteExec ["enableSimulationGlobal",2]
			}
		};
	};
[_unit] call A3A_fnc_initRevive;

_unit allowFleeing 0;
_typeX = typeOf _unit;
_skill = (0.6 / skillMult + 0.015 * skillFIA);
_unit setSkill _skill;
if (!activeGREF) then {if (not((uniform _unit) in rebelUniform)) then {[_unit] call A3A_fnc_reDress}};

if (random 40 < skillFIA) then
		{
		if (getNumber (configfile >> "CfgWeapons" >> headgear _unit >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") < 2) then {removeHeadgear _unit;_unit addHeadgear (selectRandom armoredHeadgear)};
		};

if (debug) then {
	diag_log format ["%1: [Antistasi] | DEBUG | FIAinitBASES.sqf | _unit:%2 is of type:%3.",servertime,_unit,_typeX];
};

_unitIsSniper = false; //This is used for accuracy calulations later.
switch (true) do {
	case (_typeX in SDKSniper): {
		_unitIsSniper = true;
		if (count unlockedSN > 0) then
		{
			[_unit, selectRandom unlockedSN, 8, 0] call BIS_fnc_addWeapon;
			if (count unlockedOptics > 0) then
			{
				_compatibleX = [primaryWeapon _unit] call BIS_fnc_compatibleItems;
				_potentials = unlockedOptics select {_x in _compatibleX};
				if (count _potentials > 0) then {_unit addPrimaryWeaponItem (_potentials select 0)};
			};
		}
		else
		{
			[_unit,unlockedRifles] call A3A_fnc_randomRifle;
		};
		if (debug) then {
			diag_log format ["%1: [Antistasi] | DEBUG | FIAinitBASES.sqf | _unit:%2 is SDKSniper.",servertime,_unit];
		};
	};

	case (_typeX in SDKMil): {
		[_unit,unlockedRifles] call A3A_fnc_randomRifle;
		if ((loadAbs _unit < 340) and (random 20 < skillFIA) and (count unlockedAA > 0)) then
			{
				_unit addbackpack (unlockedBackpacks select 0);
				[_unit, selectRandom unlockedAA, 2, 0] call BIS_fnc_addWeapon;
			};
		if (debug) then {
			diag_log format ["%1: [Antistasi] | DEBUG | FIAinitBASES.sqf | _unit:%2 is SDKMil.",servertime,_unit];
		};
	};

	case (_typeX in SDKMG): {
		if (count unlockedMG > 0) then
			{
				[_unit,unlockedMG] call A3A_fnc_randomRifle;
			}
		else
			{
				[_unit,unlockedRifles] call A3A_fnc_randomRifle;
			};
		if (debug) then {
			diag_log format ["%1: [Antistasi] | DEBUG | FIAinitBASES.sqf | _unit:%2 is SDKMG.",servertime,_unit];
		};
	};

	case (_typeX in SDKGL): {
		if (count unlockedGL > 0) then
			{
				[_unit,unlockedGL] call A3A_fnc_randomRifle;
			}
		else
			{
				[_unit,unlockedRifles] call A3A_fnc_randomRifle;
			};
		if (debug) then {
			diag_log format ["%1: [Antistasi] | DEBUG | FIAinitBASES.sqf | _unit:%2 is SDKGL.",servertime,_unit];
		};
	};

	case (_typeX in SDKMEDIC): {
		[_unit,unlockedRifles] call A3A_fnc_randomRifle;
		_unit setUnitTrait ["medic",true];
		if ({_x == "FirstAidKit"} count (items _unit) < 10) then
			{
				for "_i" from 1 to 10 do {_unit addItemToBackpack "FirstAidKit"};
			};
		if (debug) then {
			diag_log format ["%1: [Antistasi] | DEBUG | FIAinitBASES.sqf | _unit:%2 is SDKMEDIC.",servertime,_unit];
		};
	};

	case (_typeX in SDKATman): {
		[_unit,unlockedRifles] call A3A_fnc_randomRifle;
		if !(unlockedAT isEqualTo []) then
			{
				_rlauncher = selectRandom unlockedAT;
			if (_rlauncher != secondaryWeapon _unit) then
				{
					private _magazines = getArray (configFile / "CfgWeapons" / (secondaryWeapon _unit) / "magazines");
					{_unit removeMagazines _x} forEach _magazines;
					_unit removeWeaponGlobal (secondaryWeapon _unit);
					[_unit, _rlauncher, 4, 0] call BIS_fnc_addWeapon;
				};
			}
		else
			{
			if (hasIFA) then
				{
					[_unit, "LIB_PTRD", 10, 0] call BIS_fnc_addWeapon;
				};
			};
		if (debug) then {
			diag_log format ["%1: [Antistasi] | DEBUG | FIAinitBASES.sqf | _unit:%2 is SDKATman.",servertime,_unit];
		};
	};

	case (_typeX in squadLeaders): {
		[_unit,unlockedRifles] call A3A_fnc_randomRifle;
		_unit setskill ["courage",_skill + 0.2];
		_unit setskill ["commanding",_skill + 0.2];
		if (debug) then {
			diag_log format ["%1: [Antistasi] | DEBUG | FIAinitBASES.sqf | _unit:%2 is SquadLeader.",servertime,_unit];
		};
	};

	default {
		[_unit,unlockedRifles] call A3A_fnc_randomRifle;
		diag_log format ["%1: [Antistasi] | DEBUG | FIAinitBASES.sqf | Could not identify type of _unit: %2 %3.",servertime,_unit,_typeX];
	};

};

if (debug) then {
	diag_log format ["%1: [Antistasi] | DEBUG | FIAinitBASES.sqf | Is unit Sniper? : %2.",servertime,_unitIsSniper];
};

_unit selectWeapon (primaryWeapon _unit);

if (!haveRadio) then {_unit unlinkItem (_unit call A3A_fnc_getRadio)};
if !(hasIFA) then
	{
	if (sunOrMoon < 1) then
		{
		if (haveNV) then
			{
			if (hmd _unit == "") then {_unit linkItem (selectRandom unlockedNVG)};
			_pointers = attachmentLaser arrayIntersect unlockedItems;
			if !(_pointers isEqualTo []) then
				{
				_pointers = _pointers arrayIntersect ((primaryWeapon _unit) call BIS_fnc_compatibleItems);
				if !(_pointers isEqualTo []) then
					{
					_pointer = selectRandom _pointers;
					_unit addPrimaryWeaponItem _pointer;
			        _unit assignItem _pointer;
			        _unit enableIRLasers true;
					};
				};
			}
		else
			{
			_hmd = hmd _unit;
			if (_hmd != "") then
				{
				_unit unassignItem _hmd;
				_unit removeItem _hmd;
				};
			_flashlights = attachmentLight arrayIntersect unlockedItems;
			if !(_flashlights isEqualTo []) then
				{
				_flashlights = _flashlights arrayIntersect ((primaryWeapon _unit) call BIS_fnc_compatibleItems);
				if !(_flashlights isEqualTo []) then
					{
					_flashlight = selectRandom _flashlights;
					_unit addPrimaryWeaponItem _flashlight;
				    _unit assignItem _flashlight;
				    _unit enableGunLights _flashlight;
					};
				};
		    };
		}
	else
		{
		_hmd = hmd _unit;
		if (_hmd != "") then
			{
			_unit unassignItem _hmd;
			_unit removeItem _hmd;
			};
		};
	};
if ({if (_x in smokeGrenade) exitWith {1}} count unlockedMagazines > 0) then {_unit addMagazines [selectRandom smokeGrenade,2]};

_EHkilledIdx = _unit addEventHandler ["killed", {
	_victim = _this select 0;
	_killer = _this select 1;
	[_victim] remoteExec ["A3A_fnc_postmortem",2];
	if (isPlayer _killer) then
		{
		if (!isMultiPlayer) then
			{
			_nul = [0,20] remoteExec ["A3A_fnc_resourcesFIA",2];
			_killer addRating 1000;
			};
		};
	if (side _killer == Occupants) then
		{
		[0,-0.25,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
		[-0.25,0] remoteExec ["A3A_fnc_prestige",2];
		}
	else
		{
		if (side _killer == Invaders) then {[0,-0.25] remoteExec ["A3A_fnc_prestige",2]};
		};
	_markerX = _victim getVariable "markerX";
	if (!isNil "_markerX") then
		{
		if (sidesX getVariable [_markerX,sideUnknown] == teamPlayer) then
			{
			[typeOf _victim,teamPlayer,_markerX,-1] remoteExec ["A3A_fnc_garrisonUpdate",2];
			_victim setVariable [_markerX,nil,true];
			};
		};
	}];

_revealX = false;
if (vehicle _unit != _unit) then
	{
	if (_unit == gunner (vehicle _unit)) then
		{
			_revealX = true;
			if (debug) then {
				diag_log format ["%1: [Antistasi] | DEBUG | FIAinitBASES.sqf | Unit: %2 is mounted gunner.",servertime,_unit];
			};
		};
	}
else
	{
	if ((secondaryWeapon _unit) in mlaunchers) then {
			_revealX = true;
			if (debug) then {
				diag_log format ["%1: [Antistasi] | DEBUG | FIAinitBASES.sqf | Unit: %2 has launcher: %3.",servertime,_unit, (secondaryWeapon _unit)];
			};
		};
	};

if (_revealX) then
	{
	{
	_unit reveal [_x,1.5];
	} forEach allUnits select {(vehicle _x isKindOf "Air") and (_x distance _unit <= distanceSPWN)};
	};