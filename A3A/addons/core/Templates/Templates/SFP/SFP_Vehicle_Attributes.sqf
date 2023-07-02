["attributesVehicles", [
    // Light tank
    ["sfp_ikv91", ["cost", 150]],     //Light tank, basically IFV without passenger capacity
    ["sfp_ikv91_snow", ["cost", 150]],     //	-||-
	
	//Trash light armed
    ["sfp_tgb1111_sog_ksp58", ["cost", 20]],    //7.62 MG with limited arc
    ["sfp_tgb16_ksp58", ["cost", 40]],     		//7.62 MG with exposed gunner

	//Light attack helis
    ["sfp_hkp9_rb55", ["cost", 90]], //Carries only TOW missiles, no anti-inf/soft target
	
	//Light attack helis used in lieu of regular attack helis
    ["CUP_B_UH1D_gunship_GER_KSK_Des", ["cost", 150]],
    ["CUP_B_AW159_GB", ["cost", 150]]
]] call _fnc_saveToTemplate;

//Base cost 20 static AA, AT, Mortars
//Base cost 20 lightUnarmed
//Base cost 20 trucks
//Base cost 50 lightArmed
//Base cost 60 lightAPC
//Base cost 100 APC
//Base cost 150 AA vic
//Base cost 150 Artillery
//Base cost 150 IFV
//Base cost 230 Tanks
//Base cost 70 light heli
//Base cost 100 transport heli 
//Base cost 130 light attack heli
//Base cost 130 planes transport
//Base cost 250 Plane CAS
//Base cost 250 plane AA
//Base cost 250 attack heli