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
aridmaps = ["Altis","Kunduz","Malden","tem_anizay","takistan","sara"];
tropicalmaps = ["Tanoa"];
temperatemaps = ["Enoch","chernarus_summer","vt7","Tembelan"];
arcticmaps = ["Chernarus_Winter"];
//Mod selector

//Reb Templates
switch(true) do{
    case (A3A_has3CBFactions): {
        switch(true) do {
            case (worldName in arcticmaps);
            case (worldName in temperatemaps);
            case (worldName in tropicalmaps): {
                ["Templates\NewTemplates\3CB\3CB_Reb_CNM_Temperate.sqf", independent] call A3A_fnc_compatabilityLoadFaction;
                Info("Using Temperate CNM Template");
            };
            default {
                ["Templates\NewTemplates\3CB\3CB_Reb_TKM_Arid.sqf", independent] call A3A_fnc_compatabilityLoadFaction;
                Info("Using arid TKM Templates");
            };
        };
    };
    case (A3A_hasRHS): {
        switch(true) do {
            case (worldName in arcticmaps);
            case (worldName in temperatemaps);
            case (worldName in tropicalmaps): {
                ["Templates\NewTemplates\RHS\RHS_Reb_NAPA_Temperate.sqf", independent] call A3A_fnc_compatabilityLoadFaction;
                Info("Using Temperate Napa Template");
            };
            default {
                ["Templates\NewTemplates\RHS\RHS_Reb_NAPA_Arid.sqf", independent] call A3A_fnc_compatabilityLoadFaction;
                Info("Using arid Napa Templates");
            };
        };
    };
/* disabled until imtegrated
    case (A3A_hasIFA): {
      switch(true) do {
        case (worldName in arcticmaps): {
          call compile preProcessFileLineNumbers "Templates\IFA\IFA_Reb_POL_Arct.sqf";
          Info("Using arctic POL Template");
        };
        case (worldName in temperatemaps): {
          call compile preProcessFileLineNumbers "Templates\IFA\IFA_Reb_POL_Temp.sqf";
          Info("Using temperate POL Templates");
        };
        case (worldName in tropicalmaps): {
          call compile preProcessFileLineNumbers "Templates\IFA\IFA_Reb_POL_Temp.sqf";
          Info("Using tropical POL Templates");
        };
        default {
          call compile preProcessFileLineNumbers "Templates\IFA\IFA_Reb_POL_Arid.sqf";
          Info("Using arid POL Templates");
        };
      };
    };
*/
    default {
        switch(true) do {//This one (vanilla) works differently so that we don't get DLC kit on modded maps.
            case (worldName == "Enoch"): {
                ["Templates\NewTemplates\Vanilla\Vanilla_Reb_FIA_Enoch.sqf", independent] call A3A_fnc_compatabilityLoadFaction;
                Info("Using Enoch FIA Template");
            };
            case (worldName == "Tanoa"): {
                ["Templates\NewTemplates\Vanilla\Vanilla_Reb_SDK_Tanoa.sqf", independent] call A3A_fnc_compatabilityLoadFaction;
                Info("Using tanoa SDK Template");
            };
            default {
                ["Templates\NewTemplates\Vanilla\Vanilla_Reb_FIA_Arid.sqf", independent] call A3A_fnc_compatabilityLoadFaction;
                Info("Using arid FIA Templates");
            };
        };
    };
};
  //Occ Templates
switch(true) do{
/* disabled until imtegrated
case (A3A_hasFFAA): {
    switch(true) do {
    case (worldName in arcticmaps): {
        call compile preProcessFileLineNumbers "Templates\FFAA\FFAA_Occ_FFAA_Temp.sqf";
        Info("Using arctic FFAA Template");
    };
    case (worldName in temperatemaps): {
        call compile preProcessFileLineNumbers "Templates\FFAA\FFAA_Occ_FFAA_Temp.sqf";
        Info("Using temperate FFAA Template");
    };
    case (worldName in tropicalmaps): {
        call compile preProcessFileLineNumbers "Templates\FFAA\FFAA_Occ_FFAA_Temp.sqf";
        Info("Using tropical FFAA Template");
    };
    default {
        call compile preProcessFileLineNumbers "Templates\FFAA\FFAA_Occ_FFAA_Arid.sqf";
        Info("Using arid FFAA Template");
    };
    };
};
*/
    case (A3A_has3CBBAF): {
        switch(true) do {
            case (worldName in arcticmaps): {
                ["Templates\NewTemplates\3CB\3CB_AI_BAF_Arctic.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                Info("Using arctic BAF Template");
            };
            case (worldName in temperatemaps): {
                ["Templates\NewTemplates\3CB\3CB_AI_BAF_Temperate.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                Info("Using temperate BAF Template");
            };
            case (worldName in tropicalmaps): {
                ["Templates\NewTemplates\3CB\3CB_AI_BAF_Tropical.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                Info("Using tropical BAF Template");
            };
            default {
                ["Templates\NewTemplates\3CB\3CB_AI_BAF_Arid.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                Info("Using arid BAF Template");
            };
        };
    };
    case (A3A_has3CBFactions): {
        switch(true) do {
            case (worldName in arcticmaps);
            case (worldName in temperatemaps): {
                ["Templates\NewTemplates\RHS\RHS_AI_USAF_Marines_Temperate.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                Info("Using Temperate US Marines Template as Placeholder");
            };
            case (worldName in tropicalmaps): {
                ["Templates\NewTemplates\3CB\3CB_AI_CW_US.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                Info("Using Coldwar US Template");
            };
            default {
                ["Templates\NewTemplates\3CB\3CB_AI_TKA_West.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                Info("Using TKA_West Template");
            };
        };
    };
    case (A3A_hasRHS): {
        switch(true) do {
            case (worldName == "chernarus_summer");
            case (worldName == "Chernarus_Winter"): {
                ["Templates\NewTemplates\RHS\RHS_AI_CDF_Temperate.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                Info("Using CDF Temperate Template");
            };
            case (worldName in arcticmaps);
            case (worldName in temperatemaps);
            case (worldName in tropicalmaps): {
                ["Templates\NewTemplates\RHS\RHS_AI_USAF_Army_Temperate.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                Info("Using arctic USAF Template");
            };
            default {
                ["Templates\NewTemplates\RHS\RHS_AI_USAF_Army_Arid.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                Info("Using arid USAF Templates");
            };
        };
    };
/* disabled until imtegrated
case (A3A_hasIFA): {
    switch(true) do {
    case (worldName in arcticmaps): {
        call compile preProcessFileLineNumbers "Templates\IFA\IFA_Occ_WEH_Arct.sqf";
        Info("Using arctic WEH Template");
    };
    case (worldName in temperatemaps): {
        call compile preProcessFileLineNumbers "Templates\IFA\IFA_Occ_WEH_Temp.sqf";
        Info("Using temperate WEH Template");
    };
    case (worldName in tropicalmaps): {
        call compile preProcessFileLineNumbers "Templates\IFA\IFA_Occ_WEH_Temp.sqf";
        Info("Using tropical WEH Template");
    };
    default {
        call compile preProcessFileLineNumbers "Templates\IFA\IFA_Occ_WEH_Arid.sqf";
        Info("Using arid WEH Templates");
    };
    };
};
*/
    default {
        switch(true) do {//This one (vanilla) works differently so that we don't get DLC kit on modded maps.
            case (worldName == "Enoch"): {
                ["Templates\NewTemplates\Vanilla\Vanilla_AI_LDF_Enoch.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                Info("Using Enoch LDF Template");
            };
            case (worldName == "Tanoa"): {
                ["Templates\NewTemplates\Vanilla\Vanilla_AI_NATO_Tropical.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                Info("Using tropical NATO Templates");
            };
            case (worldName in temperatemaps);
            case (worldName in tropicalmaps): {
                ["Templates\NewTemplates\Vanilla\Vanilla_AI_NATO_Temperate.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                Info("Using temperate NATO Template");
            };
            default {
                ["Templates\NewTemplates\Vanilla\Vanilla_AI_NATO_Arid.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                Info("Using arid NATO Template");
            };
        };
    };
};
//Inv Templates
switch(true) do{
    case (A3A_has3CBFactions): {
        switch(true) do {
            case (worldName in arcticmaps);
            case (worldName in temperatemaps): {
                ["Templates\NewTemplates\RHS\RHS_AI_AFRF_Temperate.sqf", east] call A3A_fnc_compatabilityLoadFaction;
                Info("Using RHS AFRF as Placeholder Template");
            };
            case (worldName in tropicalmaps): {
                ["Templates\NewTemplates\3CB\3CB_AI_CW_SOV.sqf", east] call A3A_fnc_compatabilityLoadFaction;
                Info("Using Coldwar Soviets Template");
            };
            default {
                ["Templates\NewTemplates\3CB\3CB_AI_TKA_East.sqf", east] call A3A_fnc_compatabilityLoadFaction;
                Info("Using TKA_East Template");
            };
        };
    };
    case (A3A_hasRHS): {
        switch(true) do {
            case (worldName in arcticmaps);
            case (worldName in temperatemaps);
            case (worldName in tropicalmaps): {
                ["Templates\NewTemplates\RHS\RHS_AI_AFRF_Temperate.sqf", east] call A3A_fnc_compatabilityLoadFaction;
                Info("Using temperate AFRF Template");
            };
            default {
                ["Templates\NewTemplates\RHS\RHS_AI_AFRF_Arid.sqf", east] call A3A_fnc_compatabilityLoadFaction;
                Info("Using arid AFRF Template");
            };
        };
    };
/* disabled until imtegrated
case (A3A_hasIFA): {
    switch(true) do {
    case (worldName in arcticmaps): {
        call compile preProcessFileLineNumbers "Templates\IFA\IFA_Inv_SOV_Arct.sqf";
        Info("Using arctic SOV Template");
    };
    case (worldName in temperatemaps): {
        call compile preProcessFileLineNumbers "Templates\IFA\IFA_Inv_SOV_Temp.sqf";
        Info("Using temperate SOV Template");
    };
    case (worldName in tropicalmaps): {
        call compile preProcessFileLineNumbers "Templates\IFA\IFA_Inv_SOV_Temp.sqf";
        Info("Using tropical SOV Template");
    };
    default {
        call compile preProcessFileLineNumbers "Templates\IFA\IFA_Inv_SOV_Arid.sqf";
        Info("Using arid SOV Template");
    };
    };
};
*/
    default {
        switch(true) do {//This one (vanilla) works differently so that we don't get DLC kit on modded maps.
            case (worldName == "Enoch"): {
                ["Templates\NewTemplates\Vanilla\Vanilla_AI_CSAT_Enoch.sqf", east] call A3A_fnc_compatabilityLoadFaction;
                Info("Using Enoch CSAT Template");
            };
            case (worldName == "Tanoa"): {
                ["Templates\NewTemplates\Vanilla\Vanilla_AI_CSAT_Tropical.sqf", east] call A3A_fnc_compatabilityLoadFaction;
                Info("Using tanoa CSAT Template");
            };
            default {
                ["Templates\NewTemplates\Vanilla\Vanilla_AI_CSAT_Arid.sqf", east] call A3A_fnc_compatabilityLoadFaction;
                Info("Using arid CSAT Template");
            };
        };
    };
};
//Civ Templates
switch(true) do{
    case (A3A_has3CBFactions): {
        ["Templates\NewTemplates\3CB\3CB_Civ.sqf", civilian] call A3A_fnc_compatabilityLoadFaction;
        Info("Using 3CB Civ Template");
    };
    case (A3A_hasRHS): {
        ["Templates\NewTemplates\RHS\RHS_Civ.sqf", civilian] call A3A_fnc_compatabilityLoadFaction;
        Info("Using RHS Civ Template");
    };
    /* disabled until imtegrated
    case (A3A_hasIFA): {
        call compile preProcessFileLineNumbers "Templates\IFA\IFA_Civ.sqf";
        Info("Using IFA Civ Template");
    };
    */
    default {
        ["Templates\NewTemplates\Vanilla\Vanilla_Civ.sqf", civilian] call A3A_fnc_compatabilityLoadFaction;
        Info("Using Vanilla Civ Template");
    };
};

// This will be adapted at a later step
Info("Reading Addon mod files.");
//Addon pack loading goes here.
if (A3A_hasIvory) then {
  call compile preProcessFileLineNumbers "Templates\AddonVics\ivory_Civ.sqf";
  Info("Using Addon Ivory Cars Template");
};
if (A3A_hasTCGM) then {
  call compile preProcessFileLineNumbers "Templates\AddonVics\tcgm_Civ.sqf";
  Info("Using Addon TCGM_BikeBackPack Template");
};
if (A3A_hasD3S) then {
  call compile preProcessFileLineNumbers "Templates\AddonVics\d3s_Civ.sqf";
  Info("Using Addon D3S Cars Template");
};
if (A3A_hasRDS) then {
  call compile preProcessFileLineNumbers "Templates\AddonVics\rds_Civ.sqf";
  Info("Using Addon RDS Cars Template");
};

//Logistics node loading is done here
Info("Reading Logistics Node files.");
call compile preProcessFileLineNumbers "Templates\NewTemplates\Vanilla\Vanilla_Logistics_Nodes.sqf";//Always call vanilla as it initialises the arrays.
if (A3A_hasRHS) then {call compile preProcessFileLineNumbers "Templates\NewTemplates\RHS\RHS_Logistics_Nodes.sqf"};
if (A3A_has3CBFactions) then {call compile preProcessFileLineNumbers "Templates\NewTemplates\3CB\3CBFactions_Logistics_Nodes.sqf"};
if (A3A_has3CBBAF) then {call compile preProcessFileLineNumbers "Templates\NewTemplates\3CB\3CBBAF_Logistics_Nodes.sqf"};
//if (A3A_hasIFA) then {call compile preProcessFileLineNumbers "Templates\IFA\IFA_Logistics_Nodes.sqf"};		//disabled until imtegrated
//if (A3A_hasFFAA) then {call compile preProcessFileLineNumbers "Templates\FFAA\FFAA_Logistics_Nodes.sqf"};		//disabled until imtegrated
//if (A3A_hasD3S) then {call compile preProcessFileLineNumbers "Templates\AddonVics\d3s_Logi_Nodes.sqf";};		//disabled until imtegrated
//if (A3A_hasRDS) then {call compile preProcessFileLineNumbers "Templates\AddonVics\rds_Logi_Nodes.sqf";};		//disabled until imtegrated
