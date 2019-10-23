if (!isServer) exitWith {};
private ["_subCosa","_municion","_origen","_destino"];
_origen = _this select 0;
if (isNull _origen) exitWith {};
_destino = _this select 1;

_municion= [];
_items = [];
_municion = magazineCargo _origen;
_items = itemCargo _origen;
_armas = [];
_weaponsItemsCargo = weaponsItemsCargo _origen;
_mochis = [];

if (count backpackCargo _origen > 0) then
	{
	{
	_mochis pushBack (_x call BIS_fnc_basicBackpack);
	} forEach backpackCargo _origen;
	};
_contenedores = everyContainer _origen;
if (count _contenedores > 0) then
	{
	for "_i" from 0 to (count _contenedores) - 1 do
		{
		_subCosa = magazineCargo ((_contenedores select _i) select 1);
		if (!isNil "_subCosa") then {_municion = _municion + _subCosa} else {diag_log format ["Error from %1",magazineCargo (_contenedores select _i)]};
		//_municion = _municion + (magazineCargo ((_contenedores select _i) select 1));
		_items = _items + (itemCargo ((_contenedores select _i) select 1));
		_weaponsItemsCargo = _weaponsItemsCargo + weaponsItemsCargo ((_contenedores select _i) select 1);
		};
	};
if (!isNil "_weaponsItemsCargo") then
	{
	if (count _weaponsItemsCargo > 0) then
		{
		{
		_armas pushBack ([(_x select 0)] call BIS_fnc_baseWeapon);
		for "_i" from 1 to (count _x) - 1 do
			{
			_cosa = _x select _i;
			if (typeName _cosa == typeName "") then
				{
				if (_cosa != "") then {_items pushBack _cosa};
				};
			};
		} forEach _weaponsItemsCargo;
		};
	};

_armasFinal = [];
_armasFinalCount = [];
{
_arma = _x;
if ((not(_arma in _armasFinal)) and (not(_arma in unlockedWeapons))) then
	{
	_armasFinal pushBack _arma;
	_armasFinalCount pushBack ({_x == _arma} count _armas);
	};
} forEach _armas;

if (count _armasFinal > 0) then
	{
	for "_i" from 0 to (count _armasFinal) - 1 do
		{
		_destino addWeaponCargoGlobal [_armasFinal select _i,_armasFinalCount select _i];
		};
	};

_municionFinal = [];
_municionFinalCount = [];
if (isNil "_municion") then
	{
	diag_log format ["Error en transmisión de munición. Tenía esto: %1 y estos contenedores: %2, el origen era un %3 y el objeto está definido como: %4", magazineCargo _origen, everyContainer _origen,typeOf _origen,_origen];
	}
else
	{
	{
	_arma = _x;
	if ((not(_arma in _municionFinal)) and (not(_arma in unlockedMagazines))) then
		{
		_municionFinal pushBack _arma;
		_municionFinalCount pushBack ({_x == _arma} count _municion);
		};
	} forEach  _municion;
	};


if (count _municionFinal > 0) then
	{
	for "_i" from 0 to (count _municionFinal) - 1 do
		{
		_destino addMagazineCargoGlobal [_municionFinal select _i,_municionFinalCount select _i];
		};
	};

_itemsFinal = [];
_itemsFinalCount = [];
{
_arma = _x;
if ((not(_arma in _itemsFinal)) and (not(_arma in unlockedItems))) then
	{
	_itemsFinal pushBack _arma;
	_itemsFinalCount pushBack ({_x == _arma} count _items);
	};
} forEach _items;

if (count _itemsFinal > 0) then
	{
	for "_i" from 0 to (count _itemsFinal) - 1 do
		{
		_destino addItemCargoGlobal [_itemsFinal select _i,_itemsFinalCount select _i];
		};
	};

_mochisFinal = [];
_mochisFinalCount = [];
{
_arma = _x;
if ((not(_arma in _mochisFinal)) and (not(_arma in unlockedBackpacks))) then
	{
	_mochisFinal pushBack _arma;
	_mochisFinalCount pushBack ({_x == _arma} count _mochis);
	};
} forEach _mochis;

if (count _mochisFinal > 0) then
	{
	for "_i" from 0 to (count _mochisFinal) - 1 do
		{
		_destino addBackpackCargoGlobal [_mochisFinal select _i,_mochisFinalCount select _i];
		};
	};

if (count _this == 3) then
	{
	deleteVehicle _origen;
	}
else
	{
	clearMagazineCargoGlobal _origen;
	clearWeaponCargoGlobal _origen;
	clearItemCargoGlobal _origen;
	clearBackpackCargoGlobal _origen;
	};

if (_destino == caja) then
	{
	if (isMultiplayer) then {{if (_x distance caja < 10) then {[petros,"hint","Ammobox Loaded"] remoteExec ["A3A_fnc_commsMP",_x]}} forEach playableUnits} else {hint "Ammobox Loaded"};
	if ((_origen isKindOf "ReammoBox_F") and (_origen != cajaVeh)) then {deleteVehicle _origen};
	_updated = [] call A3A_fnc_arsenalManage;
	if (_updated != "") then
		{
		_updated = format ["Arsenal Updated<br/><br/>%1",_updated];
		[petros,"income",_updated] remoteExec ["A3A_fnc_commsMP",[buenos,civilian]];
		};
	}
else
	{
	[petros,"hint","Truck Loaded"] remoteExec ["A3A_fnc_commsMP",driver _destino];
	};