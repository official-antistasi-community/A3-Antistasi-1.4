private ["_tipo","_posicionTel","_cercano","_garrison","_coste","_hr","_size"];
_tipo = _this select 0;

if (_tipo == "add") then {hint "Select a zone to add garrisoned troops"} else {hint "Select a zone to remove it's Garrison"};

if (!visibleMap) then {openMap true};
posicionTel = [];

onMapSingleClick "posicionTel = _pos;";

waitUntil {sleep 1; (count posicionTel > 0) or (not visiblemap)};
onMapSingleClick "";

if (!visibleMap) exitWith {};

_posicionTel = posicionTel;
posicionGarr = "";

_cercano = [marcadores,_posicionTel] call BIS_fnc_nearestPosition;
_posicion = getMarkerPos _cercano;

if (getMarkerPos _cercano distance _posicionTel > 40) exitWith {hint "You must click near a marked zone"; _nul=CreateDialog "build_menu";};

if (not(lados getVariable [_cercano,sideUnknown] == buenos)) exitWith {hint format ["That zone does not belong to %1",nameBuenos]; _nul=CreateDialog "build_menu";};
if ([_posicion,500] call A3A_fnc_enemyNearCheck) exitWith {hint "You cannot manage this garrison while there are enemies nearby";_nul=CreateDialog "build_menu"};
//if (((_cercano in puestosFIA) and !(isOnRoad _posicion)) /*or (_cercano in ciudades)*/ or (_cercano in controles)) exitWith {hint "You cannot manage garrisons on this kind of zone"; _nul=CreateDialog "garrison_menu"};
_puestoFIA = if (_cercano in puestosFIA) then {true} else {false};
_wPost = if (_puestoFIA and !(isOnRoad getMarkerPos _cercano)) then {true} else {false};
_garrison = if (! _wpost) then {garrison getVariable [_cercano,[]]} else {SDKSniper};

if (_tipo == "rem") then
	{
	if ((count _garrison == 0) and !(_cercano in puestosFIA)) exitWith {hint "The place has no garrisoned troops to remove"; _nul=CreateDialog "build_menu";};
	_coste = 0;
	_hr = 0;
	{
	if (_x == staticCrewBuenos) then {if (_puestoFIA) then {_coste = _coste + ([vehSDKLightArmed] call A3A_fnc_vehiclePrice)} else {_coste = _coste + ([SDKMortar] call A3A_fnc_vehiclePrice)}};
	_hr = _hr + 1;
	_coste = _coste + (server getVariable [_x,0]);
	} forEach _garrison;
	[_hr,_coste] remoteExec ["A3A_fnc_resourcesFIA",2];
	if (_puestoFIA) then
		{
		garrison setVariable [_cercano,nil,true];
		puestosFIA = puestosFIA - [_cercano]; publicVariable "puestosFIA";
		marcadores = marcadores - [_cercano]; publicVariable "marcadores";
		deleteMarker _cercano;
		lados setVariable [_cercano,nil,true];
		}
	else
		{
		garrison setVariable [_cercano,[],true];
		//[_cercano] call A3A_fnc_mrkUpdate;
		//[_cercano] remoteExec ["tempMoveMrk",2];
		{if (_x getVariable ["marcador",""] == _cercano) then {deleteVehicle _x}} forEach allUnits;
		};
	[_cercano] call A3A_fnc_mrkUpdate;
	hint format ["Garrison removed\n\nRecovered Money: %1 €\nRecovered HR: %2",_coste,_hr];
	_nul=CreateDialog "build_menu";
	}
else
	{
	posicionGarr = _cercano;
	publicVariable "posicionGarr";
	hint format ["Info%1",[_cercano] call A3A_fnc_garrisonInfo];
	closeDialog 0;
	_nul=CreateDialog "garrison_recruit";
	sleep 1;
	disableSerialization;

	_display = findDisplay 100;

	if (str (_display) != "no display") then
		{
		_ChildControl = _display displayCtrl 104;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable (SDKMil select 0)];
		_ChildControl = _display displayCtrl 105;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable (SDKMG select 0)];
		_ChildControl = _display displayCtrl 126;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable (SDKMedic select 0)];
		_ChildControl = _display displayCtrl 107;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable (SDKSL select 0)];
		_ChildControl = _display displayCtrl 108;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",(server getVariable staticCrewBuenos) + ([SDKMortar] call A3A_fnc_vehiclePrice)];
		_ChildControl = _display displayCtrl 109;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable (SDKGL select 0)];
		_ChildControl = _display displayCtrl 110;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable (SDKSniper select 0)];
		_ChildControl = _display displayCtrl 111;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable (SDKATman select 0)];
		};
	};