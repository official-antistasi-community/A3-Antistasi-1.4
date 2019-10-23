if (isDedicated) exitWith {};
private ["_nuevo","_viejo"];
_nuevo = _this select 0;
_viejo = _this select 1;

if (isNull _viejo) exitWith {};

waitUntil {alive player};

_nul = [_viejo] spawn A3A_fnc_postmortem;
if !(hayACEMedical) then
	{
	_viejo setVariable ["INCAPACITATED",false,true];
	_nuevo setVariable ["INCAPACITATED",false,true];
	};
if ((side player == buenos) or (side player == civilian)) then
	{
	_owner = _viejo getVariable ["owner",_viejo];

	if (_owner != _viejo) exitWith {hint "Died while remote controlling AI"; selectPlayer _owner; disableUserInput false; deleteVehicle _nuevo};

	_nul = [0,-1,getPos _viejo] remoteExec ["A3A_fnc_citySupportChange",2];

	_score = _viejo getVariable ["score",0];
	_punish = _viejo getVariable ["punish",0];
	_dinero = _viejo getVariable ["dinero",0];
	_dinero = round (_dinero - (_dinero * 0.1));
	_elegible = _viejo getVariable ["elegible",true];
	_rango = _viejo getVariable ["rango","PRIVATE"];

	_dinero = round (_dinero - (_dinero * 0.05));
	if (_dinero < 0) then {_dinero = 0};

	_nuevo setVariable ["score",_score -1,true];
	_nuevo setVariable ["owner",_nuevo,true];
	_nuevo setVariable ["punish",_punish,true];
	_nuevo setVariable ["respawning",false];
	_nuevo setVariable ["dinero",_dinero,true];
	//_nuevo setUnitRank (rank _viejo);
	_nuevo setVariable ["compromised",0];
	_nuevo setVariable ["elegible",_elegible,true];
	_nuevo setVariable ["GREENFORSpawn",true,true];
	_viejo setVariable ["GREENFORSpawn",nil,true];
	[_nuevo,false] remoteExec ["setCaptive",0,_nuevo];
	_nuevo setCaptive false;
	_nuevo setRank (_rango);
	_nuevo setVariable ["rango",_rango,true];
	_nuevo setUnitTrait ["camouflageCoef",0.8];
	_nuevo setUnitTrait ["audibleCoef",0.8];
	{
    _nuevo addOwnedMine _x;
    } count (getAllOwnedMines (_viejo));

	//if (!hayACEMedical) then {[_nuevo] call A3A_fnc_initRevive};
	disableUserInput false;
	//_nuevo enableSimulation true;
	if (_viejo == theBoss) then
		{
		[_nuevo] call A3A_fnc_theBossInit;
		};


	removeAllItemsWithMagazines _nuevo;
	{_nuevo removeWeaponGlobal _x} forEach weapons _nuevo;
	removeBackpackGlobal _nuevo;
	removeVest _nuevo;
	if ((not("ItemGPS" in unlockedItems)) and ("ItemGPS" in (assignedItems _nuevo))) then {_nuevo unlinkItem "ItemGPS"};
	if ((!hayTFAR) and (!hayACRE) and ("ItemRadio" in (assignedItems player)) and (!haveRadio)) then {player unlinkItem "ItemRadio"};
	if (!isPlayer (leader group player)) then {(group player) selectLeader player};
	player addEventHandler ["FIRED",
		{
		_player = _this select 0;
		if (captive _player) then
			{
			if ({if (((side _x == malos) or (side _x == muyMalos)) and (_x distance player < 300)) exitWith {1}} count allUnits > 0) then
				{
				[_player,false] remoteExec ["setCaptive",0,_player];
				_player setCaptive false;
				}
			else
				{
				_ciudad = [ciudades,_player] call BIS_fnc_nearestPosition;
				_size = [_ciudad] call A3A_fnc_sizeMarker;
				_datos = server getVariable _ciudad;
				if (random 100 < _datos select 2) then
					{
					if (_player distance getMarkerPos _ciudad < _size * 1.5) then
						{
						[_player,false] remoteExec ["setCaptive",0,_player];
						_player setCaptive false;
						if (vehicle _player != _player) then
							{
							{if (isPlayer _x) then {[_x,false] remoteExec ["setCaptive",0,_x]; _x setCaptive false}} forEach ((assignedCargo (vehicle _player)) + (crew (vehicle _player)) - [_player]);
							};
						};
					};
				};
			}
		}
		];

	player addEventHandler ["InventoryOpened",
		{
		private ["_jugador","_contenedor","_tipo"];
		_control = false;
		_jugador = _this select 0;
		if (captive _jugador) then
			{
			_contenedor = _this select 1;
			_tipo = typeOf _contenedor;
			if (((_contenedor isKindOf "Man") and (!alive _contenedor)) or (_tipo == NATOAmmoBox) or (_tipo == CSATAmmoBox)) then
				{
				if ({if (((side _x== muyMalos) or (side _x== malos)) and (_x knowsAbout _jugador > 1.4)) exitWith {1}} count allUnits > 0) then
					{
					[_jugador,false] remoteExec ["setCaptive",0,_jugador];
					_jugador setCaptive false;
					}
				else
					{
					_ciudad = [ciudades,_jugador] call BIS_fnc_nearestPosition;
					_size = [_ciudad] call A3A_fnc_sizeMarker;
					_datos = server getVariable _ciudad;
					if (random 100 < _datos select 2) then
						{
						if (_jugador distance getMarkerPos _ciudad < _size * 1.5) then
							{
							[_jugador,false] remoteExec ["setCaptive",0,_jugador];
							_jugador setCaptive false;
							};
						};
					};
				};
			};
		_control
		}];
	/*
	player addEventHandler ["InventoryClosed",
		{
		_control = false;
		_uniform = uniform player;
		_typeSoldier = getText (configfile >> "CfgWeapons" >> _uniform >> "ItemInfo" >> "uniformClass");
		_sideType = getNumber (configfile >> "CfgVehicles" >> _typeSoldier >> "side");
		if ((_sideType == 1) or (_sideType == 0) and (_uniform != "")) then
			{
			if !(player getVariable ["disfrazado",false]) then
				{
				hint "You are wearing an enemy uniform, this will make the AI attack you. Beware!";
				player setVariable ["disfrazado",true];
				player addRating (-1*(2001 + rating player));
				};
			}
		else
			{
			if (player getVariable ["disfrazado",false]) then
				{
				hint "You removed your enemy uniform";
				player addRating (rating player * -1);
				};
			};
		_control
		}];
		*/
	if (tkPunish) then
		{
		player addEventHandler ["Fired",
				{
				_tipo = _this select 1;
				if ((_tipo == "Put") or (_tipo == "Throw")) then
					{
					if (player distance petros < 50) then
						{
						deleteVehicle (_this select 6);
						if (_tipo == "Put") then
							{
							if (player distance petros < 10) then {[player,60] spawn A3A_fnc_castigo};
							};
						};
					};
				}];
		};
	player addEventHandler ["HandleHeal",
		{
		_player = _this select 0;
		if (captive _player) then
			{
			if ({((side _x== muyMalos) or (side _x== malos)) and (_x knowsAbout player > 1.4)} count allUnits > 0) then
				{
				[_player,false] remoteExec ["setCaptive",0,_player];
				_player setCaptive false;
				}
			else
				{
				_ciudad = [ciudades,_player] call BIS_fnc_nearestPosition;
				_size = [_ciudad] call A3A_fnc_sizeMarker;
				_datos = server getVariable _ciudad;
				if (random 100 < _datos select 2) then
					{
					if (_player distance getMarkerPos _ciudad < _size * 1.5) then
						{
						[_player,false] remoteExec ["setCaptive",0,_player];
						_player setCaptive false;
						};
					};
				};
			}
		}
		];
	player addEventHandler ["WeaponAssembled",
		{
		private ["_veh"];
		_veh = _this select 1;
		if (_veh isKindOf "StaticWeapon") then
			{
			if (not(_veh in staticsToSave)) then
				{
				staticsToSave pushBack _veh;
				publicVariable "staticsToSave";
				[_veh] call A3A_fnc_AIVEHinit;
				};
			}
		else
			{
			_veh addEventHandler ["Killed",{[_this select 0] remoteExec ["A3A_fnc_postmortem",2]}];
			};
		}];
	player addEventHandler ["WeaponDisassembled",
			{
			_bag1 = _this select 1;
			_bag2 = _this select 2;
			//_bag1 = objectParent (_this select 1);
			//_bag2 = objectParent (_this select 2);
			[_bag1] call A3A_fnc_AIVEHinit;
			[_bag2] call A3A_fnc_AIVEHinit;
			}
		];
	[true] execVM "reinitY.sqf";
	[player] execVM "OrgPlayers\unitTraits.sqf";
	[] spawn A3A_fnc_statistics;
	}
else
	{
	if (side player == malos) then {_viejo setVariable ["BLUFORSpawn",nil,true];_nuevo setVariable ["BLUFORSpawn",true,true]};
	if (activeUSAF) then {[player] call A3A_fnc_RHSdress};
	if (hayACE) then {[] call A3A_fnc_ACEpvpReDress};
	};
