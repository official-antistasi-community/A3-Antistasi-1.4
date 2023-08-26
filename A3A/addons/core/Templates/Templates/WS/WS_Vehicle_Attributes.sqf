["attributesVehicles", [
    // Attack helis with only fixed miniguns
    ["O_Heli_Light_02_dynamicLoadout_F", ["cost", 100]],
    ["O_Heli_Light_02_F", ["cost", 100]],
    ["B_Heli_Light_01_armed_F", ["cost", 100]],
    ["B_Heli_Light_01_dynamicLoadout_F", ["cost", 100]],
    ["I_E_Heli_light_03_dynamicLoadout_F", ["cost", 100]],

    ["B_ION_APC_Wheeled_01_cannon_lxWS", ["cost", 100], ["threat", 120]],
    // AAF trash CAS
    ["I_Plane_Fighter_03_dynamicLoadout_F", ["cost", 200]]

]] call _fnc_saveToTemplate;

//Base cost 20 static AA, AT, Mortars   base Threat 80
//Base cost 20 lightUnarmed             base Threat 
//Base cost 20 trucks                   base Threat 
//Base cost 50 lightArmed               base Threat 60
//Base cost 60 lightAPC                 base Threat 60
//Base cost 100 APC                     base Threat 120
//Base cost 150 AA vic                  base Threat 200
//Base cost 150 Artillery               base Threat 200
//Base cost 150 IFV                     base Threat 200
//Base cost 230 Tanks                   base Threat 300
//Base cost 70 light heli               base Threat 
//Base cost 100 transport heli          base Threat 
//Base cost 130 light attack heli       base Threat 
//Base cost 130 planes transport        base Threat 
//Base cost 250 Plane CAS               base Threat 
//Base cost 250 plane AA                base Threat 
//Base cost 250 attack heli             base Threat 