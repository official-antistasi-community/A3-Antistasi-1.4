/*
Author: Meerkat & Håkon
  This file controls the selection of templates based on the mods loaded and map used.

  - When porting new mods/maps be sure to add them to their respective sections!

  - when adding a faction add it to the faction enums (ln 114), the autopick functions (ln 35), the _pick{Reb/AI/Civ}Template function (ln 153), and the params (initParams.sqf & params.hpp)

  - when new vehicles are added add a logistics node file and load it when the mod its dependant on is loaded

Scope: Server
Environment: Any (Inherits scheduled from initVarServer)
Public: No
Dependencies:
  <SIDE> teamplayer The side of the rebels, usually only independent or west.
  <FILES> "Templates\" Assumes the existence of files under "Templates\". Please check here before deleting/renaming one.
*/
#include "..\Includes\common.inc"
FIX_LINE_NUMBERS()

//======================|
// Climate Getter       |
//======================|

private _fileName = "Map\" + toLower worldName + "Info.sqf";
A3A_climate = ["climate"] call compile preProcessFileLineNumbers _filename;

//======================|
// Autopick Functions   |
//======================|
// side passed as _this

private _autoPickAI = {
    //occ
    if (_this isEqualTo west) exitWith {
        switch (true) do {
            case (A3A_hasCUP): {
                switch(true) do {
                    case (toLower worldName == "sara"): {"RAS"};
                    case (toLower worldName == "chernarus_summer");
                    case (toLower worldName == "chernarus_winter"): {"CDF"};
                    default {"USAF"};
                };
            };
            case (A3A_has3CBBAF): {"BAF"};
            case (A3A_has3CBFactions): {
                switch(true) do {
                    case (toLower worldName == "kunduz"): {"ANA"};
                    case (toLower worldName == "altis"): {"AAF"};
                    case (toLower worldName == "tanoa"): {"HIDF"};
                    case (toLower worldName == "malden"): {"MDF"};
                    case (A3A_climate isEqualTo "arctic");
                    case (A3A_climate isEqualTo "temperate"): {"US Marines"};
                    case (A3A_climate isEqualTo "tropical"): {"Coldwar US"};
                    default {"TKA West"};
                };
            };
            case (A3A_hasRHS): {
                switch(true) do {
                    case (toLower worldName == "chernarus_summer");
                    case (toLower worldName == "chernarus_winter"): {"CDF"};
                    default {"USAF"};
                };
            };
            case (A3A_hasVN): {"PAVN"};
            default {
                switch(true) do {
                    case (toLower worldName == "altis"): {"AAF"};
                    case (toLower worldName == "enoch"): {"LDF"};
                    default {"NATO"};
                };
            };
        };
    };

    //inv
    switch (true) do {
        case (A3A_has3CBFactions): {
            switch(true) do {
                case (A3A_climate isEqualTo "arctic");
                case (A3A_climate isEqualTo "temperate"): {"AFRF"};
                case (A3A_climate isEqualTo "tropical"): {"Coldwar Soviets"};
                default {"TKA East"};
            };
        };
        case (A3A_hasCUP): {
            switch(true) do {
                case (toLower worldName == "sara"): {"SLA"};
                case (toLower worldName == "takistan");
                default {"AFRF"};
            };
        };      
        case (A3A_hasRHS): {"AFRF"};
        case (A3A_hasVN): {"MACV"};
        default {"CSAT"};
    };
};
private _autoPickReb = {
    switch (true) do {
        case (A3A_has3CBFactions): {
            switch(true) do {
                case (A3A_climate isEqualTo "arctic");
                case (A3A_climate isEqualTo "temperate");
                case (A3A_climate isEqualTo "tropical"): { "CNM" };
                default { "TKM" };
            };
        };
        case (A3A_hasCUP): {
            switch(true) do {
                case (A3A_climate isEqualTo "arctic");
                case (A3A_climate isEqualTo "temperate");
                case (A3A_climate isEqualTo "tropical"): { "NPC" };
                case (toLower worldName == "chernarus_summer"): { "NPC" };
                case (toLower worldName == "chernarus_winter"): { "NPC" };
                default { "TKL" };
            };
        };
        case (A3A_hasRHS): {"NAPA"};
        case (A3A_hasVN): {"POF"};
        default {
            switch(true) do {
                case (toLower worldName == "tanoa"): { "SDK" };
                default { "FIA" };
            };
        };
    };
};
private _autoPickCiv = {
    switch (true) do {
        case (A3A_has3CBFactions): { "Factions" };
        case (A3A_hasRHS): { "RHS" };
        case (A3A_hasVN): { "VN" };
        case (A3A_hasCUP): {"CUP"};
        default { "Vanilla" };
    };
};

//======================|
// Factions enums       |
//======================|

private _AIFactionEnums = [
    [_autoPickAI, true]
    ,["NATO", true]
    , ["CSAT", true]
    , ["AAF", true]
    , ["LDF" , true] //ToDo: add contact dlc check
    , ["USAF", A3A_hasRHS]
    , ["AFRF", A3A_hasRHS]
    , ["CDF", A3A_hasRHS]
    , ["US Marines", A3A_hasRHS]
    , ["BAF", A3A_has3CBBAF]
    , ["Coldwar US", A3A_has3CBFactions]
    , ["Coldwar Soviets", A3A_has3CBFactions]
    , ["TKA West", A3A_has3CBFactions]
    , ["TKA East", A3A_has3CBFactions]
    , ["ADA", A3A_has3CBFactions]
    , ["ANA", A3A_has3CBFactions]
    , ["AAF", A3A_has3CBFactions]
    , ["MDF", A3A_has3CBFactions]
    , ["HIDF", A3A_has3CBFactions]
    , ["MACV", A3A_hasVN]
    , ["PAVN", A3A_hasVN]
    , ["ACR", A3A_hasCUP]
    , ["BAF", A3A_hasCUP]
    , ["CDF", A3A_hasCUP]
    , ["USAF", A3A_hasCUP]
    , ["USMC", A3A_hasCUP]
    , ["AFRF", A3A_hasCUP]
    , ["RAS", A3A_hasCUP]
    , ["SLA", A3A_hasCUP]
    , ["TA", A3A_hasCUP]
];
private _rebFactionEnums = [
    [_autoPickReb, true]
    , ["FIA", true]
    , ["SDK", true]
    , ["NAPA", A3A_hasRHS]
    , ["CNM", A3A_has3CBFactions]
    , ["TKM", A3A_has3CBFactions]
    , ["POF", A3A_hasVN]
    , ["NPC", A3A_hasCUP]
    , ["TKL", A3A_hasCUP]
];
private _civFactionEnums = [
    [_autoPickCiv, true]
    , ["Vanilla", true]
    , ["RHS", A3A_hasRHS]
    , ["Factions", A3A_has3CBFactions]
    , ["VN", A3A_hasVN]
    , ["CUP", A3A_hasCUP]
];

//======================|
// Faction to template  |
//======================|

private _pickAITemplate = {
    switch _this do {
        //CUP
        case "ACR": {
            switch(true) do {
                case (A3A_climate isEqualTo "arctic");
                case (A3A_climate isEqualTo "temperate");
                case (A3A_climate isEqualTo "tropical"): { "Templates\Templates\CUP\CUP_AI_ACR_Temperate.sqf" };
                default { "Templates\Templates\CUP\CUP_AI_ACR_Arid.sqf" };
            };
        };
        case "BAF": {
            switch(true) do {
                case (A3A_climate isEqualTo "arctic");
                case (A3A_climate isEqualTo "temperate");
                case (A3A_climate isEqualTo "tropical"): { "Templates\Templates\CUP\CUP_AI_BAF_Temperate.sqf" };
                default { "Templates\Templates\CUP\CUP_AI_BAF_Arid.sqf" };
            };
        };
        case "CDF": { "Templates\Templates\CUP\CUP_AI_CDF_Temperate.sqf" };
        case "USAF": {
            switch(true) do {
                case (A3A_climate isEqualTo "arctic");
                case (A3A_climate isEqualTo "temperate");
                case (A3A_climate isEqualTo "tropical"): { "Templates\Templates\CUP\CUP_AI_US_Army_Temperate.sqf" };
                default { "Templates\Templates\CUP\CUP_AI_US_Army_Arid.sqf" };
            };
        };
        case "USMC": {
            switch(true) do {
                case (A3A_climate isEqualTo "arctic");
                case (A3A_climate isEqualTo "temperate");
                case (A3A_climate isEqualTo "tropical"): { "Templates\Templates\CUP\CUP_AI_US_Marine_Temperate.sqf" };
                default { "Templates\Templates\CUP\CUP_AI_US_Marine_Arid.sqf" };
            };
        };
        case "AFRF": {
            switch(true) do {
                case (A3A_climate isEqualTo "arctic");
                case (A3A_climate isEqualTo "temperate");
                case (A3A_climate isEqualTo "tropical"): { "Templates\Templates\CUP\CUP_AI_AFRF_Temperate.sqf" };
                default { "Templates\Templates\CUP\CUP_AI_AFRF_Arid.sqf" };
            };
        };
        case "RAS": { "Templates\Templates\CUP\CUP_AI_RAS_Arid.sqf" };
        case "SLA": { "Templates\Templates\CUP\CUP_AI_SLA_Temperate.sqf" };
        case "TA": { "Templates\Templates\CUP\CUP_AI_TA_Arid.sqf" };
        //3CB BAF
        case "BAF": {
            switch(true) do {
                case (A3A_climate isEqualTo "arctic"): { "Templates\Templates\3CB\3CB_AI_BAF_Arctic.sqf" };
                case (A3A_climate isEqualTo "temperate"): { "Templates\Templates\3CB\3CB_AI_BAF_Temperate.sqf" };
                case (A3A_climate isEqualTo "tropical"): { "Templates\Templates\3CB\3CB_AI_BAF_Tropical.sqf" };
                default { "Templates\Templates\3CB\3CB_AI_BAF_Arid.sqf" };
            };
        };

        //Factions
        case "Coldwar US": { "Templates\Templates\3CB\3CB_AI_CW_US.sqf" };
        case "Coldwar Soviets": { "Templates\Templates\3CB\3CB_AI_CW_SOV.sqf" };
        case "TKA West": { "Templates\Templates\3CB\3CB_AI_TKA_West.sqf" };
        case "TKA East": { "Templates\Templates\3CB\3CB_AI_TKA_East.sqf" };
        case "ADA": { "Templates\Templates\3CB\3CB_AI_ADA.sqf" };
        case "ANA": { "Templates\Templates\3CB\3CB_AI_ANA.sqf" };
        case "3CB AAF": { "Templates\Templates\3CB\3CB_AI_AAF.sqf" };
        case "HIDF": { "Templates\Templates\3CB\3CB_AI_HIDF.sqf" };
        case "MDF": { "Templates\Templates\3CB\3CB_AI_MDF.sqf" };
        //RHS
        case "US Marines": {
            switch(true) do {
                case (A3A_climate isEqualTo "arctic");
                case (A3A_climate isEqualTo "temperate");
                case (A3A_climate isEqualTo "tropical"): { "Templates\Templates\RHS\RHS_AI_USAF_Marines_Temperate.sqf" };
                default { "Templates\Templates\RHS\RHS_AI_USAF_Marines_Arid.sqf" };
            };
        };
        case "CDF": { "Templates\Templates\RHS\RHS_AI_CDF_Temperate.sqf" };
        case "USAF": {
            switch(true) do {
                case (A3A_climate isEqualTo "arctic");
                case (A3A_climate isEqualTo "temperate");
                case (A3A_climate isEqualTo "tropical"): { "Templates\Templates\RHS\RHS_AI_USAF_Army_Temperate.sqf" };
                default { "Templates\Templates\RHS\RHS_AI_USAF_Army_Arid.sqf" };
            };
        };
        case "AFRF": {
            switch(true) do {
                case (A3A_climate isEqualTo "arctic");
                case (A3A_climate isEqualTo "temperate");
                case (A3A_climate isEqualTo "tropical"): { "Templates\Templates\RHS\RHS_AI_AFRF_Temperate.sqf" };
                default { "Templates\Templates\RHS\RHS_AI_AFRF_Arid.sqf" };
            };
        };

        //VN
        case "PAVN": { "Templates\Templates\VN\VN_PAVN.sqf" };
        case "MACV": { "Templates\Templates\VN\VN_MACV.sqf" };

        //Vanilla & DLC
        case "LDF": { "Templates\Templates\Vanilla\Vanilla_AI_LDF_Enoch.sqf" };
        case "AAF": { "Templates\Templates\Vanilla\Vanilla_AI_AAF_Arid.sqf" };
        case "NATO": {
            switch(true) do {
                case (toLower worldName == "tanoa"): { "Templates\Templates\Vanilla\Vanilla_AI_NATO_Tropical.sqf" };
                case (A3A_climate isEqualTo "temperate");
                case (A3A_climate isEqualTo "tropical"): { "Templates\Templates\Vanilla\Vanilla_AI_NATO_Temperate.sqf" };
                default { "Templates\Templates\Vanilla\Vanilla_AI_NATO_Arid.sqf" };
            };
        };
        case "CSAT": {
            switch(true) do {
                case (toLower worldName == "enoch"): { "Templates\Templates\Vanilla\Vanilla_AI_CSAT_Enoch.sqf" };
                case (toLower worldName == "tanoa"): { "Templates\Templates\Vanilla\Vanilla_AI_CSAT_Tropical.sqf" };
                default { "Templates\Templates\Vanilla\Vanilla_AI_CSAT_Arid.sqf" };
            };
        };
    };
};

private _pickRebTemplate = {
    switch _this do {
    
        //3cb Factions
        case "CNM": { "Templates\Templates\3CB\3CB_Reb_CNM_Temperate.sqf" };
        case "TKM": { "Templates\Templates\3CB\3CB_Reb_TKM_Arid.sqf" };

        //RHS
        case "NAPA": {
            switch(true) do {
                case (A3A_climate isEqualTo "arctic");
                case (A3A_climate isEqualTo "temperate");
                case (A3A_climate isEqualTo "tropical"): { "Templates\Templates\RHS\RHS_Reb_NAPA_Temperate.sqf" };
                default { "Templates\Templates\RHS\RHS_Reb_NAPA_Arid.sqf" };
            };
        };

        //VN
        case "POF": { "Templates\Templates\VN\VN_Reb_POF.sqf" };

        // CUP
        case "NPC": { "Templates\Templates\CUP\CUP_Reb_NPC_Temperate.sqf" };
        case "TKL": { "Templates\Templates\CUP\CUP_Reb_TKL_Arid.sqf" };
        //Vanilla
        case "FIA": {
            switch (true) do {
                case (toLower worldName == "enoch"): { "Templates\Templates\Vanilla\Vanilla_Reb_FIA_Enoch.sqf" };
                default { "Templates\Templates\Vanilla\Vanilla_Reb_FIA_Arid.sqf" };
            };
        };
        case "SDK": { "Templates\Templates\Vanilla\Vanilla_Reb_SDK_Tanoa.sqf" };
    };
};

private _pickCIVTemplate = {
    switch _this do {
        case "Factions": {
            switch(true) do {
                case (A3A_climate isEqualTo "arctic");
                case (A3A_climate isEqualTo "temperate");
                case (A3A_climate isEqualTo "tropical"): { "Templates\Templates\3CB\3CB_Civ_Temperate.sqf" };
                default { "Templates\Templates\3CB\3CB_Civ_Arid.sqf" };
            };
        };
        case "RHS": { "Templates\Templates\RHS\RHS_Civ.sqf" };
        case "VN": { "Templates\Templates\VN\VN_CIV.sqf" };
        case "Vanilla": { "Templates\Templates\Vanilla\Vanilla_Civ.sqf" };
        case "CUP" : { "Templates\Templates\CUP\CUP_Civ.sqf" };    
    };
};

//======================|
// Template selection   |
//======================|

//reb
_rebFactionEnums#A3A_rebTemplateFactionEnum params ["_template", "_condition"];
if !(_condition) then {
    Error_1("Invalid mods loaded, failed to load choosen template: %1", _template);
    _template = (_rebFactionEnums#(_rebFactionEnums findIf {_x#1}))#0
};
if (_template isEqualType {}) then {
    Info("Autopicking Reb template");
    _template = resistance call _template
};
private _path = _template call _pickRebTemplate;

[_path, resistance] call A3A_fnc_compatibilityLoadFaction;
Info_2("Loaded Reb template: %1 | Path: %2", _template, _path);
A3A_Reb_template = _template;

//occ
_AIFactionEnums#A3A_occTemplateFactionEnum params ["_template", "_condition"];
if !(_condition) then {
    Error_1("Invalid mods loaded, failed to load choosen template: %1", _template);
    _template = (_AIFactionEnums#(_AIFactionEnums findIf {_x#1}))#0
};
if (_template isEqualType {}) then {
    Info("Autopicking Occ template");
    _template = west call _template
};
private _path = _template call _pickAITemplate;

[_path, west] call A3A_fnc_compatibilityLoadFaction;
Info_2("Loaded Occ template: %1 | Path: %2", _template, _path);
A3A_Occ_template = _template;

//inv
_AIFactionEnums#A3A_invTemplateFactionEnum params ["_template", "_condition"];
if !(_condition) then {
    Error_1("Invalid mods loaded, failed to load choosen template: %1", _template);
    _template = (_AIFactionEnums#(_AIFactionEnums findIf {_x#1}))#0
};
if (_template isEqualType {}) then {
    Info("Autopicking Inv template");
    _template = east call _template
};
private _path = _template call _pickAITemplate;

[_path, east] call A3A_fnc_compatibilityLoadFaction;
Info_2("Loaded Inv template: %1 | Path: %2", _template, _path);
A3A_Inv_template = _template;

//civ
_civFactionEnums#A3A_civTemplateFactionEnum params ["_template", "_condition"];
if !(_condition) then {
    Error_1("Invalid mods loaded, failed to load choosen template: %1", _template);
    _template = _civFactionEnums#((_civFactionEnums findIf {_x#1}))#0
};
if (_template isEqualType {}) then {
    Info("Autopicking Civ template");
    _template = civilian call _template
};
private _path = _template call _pickCIVTemplate;

[_path, civilian] call A3A_fnc_compatibilityLoadFaction;
Info_2("Loaded Civ template: %1 | Path: %2", _template, _path);
A3A_Civ_template = _template;

//======================|
// Addon mods           |
//======================|

// This will be adapted at a later step
Info("Reading Addon mod files.");
//Addon pack loading goes here.
A3A_LoadedContentAddons = [];
if (A3A_hasIvory) then {
    [civilian, "Templates\AddonVics\ivory_Civ.sqf"] call A3A_fnc_loadAddon;
    A3A_LoadedContentAddons pushBack "IvoryCars";
    Info("Using Addon Ivory Cars Template");
};
if (A3A_hasTCGM) then {
    [civilian, "Templates\AddonVics\tcgm_Civ.sqf"] call A3A_fnc_loadAddon;
    A3A_LoadedContentAddons pushBack "TCGM_BikeBackPack";
    Info("Using Addon TCGM_BikeBackPack Template");
};
if (A3A_hasD3S) then {
    [civilian, "Templates\AddonVics\d3s_Civ.sqf"] call A3A_fnc_loadAddon;
    A3A_LoadedContentAddons pushBack "D3SCars";
    Info("Using Addon D3S Cars Template");
};
if (A3A_hasRDS) then {
    [civilian, "Templates\AddonVics\rds_Civ.sqf"] call A3A_fnc_loadAddon;
    A3A_LoadedContentAddons pushBack "RDSCars";
    Info("Using Addon RDS Cars Template");
};
A3A_LoadedContentAddons = A3A_LoadedContentAddons apply {toLower _x};

//======================|
// Logistics nodes      |
//======================|

Info("Reading Logistics Node files.");
call compile preProcessFileLineNumbers "Templates\Templates\Vanilla\Vanilla_Logistics_Nodes.sqf";//Always call vanilla as it initialises the arrays.
if (A3A_hasRHS) then {call compile preProcessFileLineNumbers "Templates\Templates\RHS\RHS_Logistics_Nodes.sqf"};
if (A3A_has3CBFactions) then {call compile preProcessFileLineNumbers "Templates\Templates\3CB\3CBFactions_Logistics_Nodes.sqf"};
if (A3A_has3CBBAF) then {call compile preProcessFileLineNumbers "Templates\Templates\3CB\3CBBAF_Logistics_Nodes.sqf"};
if (A3A_hasVN) then {call compile preProcessFileLineNumbers "Templates\Templates\VN\VN_Logistics_Nodes.sqf"};
if (A3A_hasCUP) then {call compile preProcessFileLineNumbers "Templates\Templates\CUP\CUP_Logistics_Nodes.sqf"};

//if (A3A_hasIFA) then {call compile preProcessFileLineNumbers "Templates\IFA\IFA_Logistics_Nodes.sqf"};		//disabled until imtegrated
//if (A3A_hasFFAA) then {call compile preProcessFileLineNumbers "Templates\FFAA\FFAA_Logistics_Nodes.sqf"};		//disabled until imtegrated
//if (A3A_hasD3S) then {call compile preProcessFileLineNumbers "Templates\AddonVics\d3s_Logi_Nodes.sqf";};		//disabled until imtegrated
//if (A3A_hasRDS) then {call compile preProcessFileLineNumbers "Templates\AddonVics\rds_Logi_Nodes.sqf";};		//disabled until imtegrated

call A3A_fnc_compileMissionAssets;
