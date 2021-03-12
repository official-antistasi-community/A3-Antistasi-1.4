//////////////////////////////
//   Civilian Information   //
//////////////////////////////

["civilianUniforms", []] call _fnc_saveToTemplate;

["civilianHeadgear", []] call _fnc_saveToTemplate;



["vehiclesCivCar", []] call _fnc_saveToTemplate; 			//this line determines civilian cars -- Example: ["vehiclesCivCar", ["C_Offroad_01_F"]] -- Array, can contain multiple assets

["vehiclesCivIndustrial", []] call _fnc_saveToTemplate; 			//this line determines civilian trucks -- Example: ["vehiclesCivIndustrial", ["C_Truck_02_transport_F"]] -- Array, can contain multiple assets

["vehiclesCivHeli", []] call _fnc_saveToTemplate; 			//this line determines civilian helis -- Example: ["vehiclesCivHeli", ["C_Heli_Light_01_civil_F"]] -- Array, can contain multiple assets

["vehiclesCivBoat", []] call _fnc_saveToTemplate; 			//this line determines civilian boats -- Example: ["vehiclesCivBoat", ["C_Boat_Civil_01_F"]] -- Array, can contain multiple assets

["vehiclesCivRepair", []] call _fnc_saveToTemplate;			//this line determines civilian repair vehicles

["vehiclesCivMedical", []] call _fnc_saveToTemplate;		//this line determines civilian medic vehicles

["vehiclesCivFuel", []] call _fnc_saveToTemplate;			//this line determines civilian fuel vehicles
