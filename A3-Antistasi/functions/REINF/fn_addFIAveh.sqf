
if (!(isNil "placingVehicle") && {placingVehicle}) exitWith {["Add Vehicle", "Unable to buy vehicle, you are already placing something"] call A3A_fnc_customHint;};
if (player != player getVariable ["owner",player]) exitWith {["Add Vehicle", "You cannot buy vehicles while you are controlling AI"] call A3A_fnc_customHint;};
if ([player,300] call A3A_fnc_enemyNearCheck) exitWith {["Add Vehicle", "You cannot buy vehicles with enemies nearby"] call A3A_fnc_customHint;};


private _typeVehX = _this select 0;
if (_typeVehX == "not_supported") exitWith {["Add Vehicle", "The vehicle you requested is not supported in your current modset"] call A3A_fnc_customHint;};

vehiclePurchase_cost = [_typeVehX] call A3A_fnc_vehiclePrice;

private _resourcesFIA = 0;
if (!isMultiPlayer) then {_resourcesFIA = server getVariable "resourcesFIA"} else
	{
	if (player != theBoss) then
		{
		_resourcesFIA = player getVariable "moneyX";
		}
	else
		{
		if ((_typeVehX == SDKMortar) or (_typeVehX == staticATteamPlayer) or (_typeVehX == staticAAteamPlayer) or (_typeVehX == SDKMGStatic)) then {_resourcesFIA = server getVariable "resourcesFIA"} else {_resourcesFIA = player getVariable "moneyX"};
		};
	};

if (_resourcesFIA < vehiclePurchase_cost) exitWith {["Add Vehicle", format ["You do not have enough money for this vehicle: %1 € required",vehiclePurchase_cost]] call A3A_fnc_customHint;};
vehiclePurchase_nearestMarker = [markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer},player] call BIS_fnc_nearestPosition;
if !(player inArea vehiclePurchase_nearestMarker) exitWith {["Add Vehicle", "You need to be close to the flag to be able to purchase a vehicle"] call A3A_fnc_customHint;};

private _extraMessage =	format ["Buying vehicle for $%1", vehiclePurchase_cost];

[_typeVehX, "BUYFIA", _extraMessage] call A3A_fnc_vehPlacementBegin;