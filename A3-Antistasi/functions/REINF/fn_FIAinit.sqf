private ["_victim","_killer"];

private _unit = _this select 0;

[_unit] call A3A_fnc_initRevive;
_unit setVariable ["spawner",true,true];

_unit allowFleeing 0;
private _typeX = typeOf _unit;

private _skill = (0.6 / skillMult + 0.015 * skillFIA);
if (!activeGREF) then {if (not((uniform _unit) in allRebelUniforms)) then {[_unit] call A3A_fnc_reDress}};

removeAllWeapons _unit;
if (unlockedHeadgear isEqualTo []) then {removeHeadgear _unit} else {removeHeadgear _unit; _unit addHeadgear (selectRandom unlockedHeadgear)};
if (unlockedVests isEqualTo []) then {removeVest _unit} else {removeVest _unit; _unit addVest (selectRandom unlockedVests)};
if (unlockedBackpacks isEqualTo []) then {removeBackpack _unit} else {removeBackpack _unit; _unit addBackpack (selectRandom unlockedBackpacks)};

_unit setSkill _skill;

switch (true) do {
	case (_typeX in SDKSniper): {
		if (count unlockedSniperRifles > 0) then {
			private _magazines = getArray (configFile / "CfgWeapons" / (primaryWeapon _unit) / "magazines");
			{_unit removeMagazines _x} forEach _magazines;
			_unit removeWeaponGlobal (primaryWeapon _unit);
			[_unit, selectRandom unlockedSniperRifles, 8, 0] call BIS_fnc_addWeapon;
			if (count unlockedOptics > 0) then {
				private _compatibleX = [primaryWeapon _unit] call BIS_fnc_compatibleItems;
				private _potentials = unlockedOptics select {_x in _compatibleX};
				if (count _potentials > 0) then {_unit addPrimaryWeaponItem (_potentials select 0)};
			};
		} else {
			[_unit,unlockedRifles] call A3A_fnc_randomRifle;
		};
	};
	case ((_typeX in SDKMil) || (_typeX == staticCrewTeamPlayer)): {
		[_unit,unlockedRifles] call A3A_fnc_randomRifle;
		if ((loadAbs _unit < 340) and (_typeX in SDKMil)) then {
			if ((random 20 < skillFIA) and (count unlockedAA > 0)) then {
				_unit addbackpack (unlockedBackpacks select 0);
				[_unit, selectRandom unlockedAA, 2, 0] call BIS_fnc_addWeapon;
			};
		};
	};
	case (_typeX in SDKMG): {
		if (count unlockedMachineGuns > 0) then {
			[_unit,unlockedMachineGuns] call A3A_fnc_randomRifle;
		} else {
			[_unit,unlockedRifles] call A3A_fnc_randomRifle;
		};
	};
	case (_typeX in SDKGL): {
		if (count unlockedGrenadeLaunchers > 0) then {
			[_unit,unlockedGrenadeLaunchers] call A3A_fnc_randomRifle;
		} else {
			[_unit,unlockedRifles] call A3A_fnc_randomRifle;
		};
	};
	case (_typeX in SDKExp): {
		[_unit,unlockedRifles] call A3A_fnc_randomRifle;
	};
	case (_typeX in SDKMedic): {
		_unit setUnitTrait ["medic",true];
		[_unit,unlockedSMGs] call A3A_fnc_randomRifle;
		if ({_x == "FirstAidKit"} count (items _unit) < 10) then {
			for "_i" from 1 to 10 do {_unit addItemToBackpack "FirstAidKit"};
		};
	};
	case (_typeX in SDKATman): {
		[_unit,unlockedRifles] call A3A_fnc_randomRifle;
		if !(unlockedAT isEqualTo []) then {
			private _rlauncher = selectRandom unlockedAT;
			if (_rlauncher != secondaryWeapon _unit) then {
				private _magazines = getArray (configFile / "CfgWeapons" / (secondaryWeapon _unit) / "magazines");
				{_unit removeMagazines _x} forEach _magazines;
				_unit removeWeaponGlobal (secondaryWeapon _unit);
				[_unit, _rlauncher, 4, 0] call BIS_fnc_addWeapon;
			};
		} else {
			if (hasIFA) then {
				[_unit, "LIB_PTRD", 10, 0] call BIS_fnc_addWeapon;
			};
		};
	};
	case (_typeX in squadLeaders): {
		[_unit,unlockedRifles] call A3A_fnc_randomRifle;
		_unit setskill ["courage",_skill + 0.2];
		_unit setskill ["commanding",_skill + 0.2];
	};
	default {
		[_unit,unlockedSMGs] call A3A_fnc_randomRifle;
		diag_log format ["%1: [Antistasi] | DEBUG | FIAinit.sqf | Could not identify type of _unit: %2 %3.",servertime,_unit,_typeX];
	};
};
_unit setUnitTrait ["camouflageCoef",0.8];
_unit setUnitTrait ["audibleCoef",0.8];

_unit selectWeapon (primaryWeapon _unit);

if (!haveRadio) then {
	if ((_unit != leader _unit) and (_typeX != staticCrewTeamPlayer)) then {_unit unlinkItem (_unit call A3A_fnc_getRadio)};
};

if ({if (_x in allSmokeGrenades) exitWith {1}} count unlockedMagazines > 0) then {_unit addMagazines [selectRandom allSmokeGrenades,2]};
if !(hasIFA) then {
	if ((sunOrMoon < 1) and (_typeX != SDKUnarmed)) then {
		if (haveNV) then {
			if (hmd _unit == "") then {_unit linkItem (selectRandom unlockedNVGs)};
			private _pointers = allLaserAttachments arrayIntersect unlockedItems;
			if !(_pointers isEqualTo []) then {
				_pointers = _pointers arrayIntersect ((primaryWeapon _unit) call BIS_fnc_compatibleItems);
				if !(_pointers isEqualTo []) then {
					_pointer = selectRandom _pointers;
					_unit addPrimaryWeaponItem _pointer;
					_unit assignItem _pointer;
					_unit enableIRLasers true;
				};
			};
		} else {
			private _hmd = hmd _unit;
			if (_hmd != "") then {
				_unit unassignItem _hmd;
				_unit removeItem _hmd;
			};
			private _flashlights = allLightAttachments arrayIntersect unlockedItems;
			if !(_flashlights isEqualTo []) then {
				_flashlights = _flashlights arrayIntersect ((primaryWeapon _unit) call BIS_fnc_compatibleItems);
				if !(_flashlights isEqualTo []) then {
					private _flashlight = selectRandom _flashlights;
					_unit addPrimaryWeaponItem _flashlight;
					_unit assignItem _flashlight;
					_unit enableGunLights _flashlight;
				};
			};
		};
	} else {
		_hmd = hmd _unit;
		if (_hmd != "") then {
			_unit unassignItem _hmd;
			_unit removeItem _hmd;
		};
	};
};

private _victim = objNull;
private _killer = objNull;

if (player == leader _unit) then {
	_unit setVariable ["owner",player];
	_unit addEventHandler ["killed", {
		_victim = _this select 0;
		[_victim] spawn A3A_fnc_postmortem;
		_killer = _this select 1;
		if !(hasIFA) then {arrayids pushBackUnique (name _victim)};
		if (side _killer == Occupants) then {
			_nul = [0.25,0,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
			[-0.25,0] remoteExec ["A3A_fnc_prestige",2];
		} else {
			if (side _killer == Invaders) then {
				[0,-0.25] remoteExec ["A3A_fnc_prestige",2]
			} else {
				if (isPlayer _killer) then {
					_killer addRating 1000;
				};
			};
		};
		_victim setVariable ["spawner",nil,true];
	}];
	if ((typeOf _unit != SDKUnarmed) and !hasIFA) then {
		private _idUnit = selectRandom arrayids;
		arrayids = arrayids - [_idunit];
		_unit setIdentity _idUnit;
	};
	if (captive player) then {[_unit] spawn A3A_fnc_undercoverAI};

	_unit setVariable ["rearming",false];
	if ((!haveRadio) and !(hasIFA)) then {
		while {alive _unit} do {
			sleep 10;
			if (([player] call A3A_fnc_hasRadio) && (_unit call A3A_fnc_getRadio != "")) exitWith {_unit groupChat format ["This is %1, radiocheck OK",name _unit]};
			if (unitReady _unit) then {
				if ((alive _unit) and (_unit distance (getMarkerPos respawnTeamPlayer) > 50) and (_unit distance leader group _unit > 500) and ((vehicle _unit == _unit) or ((typeOf (vehicle _unit)) in arrayCivVeh))) then {
					hint format ["%1 lost communication, he will come back with you if possible", name _unit];
					[_unit] join stragglers;
					if ((vehicle _unit isKindOf "StaticWeapon") or (isNull (driver (vehicle _unit)))) then {unassignVehicle _unit; [_unit] orderGetIn false};
					_unit doMove position player;
					private _timeX = time + 900;
					waitUntil {sleep 1;(!alive _unit) or (_unit distance player < 500) or (time > _timeX)};
					if ((_unit distance player >= 500) and (alive _unit)) then {_unit setPos (getMarkerPos respawnTeamPlayer)};
					[_unit] join group player;
				};
			};
		};
	};
} else {
	_unit addEventHandler ["killed", {
		_victim = _this select 0;
		_killer = _this select 1;
		[_victim] remoteExec ["A3A_fnc_postmortem",2];
		if ((isPlayer _killer) and (side _killer == teamPlayer)) then {
			if (!isMultiPlayer) then {
				_nul = [0,20] remoteExec ["A3A_fnc_resourcesFIA",2];
				_killer addRating 1000;
			};
		} else {
			if (side _killer == Occupants) then {
				_nul = [0.25,0,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
				[-0.25,0] remoteExec ["A3A_fnc_prestige",2];
			} else {
				if (side _killer == Invaders) then {
					[0,-0.25] remoteExec ["A3A_fnc_prestige",2]
				} else {
					if (isPlayer _killer) then {
						_killer addRating 1000;
					};
				};
			};
		};
		_victim setVariable ["spawner",nil,true];
	}];
};
