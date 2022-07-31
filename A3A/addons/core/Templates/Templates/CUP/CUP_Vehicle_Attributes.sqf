["vehicleAttributes", [

    // Weak AA vehicles. Leave threat because they're still dangerous in rebel hands
    ["CUP_B_nM1097_AVENGER_USA_DES", ["cost", 70]],
    ["CUP_B_nM1097_AVENGER_USA_WDL", ["cost", 70]],
    ["CUP_B_M163_Vulcan_USA", ["cost", 100]],
    ["CUP_I_M163_Vulcan_RACS", ["cost", 100]],

    // IFVs with bonus armour
    ["CUP_B_FV510_GB_D_SLAT", ["cost", 170]],
    ["CUP_B_FV510_GB_W_SLAT", ["cost", 170]],
    ["CUP_B_MCV80_GB_D_SLAT", ["cost", 170]],
    ["CUP_B_MCV80_GB_W_SLAT", ["cost", 170]],
    ["CUP_B_M2A3Bradley_USA_D", ["cost", 180], ["threat", 230]],
    ["CUP_B_M2A3Bradley_USA_W", ["cost", 180], ["threat", 230]],        // also has TOW

    // BMPs a bit better than APC but not Bradley level
    ["CUP_O_BMP3_RU", ["cost", 120], ["threat", 150]],
    ["CUP_O_BMP2_RU", ["cost", 120], ["threat", 150]],
    ["CUP_O_BMP2_SLA", ["cost", 120], ["threat", 150]],
    ["CUP_O_BMP2_TKA", ["cost", 120], ["threat", 150]],
    ["CUP_B_BMP2_CZ", ["cost", 120], ["threat", 150]],
    ["CUP_B_BMP2_CZ_Des", ["cost", 120], ["threat", 150]],
    ["CUP_B_BMP2_CDF", ["cost", 120], ["threat", 150]],

    // This one is quite strong by light-armed standards
    ["CUP_O_GAZ_Vodnik_BPPU_RU", ["cost", 75], ["threat", 120]],

    // Tank destroyer strykers, not tough
    ["CUP_B_M1128_MGS_Woodland", ["cost", 120], ["threat", 180]],
    ["CUP_B_M1128_MGS_Desert", ["cost", 120], ["threat", 180]],

    // Trash planes
    ["CUP_B_L39_CZ", ["cost", 150]],
    ["CUP_O_L39_TK", ["cost", 150]],

    // Attack helis
//    ["CUP_O_UH1H_armed_TKA", ["cost", 100]],         // few rockets plus door PKs
//   ["CUP_I_AH6J_RACS", ["cost", 100]],              // few rockets plus fixed miniguns
//    ["CUP_O_Ka50_SLA", ["cost", 250]],              // rockets & missiles but fixed cannon
//    ["CUP_O_Ka50_RU", ["cost", 250]],
//    ["CUP_O_Ka52_RU", ["cost", 250]],
    ["CUP_B_AH64D_DL_USA", ["cost", 350]]           // better than the russian stuff
//    ["CUP_B_AH1Z_Dynamic_USMC", ["cost", 300]]

]] call _fnc_saveToTemplate;
