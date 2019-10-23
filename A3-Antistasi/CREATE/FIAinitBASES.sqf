private ["_unit","_skill"];

_unit = _this select 0;
if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {diag_log format ["Antistasi: Error enviando a NATOinit los parámetros:%1",_this]};
_marcador = "";
if (count _this > 1) then
	{
	_marcador = _this select 1;
	_unit setVariable ["marcador",_marcador,true];
	if ((spawner getVariable _marcador != 0) and (vehicle _unit != _unit)) then
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
_tipo = typeOf _unit;
//_skill = if (_tipo in sdkTier1) then {0.1 + (skillFIA * 0.2)} else {if (_tipo in sdkTier2) then {0.2 + (skillFIA * 0.2)} else {0.3 + (skillFIA * 0.2)}};
_skill = 0.1 + (skillFIA * 0.05 * skillMult);
if ((_marcador == "Synd_HQ") and (isMultiplayer)) then {_skill = 1};
_unit setSkill _skill;
if (!activeGREF) then {if (not((uniform _unit) in uniformsSDK)) then {[_unit] call A3A_fnc_reDress}};
if (_tipo in SDKSniper) then
	{
	if (count unlockedSN > 0) then
		{
		[_unit, selectRandom unlockedSN, 8, 0] call BIS_fnc_addWeapon;
		if (count unlockedOptics > 0) then
			{
			_compatibles = [primaryWeapon _unit] call BIS_fnc_compatibleItems;
			_posibles = unlockedOptics select {_x in _compatibles};
			if (count _posibles > 0) then {_unit addPrimaryWeaponItem (_posibles select 0)};
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
		if (getNumber (configfile >> "CfgWeapons" >> headgear _unit >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") < 2) then {removeHeadgear _unit;_unit addHeadgear (selectRandom cascos)};
		};
	if (_tipo in SDKMil) then
		{
		[_unit,unlockedRifles] call A3A_fnc_randomRifle;
		if ((loadAbs _unit < 340) and (_tipo in SDKMil)) then
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
		if (_tipo in SDKMG) then
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
			if (_tipo in SDKGL) then
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
				[_unit,unlockedRifles] call A3A_fnc_randomRifle;
				if (_tipo in SDKMedic) then
					{
					_unit setUnitTrait ["medic",true];
					if ({_x == "FirstAidKit"} count (items _unit) < 10) then
						{
						for "_i" from 1 to 10 do {_unit addItemToBackpack "FirstAidKit"};
						};
					}
				else
					{
					if (_tipo in SDKATman) then
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
							if (hayIFA) then
								{
								[_unit, "LIB_PTRD", 10, 0] call BIS_fnc_addWeapon;
								};
							};
						}
					else
						{
						if (_tipo in squadLeaders) then
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


_unit selectWeapon (primaryWeapon _unit);

if (!haveRadio) then {_unit unlinkItem "ItemRadio"};
if !(hayIFA) then
	{
	if (sunOrMoon < 1) then
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
if ({if (_x in humo) exitWith {1}} count unlockedMagazines > 0) then {_unit addMagazines [selectRandom humo,2]};

_EHkilledIdx = _unit addEventHandler ["killed", {
	_muerto = _this select 0;
	_killer = _this select 1;
	[_muerto] remoteExec ["A3A_fnc_postmortem",2];
	if (isPlayer _killer) then
		{
		if (!isMultiPlayer) then
			{
			_nul = [0,20] remoteExec ["A3A_fnc_resourcesFIA",2];
			_killer addRating 1000;
			};
		};
	if (side _killer == malos) then
		{
		[0,-0.25,getPos _muerto] remoteExec ["A3A_fnc_citySupportChange",2];
		[-0.25,0] remoteExec ["A3A_fnc_prestige",2];
		}
	else
		{
		if (side _killer == muyMalos) then {[0,-0.25] remoteExec ["A3A_fnc_prestige",2]};
		};
	_marcador = _muerto getVariable "marcador";
	if (!isNil "_marcador") then
		{
		if (lados getVariable [_marcador,sideUnknown] == buenos) then
			{
			[typeOf _muerto,buenos,_marcador,-1] remoteExec ["A3A_fnc_garrisonUpdate",2];
			_muerto setVariable [_marcador,nil,true];
			};
		};
	}];
_revelar = false;
if (vehicle _unit != _unit) then
	{
	if (_unit == gunner (vehicle _unit)) then
		{
		_revelar = true;
		};
	}
else
	{
	if ((secondaryWeapon _unit) in mlaunchers) then {_revelar = true};
	};
if (_revelar) then
	{
	{
	_unit reveal [_x,1.5];
	} forEach allUnits select {(vehicle _x isKindOf "Air") and (_x distance _unit <= distanciaSPWN)};
	};
