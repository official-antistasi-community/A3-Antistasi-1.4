params["_filename", ""];

switch (_filename) do {
	case "zone": {
		A3A_antennasDead = [];
		A3A_banks = [];
		A3A_mrkAntennas = [];
		A3A_posAntennas = [];
		A3A_blacklistPos = [];
		A3A_posBank = [];
		A3A_hardcodedPop = true;
		A3A_hardCodedAntennas = true;


		//To improve Performance, reduces pop from 13972 to 4850
		{server setVariable [_x select 0,_x select 1]} forEach
		[["Adamow",200],["Bielawa",150],["Borek",150],["Brena",150],["Dolnik",100],["Gieraltow",400],["Gliniska",150],["Grabin",250],["Huta",150],["Karlin",50],["Kolembrody",100],
		["Lembork",50],["Lipina",100],["Lukow",200],["Muratyn",50],["Nadbor",600],["Nidek",100],["Olszanka",100],["Polana",100],["Radacz",150],["Radunin",150],["Roztoka",50],
		["Sitnik",150],["Sobotka",100],["Tarnow",200],["Topolin",650],["Zalesie",150],["Zapadlisko",100]];

		A3A_posAntennas =
		[[3830.61,1827.19,0], [5007.39,2131.27,0], [1583.47,7162.08,0.000152588], [3146.07,7024.41,0.00133514],
		[1408.43,8675.08,-1.00183], [8894.99,2049.1,0.00387573], [2382.53,11479.5,3.05176e-005], [6293.86,9910.17,-7.62939e-006],
		[3585.76,11540.7,-0.000236511], [7906.11,9917.2,0.0120544], [7776.88,10082.3,0.0262146], [7866.34,10102.5,3.05176e-005],
		[6908.45,11119.5,-2.40052], [9257.02,10282.7,0.0631027], [10610.4,10890.6,0.166985], [11172.6,11424.1,-2.82624]];
		A3A_blackListPos = [2, 3, 4, 6, 8, 11, 12, 13, 14, 15];
		antennas = [];
	};
	case "garrison": {};
	case "selector": {};
	default {};
};