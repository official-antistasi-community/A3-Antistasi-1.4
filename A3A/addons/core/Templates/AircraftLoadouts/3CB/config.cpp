#include "..\..\..\script_component.hpp"

class CfgPatches {
	class ADDON {
		name = COMPONENT_NAME;
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"rhsgref_main_loadorder", "UK3CB_Factions_Vehicles_SUV"};
		skipWhenMissingDependencies = 1;
		author = AUTHOR;
		authors[] = { AUTHORS };
		authorUrl = "";
		VERSION_CONFIG;
	};
};

class A3A {
	class Loadouts
	{
		class CASPlane
		{
			class baseCAS;
			
			class RHS_A10;
			class UK3CB_CW_US_B_EARLY_A10 : RHS_A10{};
			
			class RHS_Su25SM_vvsc;
			class UK3CB_TKA_B_Su25SM_CAS : RHS_Su25SM_vvsc{};
			class UK3CB_LDF_B_Su25SM_CAS : RHS_Su25SM_vvsc{};
			class UK3CB_ADA_I_Su25SM_CAS : RHS_Su25SM_vvsc{};
			class UK3CB_KDF_B_Su25SM_CAS : RHS_Su25SM_vvsc{};
			class UK3CB_CW_SOV_O_LATE_Su25SM_CAS : RHS_Su25SM_vvsc{};
			
			class UK3CB_B_Mystere_HIDF_CAS1 : baseCAS {
				//Pylons
				loadout[] = {"PylonRack_3Rnd_Missile_AGM_02_F","PylonRack_12Rnd_missiles","PylonRack_12Rnd_missiles","PylonRack_3Rnd_Missile_AGM_02_F"};
				//Weapons
				mainGun[] = {"uk3cb_mystere_cannon_30mm"};
				rocketLauncher[] = {"missiles_DAR"};
				missileLauncher[] = {"Missile_AGM_02_Plane_CAS_01_F"};
			};
			class UK3CB_MDF_B_Mystere_CAS1 : UK3CB_B_Mystere_HIDF_CAS1{};
			
			class UK3CB_ADA_B_L39_PYLON : baseCAS {
				//Pylons
				loadout[] = {"PylonRack_7Rnd_Rocket_04_AP_F","PylonRack_3Rnd_LG_scalpel","PylonRack_12Rnd_missiles","PylonWeapon_300Rnd_20mm_shells","PylonRack_12Rnd_missiles","PylonRack_3Rnd_LG_scalpel","PylonRack_7Rnd_Rocket_04_AP_F"};
				//Weapons
				mainGun[] = {"Twin_Cannon_20mm"};
				rocketLauncher[] = {"Rocket_04_AP_Plane_CAS_01_F", "missiles_DAR"};
				missileLauncher[] = {"missiles_SCALPEL"};
			};
			class UK3CB_AAF_B_L39_PYLON : UK3CB_ADA_B_L39_PYLON{};
			class UK3CB_KRG_B_L39_PYLON : UK3CB_ADA_B_L39_PYLON{};
			class UK3CB_LDF_B_L39_PYLON : UK3CB_ADA_B_L39_PYLON{};
			
			class UK3CB_TKA_B_MIG21_AT : baseCAS {
				//Pylons
				loadout[] = {"uk3cb_mag_kh25MA","rhs_mag_b8m1_bd3_umk2a_s8t","rhs_mag_b8m1_bd3_umk2a_s8t","uk3cb_mag_kh25MA"};
				//Weapons
				mainGun[] = {"uk3cb_mig21_GSh23L_23mm"};
				rocketLauncher[] = {"rhs_weap_s8t"};
				missileLauncher[] = {"uk3cb_weap_kh25ma_Launcher"};
			};
			
			class UK3CB_TKA_B_MIG21_AT : baseCAS {
				//Pylons
				loadout[] = {"uk3cb_mag_kh25MA","rhs_mag_b8m1_bd3_umk2a_s8t","rhs_mag_b8m1_bd3_umk2a_s8t","uk3cb_mag_kh25MA"};
				//Weapons
				mainGun[] = {"uk3cb_mig21_GSh23L_23mm"};
				rocketLauncher[] = {"rhs_weap_s8t"};
				missileLauncher[] = {"uk3cb_weap_kh25ma_Launcher"};
			};
			
			class UK3CB_AAF_B_Gripen_G : baseCAS {
				//Pylons
				loadout[] = {"","","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x2","PylonRack_Missile_AGM_02_x2"};
				//Weapons
				mainGun[] = {"weapon_Fighter_Gun20mm_AA"};
				missileLauncher[] = {"weapon_AGM_65Launcher"};
			};
			class UK3CB_AAF_B_Gripen_DG : UK3CB_AAF_B_Gripen_G {};
		};
		class CAPPlane
		{
			class baseCAP;
			class rhs_mig29sm_vvs;
			class UK3CB_TKA_O_MIG29SM : rhs_mig29sm_vvs {};
			class UK3CB_CW_SOV_O_LATE_MIG29S : rhs_mig29sm_vvs {};
			class UK3CB_LDF_B_MIG29SM : rhs_mig29sm_vvs {};
			class UK3CB_KDF_B_MIG29SM : rhs_mig29sm_vvs {};
			class UK3CB_AAF_O_MIG29S : rhs_mig29sm_vvs {};
			
			class UK3CB_ANA_B_L39_PYLON : baseCAP {
				//Pylons
				loadout[] = {"PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_GAA_missiles","PylonWeapon_300Rnd_20mm_shells","PylonRack_1Rnd_GAA_missiles","PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_Missile_AA_04_F"};
			};
			class UK3CB_ADA_B_L39_PYLON : UK3CB_ANA_B_L39_PYLON {};
			class UK3CB_ADA_I_L39_PYLON : UK3CB_ANA_B_L39_PYLON {};
			class UK3CB_TKA_B_L39_PYLON : UK3CB_ANA_B_L39_PYLON {};
			class UK3CB_KRG_B_L39_PYLON : UK3CB_ANA_B_L39_PYLON {};
			class UK3CB_LDF_B_L39_PYLON : UK3CB_ANA_B_L39_PYLON {};
			
			class UK3CB_AAF_B_Gripen_G : baseCAP {
				//Pylons
				loadout[] = {"PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_AMRAAM_C_x2","PylonRack_Missile_AMRAAM_C_x2"};
			};
			class UK3CB_AAF_B_Gripen_DG : UK3CB_AAF_B_Gripen_G {};
			
			class UK3CB_LDF_B_MIG21_AA : baseCAP {
				//Pylons
				loadout[] = {"rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73"};
			};
			class UK3CB_TKA_B_MIG21_AA : UK3CB_LDF_B_MIG21_AA {};
			
			class UK3CB_B_Mystere_HIDF_AA1 : baseCAP {
				//Pylons
				loadout[] = {"PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_Missile_AA_04_F"};
			};
			class UK3CB_MDF_B_Mystere_AA1 : UK3CB_B_Mystere_HIDF_AA1 {};
		};
		class Helicopter
		{

		};
	};
};
