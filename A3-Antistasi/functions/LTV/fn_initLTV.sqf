params ["_killed"]; //get killed unit from occupantInvaderUnitKilledEH.sqf incase of no Ace
if (lootToVehicleEnabled) then { //checks if LTV is enabled in params (if singleplayer then always true)
	private _distance = 25;
	if ((hasACE)&&(aceLTVrun == 0)) then { //checks if ace is enabled and if this block hasnt run before
		hint "Ace loaded";
		_action = 
		["LootToVehicle", "Loot To Vehicle", "functions\LTV\Load.paa",
			{
					private _sorted_vic = [((position _player) nearEntities [["Car", "Motorcycle", "Tank"], _distance]),
					[], { _player distance _x }, "ASCEND"] call BIS_fnc_sortBy; //sorts nearby vics from closest to farthest
					private _nearestVic = _sorted_vic select 0; //closest vic
				[_target, _player, _nearestVic] spawn A3A_fnc_LootToVehicle;
			},//code to execute, passes ace variables _target & _player
			{
				((count (_player nearEntities ["Car", _distance]) > 0) && (!alive _target))
			}, //condition to show action
			{
				private _statement = {
					params ["_target", "_player", "_vehicle"];
					[_target, _player, _vehicle] spawn A3A_fnc_LootToVehicle;
				};
						private _vehicles = (nearestObjects [_target, ace_cargo_cargoHolderTypes, _distance]) select {
					(_x != _target) && {([_target, _x] call ace_interaction_fnc_getInteractionDistance) < _distance}
				};
				[_vehicles, _statement, _target] call ace_interact_menu_fnc_createVehiclesActions;
			} //creates submenu of vehicles to select from
		] call ace_interact_menu_fnc_createAction;
		
		["CAManBase", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass; //ads _action to AIM main menu
		aceLTVrun = 1; //to stop it from repeating the code
	} else {
		if (!hasACE) then { // if ACE is not enabled the run this instead
			private _vics = [((position _killed) nearEntities [["Car", "Motorcycle", "Tank"], _distance]),
			[], { _killed distance _x }, "ASCEND"] call BIS_fnc_sortBy; //sorts nearby vics from closest to farthest
			private _nearestVic = _vics select 0; //closest vic
			_killed addAction ["Loot to nearest vehicle", {[_killed, _killed, _nearestVic] spawn A3A_fnc_LootToVehicle}, //passes body as player to prevent errors
			6, true, true, "", (!isNil "_nearestVic"), 5, false, "", ""	 //condition to show, show if there is a nearby vehicle
			];
		};
	};
};