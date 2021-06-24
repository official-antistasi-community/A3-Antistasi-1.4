//////////////////////////////
//   Civilian Information   //
//////////////////////////////

["civilianUniforms", ["U_LIB_CIV_Citizen_1","U_LIB_CIV_Citizen_2","U_LIB_CIV_Citizen_3","U_LIB_CIV_Functionary_4","U_LIB_CIV_Villager_4","U_LIB_CIV_Villager_3","U_LIB_CIV_Woodlander_4","U_LIB_CIV_Woodlander_1"]] call _fnc_saveToTemplate;

["civilianHeadgear", []] call _fnc_saveToTemplate;



["vehiclesCivCar", ["LIB_GazM1", 1.0
,"LIB_GazM1_dirty", 1.0
,"LIB_GazM1_SOV", 1.0
,"LIB_Willys_MB_Hood", 1.0]] call _fnc_saveToTemplate; 			//this line determines civilian cars -- Example: ["vehiclesCivCar", ["C_Offroad_01_F"]] -- Array, can contain multiple assets

["vehiclesCivIndustrial", ["LIB_US6_Open", 0.1
,"LIB_Zis5v", 1.0]] call _fnc_saveToTemplate; 			//this line determines civilian trucks -- Example: ["vehiclesCivIndustrial", ["C_Truck_02_transport_F"]] -- Array, can contain multiple assets

["vehiclesCivHeli", ["not_supported"]] call _fnc_saveToTemplate; 			//this line determines civilian helis -- Example: ["vehiclesCivHeli", ["C_Heli_Light_01_civil_F"]] -- Array, can contain multiple assets

["vehiclesCivBoat", ["LIB_UK_LCA", 0.1]] call _fnc_saveToTemplate; 			//this line determines civilian boats -- Example: ["vehiclesCivBoat", ["C_Boat_Civil_01_F"]] -- Array, can contain multiple assets

["vehiclesCivRepair", ["LIB_Zis6_Parm", 0.2]] call _fnc_saveToTemplate;			//this line determines civilian repair vehicles

["vehiclesCivMedical", ["LIB_Zis5v_Med", 0.2]] call _fnc_saveToTemplate;		//this line determines civilian medic vehicles

["vehiclesCivFuel", ["LIB_Zis5v_Fuel", 0.2]] call _fnc_saveToTemplate;			//this line determines civilian fuel vehicles
