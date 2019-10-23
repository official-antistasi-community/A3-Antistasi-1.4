private ["_estatica","_cercano","_jugador"];

_estatica = _this select 0;
_jugador = _this select 1;

if (!alive _estatica) exitWith {hint "You cannot steal a destroyed static weapon"};

if (alive gunner _estatica) exitWith {hint "You cannot steal a static weapon when someone is using it"};

if ((alive assignedGunner _estatica) and (!isPlayer (assignedGunner _estatica))) exitWith {hint "The gunner of this static weapon is still alive"};

if (activeGREF and ((typeOf _estatica == staticATBuenos) or (typeOf _estatica == staticAABuenos))) exitWith {hint "This weapon cannot be dissassembled"};

_cercano = [marcadores,_estatica] call BIS_fnc_nearestPosition;

if (not(lados getVariable [_cercano,sideUnknown] == buenos)) exitWith {hint "You have to conquer this zone in order to be able to steal this Static Weapon"};

_estatica setOwner (owner _jugador);

_tipoEst = typeOf _estatica;

_tipoB1 = ATStaticSDKB;
_tipoB2 = soporteStaticSDKB;

switch _tipoEst do
	{
	case staticATmalos: {_tipoB1 = ATStaticNATOB; _tipoB2 = soporteStaticNATOB};
	case staticATmuyMalos: {_tipoB1 = ATStaticCSATB; _tipoB2 = soporteStaticCSATB};
	case NATOMortar: {_tipoB1 = MortStaticNATOB; _tipoB2 = soporteStaticNATOB3};
	case NATOMG: {_tipoB1 = MGStaticNATOB; _tipoB2 = soporteStaticNATOB2};
	case CSATMG: {_tipoB1 = MGStaticCSATB; _tipoB2 = soporteStaticCSATB2};
	case SDKMGStatic: {_tipoB1 = MGStaticSDKB; _tipoB2 = soporteStaticSDKB2;};
	case staticAABuenos: {_tipoB1 = AAStaticSDKB};
	case SDKMortar: {_tipoB1 = MortStaticSDKB; _tipoB2 = soporteStaticSDKB3};
	};

_posicion1 = [_jugador, 1, (getDir _jugador) - 90] call BIS_fnc_relPos;
_posicion2 = [_jugador, 1, (getDir _jugador) + 90] call BIS_fnc_relPos;

deleteVehicle _estatica;

_bag1 = _tipoB1 createVehicle _posicion1;
_bag2 = _tipoB2 createVehicle _posicion2;

[_bag1] call A3A_fnc_AIVEHinit;
[_bag2] call A3A_fnc_AIVEHinit;

hint "Weapon Stolen. It won't despawn when you assemble it again";