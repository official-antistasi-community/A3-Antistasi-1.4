["vehicleAttributes", [
    // Bad "APCs"
    ["CUP_B_BRDM2_CZ_Des", ["cost", 60], ["threat", 100]],
    ["CUP_B_BRDM2_HQ_CZ_Des", ["cost", 50], ["threat", 70]],
    ["CUP_B_BRDM2_CZ", ["cost", 60], ["threat", 100]],
    ["CUP_B_BRDM2_HQ_CZ", ["cost", 50], ["threat", 70]],

    // Weak AA vehicles. Leave threat because they're still dangerous to enemy
    ["CUP_B_nM1097_AVENGER_USA_DES", ["cost", 80]],
    ["CUP_B_nM1097_AVENGER_USA_WDL", ["cost", 80]],

    // Trash light helis
    ["rhsgref_cdf_b_btr80", ["cost", 60]]

]] call _fnc_saveToTemplate;
