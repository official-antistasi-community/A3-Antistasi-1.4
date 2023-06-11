class regero {
    population[] = {}; //automated data is fine and needs no adaptation
    disabledTowns[] = {"Malden_C_Airport","Malden_L_Moray"};
    antennas[] = {
        {7954.92,4073.66,-0.00434113},{5882.92,2019.64,-4.3018},{2386.09,6897.74,0.9758},
        {7277.5,2559.15,-15.4134},{7530.9,2127.34,5.72205e-006},{7187.52,1389.39,0.474205},
        {8438.74,2433.79,-0.0430965},{9554.05,4129.93,-15.3871},{6542.54,9463.2,0.0699959},
        {551.773,5187,0.804718},{9608.08,6791.51,1.35839},{9444.25,2874.31,-34.1},
        {7165.63,555.428,-15.4359},{9347.84,1332.12,-0.0178871},{9354.15,1329.87,0.0515499},
        {9351.84,1197.67,-0.0194836},{9290.96,1080.57,-15.4632}
    };
    antennasBlacklistIndex[] = {1, 6, 7, 11, 12, 13, 15, 16};
    banks[] = {};
    garrison[] = {{},{"airport_5", "outpost_17", "outpost_10"},{},{"control_13"}};
    fuelStationTypes[] = {
        "Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F","Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","Land_Fuelstation","Land_Fuelstation_army","Land_Benzina_schnell"
    };
    climate = "arid";
};