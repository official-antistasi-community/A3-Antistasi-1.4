
SDKMortar = "rhsgref_UN_B_2b14_82mm";
SDKMortarHEMag = "rhs_mag_3vo18_10";
SDKMortarSmokeMag = "rhs_mag_d832du_10";
SDKMGStatic = "UK3CB_UN_B_NSV";
staticATteamPlayer = "UK3CB_UN_B_SPG9";
staticAAteamPlayer = "UK3CB_UN_B_ZU23";

staticCrewTeamPlayer = "UK3CB_UN_B_FIELD_OP";
SDKUnarmed = "UK3CB_UN_B_FIELD_OP";
SDKSniper = ["UK3CB_UN_B_MK","UK3CB_UN_B_MK"];
SDKATman = ["UK3CB_UN_B_AT","UK3CB_UN_B_AT"];
SDKMedic = ["UK3CB_UN_B_MD","UK3CB_UN_B_MD"];
SDKMG = ["UK3CB_UN_B_AR","UK3CB_UN_B_MG"];
SDKExp = ["UK3CB_UN_B_DEM","UK3CB_UN_B_DEM"];
SDKGL = ["UK3CB_UN_B_GL","UK3CB_UN_B_GL"];
SDKMil = ["UK3CB_UN_B_RIF_1","UK3CB_UN_B_RIF_2"];
SDKSL = ["UK3CB_UN_B_TL","UK3CB_UN_B_SL"];
SDKEng = ["UK3CB_UN_B_ENG","UK3CB_UN_B_ENG"];

vehSDKBike = "UK3CB_UN_B_UAZ_Closed";
vehSDKLightArmed = "UK3CB_UN_B_Hilux_Pkm";
vehSDKAT = "UK3CB_UN_B_LR_SPG9";
vehSDKLightUnarmed = "UK3CB_CCM_I_Hilux_Closed";
vehSDKTruck = "UK3CB_UN_B_V3S_Closed";
//vehSDKHeli = "rhsgref_ins_g_Mi8amt";
vehSDKPlane = "UK3CB_UN_B_C130J";
vehSDKBoat = "I_C_Boat_Transport_01_F";
vehSDKRepair = "UK3CB_UN_B_V3S_Repair";
SDKFlag = "Flag_CCM_B";
SDKFlagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_CCM\Flag\ccm_i_flag_co.paa";
typePetros = "UK3CB_UN_B_OFF";

supportStaticSDKB = "RHS_SPG9_Tripod_Bag";
ATStaticSDKB = "RHS_SPG9_Gun_Bag";
MGStaticSDKB = "RHS_DShkM_Gun_Bag";
supportStaticsSDKB2 = "RHS_DShkM_TripodHigh_Bag";
AAStaticSDKB = "I_AA_01_weapon_F";
MortStaticSDKB = "RHS_Podnos_Gun_Bag";
supportStaticsSDKB3 = "RHS_Podnos_Bipod_Bag";

civCar = "UK3CB_CHC_C_Ikarus";
civTruck = "UK3CB_CHC_C_V3S_Recovery";
civHeli = "UK3CB_UN_B_UH1H_MED";
civBoat = "C_Rubberboat";

arrayCivVeh = ["UK3CB_CHC_C_Datsun_Civ_Closed","UK3CB_CHC_C_Datsun_Civ_Open","UK3CB_CHC_C_Gaz24","UK3CB_CHC_C_Golf","UK3CB_CHC_C_Hatchback","UK3CB_CHC_C_Hilux_Civ_Open","UK3CB_CHC_C_Hilux_Civ_Closed","UK3CB_CHC_C_Ikarus","UK3CB_CHC_C_Kamaz_Covered","UK3CB_CHC_C_Kamaz_Fuel","UK3CB_CHC_C_Kamaz_Open","UK3CB_CHC_C_Kamaz_Repair","UK3CB_CHC_C_Lada","UK3CB_CHC_C_LR_Open","UK3CB_CHC_C_LR_Closed","UK3CB_CHC_C_S1203","UK3CB_CHC_C_S1203_Amb","UK3CB_CHC_C_Sedan","UK3CB_CHC_C_Skoda","UK3CB_CHC_C_Tractor","UK3CB_CHC_C_Tractor_Old","UK3CB_CHC_C_UAZ_Closed","UK3CB_CHC_C_UAZ_Open","UK3CB_CHC_C_Ural","UK3CB_CHC_C_Ural_Open","UK3CB_CHC_C_Ural_Fuel","UK3CB_CHC_C_Ural_Empty","UK3CB_CHC_C_Ural_Repair","UK3CB_CHC_C_V3S_Open","UK3CB_CHC_C_V3S_Closed","UK3CB_CHC_C_V3S_Recovery","UK3CB_CHC_C_V3S_Refuel","UK3CB_CHC_C_V3S_Repair"];

sniperRifle = "UK3CB_M16A2";
lampsSDK = ["rhs_acc_2dpZenit","acc_flashlight"];

ATMineMag = "rhs_mine_tm62m_mag";
APERSMineMag = "rhs_mine_pmn2_mag";

if (gameMode != 4) then
  {
    FIARifleman = "UK3CB_TKP_I_RIF_1";
    FIAMarksman = "UK3CB_TKP_I_MK";
    vehFIAArmedCar = "UK3CB_TKP_I_Datsun_Pickup_PKM";
    vehFIATruck = "UK3CB_TKP_I_Hilux_Ipen";
    vehFIACar = "UK3CB_TKP_I_Lada_Police";

    groupsFIASmall = [["UK3CB_TKP_I_STATIC_GUN_NSV","UK3CB_TKP_I_STATIC_TRI_NSV"],["UK3CB_TKP_I_AT","UK3CB_TKP_I_RIF_2"],["UK3CB_TKP_I_IFF","UK3CB_TKP_I_MK"]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
    groupsFIAMid = [["UK3CB_TKP_I_QRF_SL","UK3CB_TKP_I_QRF_MK","UK3CB_TKP_I_QRF_AR","UK3CB_TKP_I_QRF_ENG"],["UK3CB_TKP_I_QRF_TL","UK3CB_TKP_I_QRF_AR","UK3CB_TKP_I_QRF_RIF_1","UK3CB_TKP_I_QRF_AT"],["UK3CB_TKP_I_QRF_TL","UK3CB_TKP_I_QRF_ENG","UK3CB_TKP_I_QRF_AR","UK3CB_TKP_I_QRF_AT"]];
    FIASquad = ["UK3CB_TKP_I_CIB_SL","UUK3CB_TKP_I_CIB_RIF_2","UK3CB_TKP_I_CIB_AT","UK3CB_TKP_I_CIB_MD","UK3CB_TKP_I_CIB_TL","UK3CB_TKP_I_CIB_AR","UK3CB_TKP_I_CIB_RIF_1","UK3CB_TKP_I_CIB_ENG"];//"IRG_InfSquad";///
    groupsFIASquad = [FIASquad];
    factionFIA = "UK3CB_TKP_I";
  }
else
  {
  FIARifleman = "UK3CB_TKP_O_RIF_1";
  FIAMarksman = "UK3CB_TKP_O_MK";
  vehFIAArmedCar = "UK3CB_TKP_O_Datsun_Pickup_PKM";
  vehFIATruck = "UK3CB_TKP_O_Hilux_Open";
  vehFIACar = "UK3CB_TKP_O_Lada_Police";

  groupsFIASmall = [["UK3CB_TKP_O_STATIC_GUN_NSV","UK3CB_TKP_O_STATIC_TRI_NSV"],["UK3CB_TKP_O_AT","UK3CB_TKP_O_RIF_2"],["UK3CB_TKP_O_OFF","UK3CB_TKP_O_MK"]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
  groupsFIAMid = [["UK3CB_TKP_O_QRF_SL","UK3CB_TKP_O_QRF_MK","UK3CB_TKP_O_QRF_AR","UK3CB_TKP_O_QRF_ENG"],["UK3CB_TKP_O_QRF_TL","UK3CB_TKP_O_QRF_AR","UK3CB_TKP_O_QRF_RIF_1","UK3CB_TKP_O_QRF_AT"],["UK3CB_TKP_O_QRF_TL","UK3CB_TKP_O_QRF_ENG","UK3CB_TKP_O_QRF_AR","UK3CB_TKP_O_QRF_AT"]];
  FIASquad = ["UK3CB_TKP_O_CIB_SL","UUK3CB_TKP_O_CIB_RIF_2","UK3CB_TKP_O_CIB_AT","UK3CB_TKP_O_CIB_MD","UK3CB_TKP_O_CIB_TL","UK3CB_TKP_O_CIB_AR","UK3CB_TKP_O_CIB_RIF_1","UK3CB_TKP_O_CIB_ENG"];//"IRG_InfSquad";///
  groupsFIASquad = [FIASquad];
  factionFIA = "UK3CB_TKP_O";
  };

vehPoliceCar = "UK3CB_TKP_O_Lada_Police";
policeOfficer = "UK3CB_TKP_O_TL";
policeGrunt = "UK3CB_TKP_O_RIF_2";
groupsNATOGen = [policeOfficer,policeGrunt];
nameTeamPlayer = "UN";

factionGEN = "BLU_GEN_F";
