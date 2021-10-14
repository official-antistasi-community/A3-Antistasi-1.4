params["_filename", ""];

switch (_filename) do {
	case "zone": {
		A3A_antennasDead = [];
		A3A_banks = [];
		A3A_mrkAntennas = [];
		A3A_posAntennas = [];
		A3A_blacklistPos = [];
		A3A_posBank = [];
		A3A_hardcodedPop = false;
		A3A_hardCodedAntennas = true;

		A3A_posAntennas =
		[[4014.64,3089.66,0.150604], [5249.37,3709.48,-0.353882], [3126.7,8223.88,-0.649429], [8547.92,3897.03,-0.56073], [5578.24,9072.21,-0.842239], [2239.98,12630.7,-0.575844]];
		A3A_blacklistPos = [];
		antennas = [];
	};
	case "garrison": {};
	case "selector": {};
	default {};
};