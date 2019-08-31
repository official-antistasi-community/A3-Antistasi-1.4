
if (!(isNil "placingVehicle") && {placingVehicle}) exitWith { hint "Unable to buy vehicle, you are already placing something" };
if (player != player getVariable ["owner",player]) exitWith {hint "You cannot buy vehicles while you are controlling AI"};
if ([player,300] call A3A_fnc_enemyNearCheck) exitWith {Hint "You cannot buy vehicles with enemies nearby"};


private _typeVehX = _this select 0;
if (_typeVehX == "not_supported") exitWith {hint "The vehicle you requested is not supported in your current modset"};

vehiclePurchase_cost = [_typeVehX] call A3A_fnc_vehiclePrice;

private _rebelMoney = 0;
if (!isMultiPlayer) then {_rebelMoney = server getVariable "rebelMoney"} else
	{
	if (player != theBoss) then
		{
		_rebelMoney = player getVariable "moneyX";
		}
	else
		{
		if ((_typeVehX == rebelMortar) or (_typeVehX == rebelStaticAT) or (_typeVehX == rebelStaticAA) or (_typeVehX == rebelStaticMG)) then {_rebelMoney = server getVariable "rebelMoney"} else {_rebelMoney = player getVariable "moneyX"};
		};
	};

if (_rebelMoney < vehiclePurchase_cost) exitWith {hint format ["You do not have enough money for this vehicle: %1 € required",vehiclePurchase_cost]};
vehiclePurchase_nearestMarker = [markersX select {sidesX getVariable [_x,sideUnknown] == rebelSide},player] call BIS_fnc_nearestPosition;
if !(player inArea vehiclePurchase_nearestMarker) exitWith {hint "You need to be close to the flag to be able to purchase a vehicle"};

private _extraMessage =	format ["Buying vehicle for $%1", vehiclePurchase_cost];

[_typeVehX, "rebelPurchase", _extraMessage] call A3A_fnc_vehPlacementBegin;