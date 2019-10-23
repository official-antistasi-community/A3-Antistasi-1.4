if (player != player getVariable ["owner",objNull]) exitWith {hint "You cannot construct anything while controlling AI"};

private _ingeniero = objNull;

{if (_x getUnitTrait "engineer") exitWith {_ingeniero = _x}} forEach units group player;

if (isNull _ingeniero) exitWith {hint "Your squad needs an engineer to be able to construct"};
if ((player != _ingeniero) and (isPlayer _ingeniero)) exitWith {hint "There is a human player engineer in your squad, ask him to construct whatever you need"};
if ((player != leader player) and (_ingeniero != player)) exitWith {hint "Only squad leaders can ask engineers to construct something"};
if !([_ingeniero] call A3A_fnc_canFight) exitWith {hint "Your Engineer is dead or incapacitated and cannot construct anything"};
if ((_ingeniero getVariable ["ayudando",false]) or (_ingeniero getVariable ["rearming",false]) or (_ingeniero getVariable ["constructing",false])) exitWith {hint "Your engineer is currently performing another action"};

private _tipo = _this select 0;
private _dir = getDir player;
private _posicion = position player;
private _coste = 0;
private _tiempo = 60;
private _clase = "";
switch _tipo do
	{
	case "ST":
		{
		if (count (nearestTerrainObjects [player, ["House"], 70]) > 3) then
			{
			_clase = selectRandom ["Land_GarbageWashingMachine_F","Land_JunkPile_F","Land_Barricade_01_4m_F"];
			}
		else
			{
			if (count (nearestTerrainObjects [player,["tree"],70]) > 8) then
				{
				_clase = "Land_WoodPile_F";
				}
			else
				{
				_clase = "CraterLong_small";
				};
			};
		};
	case "MT":
		{
		_tiempo = 60;
		if (count (nearestTerrainObjects [player, ["House"], 70]) > 3) then
			{
			_clase = "Land_Barricade_01_10m_F";
			}
		else
			{
			if (count (nearestTerrainObjects [player,["tree"],70]) > 8) then
				{
				_clase = "Land_WoodPile_large_F";
				}
			else
				{
				_clase = selectRandom ["Land_BagFence_01_long_green_F","Land_SandbagBarricade_01_half_F"];
				};
			};
		};
	case "RB":
		{
		_tiempo = 100;
		if (count (nearestTerrainObjects [player, ["House"], 70]) > 3) then
			{
			_clase = "Land_Tyres_F";
			}
		else
			{
			_clase = "Land_TimberPile_01_F";
			};
		};
	case "SB":
		{
		_tiempo = 60;
		_clase = "Land_BagBunker_01_small_green_F";
		_coste = 100;
		};
	case "CB":
		{
		_tiempo = 120;
		_clase = "Land_PillboxBunker_01_big_F";
		_coste = 300;
		};
	};

//if ((_tipo == "RB") and !(isOnRoad _posicion)) exitWith {hint "Please select this option on a road segment"};

private _salir = false;
private _texto = "";
if ((_tipo == "SB") or (_tipo == "CB")) then
	{
	if (_tipo == "SB") then {_dir = _dir + 180};
	_resourcesFIA = if (!isMultiPlayer) then {server getVariable "resourcesFIA"} else {player getVariable "dinero"};
	if (_coste > _resourcesFIA) then
		{
		_salir = true;
		_texto = format ["You do not have enough money for this construction (%1 € needed)",_coste]
		}
	else
		{
		_sitios = marcadores select {lados getVariable [_x,sideUnknown] == buenos};
		cercano = [_sitios,_posicion] call BIS_fnc_nearestPosition;
		if (!(_posicion inArea cercano)) then
			{
			_salir = true;
			_texto = "You cannot build a bunker outside a controlled zone";
			cercano = nil;
			};
		};
	};

if (_salir) exitWith {hint format ["%1",_texto]};
hint "Select a place to build the required asset and press SPACE to start the construction.\n\nHit ESC to exit";
garageVeh = _clase createVehicleLocal [0,0,0];
comprado = 0;

_displayEH = (findDisplay 46) displayAddEventHandler ["KeyDown",
		{
		_handled = false;
		if (_this select 1 == 1) then
			{
			comprado = 1;
			_handled = true;
			}
		else
			{
			if (_this select 1 == 57) then
				{
				if (getPosASL garageVeh isEqualTo [0,0,0]) then
					{
					hint "You have selected a wrong place. Please note:\n\nRoadblocks have to be built in road segments.\n\nBunkers have to be built in garrison zones";
					}
				else
					{
					comprado = 2;
					};
				};
			};
		_handled;
		}];

_HDEH = player addEventHandler ["HandleDamage",{comprado = 1}];
posicionSel = [0,0,0];
if (_tipo == "RB") then
	{
	onEachFrame
	 {
	 if !(isNull garageVeh) then
	  {
	  _ins = lineIntersectsSurfaces [
	    AGLToASL positionCameraToWorld [0,0,0],
	    AGLToASL positionCameraToWorld [0,0,1000],
	    player,garageVeh
	   ];
	   if (_ins isEqualTo []) exitWith {};
	   _pos = (_ins select 0 select 0);
	   if (_pos distance posicionSel < 0.1) exitWith {};
	   posicionSel = _pos;
	   if (count (_pos findEmptyPosition [0, 0, typeOf garageVeh])== 0) exitWith {garageVeh setPosASL [0,0,0]};
	   if (_pos distance2d player > 100)exitWith {garageVeh setPosASL [0,0,0]};
	   if (surfaceIsWater _pos) exitWith {garageVeh setPosASL [0,0,0]};
	   if !(isOnRoad ASLToAGL _pos) exitWith {garageVeh setPosASL [0,0,0]};
	   garageVeh setPosASL _pos;
	   garageVeh setVectorUp (_ins select 0 select 1);
	   garageVeh setDir (getDir player);
	   };
	 };
	}
else
	{
	if ((_tipo == "SB") or (_tipo == "CB")) then
		{
		onEachFrame
		 {
		 if !(isNull garageVeh) then
		  {
		  _ins = lineIntersectsSurfaces [
		    AGLToASL positionCameraToWorld [0,0,0],
		    AGLToASL positionCameraToWorld [0,0,1000],
		    player,garageVeh
		   ];
		   if (_ins isEqualTo []) exitWith {};
		   _pos = (_ins select 0 select 0);
		   if (_pos distance posicionSel < 0.1) exitWith {};
		   posicionSel = _pos;
		   if (count (_pos findEmptyPosition [0, 0, typeOf garageVeh])== 0) exitWith {garageVeh setPosASL [0,0,0]};
		   if (_pos distance2d player > 100)exitWith {garageVeh setPosASL [0,0,0]};
		   if (surfaceIsWater _pos) exitWith {garageVeh setPosASL [0,0,0]};
		   if (isOnRoad ASLToAGL _pos) exitWith {garageVeh setPosASL [0,0,0]};
		   if !(_pos inArea cercano) exitWith {garageVeh setPosASL [0,0,0]};
		   garageVeh setPosASL _pos;
		   garageVeh setVectorUp (_ins select 0 select 1);
		   garageVeh setDir (getDir player);
		   };
		 };
		}
	else
		{
		onEachFrame
		 {
		 if !(isNull garageVeh) then
		  {
		  _ins = lineIntersectsSurfaces [
		    AGLToASL positionCameraToWorld [0,0,0],
		    AGLToASL positionCameraToWorld [0,0,1000],
		    player,garageVeh
		   ];
		   if (_ins isEqualTo []) exitWith {};
		   _pos = (_ins select 0 select 0);
		   if (_pos distance posicionSel < 0.1) exitWith {};
		   posicionSel = _pos;
		   if (count (_pos findEmptyPosition [0, 0, typeOf garageVeh])== 0) exitWith {garageVeh setPosASL [0,0,0]};
		   if (_pos distance2d player > 100)exitWith {garageVeh setPosASL [0,0,0]};
		   if (surfaceIsWater _pos) exitWith {garageVeh setPosASL [0,0,0]};
		   garageVeh setPosASL _pos;
		   garageVeh setVectorUp (_ins select 0 select 1);
		   garageVeh setDir (getDir player);
		   };
		 };
		};
	};

private _timeOut = time + 60;
waitUntil {(comprado > 0) or (time > _timeOut)};

onEachFrame {};
(findDisplay 46) displayRemoveEventHandler ["KeyDown", _displayEH];
player removeEventHandler ["HandleDamage",_HDEH];
posicionSel = nil;
//_posicion = getPosASL veh;
_posicion = position garageVeh;
_dir = getDir garageVeh;
deleteVehicle garageVeh;
garageVeh = nil;
cercano = nil;
if (comprado <= 1) exitWith {hint "Construction cancelled"; comprado = nil};
comprado = nil;
private _isPlayer = if (player == _ingeniero) then {true} else {false};
_timeOut = time + 30;

if (!_isPlayer) then
	{
	_ingeniero doMove ASLToAGL _posicion
	}
else
	{
	_tiempo = _tiempo / 2;
	hint "Walk to the selected position to start building";
	};

waitUntil {sleep 1;(time > _timeOut) or (_ingeniero distance _posicion < 3)};

if (time > _timeOut) exitWith {};

if (_coste > 0) then
	{
	if (!isMultiPlayer) then
		{
		_nul = [0, - _coste] remoteExec ["A3A_fnc_resourcesFIA",2];
		}
	else
		{
		[-_coste] call A3A_fnc_resourcesPlayer;
		["dinero",player getVariable ["dinero",0]] call fn_SaveStat;
		};
	};

_ingeniero setVariable ["constructing",true];

_timeOut = time + _tiempo;

if (!_isPlayer) then
	{
	{_ingeniero disableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
	};

//_animation = selectRandom ["AinvPknlMstpSnonWnonDnon_medic_1","AinvPknlMstpSnonWnonDnon_medic0","AinvPknlMstpSnonWnonDnon_medic1","AinvPknlMstpSnonWnonDnon_medic2"];
_ingeniero playMoveNow selectRandom medicAnims;

_ingeniero addEventHandler ["AnimDone",
	{
	private _ingeniero = _this select 0;
	if (([_ingeniero] call A3A_fnc_canFight) and !(_ingeniero getVariable ["ayudando",false]) and !(_ingeniero getVariable ["rearming",false]) and (_ingeniero getVariable ["constructing",false])) then
		{
		_ingeniero playMoveNow selectRandom medicAnims;
		}
	else
		{
		_ingeniero removeEventHandler ["AnimDone",_thisEventHandler];
		};
	}];

waitUntil  {sleep 5; !([_ingeniero] call A3A_fnc_canFight) or (_ingeniero getVariable ["ayudando",false]) or (_ingeniero getVariable ["rearming",false]) or (_ingeniero distance _posicion > 4) or (time > _timeOut)};

_ingeniero setVariable ["constructing",false];
if (!_isPlayer) then {{_ingeniero enableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"]};

if (time <= _timeOut) exitWith {hint "Constructing cancelled"};
if (!_isPlayer) then {_ingeniero doFollow (leader _ingeniero)};
private _veh = createVehicle [_clase, _posicion, [], 0, "CAN_COLLIDE"];
_veh setDir _dir;

if ((_tipo == "SB") or (_tipo == "CB")) exitWith
	{
	staticsToSave pushBackUnique _veh;
	publicVariable "staticsToSave"
	};


//falta inicializarlo en veh init
if (_tipo == "RB") then
	{
	sleep 30;
	_l1 = "#lightpoint" createVehicle getpos _veh;
	_l1 setLightDayLight true;
	_l1 setLightColor [5, 2.5, 0];
	_l1 setLightBrightness 0.1;
	_l1 setLightAmbient [5, 2.5, 0];
	_l1 lightAttachObject [_veh, [0, 0, 0]];
	_l1 setLightAttenuation [3, 0, 0, 0.6];
	_source01 = "#particlesource" createVehicle getpos _veh;
	_source01 setParticleClass "BigDestructionFire";
	_source02 = "#particlesource" createVehicle getpos _veh;
	_source02 setParticleClass "BigDestructionSmoke";
	[_l1,_source01,_source02,_veh] spawn
		{
		private _veh = _this select 3;
		while {alive _veh} do
			{
			_veh say3D "fire";
			sleep 13;
			};
		{deleteVehicle _x} forEach (_this - [_veh]);
		};
	};

while {alive _veh} do
	{
	if ((not([distanciaSPWN,1,_veh,"GREENFORSpawn"] call A3A_fnc_distanceUnits)) and (_veh distance getMarkerPos respawnBuenos > 100)) then
		{
		deleteVehicle _veh
		};
	sleep 60;
	};
