["attributesVehicles", [

    // Weak AA vehicles. Leave threat because they're still dangerous in rebel hands
    ["CUP_O_ZSU23_SLA", ["cost", 70]],

    // BMPs a bit better than APC but not Bradley level
    ["CUP_O_BMP2_SLA", ["cost", 120], ["threat", 150]],
    ["CUP_O_BTR60_SLA", ["cost", 120], ["threat", 150]],

    // This one is quite strong by light-armed standards
    ["CUP_O_GAZ_Vodnik_AGS_RU", ["cost", 75], ["threat", 120]],

    // Trash planes
    ["CUP_O_AN2_TK", ["cost", 150]],

    // Attack helis
    ["CUP_O_Mi24_P_Dynamic_RU", ["cost", 300]],
    ["CUP_O_Mi24_V_Dynamic_RU", ["cost", 300]],
    ["CUP_O_Mi8_medevac_RU", ["cost", 250]],
    ["CUP_O_Mi8_RU", ["cost", 300]]

]] call _fnc_saveToTemplate;