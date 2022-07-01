["vehicleAttributes", [
    // Trash light helis
    ["RHS_UH1Y_d", ["cost", 140]],          // rockets + door miniguns
    ["RHS_UH1Y_d_GS", ["cost", 150]],       // more rockets
    ["RHS_UH1Y", ["cost", 140]],            // rockets + door miniguns
    ["RHS_UH1Y_GS", ["cost", 150]],         // more rockets
    ["RHS_MELB_AH6M", ["cost", 100]],
    ["RHS_MELB_AH6M_M", ["cost", 100]],
    ["RHS_MELB_AH6M_H", ["cost", 150]],     // has 2x Hellfire

    // Lunchboxes, exposed gunner, fragile
    ["rhsusf_m113d_usarmy", ["cost", 60]],
    ["rhsusf_m113d_usarmy_M240", ["cost", 50]],
    ["rhsusf_m113d_usarmy_MK19", ["cost", 70]],
    ["rhsusf_m113_usarmy", ["cost", 60]],
    ["rhsusf_m113_usarmy_M240", ["cost", 50]],
    ["rhsusf_m113_usarmy_MK19", ["cost", 70]],

    // Bradleys
    ["RHS_M2A2", ["cost", 130], ["threat", 200]],
    ["RHS_M2A3", ["cost", 130], ["threat", 200]],
    ["RHS_M2A2_BUSKI", ["cost", 160], ["threat", 250]],
    ["RHS_M2A3_BUSKI", ["cost", 160], ["threat", 250]],
    ["RHS_M2A3_BUSKIII", ["cost", 190], ["threat", 300]],

    // woodland camo
    ["RHS_M2A2_wd", ["cost", 130], ["threat", 200]],
    ["RHS_M2A3_wd", ["cost", 130], ["threat", 200]],
    ["RHS_M2A2_BUSKI_WD", ["cost", 160], ["threat", 250]],
    ["RHS_M2A3_BUSKI_wd", ["cost", 160], ["threat", 250]],
    ["RHS_M2A3_BUSKIII_wd", ["cost", 190], ["threat", 300]],

    // Russian attack helis
    ["RHS_Mi24P_vvsc", ["cost", 200]],      // no ball turret, not many missiles
    ["RHS_Ka52_vvs", ["cost", 240]],        // no ball turret but lots of missiles
    ["RHS_Mi8MTV3_vdv", ["cost", 140]],     // just rockets and PKTs
    ["RHS_Mi8MTV3_heavy_vdv", ["cost", 150]],        // more rockets
    ["rhsgref_cdf_b_reg_Mi17Sh", ["cost", 150]],

    // CDF trash planes
    ["rhs_l159_cdf_b_CDF", ["cost", 200]],
    ["rhs_l159_cdf_b_CDF_CAP", ["cost", 200]],

    // BTRs, fragile
    ["rhs_btr80_msv", ["cost", 60]],
    ["rhs_btr80a_msv", ["cost", 60]],
    ["rhs_btr80_vdv", ["cost", 60]],
    ["rhsgref_cdf_b_btr60", ["cost", 60]],
    ["rhsgref_cdf_b_btr70", ["cost", 60]],
    ["rhsgref_cdf_b_btr80", ["cost", 60]]
]] call _fnc_saveToTemplate;
