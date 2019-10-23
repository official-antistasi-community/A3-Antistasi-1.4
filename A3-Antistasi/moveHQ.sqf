if (player != theBoss) exitWith {hint "Only our Commander has access to this function"};

if ((count weaponCargo caja >0) or (count magazineCargo caja >0) or (count itemCargo caja >0) or (count backpackCargo caja >0)) exitWith {hint "You must first empty your Ammobox in order to move the HQ"};

petros enableAI "MOVE";
petros enableAI "AUTOTARGET";

[petros,"remove"] remoteExec ["A3A_fnc_flagaction",0,petros];
//removeAllActions petros;
[petros] join theBoss;
petros setBehaviour "AWARE";
if (isMultiplayer) then
	{
	caja hideObjectGlobal true;
	cajaVeh hideObjectGlobal true;
	mapa hideObjectGlobal true;
	fuego hideObjectGlobal true;
	bandera hideObjectGlobal true;
	}
else
	{
	caja hideObject true;
	cajaVeh hideObject true;
	mapa hideObject true;
	fuego hideObject true;
	bandera hideObject true;
	};

fuego inflame false;

//respawnBuenos setMarkerPos [0,0,0];
respawnBuenos setMarkerAlpha 0;
_garrison = garrison getVariable ["Synd_HQ", []];
_posicion = getMarkerPos "Synd_HQ";
if (count _garrison > 0) then
	{
	_coste = 0;
	_hr = 0;
	if ({(alive _x) and (!captive _x) and ((side _x == malos) or (side _x == muyMalos)) and (_x distance _posicion < 500)} count allUnits > 0) then
		{
		hint "HQ Garrison will stay here and hold the enemy";
		}
	else
		{
		_size = ["Synd_HQ"] call A3A_fnc_sizeMarker;
		{
		if ((side _x == buenos) and (not(_x getVariable ["GREENFORSpawn",false])) and (_x distance _posicion < _size) and (_x != petros)) then
			{
			if (!alive _x) then
				{
				if (typeOf _x in soldadosSDK) then
					{
					if (typeOf _x == staticCrewBuenos) then {_coste = _coste - ([SDKMortar] call A3A_fnc_vehiclePrice)};
					_hr = _hr - 1;
					_coste = _coste - (server getVariable (typeOf _x));
					};
				};
			if (typeOf (vehicle _x) == SDKMortar) then {deleteVehicle vehicle _x};
			deleteVehicle _x;
			};
		} forEach allUnits;
		};
	{
	if (_x == staticCrewBuenos) then {_coste = _coste + ([SDKMortar] call A3A_fnc_vehiclePrice)};
	_hr = _hr + 1;
	_coste = _coste + (server getVariable _x);
	} forEach _garrison;
	[_hr,_coste] remoteExec ["A3A_fnc_resourcesFIA",2];
	garrison setVariable ["Synd_HQ",[],true];
	hint format ["Garrison removed\n\nRecovered Money: %1 €\nRecovered HR: %2",_coste,_hr];
	};

sleep 5;

petros addAction ["Build HQ here", {[] spawn A3A_fnc_buildHQ},nil,0,false,true];