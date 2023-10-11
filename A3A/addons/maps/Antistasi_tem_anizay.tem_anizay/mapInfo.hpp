class tem_anizay {
	population[] = {}; //population good
	disabledTowns[] = {"FobNauzad","FobObeh","Bum"};
	antennas[] = {
		{6029.91,3991.35,-0.00282288},{2256.28,6232.65,-0.207352},{4769.32,8327.64,0.0103607},{8476.38,4978.83,-0.191177},{8304.16,7129.67,0},{3086.77,8396.11,0.0198364},{943.493,4638.36,0.00810242},{3833.18,832.105,-0.103607}
	};
	antennasBlacklistIndex[] = {}; //all antennas good
	banks[] = {}; //no suitable building available
	garrison[] = {
		{},{"outpost_8","factory_4","control_19","control_44","control_45"},{},{"control_19","control_44","control_45"}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F","Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","Land_Fuelstation","Land_Fuelstation_army","Land_Benzina_schnell"
	};
	climate = "arid";
	buildObjects[] = {{"Fortress1", 10, 15}, {"Fortress2", 0, 12}, {"Land_fort_artillery_nest_EP1", 10, 15}, {"Land_fort_rampart_EP1", 0, 10}, {"Land_fortified_nest_small_EP1", 5, 12}, {"Land_Fort_Watchtower_EP1", 5, 10}, {"Land_BagFenceLong", 0, 5}, {"Land_BagFenceEnd", 0, 5}, {"Land_BagFenceShort", 0, 5}, {"Land_BagFenceRound", 0, 5}, {"Land_fortified_nest_big_EP1", 50, 15}};
};
