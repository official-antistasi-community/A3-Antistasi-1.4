//////////////////////////
//       Loadout        //
//////////////////////////

["uniforms", [
    "vn_o_uniform_vc_01_01",
    "vn_o_uniform_vc_01_02",
    "vn_o_uniform_vc_02_07",
    "vn_o_uniform_vc_03_02",
    "vn_o_uniform_vc_04_02",
    "vn_o_uniform_vc_05_01",
    "vn_o_uniform_vc_02_05",
    "vn_o_uniform_vc_04_03",
    "vn_o_uniform_vc_03_03"
]] call _fnc_saveToTemplate;

["headgear", [
    "vn_c_headband_04",
    "vn_c_headband_03",
    "vn_c_headband_02",
    "vn_c_headband_01",
    "vn_c_conehat_02",
    "vn_c_conehat_01"
]] call _fnc_saveToTemplate;

// All of bellow are optional overrides.
["firstAidKits", ["vn_o_item_firstaidkit"]] call _fnc_saveToTemplate;  // Relies on autodetection. However, item is tested for for help and reviving.
["mediKits", ["vn_o_item_medikit_01"]] call _fnc_saveToTemplate;  // Relies on autodetection. However, item is tested for for help and reviving.

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesCivCar", [
    "vn_c_wheeled_m151_02", 1.8
    ,"vn_c_wheeled_m151_01", 1.8
    ,"vn_c_car_02_01", 1.5
    ,"vn_c_car_03_01", 1
    ,"vn_c_car_01_01", 0.8
    ,"vn_c_bicycle_01", 0.2]] call _fnc_saveToTemplate;

["vehiclesCivIndustrial", [
    "vn_b_wheeled_m54_01_airport", 0.2
    ,"vn_c_car_04_01", 1]] call _fnc_saveToTemplate;

["vehiclesCivHeli", []] call _fnc_saveToTemplate;

["vehiclesCivBoat", [
    "vn_c_boat_02_02", 1
    ,"vn_c_boat_07_01", 0.6
    ,"vn_c_boat_08_01", 0.3]] call _fnc_saveToTemplate;

["vehiclesCivRepair", ["vn_b_wheeled_m54_repair_airport", 0.3]] call _fnc_saveToTemplate;

["vehiclesCivMedical", []] call _fnc_saveToTemplate;

["vehiclesCivFuel", ["vn_b_wheeled_m54_fuel_airport", 0.2]] call _fnc_saveToTemplate;