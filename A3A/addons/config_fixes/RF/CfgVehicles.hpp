//RF - CfgVehicles.hpp

class CfgVehicles
{
    class C_IDAP_Pickup_fuel_rf; // Parent is Pickup_fuel_base_rf
    class C_Pickup_rf;
    class I_G_Pickup_mmg_rf;
    class B_Pickup_comms_rf;
    class B_Pickup_rf;
    class Heli_light_03_base_F;
    class B_Heli_light_03_unarmed_RF;
    class Heli_EC_01_base_RF;

    class a3a_black_Pickup_rf : C_Pickup_rf
    {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\lxRF\vehicles_rf\pickup_01\Data\pickup_01_ext_black_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_adds_white_tank_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_ext2_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_AAT_olive_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_launcher_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_service_black_co.paa"};
    };
    class a3a_black_Pickup_mmg_rf : I_G_Pickup_mmg_rf
    {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\lxRF\vehicles_rf\pickup_01\Data\pickup_01_ext_black_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_adds_white_tank_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_ext2_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_AAT_olive_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_launcher_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_service_black_co.paa"};
    };
    class a3a_civ_Pickup_fuel_rf : C_IDAP_Pickup_fuel_rf
    {
        textureList[] = {"Red",1,"Tan",1,"White",1,"Blue",1,"Gray",1,"Black",1,"Brown",1,"Olive",1,"Orange",1,"Yellow",1};
        hiddenSelectionsTextures[] = {"lxrf\vehicles_rf\pickup_01\data\pickup_01_ext_white_co.paa","lxrf\vehicles_rf\pickup_01\data\pickup_01_adds_black_tank_co.paa","lxrf\vehicles_rf\pickup_01\data\pickup_01_ext2_co.paa","lxrf\vehicles_rf\pickup_01\data\pickup_01_aat_co.paa","lxrf\vehicles_rf\pickup_01\data\pickup_01_launcher_co.paa","lxrf\vehicles_rf\pickup_01\data\pickup_01_service_white_co.paa"};
    };
    class a3a_police_Pickup_comms_rf : B_Pickup_comms_rf
    {
        textureList[] = {};
        hiddenselectionstextures[] = {"\lxRF\vehicles_rf\pickup_01\Data\pickup_01_ext_gendarmerie_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_adds_gendarmerie_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_ext2_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_AAT_olive_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_Launcher_black_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_service_gendarmerie_co.paa"};
    };
    class a3a_police_Pickup_rf : B_Pickup_rf
    {
        textureList[] = {};
        hiddenselectionstextures[] = {"\lxRF\vehicles_rf\pickup_01\Data\pickup_01_ext_gendarmerie_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_adds_gendarmerie_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_ext2_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_AAT_olive_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_Launcher_black_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_service_gendarmerie_co.paa"};
    };
    
    class Heli_light_03_dynamicLoadout_base_F: Heli_light_03_base_F {
        class Components;
    };
    class B_Heli_light_03_dynamicLoadout_RF: Heli_light_03_dynamicLoadout_base_F {
        class Components : Components {
            class TransportPylonsComponent;
        };
    };
    class a3a_Heli_light_03_dynamicLoadout_RF : B_Heli_light_03_dynamicLoadout_RF { // !!!! This is the Navy (Camo) paint by default
       class Components : Components {
            class TransportPylonsComponent : TransportPylonsComponent {
                class Presets {
                    class Default {
                        attachment[] = {"PylonRack_19Rnd_missiles_gray_RF","PylonRack_19Rnd_missiles_gray_RF","PylonRack_19Rnd_missiles_gray_RF","PylonRack_19Rnd_missiles_gray_RF"};
                        displayName = "Default";
                    };
                    class Empty {
                        attachment[] = {};
                        displayName = "Empty";
                    }; // this is why we cant have nice things
                };
                class Pylons {
                    class PylonLeft1 {
                        attachment = "PylonRack_19Rnd_missiles_gray_RF";
                        hardpoints[] = {"DAR","DAGR","B_SHIEKER","UNI_SCALPEL","20MM_TWIN_CANNON","B_ASRRAM_EJECTOR","WEAPON_PODS_RF","B_BOMB_PYLON"};
                        priority = 5;
                        turret[] = {0};
                        UIposition[] = {"0.06 + 0.02",0.4};
                    };
                    class PylonLeft2 {
                        attachment = "PylonRack_19Rnd_missiles_gray_RF";
                        hardpoints[] = {"DAR","DAGR","B_SHIEKER","UNI_SCALPEL","20MM_TWIN_CANNON","B_ASRRAM_EJECTOR","WEAPON_PODS_RF","B_BOMB_PYLON"};
                        priority = 4;
                        turret[] = {0};
                        UIposition[] = {"0.08 + 0.02",0.35};
                    };
                    class PylonRight1 {
                        attachment = "PylonRack_19Rnd_missiles_gray_RF";
                        hardpoints[] = {"DAR","DAGR","B_SHIEKER","UNI_SCALPEL","20MM_TWIN_CANNON","B_ASRRAM_EJECTOR","WEAPON_PODS_RF","B_BOMB_PYLON"};
                        priority = 5;
                        turret[] = {0};
                        UIposition[] = {"0.57 + 0.04",0.35};
                    };
                    class PylonRight2 {
                        attachment = "PylonRack_19Rnd_missiles_gray_RF";
                        hardpoints[] = {"DAR","DAGR","B_SHIEKER","UNI_SCALPEL","20MM_TWIN_CANNON","B_ASRRAM_EJECTOR","WEAPON_PODS_RF","B_BOMB_PYLON"};
                        priority = 4;
                        turret[] = {0};
                        UIposition[] = {"0.59 + 0.04",0.4};
                    };

                };
            };
        };
    };
    class a3a_AAF_Heli_light_03_dynamicLoadout_RF : a3a_Heli_light_03_dynamicLoadout_RF {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\A3\Air_F_EPB\Heli_Light_03\data\Heli_Light_03_base_INDP_CO.paa","\lxRF\air_rf\Heli_Light_03\data\wildcat_addons_INDP_co.paa"};
    };
    class a3a_LDF_Heli_light_03_dynamicLoadout_RF : a3a_Heli_light_03_dynamicLoadout_RF {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\A3\Air_F_Enoch\Heli_Light_03\data\Heli_Light_03_base_EAF_CO.paa","\lxRF\air_rf\Heli_Light_03\data\wildcat_addons_LDF_co.paa"};
    };
    class a3a_black_Heli_light_03_dynamicLoadout_RF : a3a_Heli_light_03_dynamicLoadout_RF {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\lxRF\air_rf\Heli_Light_03\data\Heli_Light_03_base_black_CO.paa","\lxRF\air_rf\Heli_Light_03\data\wildcat_addons_black_co.paa"};
    };
    class a3a_AAF_Heli_light_03_unarmed_RF : B_Heli_light_03_unarmed_RF {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\A3\Air_F_EPB\Heli_Light_03\data\Heli_Light_03_base_INDP_CO.paa","\lxRF\air_rf\Heli_Light_03\data\wildcat_addons_INDP_co.paa"};
    };
    class a3a_black_Heli_light_03_unarmed_RF : B_Heli_light_03_unarmed_RF {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\lxRF\air_rf\Heli_Light_03\data\Heli_Light_03_base_black_CO.paa","\lxRF\air_rf\Heli_Light_03\data\wildcat_addons_black_co.paa"};
    };
    class a3a_green_Heli_light_03_unarmed_RF : B_Heli_light_03_unarmed_RF {
        textureList[] = {};
        hiddenselectionstextures[] = {"\A3\Air_F_EPB\Heli_Light_03\data\Heli_Light_03_base_CO.paa","\lxRF\air_rf\Heli_Light_03\data\wildcat_addons_green_co.paa"};
    };

    class Heli_EC_02_base_RF: Heli_EC_01_base_RF {
        class Components;
    };
    class a3a_Heli_EC_02_RF : Heli_EC_02_base_RF {
        scope = 2
        faction = "IND_F";
        side = 2;
        hiddenSelectionTextures[] = {"\lxRF\air_rf\heli_medium_ec\data\as332_exterior_02_aaf_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_co.paa","#(rgb,1024,1024,1)ui('lxRF_MFDMinimap','lxRF_MFDMinimap')","\lxRF\air_rf\heli_medium_ec\data\as332_adds_02_aaf_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_exterior_02_aaf_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_co.paa"};
        class Components : Components {
            class TransportPylonsComponent {
                uiPicture = "\lxRF\air_rf\heli_medium_ec\data\UI\heli_medium_ec_02_3DEN_CA.paa";
                class Presets {
                    class AT {
                        attachment[] = {"PylonRack_4Rnd_LG_scalpel","PylonRack_4Rnd_LG_scalpel","PylonRack_4Rnd_LG_scalpel","PylonRack_4Rnd_LG_scalpel"};
                        displayName = "AT";
                    };
                    class CAS {
                        attachment[] = {"PylonRack_19Rnd_Rocket_Skyfire","PylonMissile_1Rnd_Bomb_03_F","PylonMissile_1Rnd_Bomb_03_F","PylonRack_19Rnd_Rocket_Skyfire"};
                        displayName = "CAS";
                    };
                    class Default {
                        attachment[] = {"PylonRack_19Rnd_missiles_olive_RF","PylonRack_4Rnd_LG_scalpel","PylonRack_4Rnd_LG_scalpel","PylonRack_19Rnd_missiles_olive_RF"};
                        displayName = "Default";
                    };
                    class Empty {
                        attachment[] = {};
                        displayName = "Empty";  
                    }; // this is why we cant have nice things
                    class HAT {
                        attachment[] = {"PylonRack_4Rnd_LG_scalpel","PylonRack_1Rnd_Missile_AGM_01_F","PylonRack_1Rnd_Missile_AGM_01_F","PylonRack_4Rnd_LG_scalpel"};
                        displayName = "Heavy AT"; 
                    };
                };
                class Pylons {
                    class PylonLeft1 {
                        attachment = "PylonRack_19Rnd_missiles_olive_RF";
                        hardpoints[] = {"DAR","DAGR","B_SHIEKER","UNI_SCALPEL","20MM_TWIN_CANNON","B_ASRRAM_EJECTOR","WEAPON_PODS_RF","B_BOMB_PYLON"};
                        priority = 5;
                        turret[] = {0};
                        UIposition[] = {0.06,0.4};
                    };
                    class PylonLeft2 {
                        attachment = "PylonRack_4Rnd_LG_scalpel";
                        hardpoints[] = {"DAR","DAGR","B_SHIEKER","UNI_SCALPEL","20MM_TWIN_CANNON","B_ASRRAM_EJECTOR","WEAPON_PODS_RF","B_BOMB_PYLON"};
                        priority = 4;
                        turret[] = {0};
                        UIposition[] = {0.08,0.35};
                    };
                    class PylonRight1 {
                        attachment = "PylonRack_19Rnd_missiles_olive_RF";
                        hardpoints[] = {"DAR","DAGR","B_SHIEKER","UNI_SCALPEL","20MM_TWIN_CANNON","B_ASRRAM_EJECTOR","WEAPON_PODS_RF","B_BOMB_PYLON"};
                        priority = 5;
                        mirroredMissilePos = 1;
                        turret[] = {0};
                        UIposition[] = {0.59,0.4};
                    };
                    class PylonRight2 {
                        attachment = "PylonRack_4Rnd_LG_scalpel";
                        hardpoints[] = {"DAR","DAGR","B_SHIEKER","UNI_SCALPEL","20MM_TWIN_CANNON","B_ASRRAM_EJECTOR","WEAPON_PODS_RF","B_BOMB_PYLON"};
                        priority = 4;
                        mirroredMissilePos = 2;
                        turret[] = {0};
                        UIposition[] = {0.57,0.35};
                    };

                };
            };
        };
    };
    class a3a_LDF_Heli_EC_02_RF : a3a_Heli_EC_02_RF {
        factions = "IND_E_F";
        side = 2;
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\lxRF\air_rf\heli_medium_ec\data\as332_exterior_03_ldf_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_co.paa","#(rgb,1024,1024,1)ui('lxRF_MFDMinimap','lxRF_MFDMinimap')","\lxRF\air_rf\heli_medium_ec\data\as332_adds_03_ldf_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_exterior_03_ldf_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_co.paa"};
    };
    class a3a_black_Heli_EC_02_RF : a3a_Heli_EC_02_RF {
        factions = "CIV_F";
        side = 2;
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\lxRF\air_rf\heli_medium_ec\data\as332_exterior_34_dark_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_light_co.paa","#(rgb,1024,1024,1)ui('lxRF_MFDMinimap','lxRF_MFDMinimap')","\lxRF\air_rf\heli_medium_ec\data\as332_adds_34_dark_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_exterior_34_dark_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_light_co.paa"};
    };


};

