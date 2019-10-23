private ["_tipo","_coste","_grupo","_unit","_tam","_roads","_road","_pos","_camion","_texto","_mrk","_hr","_exists","_posicionTel","_escarretera","_tipogrupo","_resourcesFIA","_hrFIA"];

if (["PuestosFIA"] call BIS_fnc_taskExists) exitWith {hint "We can only deploy / delete one Observation Post or Roadblock at a time."};
if (!([player] call A3A_fnc_hasRadio)) exitWith {if !(hayIFA) then {hint "You need a radio in your inventory to be able to give orders to other squads"} else {hint "You need a Radio Man in your group to be able to give orders to other squads"}};

_tipo = _this select 0;

if (!visibleMap) then {openMap true};
posicionTel = [];
if (_tipo != "delete") then {hint "Click on the position you wish to build the Observation Post or Roadblock. \n Remember: to build Roadblocks you must click exactly on a road map section"} else {hint "Click on the Observation Post or Roadblock to delete."};

onMapSingleClick "posicionTel = _pos;";

waitUntil {sleep 1; (count posicionTel > 0) or (not visiblemap)};
onMapSingleClick "";

if (!visibleMap) exitWith {};

_posicionTel = posicionTel;
_pos = [];

if ((_tipo == "delete") and (count puestosFIA < 1)) exitWith {hint "No Posts or Roadblocks deployed to delete"};
if ((_tipo == "delete") and ({(alive _x) and (!captive _x) and ((side _x == malos) or (side _x == muyMalos)) and (_x distance _posicionTel < 500)} count allUnits > 0)) exitWith {hint "You cannot delete a Post while enemies are near it"};

_coste = 0;
_hr = 0;

if (_tipo != "delete") then
	{
	_escarretera = isOnRoad _posicionTel;

	_tipogrupo = gruposSDKSniper;

	if (_escarretera) then
		{
		_tipogrupo = gruposSDKAT;
		_coste = _coste + ([vehSDKLightArmed] call A3A_fnc_vehiclePrice) + (server getVariable staticCrewBuenos);
		_hr = _hr + 1;
		};

	//_formato = (configfile >> "CfgGroups" >> "buenos" >> "Guerilla" >> "Infantry" >> _tipogrupo);
	//_unidades = [_formato] call groupComposition;
	{_coste = _coste + (server getVariable (_x select 0)); _hr = _hr +1} forEach _tipoGrupo;
	}
else
	{
	_mrk = [puestosFIA,_posicionTel] call BIS_fnc_nearestPosition;
	_pos = getMarkerPos _mrk;
	if (_posicionTel distance _pos >10) exitWith {hint "No post nearby"};
	};
//if ((_tipo == "delete") and (_posicionTel distance _pos >10)) exitWith {hint "No post nearby"};

_resourcesFIA = server getVariable "resourcesFIA";
_hrFIA = server getVariable "hr";

if (((_resourcesFIA < _coste) or (_hrFIA < _hr)) and (_tipo!= "delete")) exitWith {hint format ["You lack of resources to build this Outpost or Roadblock \n %1 HR and %2 € needed",_hr,_coste]};

if (_tipo != "delete") then
	{
	[-_hr,-_coste] remoteExec ["A3A_fnc_resourcesFIA",2];
	};

 [[_tipo,_posicionTel],"A3A_fnc_crearPuestosFIA"] call BIS_fnc_MP
