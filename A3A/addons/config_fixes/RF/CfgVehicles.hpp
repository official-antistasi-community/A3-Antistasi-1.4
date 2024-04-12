//RF - CfgVehicles.hpp

class CfgVehicles
{
    class C_IDAP_Pickup_fuel_rf; // Parent is Pickup_fuel_base_rf
    class C_Pickup_rf;
    class C_Pickup_covered_RF;
    class I_E_Pickup_covered_RF;
    class I_G_Pickup_mmg_rf;
    class I_G_Pickup_hmg_rf;
    class B_Pickup_comms_rf;
    class B_Pickup_rf;
    class I_G_Pickup_rf;
    class Heli_light_03_base_F;
    class B_Heli_light_03_unarmed_RF;
    class Heli_EC_01_base_RF;
    class B_Heli_EC_04_military_RF;
    class B_Heli_EC_03_RF;
    class B_ION_Pickup_aat_RF;

    class a3a_armored_Pickup_RF : I_G_Pickup_RF {
        animationList[] = {"hide_bullbar",0.2,"hide_fuel_tank",1,"hide_snorkel",1,"hide_antenna",1,"hide_trunk_cover",1,"hide_trunk_door",0,"trunk_door_open",0,"hide_armor_window_armor_top",0,"window_armor_hatch_L_rot",1,"window_armor_hatch_R_rot",0,"door_F_L_open",0,"door_F_R_open",0,"door_R_L_open",0,"door_R_R_open",0,"hide_rack",1,"hide_rack_spotlights",1,"hide_frame",1,"hide_sidesteps",0.5};
    };
    class a3a_fia_Pickup_RF : a3a_armored_Pickup_RF {
        textureList[] = {"Guerilla_01",1,"Guerilla_02",1,"Guerilla_03",1,"Guerilla_04",1,"Guerilla_05",1,"Guerilla_06",0.1,"Guerilla_07",0.1,"Guerilla_08",0.1,"Guerilla_09",0.1};
        hiddenSelectionsTextures[] = {"\lxRF\vehicles_rf\pickup_01\Data\pickup_01_ext_fia_02_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_adds_fia_02_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_ext2_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_aat_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_launcher_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_service_fia_02_co.paa"};
    };
    class a3a_ION_Pickup_RF : a3a_armored_Pickup_RF {
        textureList[] = {"ION",1};
        hiddenSelectionsTextures[] = {"\lxRF\vehicles_rf\pickup_01\Data\pickup_01_ext_ion_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_adds_black_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_ext2_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_AAT_olive_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_Launcher_black_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_service_black_co.paa"};
    };
    class a3a_armored_Pickup_mmg_RF : I_G_Pickup_mmg_RF {
        animationList[] = {"hide_trunk_cover",1,"hide_frame_full",1,"hide_bullbar",0.2,"hide_snorkel",1,"hide_antenna",1,"hide_trunk_door",0,"trunk_door_open",0,"hide_armor_window_armor_top",0,"window_armor_hatch_L_rot",1,"window_armor_hatch_R_rot",0,"door_F_L_open",0,"door_F_R_open",0,"door_R_L_open",0,"door_R_R_open",0,"hide_frame",0,"hide_sidesteps",0.5};
    };
    class a3a_fia_Pickup_mmg_RF : a3a_armored_Pickup_mmg_RF {
        textureList[] = {"Guerilla_01",1,"Guerilla_02",1,"Guerilla_03",1,"Guerilla_04",1,"Guerilla_05",1,"Guerilla_06",0.1,"Guerilla_07",0.1,"Guerilla_08",0.1,"Guerilla_09",0.1};
        hiddenSelectionsTextures[] = {"\lxRF\vehicles_rf\pickup_01\Data\pickup_01_ext_fia_02_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_adds_fia_02_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_ext2_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_aat_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_launcher_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_service_fia_02_co.paa"};
    };
    class a3a_ION_Pickup_mmg_RF : a3a_armored_Pickup_mmg_RF {
        textureList[] = {"ION",1};
        hiddenSelectionsTextures[] = {"\lxRF\vehicles_rf\pickup_01\Data\pickup_01_ext_ion_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_adds_black_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_ext2_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_AAT_olive_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_Launcher_black_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_service_black_co.paa"};
    };
    class a3a_armored_Pickup_hmg_RF : I_G_Pickup_hmg_RF {
        animationList[] = {"Hide_Shield",1,"Hide_Rail",1,"hide_bullbar",0.2,"hide_snorkel",1,"hide_antenna",1,"hide_trunk_door",0,"trunk_door_open",0,"hide_armor_window_armor_top",0,"window_armor_hatch_L_rot",1,"window_armor_hatch_R_rot",0,"door_F_L_open",0,"door_F_R_open",0,"door_R_L_open",0,"door_R_R_open",0,"hide_rack",1,"hide_rack_spotlights",1,"hide_frame",0,"hide_sidesteps",0.5};
    };
    class a3a_fia_Pickup_hmg_RF : a3a_armored_Pickup_hmg_RF {
        textureList[] = {"Guerilla_01",1,"Guerilla_02",1,"Guerilla_03",1,"Guerilla_04",1,"Guerilla_05",1,"Guerilla_06",0.1,"Guerilla_07",0.1,"Guerilla_08",0.1,"Guerilla_09",0.1};
        hiddenSelectionsTextures[] = {"\lxRF\vehicles_rf\pickup_01\Data\pickup_01_ext_fia_02_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_adds_fia_02_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_ext2_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_aat_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_launcher_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_service_fia_02_co.paa"};
    };
    class a3a_ION_Pickup_hmg_RF : a3a_armored_Pickup_hmg_RF {
        textureList[] = {"ION",1};
        hiddenSelectionsTextures[] = {"\lxRF\vehicles_rf\pickup_01\Data\pickup_01_ext_ion_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_adds_black_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_ext2_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_AAT_olive_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_Launcher_black_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_service_black_co.paa"};
    };
    class a3a_armored_Pickup_covered_RF : I_E_Pickup_covered_RF {
        animationList[] = {"hide_rack",1,"hide_rack_antenna",1,"hide_frame",1,"hide_frame_full",1,"hide_frame_full_panel",1,"hide_box",0,"hide_box_door",0,"hide_trunk_door",0,"trunk_door_open",0,"box_door_open",0,"hide_police",1,"hide_Services",1,"BeaconsServicesStart",0,"hide_bullbar",0.2,"hide_snorkel",0,"hide_antenna",1,"hide_armor_window_armor_top",0,"window_armor_hatch_L_rot",1,"window_armor_hatch_R_rot",0,"door_F_L_open",0,"door_F_R_open",0,"door_R_L_open",0,"door_R_R_open",0,"hide_rack_spotlights",0,"hide_sidesteps",0.5};
    };
    class a3a_fia_Pickup_covered_RF : a3a_armored_Pickup_covered_RF {
        textureList[] = {"Guerilla_01",1,"Guerilla_02",1,"Guerilla_03",1,"Guerilla_04",1,"Guerilla_05",1,"Guerilla_06",0.1,"Guerilla_07",0.1,"Guerilla_08",0.1,"Guerilla_09",0.1};
        hiddenSelectionsTextures[] = {"\lxRF\vehicles_rf\pickup_01\Data\pickup_01_ext_fia_02_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_adds_fia_02_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_ext2_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_aat_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_launcher_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_service_fia_02_co.paa"};
    };
    class a3a_ION_Pickup_AAT_RF : B_ION_Pickup_aat_RF {
        animationList[] = {"hide_frame",0,"hide_frame_full",1,"hide_bullbar",0,"hide_snorkel",0,"hide_antenna",1,"hide_trunk_door",0,"trunk_door_open",0,"hide_armor_window_armor_top",0,"window_armor_hatch_L_rot",1,"window_armor_hatch_R_rot",0,"door_F_L_open",0,"door_F_R_open",0,"door_R_L_open",0,"door_R_R_open",0,"hide_rack",0,"hide_rack_spotlights",0,"hide_sidesteps",0};
    };
    class a3a_black_Pickup_rf : a3a_fia_Pickup_RF
    {
        textureList[] = {"Black",1};
        hiddenSelectionsTextures[] = {"\lxRF\vehicles_rf\pickup_01\Data\pickup_01_ext_black_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_adds_white_tank_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_ext2_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_AAT_olive_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_launcher_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_service_black_co.paa"};
    };
    class a3a_black_Pickup_mmg_rf : a3a_fia_Pickup_mmg_RF
    {
        textureList[] = {"Black",1};
        hiddenSelectionsTextures[] = {"\lxRF\vehicles_rf\pickup_01\Data\pickup_01_ext_black_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_adds_white_tank_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_ext2_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_AAT_olive_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_launcher_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_service_black_co.paa"};
    };
    class a3a_black_Pickup_hmg_rf : a3a_fia_Pickup_hmg_RF
    {
        textureList[] = {"Black",1};
        hiddenSelectionsTextures[] = {"\lxRF\vehicles_rf\pickup_01\Data\pickup_01_ext_black_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_adds_white_tank_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_ext2_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_AAT_olive_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_launcher_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_service_black_co.paa"};
    };
    class a3a_black_Pickup_covered_rf : a3a_fia_Pickup_covered_RF
    {
        textureList[] = {"Black",1};
        hiddenSelectionsTextures[] = {"\lxRF\vehicles_rf\pickup_01\Data\pickup_01_ext_black_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_adds_white_tank_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_ext2_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_AAT_olive_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_launcher_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_service_black_co.paa"};
    };
    class a3a_LDF_Pickup_mmg_rf : I_G_Pickup_mmg_rf
    {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\lxRF\vehicles_rf\pickup_01\Data\pickup_01_ext_ldf_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_adds_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_ext2_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_AAT_olive_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_launcher_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_service_ldf_co.paa"};
    };
    class a3a_hex_Pickup_mmg_rf : I_G_Pickup_mmg_rf
    {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\lxRF\vehicles_rf\pickup_01\Data\pickup_01_ext_csat_hex_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_adds_csat_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_ext2_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_aat_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_Launcher_tan_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_service_csat_hex_co.paa"};
    };
    class a3a_ghex_Pickup_mmg_rf : I_G_Pickup_mmg_rf
    {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\lxRF\vehicles_rf\pickup_01\Data\pickup_01_ext_csat_ghex_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_adds_nato_pacific_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_ext2_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_AAT_olive_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_launcher_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_service_csat_ghex_co.paa"};
    };
    class a3a_civ_Pickup_fuel_rf : C_IDAP_Pickup_fuel_rf
    {
        textureList[] = {"Red",1,"Tan",1,"White",1,"Blue",1,"Gray",1,"Black",1,"Brown",1,"Olive",1,"Orange",1,"Yellow",1};
        hiddenSelectionsTextures[] = {"lxrf\vehicles_rf\pickup_01\data\pickup_01_ext_white_co.paa","lxrf\vehicles_rf\pickup_01\data\pickup_01_adds_black_tank_co.paa","lxrf\vehicles_rf\pickup_01\data\pickup_01_ext2_co.paa","lxrf\vehicles_rf\pickup_01\data\pickup_01_aat_co.paa","lxrf\vehicles_rf\pickup_01\data\pickup_01_launcher_co.paa","lxrf\vehicles_rf\pickup_01\data\pickup_01_service_white_co.paa"};
    };
    class a3a_police_Pickup_comms_rf : B_Pickup_comms_rf
    {
        textureList[] = {};
        hiddenSelectionstextures[] = {"\lxRF\vehicles_rf\pickup_01\Data\pickup_01_ext_gendarmerie_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_adds_gendarmerie_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_ext2_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_AAT_olive_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_Launcher_black_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_service_gendarmerie_co.paa"};
    };
    class a3a_police_Pickup_rf : B_Pickup_rf
    {
        textureList[] = {};
        hiddenSelectionstextures[] = {"\lxRF\vehicles_rf\pickup_01\Data\pickup_01_ext_gendarmerie_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_adds_gendarmerie_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_ext2_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_AAT_olive_co.paa","\lxrf\vehicles_rf\pickup_01\data\pickup_01_Launcher_black_co.paa","\lxRF\vehicles_rf\pickup_01\Data\pickup_01_service_gendarmerie_co.paa"};
    };
    
    class Heli_light_03_dynamicLoadout_base_F: Heli_light_03_base_F {
        class Components;
    };
    class B_Heli_light_03_dynamicLoadout_RF: Heli_light_03_dynamicLoadout_base_F {
        class Components : Components {
            class TransportPylonsComponent;
        };
    };
    class a3a_Heli_light_03_dynamicLoadout_RF : B_Heli_light_03_dynamicLoadout_RF { // !!!! This is the Olive paint by default. It's more of a bluish-gray though
       class Components : Components {
            class TransportPylonsComponent : TransportPylonsComponent {
                class Presets {
                    class Default {
                        attachment[] = {"PylonRack_19Rnd_missiles_gray_RF","PylonWeapon_1000Rnd_20x102mm_shells_gray_RF","PylonRack_19Rnd_missiles_gray_RF","PylonWeapon_1000Rnd_20x102mm_shells_gray_RF"};
                        displayName = "Default";
                    };
                    class Empty {
                        attachment[] = {};
                        displayName = "Empty";
                    };
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
                        attachment = "PylonWeapon_1000Rnd_20x102mm_shells_gray_RF";
                        hardpoints[] = {"DAR","DAGR","B_SHIEKER","UNI_SCALPEL","20MM_TWIN_CANNON","B_ASRRAM_EJECTOR","WEAPON_PODS_RF","B_BOMB_PYLON"};
                        priority = 4;
                        turret[] = {0};
                        UIposition[] = {"0.08 + 0.02",0.35};
                    };
                    class PylonRight1 {
                        attachment = "PylonRack_19Rnd_missiles_gray_RF";
                        hardpoints[] = {"DAR","DAGR","B_SHIEKER","UNI_SCALPEL","20MM_TWIN_CANNON","B_ASRRAM_EJECTOR","WEAPON_PODS_RF","B_BOMB_PYLON"};
                        priority = 5;
                        mirroredMissilePos = 1;
                        turret[] = {0};
                        UIposition[] = {"0.59 + 0.04",0.4};
                    };
                    class PylonRight2 {
                        attachment = "PylonWeapon_1000Rnd_20x102mm_shells_gray_RF";
                        hardpoints[] = {"DAR","DAGR","B_SHIEKER","UNI_SCALPEL","20MM_TWIN_CANNON","B_ASRRAM_EJECTOR","WEAPON_PODS_RF","B_BOMB_PYLON"};
                        priority = 4;
                        mirroredMissilePos = 2;
                        turret[] = {0};
                        UIposition[] = {"0.57 + 0.04",0.35};
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
    class a3a_tan_Heli_light_03_dynamicLoadout_RF : a3a_Heli_light_03_dynamicLoadout_RF {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\lxRF\air_rf\Heli_Light_03\data\Heli_Light_03_base_tan_CO.paa","\lxRF\air_rf\Heli_Light_03\data\wildcat_addons_tan_co.paa"};
    };
    class a3a_green_Heli_light_03_dynamicLoadout_RF : a3a_Heli_light_03_dynamicLoadout_RF {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\A3\Air_F_EPB\Heli_Light_03\data\Heli_Light_03_base_CO.paa","\lxRF\air_rf\Heli_Light_03\data\wildcat_addons_green_co.paa"};
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
        hiddenSelectionsTextures[] = {"\A3\Air_F_EPB\Heli_Light_03\data\Heli_Light_03_base_CO.paa","\lxRF\air_rf\Heli_Light_03\data\wildcat_addons_green_co.paa"};
    };
    class a3a_tan_Heli_light_03_unarmed_RF : B_Heli_light_03_unarmed_RF {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\lxRF\air_rf\Heli_Light_03\data\Heli_Light_03_base_tan_CO.paa","\lxRF\air_rf\Heli_Light_03\data\wildcat_addons_tan_co.paa"};
    };

    class Heli_EC_02_base_RF: Heli_EC_01_base_RF {
        class Components;
    };
    class a3a_Heli_EC_02_RF : Heli_EC_02_base_RF { // Default camo is a lovely tan, perfect for patrolling your local desert
        scope = 2;
        faction = "IND_F";
        side = 2;
        hiddenSelectionsTextures[] = {"\lxRF\air_rf\heli_medium_ec\data\as332_exterior_09_tan_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_co.paa","#(rgb,1024,1024,1)ui('lxRF_MFDMinimap','lxRF_MFDMinimap')","\lxRF\air_rf\heli_medium_ec\data\as332_adds_09_tan_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_exterior_09_tan_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_co.paa"};
        class Components : Components {
            class TransportPylonsComponent {
                uiPicture = "\lxRF\air_rf\heli_medium_ec\data\UI\heli_medium_ec_02_3DEN_CA.paa";
                class Presets {
                    class AT {
                        attachment[] = {"PylonRack_4Rnd_LG_scalpel","PylonRack_4Rnd_LG_scalpel","PylonRack_4Rnd_LG_scalpel","PylonRack_4Rnd_LG_scalpel"};
                        displayName = "AT";
                    };
                    class Default {
                        attachment[] = {"PylonRack_19Rnd_missiles_olive_RF","PylonRack_4Rnd_LG_scalpel","PylonRack_4Rnd_LG_scalpel","PylonRack_19Rnd_missiles_olive_RF"};
                        displayName = "Default";
                    };
                    class Empty {
                        attachment[] = {};
                        displayName = "Empty";  
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
                        attachment = "PylonRack_4Rnd_LG_scalpel";
                        hardpoints[] = {"DAR","DAGR","B_SHIEKER","UNI_SCALPEL","20MM_TWIN_CANNON","B_ASRRAM_EJECTOR","WEAPON_PODS_RF","B_BOMB_PYLON"};
                        priority = 5;
                        mirroredMissilePos = 2;
                        turret[] = {0};
                        UIposition[] = {0.57,0.35};
                    };
                    class PylonRight2 {
                        attachment = "PylonRack_19Rnd_missiles_olive_RF";
                        hardpoints[] = {"DAR","DAGR","B_SHIEKER","UNI_SCALPEL","20MM_TWIN_CANNON","B_ASRRAM_EJECTOR","WEAPON_PODS_RF","B_BOMB_PYLON"};
                        priority = 4;
                        mirroredMissilePos = 1;
                        turret[] = {0};
                        UIposition[] = {0.59,0.4};
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
    class a3a_AAF_Heli_EC_02_RF : a3a_Heli_EC_02_RF {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\lxRF\air_rf\heli_medium_ec\data\as332_exterior_02_aaf_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_co.paa","#(rgb,1024,1024,1)ui('lxRF_MFDMinimap','lxRF_MFDMinimap')","\lxRF\air_rf\heli_medium_ec\data\as332_adds_02_aaf_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_exterior_02_aaf_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_co.paa"};
    };
    class a3a_black_Heli_EC_02_RF : a3a_Heli_EC_02_RF {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\lxRF\air_rf\heli_medium_ec\data\as332_exterior_34_dark_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_light_co.paa","#(rgb,1024,1024,1)ui('lxRF_MFDMinimap','lxRF_MFDMinimap')","\lxRF\air_rf\heli_medium_ec\data\as332_adds_34_dark_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_exterior_34_dark_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_light_co.paa"};
    };
    class a3a_sfia_Heli_EC_02_RF : a3a_Heli_EC_02_RF {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\lxRF\air_rf\heli_medium_ec\data\as332_exterior_01_sfia_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_co.paa","#(rgb,1024,1024,1)ui('lxRF_MFDMinimap','lxRF_MFDMinimap')","\lxRF\air_rf\heli_medium_ec\data\as332_adds_01_sfia_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_exterior_01_sfia_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_co.paa"};
    };
    class a3a_tan_Heli_EC_04_military_RF : B_Heli_EC_04_military_RF {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\lxRF\air_rf\heli_medium_ec\data\as332_exterior_09_tan_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_co.paa","#(rgb,1024,1024,1)ui('lxRF_MFDMinimap','lxRF_MFDMinimap')","\lxRF\air_rf\heli_medium_ec\data\as332_adds_09_tan_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_exterior_09_tan_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_co.paa"};
    };
    class a3a_tan_Heli_EC_03_RF : B_Heli_EC_03_RF {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\lxRF\air_rf\heli_medium_ec\data\as332_exterior_09_tan_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_co.paa","#(rgb,1024,1024,1)ui('lxRF_MFDMinimap','lxRF_MFDMinimap')","\lxRF\air_rf\heli_medium_ec\data\as332_adds_09_tan_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_exterior_09_tan_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_co.paa"};
    };
    class a3a_ION_Heli_EC_04_military_RF : B_Heli_EC_04_military_RF {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\lxRF\air_rf\heli_medium_ec\data\as332_exterior_06_ion_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_co.paa","#(rgb,1024,1024,1)ui('lxRF_MFDMinimap','lxRF_MFDMinimap')","\lxRF\air_rf\heli_medium_ec\data\as332_adds_06_ion_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_exterior_06_ion_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_co.paa"};
    };
    class a3a_ION_Heli_EC_03_RF : B_Heli_EC_03_RF {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\lxRF\air_rf\heli_medium_ec\data\as332_exterior_06_ion_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_co.paa","#(rgb,1024,1024,1)ui('lxRF_MFDMinimap','lxRF_MFDMinimap')","\lxRF\air_rf\heli_medium_ec\data\as332_adds_06_ion_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_exterior_06_ion_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_co.paa"};
    };
    class a3a_ION_Heli_EC_02_RF : a3a_Heli_EC_02_RF {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"\lxRF\air_rf\heli_medium_ec\data\as332_exterior_06_ion_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_co.paa","#(rgb,1024,1024,1)ui('lxRF_MFDMinimap','lxRF_MFDMinimap')","\lxRF\air_rf\heli_medium_ec\data\as332_adds_06_ion_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_exterior_06_ion_co.paa","\lxRF\air_rf\heli_medium_ec\data\as332_int_cargo_co.paa"};
    };

};