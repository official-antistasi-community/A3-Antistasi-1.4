private ["_unit","_Pweapon","_Sweapon","_cuenta","_magazines","_hayCaja","_distancia","_objetos","_target","_muerto","_check","_timeOut","_arma","_armas","_rearming","_basePosible","_hmd","_casco","_camion","_autoLoot","_itemsUnit"];

_unit = _this select 0;

if (isPlayer _unit) exitWith {};
if !([_unit] call A3A_fnc_canFight) exitWith {};
_inPlayerGroup = (isPlayer (leader _unit));
//_ayudando = _unit getVariable "ayudando";
if (_unit getVariable ["ayudando",false]) exitWith {if (_inPlayerGroup) then {_unit groupChat "I cannot rearm right now. I'm healing a comrade"}};
_rearming = _unit getVariable ["rearming",false];
if (_rearming) exitWith {if (_inPlayerGroup) then {_unit groupChat "I am currently rearming. Cancelling."; _unit setVariable ["rearming",false]}};
if (vehicle _unit != _unit) exitWith {};
_unit setVariable ["rearming",true];

_Pweapon = primaryWeapon _unit;
_Sweapon = secondaryWeapon _unit;

_objetos = [];
_hayCaja = false;
_arma = "";
_armas = [];
_distancia = 51;
_objetos = nearestObjects [_unit, ["ReammoBox_F","LandVehicle","WeaponHolderSimulated", "GroundWeaponHolder", "WeaponHolder"], 50];
if (caja in _objetos) then {_objetos = _objetos - [caja]};

_necesita = false;

if ((_Pweapon in initialRifles) or (_Pweapon == "")) then
	{
	_necesita = true;
	if (count _objetos > 0) then
		{
		{
		_objeto = _x;
		if (_unit distance _objeto < _distancia) then
			{
			if ((count weaponCargo _objeto > 0) and !(_objeto getVariable ["busy",false])) then
				{
				_armas = weaponCargo _objeto;
				for "_i" from 0 to (count _armas - 1) do
					{
					_posible = _armas select _i;
					_basePosible = [_posible] call BIS_fnc_baseWeapon;
					if ((not(_basePosible in ["hgun_PDW2000_F","hgun_Pistol_01_F","hgun_ACPC2_F","arifle_AKM_F","arifle_AKS_F","SMG_05_F","LMG_03_F"])) and ((_basePosible in arifles) or (_basePosible in srifles) or (_basePosible in mguns))) then
						{
						_target = _objeto;
						_hayCaja = true;
						_distancia = _unit distance _objeto;
						_arma = _posible;
						};
					};
				};
			};
		} forEach _objetos;
		};
	if ((_hayCaja) and (_unit getVariable "rearming")) then
		{
		_unit stop false;
		if ((!alive _target) or (not(_target isKindOf "ReammoBox_F"))) then {_target setVariable ["busy",true]};
		_unit doMove (getPosATL _target);
		if (_inPlayerGroup) then {_unit groupChat "Picking a better weapon"};
		_timeOut = time + 60;
		waitUntil {sleep 1; !([_unit] call A3A_fnc_canFight) or (isNull _target) or (_unit distance _target < 3) or (_timeOut < time) or (unitReady _unit)};
		if ((unitReady _unit) and ([_unit] call A3A_fnc_canFight) and (_unit distance _target > 3) and (_target isKindOf "ReammoBox_F") and (!isNull _target)) then {_unit setPos position _target};
		if (_unit distance _target < 3) then
			{
			_unit action ["TakeWeapon",_target,_arma];
			sleep 5;
			if (primaryWeapon _unit == _arma) then
				{
				if (_inPlayerGroup) then {_unit groupChat "I have a better weapon now"};
				if (_target isKindOf "ReammoBox_F") then {_unit action ["rearm",_target]};
				};
			};
		_target setVariable ["busy",false];
		};
	_distancia = 51;
	_Pweapon = primaryWeapon _unit;
	sleep 3;
	};
_hayCaja = false;
_cuenta = 4;
if (_Pweapon in mguns) then {_cuenta = 2};
_magazines = getArray (configFile / "CfgWeapons" / _Pweapon / "magazines");
if ({_x in _magazines} count (magazines _unit) < _cuenta) then
	{
	_necesita = true;
	_hayCaja = false;
	if (count _objetos > 0) then
		{
		{
		_objeto = _x;
		if (({_x in _magazines} count magazineCargo _objeto) > 0) then
			{
			if (_unit distance _objeto < _distancia) then
				{
				_target = _objeto;
				_hayCaja = true;
				_distancia = _unit distance _objeto;
				};
			};
		} forEach _objetos;
		};
	_muertos = allDead select {(_x distance _unit < 51) and (!(_x getVariable ["busy",false]))};
	{
	_muerto = _x;
	if (({_x in _magazines} count (magazines _muerto) > 0) and (_unit distance _muerto < _distancia)) then
		{
		_target = _muerto;
		_hayCaja = true;
		_distancia = _muerto distance _unit;
		};
	} forEach _muertos;
	};
if ((_hayCaja) and (_unit getVariable "rearming")) then
	{
	_unit stop false;
	if ((!alive _target) or (not(_target isKindOf "ReammoBox_F"))) then {_target setVariable ["busy",true]};
	_unit doMove (getPosATL _target);
	if (_inPlayerGroup) then {_unit groupChat "Rearming"};
	_timeOut = time + 60;
	waitUntil {sleep 1; !([_unit] call A3A_fnc_canFight) or (isNull _target) or (_unit distance _target < 3) or (_timeOut < time) or (unitReady _unit)};
	if ((unitReady _unit) and ([_unit] call A3A_fnc_canFight) and (_unit distance _target > 3) and (_target isKindOf "ReammoBox_F") and (!isNull _target)) then {_unit setPos position _target};
	if (_unit distance _target < 3) then
		{
		_unit action ["rearm",_target];
		if ({_x in _magazines} count (magazines _unit) >= _cuenta) then
			{
			if (_inPlayerGroup) then {_unit groupChat "Rearmed"};
			}
		else
			{
			if (_inPlayerGroup) then {_unit groupChat "Partially Rearmed"};
			};
		};
	_target setVariable ["busy",false];
	}
else
	{
	if (_inPlayerGroup) then {_unit groupChat "No source to rearm my primary weapon"};
	};
_hayCaja = false;
if ((_Sweapon == "") and (loadAbs _unit < 340)) then
	{
	if (count _objetos > 0) then
		{
		{
		_objeto = _x;
		if (_unit distance _objeto < _distancia) then
			{
			if ((count weaponCargo _objeto > 0) and !(_objeto getVariable ["busy",false])) then
				{
				_armas = weaponCargo _objeto;
				for "_i" from 0 to (count _armas - 1) do
					{
					_posible = _armas select _i;
					if ((_posible in mlaunchers) or (_posible in rlaunchers)) then
						{
						_target = _objeto;
						_hayCaja = true;
						_distancia = _unit distance _objeto;
						_arma = _posible;
						};
					};
				};
			};
		} forEach _objetos;
		};
	if ((_hayCaja) and (_unit getVariable "rearming")) then
		{
		_unit stop false;
		if ((!alive _target) or (not(_target isKindOf "ReammoBox_F"))) then {_target setVariable ["busy",true]};
		_unit doMove (getPosATL _target);
		if (_inPlayerGroup) then {_unit groupChat "Picking a secondary weapon"};
		_timeOut = time + 60;
		waitUntil {sleep 1; !([_unit] call A3A_fnc_canFight) or (isNull _target) or (_unit distance _target < 3) or (_timeOut < time) or (unitReady _unit)};
		if ((unitReady _unit) and ([_unit] call A3A_fnc_canFight) and (_unit distance _target > 3) and (_target isKindOf "ReammoBox_F") and (!isNull _target)) then {_unit setPos position _target};
		if (_unit distance _target < 3) then
			{
			_unit action ["TakeWeapon",_target,_arma];
			sleep 3;
			if (secondaryWeapon _unit == _arma) then
				{
				if (_inPlayerGroup) then {_unit groupChat "I have a secondary weapon now"};
				if (_target isKindOf "ReammoBox_F") then {sleep 3;_unit action ["rearm",_target]};
				};
			};
		_target setVariable ["busy",false];
		};
	_Sweapon = secondaryWeapon _unit;
	_distancia = 51;
	sleep 3;
	};
_hayCaja = false;
if (_Sweapon != "") then
	{
	_magazines = getArray (configFile / "CfgWeapons" / _Sweapon / "magazines");
	if ({_x in _magazines} count (magazines _unit) < 2) then
		{
		_necesita = true;
		_hayCaja = false;
		_distancia = 50;
		if (count _objetos > 0) then
			{
			{
			_objeto = _x;
			if ({_x in _magazines} count magazineCargo _objeto > 0) then
				{
				if (_unit distance _objeto < _distancia) then
					{
					_target = _objeto;
					_hayCaja = true;
					_distancia = _unit distance _objeto;
					};
				};
			} forEach _objetos;
			};
		_muertos = allDead select {(_x distance _unit < 51) and (!(_x getVariable ["busy",false]))};
		{
		_muerto = _x;
		if (({_x in _magazines} count (magazines _muerto) > 0) and (_unit distance _muerto < _distancia)) then
			{
			_target = _muerto;
			_hayCaja = true;
			_distancia = _muerto distance _unit;
			};
		} forEach _muertos;
		};
	if ((_hayCaja) and (_unit getVariable "rearming")) then
		{
		_unit stop false;
		if (!alive _target) then {_target setVariable ["busy",true]};
		_unit doMove (position _target);
		if (_inPlayerGroup) then {_unit groupChat "Rearming"};
		_timeOut = time + 60;
		waitUntil {sleep 1; !([_unit] call A3A_fnc_canFight) or (isNull _target) or (_unit distance _target < 3) or (_timeOut < time) or (unitReady _unit)};
		if ((unitReady _unit) and ([_unit] call A3A_fnc_canFight) and (_unit distance _target > 3) and (_target isKindOf "ReammoBox_F") and (!isNull _target)) then {_unit setPos position _target};
		if (_unit distance _target < 3) then
			{
			if ((backpack _unit == "") and (backPack _target != "")) then
				{
				_unit addBackPackGlobal ((backpack _target) call BIS_fnc_basicBackpack);
				_unit action ["rearm",_target];
				sleep 3;
				{_unit addItemToBackpack _x} forEach (backpackItems _target);
				removeBackpackGlobal _target;
				}
			else
				{
				_unit action ["rearm",_target];
				};

			if ({_x in _magazines} count (magazines _unit) >= 2) then
				{
				if (_inPlayerGroup) then {_unit groupChat "Rearmed"};
				}
			else
				{
				if (_inPlayerGroup) then {_unit groupChat "Partially Rearmed"};
				};
			};
		_target setVariable ["busy",false];
		}
	else
		{
		if (_inPlayerGroup) then {_unit groupChat "No source to rearm my secondary weapon"};
		};
	sleep 3;
	};
_hayCaja = false;
if ((not("ItemRadio" in assignedItems _unit)) and !haveRadio) then
	{
	_necesita = true;
	_hayCaja = false;
	_distancia = 50;
	_muertos = allDead select {(_x distance _unit < 51) and (!(_x getVariable ["busy",false]))};
	{
	_muerto = _x;
	if (("ItemRadio" in (assignedItems _muerto)) and (_unit distance _muerto < _distancia)) then
		{
		_target = _muerto;
		_hayCaja = true;
		_distancia = _muerto distance _unit;
		};
	} forEach _muertos;
	if ((_hayCaja) and (_unit getVariable "rearming")) then
		{
		_unit stop false;
		_target setVariable ["busy",true];
		_unit doMove (getPosATL _target);
		if (_inPlayerGroup) then {_unit groupChat "Picking a Radio"};
		_timeOut = time + 60;
		waitUntil {sleep 1; !([_unit] call A3A_fnc_canFight) or (isNull _target) or (_unit distance _target < 3) or (_timeOut < time) or (unitReady _unit)};
		if (_unit distance _target < 3) then
			{
			_unit action ["rearm",_target];
			_unit linkItem "ItemRadio";
			_target unlinkItem "ItemRadio";
			};
		_target setVariable ["busy",false];
		};
	};
_hayCaja = false;
if (hmd _unit == "") then
	{
	_necesita = true;
	_hayCaja = false;
	_distancia = 50;
	_muertos = allDead select {(_x distance _unit < 51) and (!(_x getVariable ["busy",false]))};
	{
	_muerto = _x;
	if ((hmd _muerto != "") and (_unit distance _muerto < _distancia)) then
		{
		_target = _muerto;
		_hayCaja = true;
		_distancia = _muerto distance _unit;
		};
	} forEach _muertos;

	if ((_hayCaja) and (_unit getVariable "rearming")) then
		{
		_unit stop false;
		_target setVariable ["busy",true];
		_hmd = hmd _target;
		_unit doMove (getPosATL _target);
		if (_inPlayerGroup) then {_unit groupChat "Picking NV Googles"};
		_timeOut = time + 60;
		waitUntil {sleep 1; !([_unit] call A3A_fnc_canFight) or (isNull _target) or (_unit distance _target < 3) or (_timeOut < time) or (unitReady _unit)};
		if (_unit distance _target < 3) then
			{
			_unit action ["rearm",_target];
			_unit linkItem _hmd;
			_target unlinkItem _hmd;
			};
		_target setVariable ["busy",false];
		};
	};
_hayCaja = false;
if (not(headgear _unit in cascos)) then
	{
	_necesita = true;
	_hayCaja = false;
	_distancia = 50;
	_muertos = allDead select {(_x distance _unit < 51) and (!(_x getVariable ["busy",false]))};
	{
	_muerto = _x;
	if (((headgear _muerto) in cascos) and (_unit distance _muerto < _distancia)) then
		{
		_target = _muerto;
		_hayCaja = true;
		_distancia = _muerto distance _unit;
		};
	} forEach _muertos;
	if ((_hayCaja) and (_unit getVariable "rearming")) then
		{
		_unit stop false;
		_target setVariable ["busy",true];
		_casco = headgear _target;
		_unit doMove (getPosATL _target);
		if (_inPlayerGroup) then {_unit groupChat "Picking a Helmet"};
		_timeOut = time + 60;
		waitUntil {sleep 1; !([_unit] call A3A_fnc_canFight) or (isNull _target) or (_unit distance _target < 3) or (_timeOut < time) or (unitReady _unit)};
		if (_unit distance _target < 3) then
			{
			_unit action ["rearm",_target];
			_unit addHeadgear _casco;
			removeHeadgear _target;
			};
		_target setVariable ["busy",false];
		};
	};
_hayCaja = false;
_minFA = if ([_unit] call A3A_fnc_isMedic) then {10} else {1};

if ({_x == "FirstAidKit"} count (items _unit) < _minFA) then
	{
	_necesita = true;
	_hayCaja = false;
	_distancia = 50;
	_muertos = allDead select {(_x distance _unit < 51) and (!(_x getVariable ["busy",false]))};
	{
	_muerto = _x;
	if (("FirstAidKit" in items _muerto) and (_unit distance _muerto < _distancia)) then
		{
		_target = _muerto;
		_hayCaja = true;
		_distancia = _muerto distance _unit;
		};
	} forEach _muertos;
	if ((_hayCaja) and (_unit getVariable "rearming")) then
		{
		_unit stop false;
		_target setVariable ["busy",true];
		_unit doMove (getPosATL _target);
		if (_inPlayerGroup) then {_unit groupChat "Picking a First Aid Kit"};
		_timeOut = time + 60;
		waitUntil {sleep 1; !([_unit] call A3A_fnc_canFight) or (isNull _target) or (_unit distance _target < 3) or (_timeOut < time) or (unitReady _unit)};
		if (_unit distance _target < 3) then
			{
			while {{_x == "FirstAidKit"} count (items _unit) < _minFA} do
				{
				_unit action ["rearm",_target];
				_unit addItem "FirstAidKit";
				_target removeItem "FirstAidKit";
				if ("FirstAidKit" in items _muerto) then {sleep 3};
				};
			};
		_target setVariable ["busy",false];
		};
	};
_hayCaja = false;
_numero = getNumber (configfile >> "CfgWeapons" >> vest cursortarget >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Chest" >> "armor");
_distancia = 50;
_muertos = allDead select {(_x distance _unit < 51) and (!(_x getVariable ["busy",false]))};
{
_muerto = _x;
if ((getNumber (configfile >> "CfgWeapons" >> vest _muerto >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Chest" >> "armor") > _numero) and (_unit distance _muerto < _distancia)) then
	{
	_target = _muerto;
	_hayCaja = true;
	_distancia = _muerto distance _unit;
	};
} forEach _muertos;
if ((_hayCaja) and (_unit getVariable "rearming")) then
	{
	_unit stop false;
	_target setVariable ["busy",true];
	_unit doMove (getPosATL _target);
	if (_inPlayerGroup) then {_unit groupChat "Picking a a better vest"};
	_timeOut = time + 60;
	waitUntil {sleep 1; !([_unit] call A3A_fnc_canFight) or (isNull _target) or (_unit distance _target < 3) or (_timeOut < time) or (unitReady _unit)};
	if (_unit distance _target < 3) then
		{
		_itemsUnit = vestItems _unit;
		_unit addVest (vest _target);
		{_unit addItemToVest _x} forEach _itemsUnit;
		_unit action ["rearm",_target];
		//{_unit addItemCargoGlobal [_x,1]} forEach ((backpackItems _target) + (backpackMagazines _target));
		_cosas = nearestObjects [_target, ["WeaponHolderSimulated", "GroundWeaponHolder", "WeaponHolder"], 5];
		if (count _cosas > 0) then
			{
			_cosa = _cosas select 0;
			{_cosa addItemCargoGlobal [_x,1]} forEach (vestItems _target);
			};
		removeVest _target;
		};
	_target setVariable ["busy",false];
	};

if (backpack _unit == "") then
	{
	_necesita = true;
	_hayCaja = false;
	_distancia = 50;
	_muertos = allDead select {(_x distance _unit < 51) and (!(_x getVariable ["busy",false]))};
	{
	_muerto = _x;
	if ((backpack _muerto != "") and (_unit distance _muerto < _distancia)) then
		{
		_target = _muerto;
		_hayCaja = true;
		_distancia = _muerto distance _unit;
		};
	} forEach _muertos;
	if ((_hayCaja) and (_unit getVariable "rearming")) then
		{
		_unit stop false;
		_target setVariable ["busy",true];
		_unit doMove (getPosATL _target);
		if (_inPlayerGroup) then {_unit groupChat "Picking a Backpack"};
		_timeOut = time + 60;
		waitUntil {sleep 1; !([_unit] call A3A_fnc_canFight) or (isNull _target) or (_unit distance _target < 3) or (_timeOut < time) or (unitReady _unit)};
		if (_unit distance _target < 3) then
			{
			_unit addBackPackGlobal ((backpack _target) call BIS_fnc_basicBackpack);
			_unit action ["rearm",_target];
			//{_unit addItemCargoGlobal [_x,1]} forEach ((backpackItems _target) + (backpackMagazines _target));
			_cosas = nearestObjects [_target, ["WeaponHolderSimulated", "GroundWeaponHolder", "WeaponHolder"], 5];
			if (count _cosas > 0) then
				{
				_cosa = _cosas select 0;
				{_cosa addItemCargoGlobal [_x,1]} forEach (backpackItems _target);
				};
			removeBackpackGlobal _target;
			};
		_target setVariable ["busy",false];
		};
	};
_unit doFollow (leader _unit);
if (!_necesita) then {if (_inPlayerGroup) then {_unit groupChat "No need to rearm"}} else {if (_inPlayerGroup) then {_unit groupChat "Rearming Done"}};
_unit setVariable ["rearming",false];