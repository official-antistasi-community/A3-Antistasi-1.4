private ["_bandera","_pos","_marcador","_posicion","_size","_powerpl","_arevelar"];

_bandera = _this select 0;
_jugador = _this select 1;

_pos = getPos _bandera;
_marcador = [marcadores,_pos] call BIS_fnc_nearestPosition;
if (lados getVariable [_marcador,sideUnknown] == buenos) exitWith {};
_posicion = getMarkerPos _marcador;
_size = [_marcador] call A3A_fnc_sizeMarker;

if ((!isNull _jugador) and (captive _jugador)) exitWith {hint "You cannot Capture the Flag while Undercover"};
if ((_marcador in aeropuertos) and (tierWar < 3)) exitWith {hint "You cannot capture Airports until you reach War Level 3"};
_arevelar = [];
if (!isNull _jugador) then
	{
	if (_size > 300) then {_size = 300};
	_arevelar = [];
	{
	if (((side _x == malos) or (side _x == muyMalos)) and ([_x,_marcador] call A3A_fnc_canConquer)) then {_arevelar pushBack _x};
	} forEach allUnits;
	if (player == _jugador) then
		{
		_jugador playMove "MountSide";
		sleep 8;
		_jugador playMove "";
		{player reveal _x} forEach _arevelar;
		//[_marcador] call A3A_fnc_intelFound;
		};
	};

if ((count _arevelar) > 2*({([_x,_marcador] call A3A_fnc_canConquer) and (side _x == buenos)} count allUnits)) exitWith {hint "The enemy still outnumber us, check the map and clear the rest of the area"};
//if (!isServer) exitWith {};

{
if (isPlayer _x) then
	{
	[5,_x] remoteExec ["A3A_fnc_playerScoreAdd",_x];
	[_marcador] remoteExec ["A3A_fnc_intelFound",_x];
	if (captive _x) then {[_x,false] remoteExec ["setCaptive",0,_x]; _x setCaptive false};
	}
} forEach ([_size,0,_posicion,"GREENFORSpawn"] call A3A_fnc_distanceUnits);

//_lado = if (lados getVariable [_marcador,sideUnknown] == malos) then {malos} else {muyMalos};
["GREENFORSpawn",_marcador] remoteExec ["A3A_fnc_markerChange",2];
