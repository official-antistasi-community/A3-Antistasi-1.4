["attributesVehicles", [

    // CUP/GM IFVs are all too fragile to get the full value
    ["CUP_O_BMP3_RU", ["cost", 120], ["threat", 150]],
    ["CUP_O_BMP2_RU", ["cost", 120], ["threat", 150]],
    ["gm_gc_army_bmp1sp2", ["cost", 120], ["threat", 150]],
    ["gm_ge_army_marder1a1plus", ["cost", 120], ["threat", 150]],
    ["gm_ge_army_marder1a1a", ["cost", 120], ["threat", 150]],
    ["gm_ge_army_marder1a2", ["cost", 120], ["threat", 150]],
    ["CUP_B_M2Bradley_USA_W", ["cost", 120], ["threat", 150]],

    // Autocannons in light-armed
    ["CUP_O_GAZ_Vodnik_BPPU_RU", ["cost", 75], ["threat", 120]],
    ["gm_ge_army_luchsa1", ["cost", 75], ["threat", 120]],
    ["gm_ge_army_luchsa2", ["cost", 75], ["threat", 120]],

    // Fragile tanks
    ["gm_dk_army_m113a2dk", ["cost", 120], ["threat", 150]],
    ["gm_ge_army_Leopard1a1", ["cost", 170], ["threat", 230]],
    ["gm_ge_army_Leopard1a1a1", ["cost", 170], ["threat", 230]],
    ["gm_ge_army_Leopard1a1a2", ["cost", 170], ["threat", 230]],
    ["gm_ge_army_Leopard1a3", ["cost", 170], ["threat", 230]],
    ["gm_ge_army_Leopard1a3a1", ["cost", 170], ["threat", 230]],
    ["gm_ge_army_Leopard1a5", ["cost", 170], ["threat", 230]]

]] call _fnc_saveToTemplate;
