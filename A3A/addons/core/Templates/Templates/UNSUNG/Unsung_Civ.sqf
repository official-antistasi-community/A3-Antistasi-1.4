//////////////////////////
//       Loadout        //
//////////////////////////

["uniforms", [
    "UNS_CIV_U",
    "UNS_CIV_B"
]] call _fnc_saveToTemplate;

["headgear", [
    "uns_H_Simc_nasi",
    "UNS_Conehat_VC",
    "UNS_Headband_BK",
    "UNS_Boonie_VC",
    "uns_sas_booniehat_vc_tan",
    "UNS_Boonie3_VC"
]] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesCivCar", [
    "uns_willys", 1
    ,"uns_zil157", 0.3]] call _fnc_saveToTemplate;

["vehiclesCivIndustrial", [
    "uns_zil157", 0.5]] call _fnc_saveToTemplate;

["vehiclesCivHeli", []] call _fnc_saveToTemplate;

["vehiclesCivBoat", [
    "UNS_skiff2_C", 0.4
    ,"UNS_skiff_C", 0.4
    ,"UNS_skiff2_cargo_C", 0.5
    ,"UNS_skiff_cargo_C", 0.5
    ,"UNS_sampan_cargo", 0.6
    ,"UNS_sampan_fish1", 0.5
    ,"UNS_sampan_large", 0.3
    ,"UNS_sampan_supply", 0.4
    ,"UNS_Sampan_Transport", 0.2
    ,"UNS_sampan_village", 0.3]] call _fnc_saveToTemplate;

["vehiclesCivRepair", ["uns_zil157_repair", 0.3]] call _fnc_saveToTemplate;

["vehiclesCivMedical", []] call _fnc_saveToTemplate;

["vehiclesCivFuel", ["uns_Zil157_refuel", 0.2]] call _fnc_saveToTemplate;