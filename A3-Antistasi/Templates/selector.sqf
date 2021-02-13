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
aridmaps = ["Altis","Kunduz","Malden","tem_anizay","takistan"];
tropicalmaps = ["Tanoa"];
temperatemaps = ["Enoch","chernarus_summer","vt7","Tembelan"];
arcticmaps = ["Chernarus_Winter"];
//Mod selector

if(teamplayer != independent) then {//This section is for Altis Blufor ONLY!
  switch(true) do {
    case (A3A_has3CB): {
      call compile preProcessFileLineNumbers "Templates\3CB\3CB_Reb_TPGM_Arid.sqf";
      call compile preProcessFileLineNumbers "Templates\3CB\3CB_Occ_TKA_Arid.sqf";
      call compile preProcessFileLineNumbers "Templates\3CB\3CB_Inv_TKM_Arid.sqf";
      call compile preProcessFileLineNumbers "Templates\3CB\3CB_Civ.sqf";
      [2, "Using arid_b TGPM, TKA, TKM, 3CB Civ Templates", _filename] call A3A_fnc_log;
    };
    case (A3A_hasRHS): {
      call compile preProcessFileLineNumbers "Templates\RHS\RHS_Reb_HIDF_Arid.sqf";
      call compile preProcessFileLineNumbers "Templates\RHS\RHS_Occ_CDF_Arid.sqf";
      call compile preProcessFileLineNumbers "Templates\RHS\RHS_Inv_AFRF_Arid.sqf";
      call compile preProcessFileLineNumbers "Templates\RHS\RHS_Civ.sqf";
      [2, "Using arid_b CDF, CDF, AFRF, RHS Civ Templates", _filename] call A3A_fnc_log;
    };
    default {
      call compile preProcessFileLineNumbers "Templates\Vanilla\Vanilla_Reb_FIA_B_Altis.sqf";
      call compile preProcessFileLineNumbers "Templates\Vanilla\Vanilla_Occ_AAF_Altis.sqf";
      call compile preProcessFileLineNumbers "Templates\Vanilla\Vanilla_Inv_CSAT_Altis.sqf";
      call compile preProcessFileLineNumbers "Templates\Vanilla\Vanilla_Civ.sqf";
      [2, "Using arid_b FIA_B, AAF, CSAT, Vanilla Civ Templates", _filename] call A3A_fnc_log;
    };
  };
}else{//This is for non-blufor (THE ONE THAT MATTERS!!)
  //Reb Templates
  switch(true) do{
    case (A3A_has3CB): {
      switch(true) do {
        case (worldName in arcticmaps): {
          call compile preProcessFileLineNumbers "Templates\3CB\3CB_Reb_CNM_Temp.sqf";
          [2, "Using arctic CNM Template", _filename] call A3A_fnc_log;
        };
        case (worldName in temperatemaps): {
          call compile preProcessFileLineNumbers "Templates\3CB\3CB_Reb_CNM_Temp.sqf";
          [2, "Using temperate CNM Template", _filename] call A3A_fnc_log;
        };
        case (worldName in tropicalmaps): {
          call compile preProcessFileLineNumbers "Templates\3CB\3CB_Reb_CNM_Trop.sqf";
          [2, "Using tropical CNM Template", _filename] call A3A_fnc_log;
        };
        default {
          call compile preProcessFileLineNumbers "Templates\3CB\3CB_Reb_TTF_Arid.sqf";
          [2, "Using arid TTF Templates", _filename] call A3A_fnc_log;
        };
      };
    };
    case (A3A_hasRHS): {
      switch(true) do {
        case (worldName in arcticmaps): {
          call compile preProcessFileLineNumbers "Templates\RHS\RHS_Reb_NAPA_Temp.sqf";
          [2, "Using arctic NAPA Template", _filename] call A3A_fnc_log;
        };
        case (worldName in temperatemaps): {
          call compile preProcessFileLineNumbers "Templates\RHS\RHS_Reb_NAPA_Temp.sqf";
          [2, "Using temperate NAPA Template", _filename] call A3A_fnc_log;
        };
        case (worldName in tropicalmaps): {
          call compile preProcessFileLineNumbers "Templates\RHS\RHS_Reb_NAPA_Temp.sqf";
          [2, "Using tropical NAPA Template", _filename] call A3A_fnc_log;
        };
        default {
          call compile preProcessFileLineNumbers "Templates\RHS\RHS_Reb_NAPA_Arid.sqf";
          [2, "Using arid NAPA Template", _filename] call A3A_fnc_log;
        };
      };
    };
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
    default {
      switch(true) do {//This one (vanilla) works differently so that we don't get DLC kit on modded maps.
        case (worldName == "Enoch"): {
          call compile preProcessFileLineNumbers "Templates\Vanilla\Vanilla_Reb_FIA_Enoch.sqf";
          [2, "Using Enoch FIA Template", _filename] call A3A_fnc_log;
        };
        case (worldName == "Tanoa"): {
          call compile preProcessFileLineNumbers "Templates\Vanilla\Vanilla_Reb_SDK_Tanoa.sqf";
          [2, "Using tanoa SDK Template", _filename] call A3A_fnc_log;
        };
        default {
          call compile preProcessFileLineNumbers "Templates\Vanilla\Vanilla_Reb_FIA_Altis.sqf";
          [2, "Using arid FIA Templates", _filename] call A3A_fnc_log;
        };
      };
    };
  };
  //Occ Templates
  switch(true) do{
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
    case (A3A_has3CB): {
      switch(true) do {
        case (worldName in arcticmaps): {
          call compile preProcessFileLineNumbers "Templates\3CB\3CB_Occ_BAF_Temp.sqf";
          [2, "Using arctic BAF Template", _filename] call A3A_fnc_log;
        };
        case (worldName in temperatemaps): {
          call compile preProcessFileLineNumbers "Templates\3CB\3CB_Occ_BAF_Temp.sqf";
          [2, "Using temperate BAF Template", _filename] call A3A_fnc_log;
        };
        case (worldName in tropicalmaps): {
          call compile preProcessFileLineNumbers "Templates\3CB\3CB_Occ_BAF_Trop.sqf";
          [2, "Using tropical BAF Template", _filename] call A3A_fnc_log;
        };
        default {
          call compile preProcessFileLineNumbers "Templates\3CB\3CB_Occ_BAF_Arid.sqf";
          [2, "Using arid BAF Template", _filename] call A3A_fnc_log;
        };
      };
    };
    case (A3A_hasRHS): {
      switch(true) do {
        case (worldName in arcticmaps): {
          call compile preProcessFileLineNumbers "Templates\RHS\RHS_Occ_USAF_Temp.sqf";
          [2, "Using arctic USAF Template", _filename] call A3A_fnc_log;
        };
        case (worldName in temperatemaps): {
          call compile preProcessFileLineNumbers "Templates\RHS\RHS_Occ_USAF_Temp.sqf";
          [2, "Using temperate USAF Template", _filename] call A3A_fnc_log;
        };
        case (worldName in tropicalmaps): {
          call compile preProcessFileLineNumbers "Templates\RHS\RHS_Occ_USAF_Temp.sqf";
          [2, "Using tropical USAF Template", _filename] call A3A_fnc_log;
        };
        default {
          call compile preProcessFileLineNumbers "Templates\RHS\RHS_Occ_USAF_Arid.sqf";
          [2, "Using arid USAF Templates", _filename] call A3A_fnc_log;
        };
      };
    };
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
    default {
      switch(true) do {//This one (vanilla) works differently so that we don't get DLC kit on modded maps.
        case (worldName == "Tanoa"): {
          call compile preProcessFileLineNumbers "Templates\Vanilla\Vanilla_Occ_NATO_Tanoa.sqf";
          [2, "Using tanoa NATO Templates", _filename] call A3A_fnc_log;
        };
        case (worldName in temperatemaps): {
          call compile preProcessFileLineNumbers "Templates\Vanilla\Vanilla_Occ_NATO_Temp.sqf";
          [2, "Using temperate NATO Template", _filename] call A3A_fnc_log;
        };
        default {
          call compile preProcessFileLineNumbers "Templates\Vanilla\Vanilla_Occ_NATO_Altis.sqf";
          [2, "Using arid NATO Template", _filename] call A3A_fnc_log;
        };
      };
      call compile preProcessFileLineNumbers "Templates\Vanilla\Vanilla_Civ.sqf";
    };
  };
  //Inv Templates
  switch(true) do{
    case (A3A_has3CB): {
      switch(true) do {
        case (worldName in arcticmaps): {
          call compile preProcessFileLineNumbers "Templates\3CB\3CB_Inv_SOV_Temp.sqf";
          [2, "Using arctic SOV Template", _filename] call A3A_fnc_log;
        };
        case (worldName in temperatemaps): {
          call compile preProcessFileLineNumbers "Templates\3CB\3CB_Inv_SOV_Temp.sqf";
          [2, "Using temperate SOV Template", _filename] call A3A_fnc_log;
        };
        case (worldName in tropicalmaps): {
          call compile preProcessFileLineNumbers "Templates\3CB\3CB_Inv_SOV_Temp.sqf";
          [2, "Using tropical SOV Template", _filename] call A3A_fnc_log;
        };
        default {
          call compile preProcessFileLineNumbers "Templates\3CB\3CB_Inv_TKM_Arid.sqf";
          [2, "Using arid TKM Template", _filename] call A3A_fnc_log;
        };
      };
    };
    case (A3A_hasRHS): {
      switch(true) do {
        case (worldName in arcticmaps): {
          call compile preProcessFileLineNumbers "Templates\RHS\RHS_Inv_AFRF_Temp.sqf";
          [2, "Using arctic AFRF Template", _filename] call A3A_fnc_log;
        };
        case (worldName in temperatemaps): {
          call compile preProcessFileLineNumbers "Templates\RHS\RHS_Inv_AFRF_Temp.sqf";
          [2, "Using temperate AFRF Template", _filename] call A3A_fnc_log;
        };
        case (worldName in tropicalmaps): {
          call compile preProcessFileLineNumbers "Templates\RHS\RHS_Inv_AFRF_Temp.sqf";
          [2, "Using tropical AFRF Template", _filename] call A3A_fnc_log;
        };
        default {
          call compile preProcessFileLineNumbers "Templates\RHS\RHS_Inv_AFRF_Arid.sqf";
          [2, "Using arid AFRF Template", _filename] call A3A_fnc_log;
        };
      };
    };
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
    default {
      switch(true) do {//This one (vanilla) works differently so that we don't get DLC kit on modded maps.
        case (worldName == "Enoch"): {
          call compile preProcessFileLineNumbers "Templates\Vanilla\Vanilla_Inv_CSAT_Enoch.sqf";
          [2, "Using Enoch CSAT Template", _filename] call A3A_fnc_log;
        };
        case (worldName == "Tanoa"): {
          call compile preProcessFileLineNumbers "Templates\Vanilla\Vanilla_Inv_CSAT_Tanoa.sqf";
          [2, "Using tanoa CSAT Template", _filename] call A3A_fnc_log;
        };
        default {
          call compile preProcessFileLineNumbers "Templates\Vanilla\Vanilla_Inv_CSAT_Altis.sqf";
          [2, "Using arid CSAT Template", _filename] call A3A_fnc_log;
        };
      };
    };
  };
  //Civ Templates
  switch(true) do{
    case (A3A_has3CB): {
      call compile preProcessFileLineNumbers "Templates\3CB\3CB_Civ.sqf";
      [2, "Using 3CB Civ Template", _filename] call A3A_fnc_log;
    };
    case (A3A_hasRHS): {
      call compile preProcessFileLineNumbers "Templates\RHS\RHS_Civ.sqf";
      [2, "Using RHS Civ Template", _filename] call A3A_fnc_log;
    };
    case (A3A_hasIFA): {
      call compile preProcessFileLineNumbers "Templates\IFA\IFA_Civ.sqf";
      [2, "Using IFA Civ Template", _filename] call A3A_fnc_log;
    };
    default {
      call compile preProcessFileLineNumbers "Templates\Vanilla\Vanilla_Civ.sqf";
      [2, "Using Vanilla Civ Template", _filename] call A3A_fnc_log;
    };
  };
};

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
call compile preProcessFileLineNumbers "Templates\Vanilla\Vanilla_Logistics_Nodes.sqf";//Always call vanilla as it initialises the arrays.
if (A3A_hasRHS) then {call compile preProcessFileLineNumbers "Templates\RHS\RHS_Logistics_Nodes.sqf"};
if (A3A_has3CB) then {call compile preProcessFileLineNumbers "Templates\3CB\3CB_Logistics_Nodes.sqf"};
if (A3A_hasIFA) then {call compile preProcessFileLineNumbers "Templates\IFA\IFA_Logistics_Nodes.sqf"};
if (A3A_hasFFAA) then {call compile preProcessFileLineNumbers "Templates\FFAA\FFAA_Logistics_Nodes.sqf"};
if (A3A_hasD3S) then {call compile preProcessFileLineNumbers "Templates\AddonVics\d3s_Logi_Nodes.sqf";};
if (A3A_hasRDS) then {call compile preProcessFileLineNumbers "Templates\AddonVics\rds_Logi_Nodes.sqf";};
