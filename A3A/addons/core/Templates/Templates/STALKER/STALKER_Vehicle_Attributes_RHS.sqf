["attributesVehicles", [

    // Weak AA vehicles. Leave threat because they're still dangerous in rebel hands
    ["rhs_Igla_AA_pod_msv", ["cost", 70]],

    // BMPs a bit better than APC but not Bradley level
    ["rhs_bmp2e_msv", ["cost", 120], ["threat", 150]],

    // This one is quite strong by light-armed standards
    ["rhsgref_cdf_b_reg_uaz_dshkm", ["cost", 75], ["threat", 120]],

    // Trash planes
    ["RHS_AN2_B", ["cost", 150]],

    // Attack helis
    ["RHS_Mi8mt_vdv", ["cost", 250]],
    ["RHS_Mi8MTV3_heavy_vdv", ["cost", 300]],
    ["RHS_Mi24V_vdv", ["cost", 300]],
    ["RHS_Ka52_vvsc", ["cost", 300]],
    ["rhs_mi28n_vvs", ["cost", 300]]

]] call _fnc_saveToTemplate;