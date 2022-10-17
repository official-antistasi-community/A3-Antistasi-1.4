class kunduz {
	/*
	As the CfgWorlds/Names are completely fucked on this map, here a list of the names:
	1 --> Darreh
	2 --> Anbar Tappeh
	6 --> Kamar
	8 --> Gerdan
	9 --> Kar Shek
	10 --> Chahar Dara
	11 --> Tal Kar
	12 --> Pradesh
	17 --> Tal Gozar
	20 --> Tappeh Ka
	21 --> Shek Ka
	22 --> Airport Road [disabled]
	23 --> Airport Road [disabled]
	24 --> Tabeed
	*/
	population[] = {
		{"1",150},{"2",175},{"6",115},{"8",95},{"9",250},{"10",300},{"11",180},{"12",25},{"17",95},{"20",150},{"21",75},{"24",65}
	};
	disabledTowns[] = {"22","23"};
	antennas[] = {
		{2664.34,2084.35,0.334126},{1413.97,3697.13,0.018425},{3965.45,4639.7,0.00327492}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {};
	garrison[] = {{},{"outpost"},{},{}};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F"
	};
	climate = "arid";
};
