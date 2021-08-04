/*
    Author: [Killerswin2]
    [Description]
        Creates and places a fuel tank with 300 liters

    Arguments:
    0. <Object> Unit that is trying to buy a new crate
	1. <String> String for case statement for size of can

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:
	ACE

    Example: [player,"SM"] call A3A_fnc_spawnJerrycan;

    License: MIT License
*/



params ["_unit", "_jerryCanType"];
switch _jerryCanType do {
	case "SM": {
		_jerryCan = "FlexibleTank_01_forest_F";
		_position = (getPos _unit) findEmptyPosition [1,10,_jerryCan];
		if (_position isEqualTo []) then {_position = getPos _unit};
		private _jerry = _jerryCan createVehicle _position;
		_jerry allowDamage false;

		vehiclePurchase_cost = 50;
		private _resourcesFIA = 0;
		if (!isMultiPlayer) then {_resourcesFIA = server getVariable "resourcesFIA"} else
		{
			if (player != theBoss) then
			{
				_resourcesFIA = player getVariable "moneyX";
			}
			else
			{
			_resourcesFIA = server getVariable "resourcesFIA";
			};
		};
		if (_resourcesFIA < vehiclePurchase_cost) exitWith {["Utility Items", format ["You do not have enough money for this vehicle: %1 € required",vehiclePurchase_cost]] call A3A_fnc_customHint;};
		// remove money
		if (player == theBoss) then {
            [0,(-50)] remoteExec ["A3A_fnc_resourcesFIA",2];
        } else {
            [-50] call A3A_fnc_resourcesPlayer;
		};

		//add actions
		player addAction 
		[
   		"Carry Tank",
   		{
        [cursorObject, true] call A3A_fnc_carryCrate;
    	},
    	nil,
    	1.5,
    	true,
    	true,
    	"",
    	"(
        ((typeof cursorObject) isEqualTo ""FlexibleTank_01_forest_F"")
        and (cursorObject distance _this < 3)
        and (([_this] call A3A_fnc_countAttachedObjects) isEqualTo 0)
        and (attachedTo cursorObject isEqualTo objNull)
    	)"
		];

		player addAction 
		[
    	"Drop Tank",
    	{
        [nil, false] call A3A_fnc_carryCrate;
    	},
    	nil,
    	1.5,
    	true,
    	true,
    	"",
    	"(
        (_this getVariable ['carryingCrate', false])
    	)"
		];
		[_jerry] call A3A_fnc_logistics_addLoadAction;
	};
	case "BG": {
		_jerryCan = "Land_RailwayCar_01_tank_F";
		vehiclePurchase_cost = 2000;
		private _resourcesFIA = 0;
		if (!isMultiPlayer) then {_resourcesFIA = server getVariable "resourcesFIA"} else
		{
			if (player != theBoss) then
			{
				_resourcesFIA = player getVariable "moneyX";
			}
			else
			{
			_resourcesFIA = server getVariable "resourcesFIA";
			};
		};
		if (_resourcesFIA < vehiclePurchase_cost) exitWith {["Utility Items", format ["You do not have enough money for this vehicle: %1 € required",vehiclePurchase_cost]] call A3A_fnc_customHint;};
		[_jerryCan, [], [], nil, false, "FUELSTRUCTURE"] call HR_GRG_fnc_confirmPlacement;
	};
};