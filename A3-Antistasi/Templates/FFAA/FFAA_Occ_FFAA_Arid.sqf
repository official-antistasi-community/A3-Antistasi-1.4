////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
//Name Used for notifications
nameOccupants = "FFAA";

//Police Faction
factionGEN = "";
//SF Faction
factionMaleOccupants = "";
//Miltia Faction
if (gameMode != 4) then {factionFIA = ""};

//Flag Images
NATOFlag = "ffaa_bandera_espa";
NATOFlagTexture = "ffaa_data\bandera\flag_espana_co.paa";
flagNATOmrk = "flag_Spain";
if (isServer) then {"NATO_carrier" setMarkerText "Juan Carlos I"};

//Loot Crate
NATOAmmobox = "B_supplyCrate_F";

///////////////////////////////////
//   PVP LOADOUTS AND VEHICLES   //
///////////////////////////////////
//PvP Loadouts
NATOPlayerLoadouts = [
	//Team Leader
	["Templates\FFAA\Loadouts\FFAA_Occ_MOE_Arid_teamLeader"] call A3A_fnc_getLoadout,
	//Medic
	["Templates\FFAA\Loadouts\FFAA_Occ_MOE_Arid_medic"] call A3A_fnc_getLoadout,
	//Machinegunner
	["Templates\FFAA\Loadouts\FFAA_Occ_MOE_Arid_machineGunner"] call A3A_fnc_getLoadout,
	//Marksman
	["Templates\FFAA\Loadouts\FFAA_Occ_MOE_Arid_marksman"] call A3A_fnc_getLoadout,
	//AT
	["Templates\FFAA\Loadouts\FFAA_Occ_MOE_Arid_AT"] call A3A_fnc_getLoadout,
	//Assistant AT
	["Templates\FFAA\Loadouts\FFAA_Occ_MOE_Arid_AAT"] call A3A_fnc_getLoadout
];

//PVP Player Vehicles
vehNATOPVP = ["ffaa_et_anibal","ffaa_et_vamtac_trans","ffaa_et_vamtac_trans_blind","ffaa_et_lince_mg3","ffaa_et_lince_m2","ffaa_et_vamtac_m2"];

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//Military Units
NATOGrunt = "ffaa_brilat_soldado_ds";
NATOOfficer = "ffaa_brilat_oficial_ds";
NATOOfficer2 = "ffaa_bripac_oficial_ds";
NATOBodyG = "ffaa_et_moe_sl_ds";
NATOCrew = "ffaa_brilat_carrista_ds";
NATOUnarmed = "ffaa_ar_marinero";
NATOMarksman = "ffaa_brilat_tirador_ds";
staticCrewOccupants = "ffaa_brilat_soldado_ds";
NATOPilot = "ffaa_piloto_famet_des";

//Militia Units
if (gameMode != 4) then
	{
	FIARifleman = "ffaa_bripac_soldado_ds";
	FIAMarksman = "ffaa_bripac_tirador_ds";
	};

//Police Units
policeOfficer = "ffaa_ar_fgne_soldado_bk";
policeGrunt = "ffaa_ar_fgne_soldado_bk";

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
//Military Groups
//Teams
groupsNATOSentry = ["ffaa_brilat_granadero_ds","ffaa_brilat_soldado_ds"];
groupsNATOSniper = ["ffaa_brilat_francotirador_accuracy_ds","ffaa_brilat_observador_ds"];
groupsNATOsmall = [groupsNATOSentry,groupsNATOSniper,["ffaa_brilat_nbq_ds","ffaa_brilat_nbq_ds"],["ffaa_brilat_francotirador_barrett_ds","ffaa_brilat_observador_ds"]];
//Fireteams
groupsNATOAA = ["ffaa_brilat_jefe_peloton_ds","ffaa_brilat_mg42_ds","ffaa_brilat_mg42_ds","ffaa_brilat_proveedor_mg42_ds"];
groupsNATOAT = ["ffaa_brilat_jefe_peloton_ds","ffaa_brilat_proveedor_alcotan_ds","ffaa_brilat_c90_ds","ffaa_brilat_c90_ds"];
groupsNATOmid = [["ffaa_brilat_jefe_peloton_ds","ffaa_brilat_operador_UAV_ds","ffaa_brilat_tirador_ds","ffaa_brilat_tirador_ameli_ds"],groupsNATOAA,groupsNATOAT];
//Squads
NATOSquad = ["ffaa_brilat_jefe_escuadra_ds","ffaa_brilat_proveedor_mg4_ds","ffaa_brilat_fusilero_mochila_ds","ffaa_brilat_ingeniero_ds","ffaa_brilat_jefe_peloton_ds","ffaa_brilat_tirador_ds","ffaa_brilat_c90_ds","ffaa_brilat_medico_ds"];
NATOSpecOp = ["ffaa_et_moe_lider_ds","ffaa_et_moe_mg_ds","ffaa_et_moe_lg_ds","ffaa_et_moe_sabot_ds","ffaa_et_moe_sl_ds","ffaa_et_moe_tirador_ds","ffaa_et_moe_at_ds","ffaa_et_moe_medico_ds"];
groupsNATOSquad =
	[
	NATOSquad,
	["ffaa_brilat_jefe_escuadra_ds","ffaa_brilat_proveedor_mg42_ds","ffaa_brilat_fusilero_mochila_ds","ffaa_brilat_ingeniero_ds","ffaa_brilat_jefe_peloton_ds","ffaa_brilat_tirador_ds","ffaa_brilat_c90_ds","ffaa_brilat_medico_ds"],
	["ffaa_brilat_jefe_escuadra_ds","ffaa_brilat_tirador_ameli_ds","ffaa_brilat_fusilero_mochila_ds","ffaa_brilat_ingeniero_ds","ffaa_brilat_jefe_peloton_ds","ffaa_brilat_tirador_ds","ffaa_brilat_c90_ds","ffaa_brilat_medico_ds"],
	["ffaa_brilat_jefe_escuadra_ds","ffaa_brilat_proveedor_mg4_ds","ffaa_brilat_fusilero_mochila_ds","ffaa_brilat_ingeniero_ds","ffaa_brilat_jefe_peloton_ds","ffaa_brilat_tirador_ds","ffaa_brilat_alcotan_ds","ffaa_brilat_medico_ds"]
	];

//Militia Groups
if (gameMode != 4) then
	{
	//Teams
	groupsFIASmall =
		[
		["ffaa_bripac_granadero_ds","ffaa_bripac_soldado_ds"],
		[FIAMarksman,FIARifleman],
		["ffaa_bripac_nbq_ds","ffaa_bripac_nbq_ds"]
		];
	//Fireteams
	groupsFIAMid =
		[
		["ffaa_bripac_jefe_peloton_ds","ffaa_bripac_tirador_ameli_ds","ffaa_bripac_fusilero_mochila_ds","ffaa_bripac_tirador_ds"],
		["ffaa_bripac_jefe_peloton_ds","ffaa_bripac_tirador_ameli_ds","ffaa_bripac_fusilero_mochila_ds","ffaa_bripac_c90_ds"],
		["ffaa_bripac_jefe_peloton_ds","ffaa_bripac_tirador_ameli_ds","ffaa_bripac_fusilero_mochila_ds","ffaa_bripac_ingeniero_ds"]
		];
	//Squads
	FIASquad = ["ffaa_bripac_jefe_escuadra_ds","ffaa_bripac_tirador_ameli_ds","ffaa_bripac_fusilero_mochila_ds","ffaa_bripac_granadero_ds","ffaa_bripac_jefe_peloton_ds","ffaa_bripac_tirador_ds","ffaa_bripac_c90_ds","ffaa_bripac_medico_ds"];
	groupsFIASquad = [FIASquad];
	};

//Police Groups
//Teams
groupsNATOGen = [policeOfficer,policeGrunt];

////////////////////////////////////
//           VEHICLES            ///
////////////////////////////////////
//Military Vehicles
//Lite
vehNATOBike = "B_Quadbike_01_F";
vehNATOLightArmed = ["ffaa_et_lince_mg3","ffaa_et_lince_m2","ffaa_et_lince_lag40","ffaa_et_vamtac_m2","ffaa_et_vamtac_lag40","ffaa_et_vamtac_crows","ffaa_et_vamtac_tow"];
vehNATOLightUnarmed = ["ffaa_et_anibal","ffaa_et_vamtac_trans","ffaa_et_vamtac_trans_blind"];
vehNATOTrucks = ["ffaa_et_pegaso_carga","ffaa_et_pegaso_carga_lona","ffaa_et_m250_carga_blin","ffaa_et_m250_carga_lona_blin"];
vehNATOCargoTrucks = ["ffaa_et_m250_recuperacion_blin"];
vehNATOAmmoTruck = "ffaa_et_pegaso_municion";
vehNATORepairTruck = "ffaa_et_pegaso_repara_municion";
vehNATOLight = vehNATOLightArmed + vehNATOLightUnarmed;
//Armored
vehNATOAPC = ["ffaa_et_rg31_samson","ffaa_et_toa_spike","ffaa_et_toa_zapador","ffaa_et_toa_m2","ffaa_et_pizarro_mauser"];
vehNATOTank = "ffaa_et_leopardo";
vehNATOAA = "ffaa_et_vamtac_mistral";
vehNATOAttack = vehNATOAPC + [vehNATOTank];
//Boats
vehNATOBoat = "ffaa_ar_zodiac_hurricane_long";
vehNATORBoat = "ffaa_ar_supercat";
vehNATOBoats = [vehNATOBoat,vehNATORBoat];
//Planes
vehNATOPlane = "ffaa_ar_harrier_cas";
vehNATOPlaneAA = "ffaa_ar_harrier_cap";
vehNATOTransportPlanes = ["ffaa_ea_hercules"];
//Heli
vehNATOPatrolHeli = "ffaa_nh90_tth_transport";
vehNATOTransportHelis = [vehNATOPatrolHeli,"ffaa_nh90_tth_armed","ffaa_famet_cougar","ffaa_famet_cougar_armed","ffaa_famet_ch47_mg"];
vehNATOAttackHelis = ["ffaa_famet_tigre"];
//UAV
vehNATOUAV = "ffaa_ea_reaper";
vehNATOUAVSmall = "ffaa_et_searcherIII";
//Artillery
vehNATOMRLS = "ffaa_et_vamtac_cardom";
vehNATOMRLSMags = "8Rnd_82mm_Mo_shells";
//Combined Arrays
vehNATONormal = vehNATOLight + vehNATOTrucks + [vehNATOAmmoTruck, vehNATORepairTruck, "ffaa_et_vamtac_ume", "ffaa_et_pegaso_combustible","ffaa_et_m250_estacion_nasams_blin","ffaa_et_m250_sistema_nasams_blin","ffaa_et_lince_ambulancia","ffaa_et_toa_mando","ffaa_et_toa_ambulancia"];
vehNATOAir = vehNATOTransportHelis + vehNATOAttackHelis + [vehNATOPlane,vehNATOPlaneAA] + vehNATOTransportPlanes;

//Militia Vehicles
if (gamemode != 4) then
	{
	vehFIAArmedCar = "ffaa_et_lince_mg3";
	vehFIATruck = "ffaa_et_pegaso_carga_lona";
	vehFIACar = "ffaa_et_anibal";
	};

//Police Vehicles
vehPoliceCar = "ffaa_et_vamtac_ume";

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Statics
NATOMG = "ffaa_m2_tripode";
staticATOccupants = "ffaa_spike_tripode";
staticAAOccupants = "ffaa_mistral_tripode";
NATOMortar = "B_Mortar_01_F";

//Static Weapon Bags
MGStaticNATOB = "ffaa_m2_tripode_Bag";
ATStaticNATOB = "ffaa_spike_tripode_Bag";
AAStaticNATOB = "ffaa_mistral_tripode_Bag";
MortStaticNATOB = "B_Mortar_01_weapon_F";
//Short Support
supportStaticNATOB = "ffaa_Tripod_Bag";
//Tall Support
supportStaticNATOB2 = "ffaa_Tripod_Bag";
//Mortar Support
supportStaticNATOB3 = "B_Mortar_01_support_F";
