CHVD_inUAV = if ((call CHVD_fnc_UAVstatus) isEqualTo 0) then {false} else {true};

if (CHVD_inUAV) then {
	switch (true) do {
		case (getConnectedUAV player isKindOf "LandVehicle" || getConnectedUAV player isKindOf "Ship"): {
			CHVD_vehType = 1;
		};
		case (getConnectedUAV player isKindOf "Man"): {
			CHVD_vehType = 0;
		};
		default {
			CHVD_vehType = 2;
		};
	};
} else {
	switch (true) do {
		case (vehicle player isKindOf "LandVehicle" || vehicle player isKindOf "Ship"): {
			CHVD_vehType = 1;
		};
		case (vehicle player isKindOf "Air"): {
			CHVD_vehType = 2;
		};
		default {
			CHVD_vehType = 0;
		};
	};
};
