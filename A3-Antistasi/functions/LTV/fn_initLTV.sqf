if (("LTV" call BIS_fnc_getParamValue) == 1) then {
	_action = 
	["LootToVehicle", "Loot To Vehicle", "functions\LTV\Load.paa",
		{
			private _sorted_vic = [((position _player) nearEntities [["Car", "Motorcycle", "Tank"], 25]),
			[], { _player distance _x }, "ASCEND"] call BIS_fnc_sortBy; //sorts nearby vics from closest to farthest
			private _nearestVic = _sorted_vic select 0; //closest vic
			[_target, _player, _nearestVic] spawn A3A_fnc_LootToVehicle;
		},//code to execute, passes ace variables _target & _player
		{
			((count (_player nearEntities ["Car", 25]) > 0) && (!alive _target))
		}, //condition to show action
		{
			private _statement = {
				params ["_target", "_player", "_vehicle"];
				[_target, _player, _vehicle] spawn A3A_fnc_LootToVehicle;
			};
					private _vehicles = (nearestObjects [_target, ace_cargo_cargoHolderTypes, 25]) select {
				(_x != _target) && {([_target, _x] call ace_interaction_fnc_getInteractionDistance) < 25}
			};
			[_vehicles, _statement, _target] call ace_interact_menu_fnc_createVehiclesActions;
		} //creates undermenu off vehicles to select from
	] call ace_interact_menu_fnc_createAction;
	
	["CAManBase", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass; //ads _action to AIM main menu
} else {hint "LTV Disabled"};