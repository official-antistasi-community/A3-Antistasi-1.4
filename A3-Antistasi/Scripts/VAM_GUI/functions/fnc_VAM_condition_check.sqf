//Vehicle Appearance Manager Condition Check
VAM_condition_1 = false;
VAM_condition_2 = false;
VAM_condition_3 = false;

while {true} do {
	if (1 in VAM_condition_check_options) then {
		private _repair_vehicle_finder = vehicles inAreaArray [getPos player, 20, 20, 0, false, 20] select {(typeof _x) in VAM_repair_vehicle_list};
		if (count _repair_vehicle_finder > 0 && alive player) then {
			VAM_condition_1 = true;
			} else {
			VAM_condition_1 = false;
		};
	};
	if (2 in VAM_condition_check_options) then {
		VAM_condition_2 = false;
		{
			if (_x find "VAM_service_area_" > -1) then {
				if !(VAM_condition_2) then {
					if (player inArea _x && alive player) then {
						VAM_condition_2 = true;
					};
				};
			};
		} forEach allMapMarkers;
	};
	if (3 in VAM_condition_check_options) then {
		private _nearfob = [] call F_getNearestFob;
		private _fobdistance = 9999;
		if (count _nearfob isEqualTo 3) then {
			_fobdistance = player distance _nearfob;
		};
		if ((_fobdistance < GRLIB_fob_range) && (alive player)) then {
			VAM_condition_3 = true;
		} else {
			VAM_condition_3 = false;
		};
	};
	if (VAM_condition_1 or VAM_condition_2 or VAM_condition_3) then {
		VAM_condition_result = true;
		} else {
		VAM_condition_result = false;
	};
	sleep 1;
};