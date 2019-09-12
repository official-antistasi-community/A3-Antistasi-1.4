private ["_unit","_victim","_killer","_skill","_nameX","_typeX"];

_unit = _this select 0;

[_unit] call A3A_fnc_initRevive;
_unit setVariable ["spawner",true,true];

_unit allowFleeing 0;
_typeX = typeOf _unit;
//_skill = if (_typeX in sdkTier1) then {(skillFIA * 0.2)} else {if (_typeX in sdkTier2) then {0.1 + (skillFIA * 0.2)} else {0.1 + (skillFIA * 0.2)}};
_skill = skillFIA * 0.05 * skillMult;
if (!activeGREF) then {if (not((uniform _unit) in uniformsSDK)) then {[_unit] call A3A_fnc_reDress}};

if ((!isMultiplayer) and (leader _unit == theBoss)) then {_skill = _skill + 0.1};
_unit setSkill _skill;
if (_typeX in SDKSniper) then
	{
	if (count unlockedSN > 0) then
		{
		_magazines = getArray (configFile / "CfgWeapons" / (primaryWeapon _unit) / "magazines");
		{_unit removeMagazines _x} forEach _magazines;
		_unit removeWeaponGlobal (primaryWeapon _unit);
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
	}
else
	{
	if (_unit skill "aimingAccuracy" > 0.35) then {_unit setSkill ["aimingAccuracy",0.35]};
	if (random 40 < skillFIA) then
		{
		if (getNumber (configfile >> "CfgWeapons" >> headgear _unit >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") < 2) then {removeHeadgear _unit;_unit addHeadgear (selectRandom helmets)};
		};
	if ((_typeX in SDKMil) or (_typeX == staticCrewTeamPlayer)) then
		{
		[_unit,unlockedRifles] call A3A_fnc_randomRifle;
		if ((loadAbs _unit < 340) and (_typeX in SDKMil)) then
			{
			if ((random 20 < skillFIA) and (count unlockedAA > 0)) then
				{
				_unit addbackpack (unlockedBackpacks select 0);
				[_unit, selectRandom unlockedAA, 2, 0] call BIS_fnc_addWeapon;
				//removeBackpack _unit;
				};
			};
		}
	else
		{
		if (_typeX in SDKMG) then
			{
			if (count unlockedMG > 0) then
				{
				[_unit,unlockedMG] call A3A_fnc_randomRifle;
				}
			else
				{
				[_unit,unlockedRifles] call A3A_fnc_randomRifle;
				};
			}
		else
			{
			if (_typeX in SDKGL) then
				{
				if (count unlockedGL > 0) then
					{
					[_unit,unlockedGL] call A3A_fnc_randomRifle;
					}
				else
					{
					[_unit,unlockedRifles] call A3A_fnc_randomRifle;
					};
				}
			else
				{
				if (_typeX != SDKUnarmed) then {[_unit,unlockedRifles] call A3A_fnc_randomRifle};
				if (_typeX in SDKExp) then
					{
					_unit setUnitTrait ["explosiveSpecialist",true];
					}
				else
					{
					if (_typeX in SDKMedic) then
						{
						_unit setUnitTrait ["medic",true];
						if ({_x == "FirstAidKit"} count (items _unit) < 10) then
							{
							for "_i" from 1 to 10 do {_unit addItemToBackpack "FirstAidKit"};
							};
						}
					else
						{
						if (_typeX in SDKATman) then
							{
							if !(unlockedAT isEqualTo []) then
								{
								_rlauncher = selectRandom unlockedAT;
								if (_rlauncher != secondaryWeapon _unit) then
									{
									_magazines = getArray (configFile / "CfgWeapons" / (secondaryWeapon _unit) / "magazines");
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
							}
						else
							{
							if (_typeX in squadLeaders) then
								{
								_unit setskill ["courage",_skill + 0.2];
								_unit setskill ["commanding",_skill + 0.2];
								};
							};
						};
					};
				};
			};
		};
	};

_unit setUnitTrait ["camouflageCoef",0.8];
_unit setUnitTrait ["audibleCoef",0.8];

_unit selectWeapon (primaryWeapon _unit);

if (!haveRadio) then
	{
	if ((_unit != leader _unit) and (_typeX != staticCrewTeamPlayer)) then {_unit unlinkItem (_unit call A3A_fnc_getRadio)};
	};

if ({if (_x in smokeX) exitWith {1}} count unlockedMagazines > 0) then {_unit addMagazines [selectRandom smokeX,2]};
if !(hasIFA) then
	{
	if ((sunOrMoon < 1) and (_typeX != SDKUnarmed)) then
		{
		if (haveNV) then
			{
			if (hmd _unit == "") then {_unit linkItem (selectRandom NVGoggles)};
			_pointers = pointers arrayIntersect unlockedItems;
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
			_flashlights = flashlights arrayIntersect unlockedItems;
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
/*
if ((_typeX != "B_G_Soldier_M_F") and (_typeX != "B_G_Sharpshooter_F")) then {if (_aiming > 0.35) then {_aiming = 0.35}};

_unit setskill ["aimingAccuracy",_aiming];
_unit setskill ["spotDistance",_spotD];
_unit setskill ["spotTime",_spotT];
_unit setskill ["courage",_cour];
_unit setskill ["commanding",_comm];
_unit setskill ["aimingShake",_aimingSh];
_unit setskill ["aimingSpeed",_aimingSp];
_unit setskill ["reloadSpeed",_reload];
*/
if (player == leader _unit) then
	{
	_unit setVariable ["owner",player];
	_EHkilledIdx = _unit addEventHandler ["killed", {
		_victim = _this select 0;
		[_victim] spawn A3A_fnc_postmortem;
		_killer = _this select 1;
		if !(hasIFA) then {arrayids pushBackUnique (name _victim)};
		if (side _killer == Occupants) then
			{
			_nul = [0.25,0,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
			[-0.25,0] remoteExec ["A3A_fnc_prestige",2];
			}
		else
			{
			if (side _killer == Invaders) then
				{
				[0,-0.25] remoteExec ["A3A_fnc_prestige",2]
				}
			else
				{
				if (isPlayer _killer) then
					{
					_killer addRating 1000;
					};
				};
			};
		_victim setVariable ["spawner",nil,true];
		}];
	if ((typeOf _unit != SDKUnarmed) and !hasIFA) then
		{
		_idUnit = arrayids call BIS_Fnc_selectRandom;
		arrayids = arrayids - [_idunit];
		_unit setIdentity _idUnit;
		};
	if (captive player) then {[_unit] spawn A3A_fnc_undercoverAI};

	_unit setVariable ["rearming",false];
	if ((!haveRadio) and !(hasIFA)) then
		{
		while {alive _unit} do
			{
			sleep 10;
			if (([player] call A3A_fnc_hasRadio) && (_unit call A3A_fnc_getRadio != "")) exitWith {_unit groupChat format ["This is %1, radiocheck OK",name _unit]};
			if (unitReady _unit) then
				{
				if ((alive _unit) and (_unit distance (getMarkerPos respawnTeamPlayer) > 50) and (_unit distance leader group _unit > 500) and ((vehicle _unit == _unit) or ((typeOf (vehicle _unit)) in arrayCivVeh))) then
					{
					hint format ["%1 lost communication, he will come back with you if possible", name _unit];
					[_unit] join stragglers;
					if ((vehicle _unit isKindOf "StaticWeapon") or (isNull (driver (vehicle _unit)))) then {unassignVehicle _unit; [_unit] orderGetIn false};
					_unit doMove position player;
					_timeX = time + 900;
					waitUntil {sleep 1;(!alive _unit) or (_unit distance player < 500) or (time > _timeX)};
					if ((_unit distance player >= 500) and (alive _unit)) then {_unit setPos (getMarkerPos respawnTeamPlayer)};
					[_unit] join group player;
					};
				};
			};
		};
	}
else
	{
	_EHkilledIdx = _unit addEventHandler ["killed", {
		_victim = _this select 0;
		_killer = _this select 1;
		[_victim] remoteExec ["A3A_fnc_postmortem",2];
		if ((isPlayer _killer) and (side _killer == teamPlayer)) then
			{
			if (!isMultiPlayer) then
				{
				_nul = [0,20] remoteExec ["A3A_fnc_resourcesFIA",2];
				_killer addRating 1000;
				};
			}
		else
			{
			if (side _killer == Occupants) then
				{
				_nul = [0.25,0,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
				[-0.25,0] remoteExec ["A3A_fnc_prestige",2];
				}
			else
				{
				if (side _killer == Invaders) then
					{
					[0,-0.25] remoteExec ["A3A_fnc_prestige",2]
					}
				else
					{
					if (isPlayer _killer) then
						{
						_killer addRating 1000;
						};
					};
				};
			};
		_victim setVariable ["spawner",nil,true];
		}];
	};


