if (player != player getVariable ["owner",player]) exitWith {hint "You cannot buy vehicles while you are controlling AI"};

if ([player,300] call A3A_fnc_enemyNearCheck) exitWith {Hint "You cannot buy vehicles with enemies nearby"};

private ["_tipoVeh","_coste","_resourcesFIA","_marcador","_pos","_veh","_tipoVeh"];

_tipoveh = _this select 0;
if (_tipoVeh == "not_supported") exitWith {hint "The vehicle you requested is not supported in your current modset"};

_coste = [_tipoVeh] call A3A_fnc_vehiclePrice;

if (!isMultiPlayer) then {_resourcesFIA = server getVariable "resourcesFIA"} else
	{
	if (player != theBoss) then
		{
		_resourcesFIA = player getVariable "dinero";
		}
	else
		{
		if ((_tipoVeh == SDKMortar) or (_tipoVeh == staticATBuenos) or (_tipoVeh == staticAABuenos) or (_tipoVeh == SDKMGStatic)) then {_resourcesFIA = server getVariable "resourcesFIA"} else {_resourcesFIA = player getVariable "dinero"};
		};
	};

if (_resourcesFIA < _coste) exitWith {hint format ["You do not have enough money for this vehicle: %1 € required",_coste]};
_cercano = [marcadores select {lados getVariable [_x,sideUnknown] == buenos},player] call BIS_fnc_nearestPosition;
if !(player inArea _cercano) exitWith {hint "You need to be close to one of your garrisons to be able to retrieve a vehicle from your garage"};

garageVeh = _tipoVeh createVehicleLocal [0,0,1000];
garageVeh allowDamage false;
garageVeh enableSimulationGlobal false;
comprado = 0;
[format ["<t size='0.7'>%1<br/><br/><t size='0.6'>Vehicle placement Keys.<t size='0.5'><br/>Arrow Left-Right to rotate<br/>SPACE to Select<br/>ENTER to Exit",getText (configFile >> "CfgVehicles" >> typeOf garageVeh >> "displayName")],0,0,5,0,0,4] spawn bis_fnc_dynamicText;
hint "Hover your mouse to the desired position. If it's safe and suitable, you will see the vehicle";
garageKeys = (findDisplay 46) displayAddEventHandler ["KeyDown",
		{
		_handled = false;
		_salir = false;
		_comprado = false;
		[format ["<t size='0.7'>%1<br/><br/><t size='0.6'>Vehicle placement Keys.<t size='0.5'><br/>Arrow Left-Right to rotate<br/>SPACE to Select<br/>ENTER to Exit",getText (configFile >> "CfgVehicles" >> typeOf garageVeh >> "displayName")],0,0,5,0,0,4] spawn bis_fnc_dynamicText;
		if (_this select 1 == 57) then
			{
			_salir = true;
			_comprado = true;
			};
		if (_this select 1 == 28) then
			{
			_salir = true;
			deleteVehicle garageVeh;
			};
		if (_this select 1 == 205) then
			{
			garageVeh setDir (getDir garageVeh + 1);
			_handled = true;
			};
		if (_this select 1 == 203) then
			{
			garageVeh setDir (getDir garageVeh - 1);
			_handled = true;
			};
		if (_salir) then
			{
			if (!_comprado) then
				{
				["",0,0,5,0,0,4] spawn bis_fnc_dynamicText;
				comprado = 1;
				}
			else
				{
				if (garageVeh distance [0,0,1000] < 1500) then
					{
					["<t size='0.6'>The current position is not suitable for the vehicle. Try another",0,0,3,0,0,4] spawn bis_fnc_dynamicText;
					}
				else
					{
					comprado = 2;
					["<t size='0.6'>Vehicle purchased",0,0,3,0,0,4] spawn bis_fnc_dynamicText;
					};
				};
			};
		_handled;
		}];
posicionSel = [0,0,0];
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
   _barco = false;
   if (garageVeh isKindOf "Ship") then {_pos set [2,0]; _barco = true};
   if (count (_pos findEmptyPosition [0, 0, typeOf garageVeh])== 0) exitWith {garageVeh setPosASL [0,0,0]};
   if (_pos distance2d player > 100)exitWith {garageVeh setPosASL [0,0,0]};
   _agua = surfaceIsWater _pos;
   if (_barco and {!_agua}) exitWith {garageVeh setPosASL [0,0,0]};
   if (!_barco and {_agua}) exitWith {garageVeh setPosASL [0,0,0]};
   garageVeh setPosASL _pos;
   garageVeh setVectorUp (_ins select 0 select 1);
   };
 };
waitUntil {(comprado > 0) or !(player inArea _cercano)};
onEachFrame {};
(findDisplay 46) displayRemoveEventHandler ["KeyDown", garageKeys];
posicionSel = nil;
_pos = getPosASL garageVeh;
_dir = getDir garageVeh;
deleteVehicle garageVeh;
if !(player inArea _cercano) then {hint "You need to be close to one of your garrisons to be able to buy a vehicle";["",0,0,5,0,0,4] spawn bis_fnc_dynamicText; comprado = nil;garageVeh = nil};
if ([player,300] call A3A_fnc_enemyNearCheck) then {comprado = 0; hint "You cannot buy vehicles with enemies nearby"};
if (comprado != 2) exitWith {comprado = nil;garageVeh = nil};
waitUntil {isNull garageVeh};
garageVeh = nil;
comprado = nil;
_veh = createVehicle [_tipoVeh, [0,0,1000], [], 0, "NONE"];
_veh setDir _dir;
_veh setPosASL _pos;
[_veh] call A3A_fnc_AIVEHinit;
if (_veh isKindOf "Car") then {_veh setPlateNumber format ["%1",name player]};
if (!isMultiplayer) then
	{
	[0,(-1* _coste)] spawn A3A_fnc_resourcesFIA;
	}
else
	{
	if (player != theBoss) then
		{
		[-1* _coste] call A3A_fnc_resourcesPlayer;
		["dinero",player getVariable ["dinero",0]] call fn_SaveStat;
		_veh setVariable ["duenyo",getPlayerUID player,true];
		}
	else
		{
		if ((_tipoVeh == SDKMortar) or (_tipoVeh == staticATBuenos) or (_tipoVeh == staticAABuenos) or (_tipoVeh == SDKMGStatic)) then
			{
			_nul = [0,(-1* _coste)] remoteExecCall ["A3A_fnc_resourcesFIA",2]
			}
		else
			{
			[-1* _coste] call A3A_fnc_resourcesPlayer;
			["dinero",player getVariable ["dinero",0]] call fn_SaveStat;
			_veh setVariable ["duenyo",getPlayerUID player,true];
			};
		};
	};
//if ((_tipoVeh == SDKMortar) or (_tipoVeh == staticATBuenos) or (_tipoVeh == staticAABuenos) or (_tipoVeh == SDKMGStatic)) then {staticsToSave pushBackUnique _veh; publicVariable "staticsToSave"};
if (_veh isKindOf "StaticWeapon") then {staticsToSave pushBackUnique _veh; publicVariable "staticsToSave"};

//hint "Vehicle Purchased";
player reveal _veh;
petros directSay "SentGenBaseUnlockVehicle";