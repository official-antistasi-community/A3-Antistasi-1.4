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
private _filename = "selector.sqf";
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
                [2, "Using Temperate CNM Template", _filename] call A3A_fnc_log;
            };
            default {
                ["Templates\NewTemplates\3CB\3CB_Reb_TKM_Arid.sqf", independent] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using arid TKM Templates", _filename] call A3A_fnc_log;
            };
        };
    };
    case (A3A_hasRHS): {
        switch(true) do {
            case (worldName in arcticmaps);
            case (worldName in temperatemaps);
            case (worldName in tropicalmaps): {
                ["Templates\NewTemplates\RHS\RHS_Reb_NAPA_Temperate.sqf", independent] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using Temperate Napa Template", _filename] call A3A_fnc_log;
            };
            default {
                ["Templates\NewTemplates\RHS\RHS_Reb_NAPA_Arid.sqf", independent] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using arid Napa Templates", _filename] call A3A_fnc_log;
            };
        };
    };
/* disabled until imtegrated
    case (A3A_hasIFA): {
      switch(true) do {
        case (worldName in arcticmaps): {
          call compile preProcessFileLineNumbers "Templates\IFA\IFA_Reb_POL_Arct.sqf";
          [2, "Using arctic POL Template", _filename] call A3A_fnc_log;
        };
        case (worldName in temperatemaps): {
          call compile preProcessFileLineNumbers "Templates\IFA\IFA_Reb_POL_Temp.sqf";
          [2, "Using temperate POL Templates", _filename] call A3A_fnc_log;
        };
        case (worldName in tropicalmaps): {
          call compile preProcessFileLineNumbers "Templates\IFA\IFA_Reb_POL_Temp.sqf";
          [2, "Using tropical POL Templates", _filename] call A3A_fnc_log;
        };
        default {
          call compile preProcessFileLineNumbers "Templates\IFA\IFA_Reb_POL_Arid.sqf";
          [2, "Using arid POL Templates", _filename] call A3A_fnc_log;
        };
      };
    };
*/
    default {
        switch(true) do {//This one (vanilla) works differently so that we don't get DLC kit on modded maps.
            case (worldName == "Enoch"): {
                ["Templates\NewTemplates\Vanilla\Vanilla_Reb_FIA_Enoch.sqf", independent] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using Enoch FIA Template", _filename] call A3A_fnc_log;
            };
            case (worldName == "Tanoa"): {
                ["Templates\NewTemplates\Vanilla\Vanilla_Reb_SDK_Tanoa.sqf", independent] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using tanoa SDK Template", _filename] call A3A_fnc_log;
            };
            default {
                ["Templates\NewTemplates\Vanilla\Vanilla_Reb_FIA_Arid.sqf", independent] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using arid FIA Templates", _filename] call A3A_fnc_log;
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
        [2, "Using arctic FFAA Template", _filename] call A3A_fnc_log;
    };
    case (worldName in temperatemaps): {
        call compile preProcessFileLineNumbers "Templates\FFAA\FFAA_Occ_FFAA_Temp.sqf";
        [2, "Using temperate FFAA Template", _filename] call A3A_fnc_log;
    };
    case (worldName in tropicalmaps): {
        call compile preProcessFileLineNumbers "Templates\FFAA\FFAA_Occ_FFAA_Temp.sqf";
        [2, "Using tropical FFAA Template", _filename] call A3A_fnc_log;
    };
    default {
        call compile preProcessFileLineNumbers "Templates\FFAA\FFAA_Occ_FFAA_Arid.sqf";
        [2, "Using arid FFAA Template", _filename] call A3A_fnc_log;
    };
    };
};
*/
    case (A3A_has3CBBAF): {
        switch(true) do {
            case (worldName in arcticmaps): {
                ["Templates\NewTemplates\3CB\3CB_AI_BAF_Arctic.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using arctic BAF Template", _filename] call A3A_fnc_log;
            };
            case (worldName in temperatemaps): {
                ["Templates\NewTemplates\3CB\3CB_AI_BAF_Temperate.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using temperate BAF Template", _filename] call A3A_fnc_log;
            };
            case (worldName in tropicalmaps): {
                ["Templates\NewTemplates\3CB\3CB_AI_BAF_Tropical.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using tropical BAF Template", _filename] call A3A_fnc_log;
            };
            default {
                ["Templates\NewTemplates\3CB\3CB_AI_BAF_Arid.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using arid BAF Template", _filename] call A3A_fnc_log;
            };
        };
    };
    case (A3A_has3CBFactions): {
        switch(true) do {
            case (worldName in arcticmaps);
            case (worldName in temperatemaps): {
                ["Templates\NewTemplates\RHS\RHS_AI_USAF_Marines_Temperate.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using Temperate US Marines Template as Placeholder", _filename] call A3A_fnc_log;
            };
            case (worldName in tropicalmaps): {
                ["Templates\NewTemplates\3CB\3CB_AI_CW_US.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using Coldwar US Template", _filename] call A3A_fnc_log;
            };
            default {
                ["Templates\NewTemplates\3CB\3CB_AI_TKA_West.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using TKA_West Template", _filename] call A3A_fnc_log;
            };
        };
    };
    case (A3A_hasRHS): {
        switch(true) do {
            case (worldName == "chernarus_summer");
            case (worldName == "Chernarus_Winter"): {
                ["Templates\NewTemplates\RHS\RHS_AI_CDF_Temperate.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using CDF Temperate Template", _filename] call A3A_fnc_log;
            };
            case (worldName in arcticmaps);
            case (worldName in temperatemaps);
            case (worldName in tropicalmaps): {
                ["Templates\NewTemplates\RHS\RHS_AI_USAF_Army_Temperate.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using arctic USAF Template", _filename] call A3A_fnc_log;
            };
            default {
                ["Templates\NewTemplates\RHS\RHS_AI_USAF_Army_Arid.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using arid USAF Templates", _filename] call A3A_fnc_log;
            };
        };
    };
/* disabled until imtegrated
case (A3A_hasIFA): {
    switch(true) do {
    case (worldName in arcticmaps): {
        call compile preProcessFileLineNumbers "Templates\IFA\IFA_Occ_WEH_Arct.sqf";
        [2, "Using arctic WEH Template", _filename] call A3A_fnc_log;
    };
    case (worldName in temperatemaps): {
        call compile preProcessFileLineNumbers "Templates\IFA\IFA_Occ_WEH_Temp.sqf";
        [2, "Using temperate WEH Template", _filename] call A3A_fnc_log;
    };
    case (worldName in tropicalmaps): {
        call compile preProcessFileLineNumbers "Templates\IFA\IFA_Occ_WEH_Temp.sqf";
        [2, "Using tropical WEH Template", _filename] call A3A_fnc_log;
    };
    default {
        call compile preProcessFileLineNumbers "Templates\IFA\IFA_Occ_WEH_Arid.sqf";
        [2, "Using arid WEH Templates", _filename] call A3A_fnc_log;
    };
    };
};
*/
    default {
        switch(true) do {//This one (vanilla) works differently so that we don't get DLC kit on modded maps.
            case (worldName == "Enoch"): {
                ["Templates\NewTemplates\Vanilla\Vanilla_AI_LDF_Enoch.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using Enoch LDF Template", _filename] call A3A_fnc_log;
            };
            case (worldName == "Tanoa"): {
                ["Templates\NewTemplates\Vanilla\Vanilla_AI_NATO_Tropical.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using tropical NATO Templates", _filename] call A3A_fnc_log;
            };
            case (worldName in temperatemaps);
            case (worldName in tropicalmaps): {
                ["Templates\NewTemplates\Vanilla\Vanilla_AI_NATO_Temperate.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using temperate NATO Template", _filename] call A3A_fnc_log;
            };
            default {
                ["Templates\NewTemplates\Vanilla\Vanilla_AI_NATO_Arid.sqf", west] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using arid NATO Template", _filename] call A3A_fnc_log;
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
                [2, "Using RHS AFRF as Placeholder Template", _filename] call A3A_fnc_log;
            };
            case (worldName in tropicalmaps): {
                ["Templates\NewTemplates\3CB\3CB_AI_CW_SOV.sqf", east] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using Coldwar Soviets Template", _filename] call A3A_fnc_log;
            };
            default {
                ["Templates\NewTemplates\3CB\3CB_AI_TKA_East.sqf", east] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using TKA_East Template", _filename] call A3A_fnc_log;
            };
        };
    };
    case (A3A_hasRHS): {
        switch(true) do {
            case (worldName in arcticmaps);
            case (worldName in temperatemaps);
            case (worldName in tropicalmaps): {
                ["Templates\NewTemplates\RHS\RHS_AI_AFRF_Temperate.sqf", east] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using temperate AFRF Template", _filename] call A3A_fnc_log;
            };
            default {
                ["Templates\NewTemplates\RHS\RHS_AI_AFRF_Arid.sqf", east] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using arid AFRF Template", _filename] call A3A_fnc_log;
            };
        };
    };
/* disabled until imtegrated
case (A3A_hasIFA): {
    switch(true) do {
    case (worldName in arcticmaps): {
        call compile preProcessFileLineNumbers "Templates\IFA\IFA_Inv_SOV_Arct.sqf";
        [2, "Using arctic SOV Template", _filename] call A3A_fnc_log;
    };
    case (worldName in temperatemaps): {
        call compile preProcessFileLineNumbers "Templates\IFA\IFA_Inv_SOV_Temp.sqf";
        [2, "Using temperate SOV Template", _filename] call A3A_fnc_log;
    };
    case (worldName in tropicalmaps): {
        call compile preProcessFileLineNumbers "Templates\IFA\IFA_Inv_SOV_Temp.sqf";
        [2, "Using tropical SOV Template", _filename] call A3A_fnc_log;
    };
    default {
        call compile preProcessFileLineNumbers "Templates\IFA\IFA_Inv_SOV_Arid.sqf";
        [2, "Using arid SOV Template", _filename] call A3A_fnc_log;
    };
    };
};
*/
    default {
        switch(true) do {//This one (vanilla) works differently so that we don't get DLC kit on modded maps.
            case (worldName == "Enoch"): {
                ["Templates\NewTemplates\Vanilla\Vanilla_AI_CSAT_Enoch.sqf", east] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using Enoch CSAT Template", _filename] call A3A_fnc_log;
            };
            case (worldName == "Tanoa"): {
                ["Templates\NewTemplates\Vanilla\Vanilla_AI_CSAT_Tropical.sqf", east] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using tanoa CSAT Template", _filename] call A3A_fnc_log;
            };
            default {
                ["Templates\NewTemplates\Vanilla\Vanilla_AI_CSAT_Arid.sqf", east] call A3A_fnc_compatabilityLoadFaction;
                [2, "Using arid CSAT Template", _filename] call A3A_fnc_log;
            };
        };
    };
};
//Civ Templates
switch(true) do{
    case (A3A_has3CBFactions): {
        ["Templates\NewTemplates\3CB\3CB_Civ.sqf", civilian] call A3A_fnc_compatabilityLoadFaction;
        [2, "Using 3CB Civ Template", _filename] call A3A_fnc_log;
    };
    case (A3A_hasRHS): {
        ["Templates\NewTemplates\RHS\RHS_Civ.sqf", civilian] call A3A_fnc_compatabilityLoadFaction;
        [2, "Using RHS Civ Template", _filename] call A3A_fnc_log;
    };
    /* disabled until imtegrated
    case (A3A_hasIFA): {
        call compile preProcessFileLineNumbers "Templates\IFA\IFA_Civ.sqf";
        [2, "Using IFA Civ Template", _filename] call A3A_fnc_log;
    };
    */
    default {
        ["Templates\NewTemplates\Vanilla\Vanilla_Civ.sqf", civilian] call A3A_fnc_compatabilityLoadFaction;
        [2, "Using Vanilla Civ Template", _filename] call A3A_fnc_log;
    };
};

// This will be adapted at a later step
[2,"Reading Addon mod files.",_fileName] call A3A_fnc_log;
//Addon pack loading goes here.
if (A3A_hasIvory) then {
  call compile preProcessFileLineNumbers "Templates\AddonVics\ivory_Civ.sqf";
  [2, "Using Addon Ivory Cars Template", _filename] call A3A_fnc_log;
};
if (A3A_hasTCGM) then {
  call compile preProcessFileLineNumbers "Templates\AddonVics\tcgm_Civ.sqf";
  [2, "Using Addon TCGM_BikeBackPack Template", _filename] call A3A_fnc_log;
};
if (A3A_hasD3S) then {
  call compile preProcessFileLineNumbers "Templates\AddonVics\d3s_Civ.sqf";
  [2, "Using Addon D3S Cars Template", _filename] call A3A_fnc_log;
};
if (A3A_hasRDS) then {
  call compile preProcessFileLineNumbers "Templates\AddonVics\rds_Civ.sqf";
  [2, "Using Addon RDS Cars Template", _filename] call A3A_fnc_log;
};

//Logistics node loading is done here
[2,"Reading Logistics Node files.",_fileName] call A3A_fnc_log;
call compile preProcessFileLineNumbers "Templates\NewTemplates\Vanilla\Vanilla_Logistics_Nodes.sqf";//Always call vanilla as it initialises the arrays.
if (A3A_hasRHS) then {call compile preProcessFileLineNumbers "Templates\NewTemplates\RHS\RHS_Logistics_Nodes.sqf"};
if (A3A_has3CBFactions) then {call compile preProcessFileLineNumbers "Templates\NewTemplates\3CB\3CBFactions_Logistics_Nodes.sqf"};
if (A3A_has3CBBAF) then {call compile preProcessFileLineNumbers "Templates\NewTemplates\3CB\3CBBAF_Logistics_Nodes.sqf"};
//if (A3A_hasIFA) then {call compile preProcessFileLineNumbers "Templates\IFA\IFA_Logistics_Nodes.sqf"};		//disabled until imtegrated
//if (A3A_hasFFAA) then {call compile preProcessFileLineNumbers "Templates\FFAA\FFAA_Logistics_Nodes.sqf"};		//disabled until imtegrated
//if (A3A_hasD3S) then {call compile preProcessFileLineNumbers "Templates\AddonVics\d3s_Logi_Nodes.sqf";};		//disabled until imtegrated
//if (A3A_hasRDS) then {call compile preProcessFileLineNumbers "Templates\AddonVics\rds_Logi_Nodes.sqf";};		//disabled until imtegrated
