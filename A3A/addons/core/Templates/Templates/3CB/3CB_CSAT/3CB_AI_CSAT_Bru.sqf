
//////////////////////////
//   Side Information   //
//////////////////////////

["name", "CSAT"] call _fnc_saveToTemplate;
["spawnMarkerName", "CSAT Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_AAF_F"] call _fnc_saveToTemplate;
["flagTexture", "uk3cb_factions\addons\uk3cb_factions_cst\flag\csat_w_regiment_flag_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "UK3CB_Marker_CSAT_Woodland"] call _fnc_saveToTemplate;

switch (A3A_climate) do 
{
    case "arid":{
        //Urban
    };
    case "arctic":   {
        //Winter
    };
    case "temperate";
    case "tropical": {
        //europe
    };
    default          {
        //europe
    };
};