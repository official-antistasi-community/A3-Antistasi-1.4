//////////////////////////
//  Mission/HQ Objects  //
//////////////////////////

// All of bellow are optional overrides.
["firstAidKits", ["FirstAidKit"]] call _fnc_saveToTemplate;  // However, item is tested for for help and reviving.
["mediKits", ["Medikit"]] call _fnc_saveToTemplate;  // However, item is tested for for help and reviving.
["toolKits", ["ToolKit"]] call _fnc_saveToTemplate;  // Relies on autodetection.
["itemMaps", ["ItemMap"]] call _fnc_saveToTemplate;  // Relies on autodetection.

["diveGear", ["U_I_Wetsuit","V_RebreatherIA","G_Diving"]] call _fnc_saveToTemplate;

["flyGear", ["U_I_pilotCoveralls"]] call _fnc_saveToTemplate;

["vehicleLightSource", "Land_LampShabby_F"] call _fnc_saveToTemplate;
["vehicleFuelDrum", ["FlexibleTank_01_forest_F", 160]] call _fnc_saveToTemplate;
["vehicleFuelTank", ["B_Slingload_01_Fuel_F", 1000]] call _fnc_saveToTemplate;
