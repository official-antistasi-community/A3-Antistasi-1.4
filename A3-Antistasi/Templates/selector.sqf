/*
Author: Meerkat
  This file controls the selection of templates based on the mods loaded and map used.
  When porting new mods/maps be sure to add them to their respective sections!

Scope: Server
Environment: Any (Inherits scheduled from initVarServer)
Public: No
Dependencies:
  <SIDE> teamplayer The side of the rebels, usually only independent or west.
  <FILES> "Templates\" Assumes the existence of files under "Templates\". Please check here before deleting/renaming one.
*/
#include "..\Includes\common.inc"
FIX_LINE_NUMBERS()
//Map checker
aridmaps = ["altis","kunduz","malden","tem_anizay","takistan","sara"];
tropicalmaps = ["tanoa","cam_lao_nam"];
temperatemaps = ["enoch","chernarus_summer","vt7","tembelan"];
arcticmaps = ["chernarus_winter"];
//Mod selector

//Reb Templates
A3A_Reb_template = switch(true) do {
    case (A3A_has3CBFactions): {
        switch(true) do {
            case (toLower worldName in arcticmaps);
            case (toLower worldName in temperatemaps);
            case (toLower worldName in tropicalmaps): {
                Info("Using Temperate CNM Template");
                ["Templates\NewTemplates\3CB\3CB_Reb_CNM_Temperate.sqf", independent] call A3A_fnc_compatibilityLoadFaction;
            };
            default {
                Info("Using arid TKM Template");
                ["Templates\NewTemplates\3CB\3CB_Reb_TKM_Arid.sqf", independent] call A3A_fnc_compatibilityLoadFaction;
            };
        };
        "3CBFactions"
    };
    case (A3A_hasRHS): {
        switch(true) do {
            case (toLower worldName in arcticmaps);
            case (toLower worldName in temperatemaps);
            case (toLower worldName in tropicalmaps): {
                Info("Using Temperate Napa Template");
                ["Templates\NewTemplates\RHS\RHS_Reb_NAPA_Temperate.sqf", independent] call A3A_fnc_compatibilityLoadFaction;
            };
            default {
                Info("Using arid Napa Template");
                ["Templates\NewTemplates\RHS\RHS_Reb_NAPA_Arid.sqf", independent] call A3A_fnc_compatibilityLoadFaction;
            };
        };
        "RHS"
    };
    case (A3A_hasVN): {
        ["Templates\NewTemplates\VN\VN_Reb_POF.sqf", independent] call A3A_fnc_compatibilityLoadFaction;
        Info("Using Pissed off Farmers Template");
        "VN"
    };
    /* disabled until imtegrated
    case (A3A_hasIFA): {
      switch(true) do {
        case (toLower worldName in arcticmaps): {
          call compile preProcessFileLineNumbers "Templates\IFA\IFA_Reb_POL_Arct.sqf";
          Info("Using arctic POL Template");
        };
        case (toLower worldName in temperatemaps): {
          call compile preProcessFileLineNumbers "Templates\IFA\IFA_Reb_POL_Temp.sqf";
          Info("Using temperate POL Templates");
        };
        case (toLower worldName in tropicalmaps): {
          call compile preProcessFileLineNumbers "Templates\IFA\IFA_Reb_POL_Temp.sqf";
          Info("Using tropical POL Templates");
        };
        default {
          call compile preProcessFileLineNumbers "Templates\IFA\IFA_Reb_POL_Arid.sqf";
          Info("Using arid POL Templates");
        };
      };
      "IFA"
    };
    */
    default {
        switch(true) do {//This one (vanilla) works differently so that we don't get DLC kit on modded maps.
            case (toLower worldName == "enoch"): {
                Info("Using Enoch FIA Template");
                ["Templates\NewTemplates\Vanilla\Vanilla_Reb_FIA_Enoch.sqf", independent] call A3A_fnc_compatibilityLoadFaction;
            };
            case (toLower worldName == "tanoa"): {
                Info("Using tanoa SDK Template");
                ["Templates\NewTemplates\Vanilla\Vanilla_Reb_SDK_Tanoa.sqf", independent] call A3A_fnc_compatibilityLoadFaction;
            };
            default {
                Info("Using arid FIA Template");
                ["Templates\NewTemplates\Vanilla\Vanilla_Reb_FIA_Arid.sqf", independent] call A3A_fnc_compatibilityLoadFaction;
            };
        };
        "Vanilla"
    };
};
  //Occ Templates
A3A_Occ_template = switch(true) do {
    /* disabled until imtegrated
    case (A3A_hasFFAA): {
        switch(true) do {
        case (toLower worldName in arcticmaps): {
            call compile preProcessFileLineNumbers "Templates\FFAA\FFAA_Occ_FFAA_Temp.sqf";
            Info("Using arctic FFAA Template");
        };
        case (toLower worldName in temperatemaps): {
            call compile preProcessFileLineNumbers "Templates\FFAA\FFAA_Occ_FFAA_Temp.sqf";
            Info("Using temperate FFAA Template");
        };
        case (toLower worldName in tropicalmaps): {
            call compile preProcessFileLineNumbers "Templates\FFAA\FFAA_Occ_FFAA_Temp.sqf";
            Info("Using tropical FFAA Template");
        };
        default {
            call compile preProcessFileLineNumbers "Templates\FFAA\FFAA_Occ_FFAA_Arid.sqf";
            Info("Using arid FFAA Template");
        };
        };
        "FFAA"
    };
    */
    case (A3A_has3CBBAF): {
        switch(true) do {
            case (toLower worldName in arcticmaps): {
                Info("Using arctic BAF Template");
                ["Templates\NewTemplates\3CB\3CB_AI_BAF_Arctic.sqf", west] call A3A_fnc_compatibilityLoadFaction;
            };
            case (toLower worldName in temperatemaps): {

                Info("Using temperate BAF Template");
                ["Templates\NewTemplates\3CB\3CB_AI_BAF_Temperate.sqf", west] call A3A_fnc_compatibilityLoadFaction;
            };
            case (toLower worldName in tropicalmaps): {
                Info("Using tropical BAF Template");
                ["Templates\NewTemplates\3CB\3CB_AI_BAF_Tropical.sqf", west] call A3A_fnc_compatibilityLoadFaction;
            };
            default {
                Info("Using arid BAF Template");
                ["Templates\NewTemplates\3CB\3CB_AI_BAF_Arid.sqf", west] call A3A_fnc_compatibilityLoadFaction;
            };
        };
        "3CBBAF"
    };
    case (A3A_has3CBFactions): {
        switch(true) do {
            case (toLower worldName == "altis"): {
                Info("Using 3CB AAF Template");
                ["Templates\NewTemplates\3CB\3CB_AI_AAF.sqf", west] call A3A_fnc_compatibilityLoadFaction;
            };
            case (toLower worldName == "malden"): {
                Info("Using 3CB MDF Template");
                ["Templates\NewTemplates\3CB\3CB_AI_MDF.sqf", west] call A3A_fnc_compatibilityLoadFaction;
            };
            case (toLower worldName == "tanoa"): {
                Info("Using 3CB HIDF Template");
                ["Templates\NewTemplates\3CB\3CB_AI_HIDF.sqf", west] call A3A_fnc_compatibilityLoadFaction;
            };
            case (toLower worldName == "kunduz"): {
                Info("Using 3CB ANA Template");
                ["Templates\NewTemplates\3CB\3CB_AI_ANA.sqf", west] call A3A_fnc_compatibilityLoadFaction;
            };
            case (toLower worldName in arcticmaps);
            case (toLower worldName in temperatemaps): {
                Info("Using Temperate US Marines Template as Placeholder");
                ["Templates\NewTemplates\RHS\RHS_AI_USAF_Marines_Temperate.sqf", west] call A3A_fnc_compatibilityLoadFaction;
            };
            case (toLower worldName in tropicalmaps): {
                Info("Using Coldwar US Template");
                ["Templates\NewTemplates\3CB\3CB_AI_CW_US.sqf", west] call A3A_fnc_compatibilityLoadFaction;
            };
            default {
                Info("Using TKA_West Template");
                ["Templates\NewTemplates\3CB\3CB_AI_TKA_West.sqf", west] call A3A_fnc_compatibilityLoadFaction;
            };
        };
        "3CBFactions"
    };
    case (A3A_hasRHS): {
        switch(true) do {
            case (toLower worldName == "chernarus_summer");
            case (toLower worldName == "chernarus_winter"): {
                Info("Using CDF Temperate Template");
                ["Templates\NewTemplates\RHS\RHS_AI_CDF_Temperate.sqf", west] call A3A_fnc_compatibilityLoadFaction;
            };
            case (toLower worldName in arcticmaps);
            case (toLower worldName in temperatemaps);
            case (toLower worldName in tropicalmaps): {
                Info("Using arctic USAF Template");
                ["Templates\NewTemplates\RHS\RHS_AI_USAF_Army_Temperate.sqf", west] call A3A_fnc_compatibilityLoadFaction;
            };
            default {
                Info("Using arid USAF Template");
                ["Templates\NewTemplates\RHS\RHS_AI_USAF_Army_Arid.sqf", west] call A3A_fnc_compatibilityLoadFaction;
            };
        };
        "RHS"
    };
    case (A3A_hasVN): {
        ["Templates\NewTemplates\VN\VN_PAVN.sqf", west] call A3A_fnc_compatibilityLoadFaction;
        Info("Using VN PAVN Template");
        "VN"
    };
    /* disabled until imtegrated
    case (A3A_hasIFA): {
        switch(true) do {
        case (toLower worldName in arcticmaps): {
            call compile preProcessFileLineNumbers "Templates\IFA\IFA_Occ_WEH_Arct.sqf";
            Info("Using arctic WEH Template");
        };
        case (toLower worldName in temperatemaps): {
            call compile preProcessFileLineNumbers "Templates\IFA\IFA_Occ_WEH_Temp.sqf";
            Info("Using temperate WEH Template");
        };
        case (toLower worldName in tropicalmaps): {
            call compile preProcessFileLineNumbers "Templates\IFA\IFA_Occ_WEH_Temp.sqf";
            Info("Using tropical WEH Template");
        };
        default {
            call compile preProcessFileLineNumbers "Templates\IFA\IFA_Occ_WEH_Arid.sqf";
            Info("Using arid WEH Templates");
        };
        };
        "IFA"
    };
    */
    default {
        switch(true) do {//This one (vanilla) works differently so that we don't get DLC kit on modded maps.
            case (toLower worldName == "enoch"): {
                Info("Using Enoch LDF Template");
                ["Templates\NewTemplates\Vanilla\Vanilla_AI_LDF_Enoch.sqf", west] call A3A_fnc_compatibilityLoadFaction;
            };
            case (toLower worldName == "tanoa"): {
                Info("Using tropical NATO Template");
                ["Templates\NewTemplates\Vanilla\Vanilla_AI_NATO_Tropical.sqf", west] call A3A_fnc_compatibilityLoadFaction;
            };
            case (toLower worldName in temperatemaps);
            case (toLower worldName in tropicalmaps): {
                Info("Using temperate NATO Template");
                ["Templates\NewTemplates\Vanilla\Vanilla_AI_NATO_Temperate.sqf", west] call A3A_fnc_compatibilityLoadFaction;
            };
            case (toLower worldName == "altis"): {
                Info("Using Arid AAF Template");
                ["Templates\NewTemplates\Vanilla\Vanilla_AI_AAF_Arid.sqf", west] call A3A_fnc_compatibilityLoadFaction;
            };
            default {
                Info("Using arid NATO Template");
                ["Templates\NewTemplates\Vanilla\Vanilla_AI_NATO_Arid.sqf", west] call A3A_fnc_compatibilityLoadFaction;
            };
        };
        "Vanilla"
    };
};
//Inv Templates
A3A_Inv_template = switch(true) do {
    case (A3A_has3CBFactions): {
        switch(true) do {
            case (toLower worldName in arcticmaps);
            case (toLower worldName in temperatemaps): {
                Info("Using RHS AFRF as Placeholder Template");
                ["Templates\NewTemplates\RHS\RHS_AI_AFRF_Temperate.sqf", east] call A3A_fnc_compatibilityLoadFaction;
            };
            case (toLower worldName in tropicalmaps): {
                Info("Using Coldwar Soviets Template");
                ["Templates\NewTemplates\3CB\3CB_AI_CW_SOV.sqf", east] call A3A_fnc_compatibilityLoadFaction;
            };
            default {
                Info("Using TKA_East Template");
                ["Templates\NewTemplates\3CB\3CB_AI_TKA_East.sqf", east] call A3A_fnc_compatibilityLoadFaction;
            };
        };
        "3CBFactions"
    };
    case (A3A_hasRHS): {
        switch(true) do {
            case (toLower worldName in arcticmaps);
            case (toLower worldName in temperatemaps);
            case (toLower worldName in tropicalmaps): {
                Info("Using temperate AFRF Template");
                ["Templates\NewTemplates\RHS\RHS_AI_AFRF_Temperate.sqf", east] call A3A_fnc_compatibilityLoadFaction;
            };
            default {
                Info("Using arid AFRF Template");
                ["Templates\NewTemplates\RHS\RHS_AI_AFRF_Arid.sqf", east] call A3A_fnc_compatibilityLoadFaction;
            };
        };
        "RHS"
    };
    case (A3A_hasVN): {
        ["Templates\NewTemplates\VN\VN_MACV.sqf", east] call A3A_fnc_compatibilityLoadFaction;
        Info("Using VN MACV Template");
        "VN"
    };
    /* disabled until imtegrated
    case (A3A_hasIFA): {
        switch(true) do {
        case (toLower worldName in arcticmaps): {
            call compile preProcessFileLineNumbers "Templates\IFA\IFA_Inv_SOV_Arct.sqf";
            Info("Using arctic SOV Template");
        };
        case (toLower worldName in temperatemaps): {
            call compile preProcessFileLineNumbers "Templates\IFA\IFA_Inv_SOV_Temp.sqf";
            Info("Using temperate SOV Template");
        };
        case (toLower worldName in tropicalmaps): {
            call compile preProcessFileLineNumbers "Templates\IFA\IFA_Inv_SOV_Temp.sqf";
            Info("Using tropical SOV Template");
        };
        default {
            call compile preProcessFileLineNumbers "Templates\IFA\IFA_Inv_SOV_Arid.sqf";
            Info("Using arid SOV Template");
        };
        };
        "IFA"
    };
    */
    default {
        switch(true) do {//This one (vanilla) works differently so that we don't get DLC kit on modded maps.
            case (toLower worldName == "enoch"): {
                Info("Using Enoch CSAT Template");
                ["Templates\NewTemplates\Vanilla\Vanilla_AI_CSAT_Enoch.sqf", east] call A3A_fnc_compatibilityLoadFaction;
            };
            case (toLower worldName == "tanoa"): {
                Info("Using tanoa CSAT Template");
                ["Templates\NewTemplates\Vanilla\Vanilla_AI_CSAT_Tropical.sqf", east] call A3A_fnc_compatibilityLoadFaction;
            };
            default {
                Info("Using arid CSAT Template");
                ["Templates\NewTemplates\Vanilla\Vanilla_AI_CSAT_Arid.sqf", east] call A3A_fnc_compatibilityLoadFaction;
            };
        };
        "Vanilla"
    };
};
//Civ Templates
A3A_Civ_template = switch(true) do {
    case (A3A_has3CBFactions): {
        switch(true) do {
            case (toLower worldName in arcticmaps);
            case (toLower worldName in temperatemaps);
            case (toLower worldName in tropicalmaps): {
                ["Templates\NewTemplates\3CB\3CB_Civ_Temperate.sqf", civilian] call A3A_fnc_compatibilityLoadFaction;
                Info("Using 3CB Civ Temperate Template");
            };
            default {
                ["Templates\NewTemplates\3CB\3CB_Civ_Arid.sqf", civilian] call A3A_fnc_compatibilityLoadFaction;
                Info("Using 3CB Civ Arid Template");
                "3CBFactions"
            };
        };
    };
    case (A3A_hasRHS): {
        ["Templates\NewTemplates\RHS\RHS_Civ.sqf", civilian] call A3A_fnc_compatibilityLoadFaction;
        Info("Using RHS Civ Template");
        "RHS"
    };
    case (A3A_hasVN): {
        ["Templates\NewTemplates\VN\VN_CIV.sqf", civilian] call A3A_fnc_compatibilityLoadFaction;
        Info("Using VN CIV Template");
        "VN"
    };
    /* disabled until imtegrated
    case (A3A_hasIFA): {
        call compile preProcessFileLineNumbers "Templates\IFA\IFA_Civ.sqf";
        Info("Using IFA Civ Template");
        "IFA"
    };
    */
    default {
        ["Templates\NewTemplates\Vanilla\Vanilla_Civ.sqf", civilian] call A3A_fnc_compatibilityLoadFaction;
        Info("Using Vanilla Civ Template");
        "Vanilla"
    };
};

// This will be adapted at a later step
Info("Reading Addon mod files.");
//Addon pack loading goes here.
A3A_LoadedContentAddons = [];
if (A3A_hasIvory) then {
  call compile preProcessFileLineNumbers "Templates\AddonVics\ivory_Civ.sqf";
  A3A_LoadedContentAddons pushBack "IvoryCars";
  Info("Using Addon Ivory Cars Template");
};
if (A3A_hasTCGM) then {
  call compile preProcessFileLineNumbers "Templates\AddonVics\tcgm_Civ.sqf";
  A3A_LoadedContentAddons pushBack "TCGM_BikeBackPack";
  Info("Using Addon TCGM_BikeBackPack Template");
};
if (A3A_hasD3S) then {
  call compile preProcessFileLineNumbers "Templates\AddonVics\d3s_Civ.sqf";
  A3A_LoadedContentAddons pushBack "D3SCars";
  Info("Using Addon D3S Cars Template");
};
if (A3A_hasRDS) then {
  call compile preProcessFileLineNumbers "Templates\AddonVics\rds_Civ.sqf";
  A3A_LoadedContentAddons pushBack "RDSCars";
  Info("Using Addon RDS Cars Template");
};
A3A_LoadedContentAddons = A3A_LoadedContentAddons apply {toLower _x};

//Logistics node loading is done here
Info("Reading Logistics Node files.");
call compile preProcessFileLineNumbers "Templates\NewTemplates\Vanilla\Vanilla_Logistics_Nodes.sqf";//Always call vanilla as it initialises the arrays.
if (A3A_hasRHS) then {call compile preProcessFileLineNumbers "Templates\NewTemplates\RHS\RHS_Logistics_Nodes.sqf"};
if (A3A_has3CBFactions) then {call compile preProcessFileLineNumbers "Templates\NewTemplates\3CB\3CBFactions_Logistics_Nodes.sqf"};
if (A3A_has3CBBAF) then {call compile preProcessFileLineNumbers "Templates\NewTemplates\3CB\3CBBAF_Logistics_Nodes.sqf"};
if (A3A_hasVN) then {call compile preProcessFileLineNumbers "Templates\NewTemplates\VN\VN_Logistics_Nodes.sqf"};

//if (A3A_hasIFA) then {call compile preProcessFileLineNumbers "Templates\IFA\IFA_Logistics_Nodes.sqf"};		//disabled until imtegrated
//if (A3A_hasFFAA) then {call compile preProcessFileLineNumbers "Templates\FFAA\FFAA_Logistics_Nodes.sqf"};		//disabled until imtegrated
//if (A3A_hasD3S) then {call compile preProcessFileLineNumbers "Templates\AddonVics\d3s_Logi_Nodes.sqf";};		//disabled until imtegrated
//if (A3A_hasRDS) then {call compile preProcessFileLineNumbers "Templates\AddonVics\rds_Logi_Nodes.sqf";};		//disabled until imtegrated
