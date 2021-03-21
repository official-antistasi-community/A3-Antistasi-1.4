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

////////////////////////////////////
//   PVP LOADOUTS AND VEHICLES   ///
////////////////////////////////////
//PvP Loadouts
NATOPlayerLoadouts = [
	//Team Leader
	["Templates\FFAA\Loadouts\FFAA_Occ_MOE_Temp_teamLeader"] call A3A_fnc_getLoadout,
	//Medic
	["Templates\FFAA\Loadouts\FFAA_Occ_MOE_Temp_medic"] call A3A_fnc_getLoadout,
	//Machinegunner
	["Templates\FFAA\Loadouts\FFAA_Occ_MOE_Temp_machineGunner"] call A3A_fnc_getLoadout,
	//Marksman
	["Templates\FFAA\Loadouts\FFAA_Occ_MOE_Temp_marksman"] call A3A_fnc_getLoadout,
	//AT
	["Templates\FFAA\Loadouts\FFAA_Occ_MOE_Temp_AT"] call A3A_fnc_getLoadout,
	//Assistant AT
	["Templates\FFAA\Loadouts\FFAA_Occ_MOE_Temp_AAT"] call A3A_fnc_getLoadout
];

//PVP Player Vehicles
vehNATOPVP = ["ffaa_et_anibal","ffaa_et_vamtac_trans","ffaa_et_vamtac_trans_blind","ffaa_et_lince_mg3","ffaa_et_lince_m2","ffaa_et_vamtac_m2"];

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//Military Units
NATOGrunt = "ffaa_brilat_soldado";
NATOOfficer = "ffaa_brilat_oficial";
NATOOfficer2 = "ffaa_bripac_oficial";
NATOBodyG = "ffaa_et_moe_sl";
NATOCrew = "ffaa_brilat_carrista";
NATOUnarmed = "ffaa_ar_marinero";
NATOMarksman = "ffaa_brilat_tirador";
staticCrewOccupants = "ffaa_brilat_soldado";
NATOPilot = "ffaa_piloto_famet";

//Militia Units
if (gameMode != 4) then
	{
	FIARifleman = "ffaa_bripac_soldado";
	FIAMarksman = "ffaa_bripac_tirador";
	};

//Police Units
policeOfficer = "ffaa_ar_fgne_soldado_bk";
policeGrunt = "ffaa_ar_fgne_soldado_bk";

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
//Military Groups
//Teams
groupsNATOSentry = ["ffaa_brilat_granadero","ffaa_brilat_soldado"];
groupsNATOSniper = ["ffaa_brilat_francotirador_accuracy","ffaa_brilat_observador"];
groupsNATOsmall = [groupsNATOSentry,groupsNATOSniper,["ffaa_brilat_nbq","ffaa_brilat_nbq"],["ffaa_brilat_francotirador_barrett","ffaa_brilat_observador"]];
//Fireteams
groupsNATOAA = ["ffaa_brilat_jefe_peloton","ffaa_brilat_mg42","ffaa_brilat_mg42","ffaa_brilat_proveedor_mg42"];
groupsNATOAT = ["ffaa_brilat_jefe_peloton","ffaa_brilat_proveedor_alcotan","ffaa_brilat_c90","ffaa_brilat_c90"];
groupsNATOmid = [["ffaa_brilat_jefe_peloton","ffaa_brilat_operador_UAV","ffaa_brilat_tirador","ffaa_brilat_tirador_ameli"],groupsNATOAA,groupsNATOAT];
//Squads
NATOSquad = ["ffaa_brilat_jefe_escuadra","ffaa_brilat_proveedor_mg4","ffaa_brilat_fusilero_mochila","ffaa_brilat_ingeniero","ffaa_brilat_jefe_peloton","ffaa_brilat_tirador","ffaa_brilat_c90","ffaa_brilat_medico"];
NATOSpecOp = ["ffaa_et_moe_lider","ffaa_et_moe_mg","ffaa_et_moe_lg","ffaa_et_moe_sabot","ffaa_et_moe_sl","ffaa_et_moe_tirador","ffaa_et_moe_at","ffaa_et_moe_medico"];
groupsNATOSquad =
	[
	NATOSquad,
	["ffaa_brilat_jefe_escuadra","ffaa_brilat_proveedor_mg42","ffaa_brilat_fusilero_mochila","ffaa_brilat_ingeniero","ffaa_brilat_jefe_peloton","ffaa_brilat_tirador","ffaa_brilat_c90","ffaa_brilat_medico"],
	["ffaa_brilat_jefe_escuadra","ffaa_brilat_tirador_ameli","ffaa_brilat_fusilero_mochila","ffaa_brilat_ingeniero","ffaa_brilat_jefe_peloton","ffaa_brilat_tirador","ffaa_brilat_c90","ffaa_brilat_medico"],
	["ffaa_brilat_jefe_escuadra","ffaa_brilat_proveedor_mg4","ffaa_brilat_fusilero_mochila","ffaa_brilat_ingeniero","ffaa_brilat_jefe_peloton","ffaa_brilat_tirador","ffaa_brilat_alcotan","ffaa_brilat_medico"]
	];

//Militia Groups
if (gameMode != 4) then
	{
	//Teams
	groupsFIASmall =
		[
		["ffaa_bripac_granadero","ffaa_bripac_soldado"],
		[FIAMarksman,FIARifleman],
		["ffaa_bripac_nbq","ffaa_bripac_nbq"]
		];
	//Fireteams
	groupsFIAMid =
		[
		["ffaa_bripac_jefe_peloton","ffaa_bripac_tirador_ameli","ffaa_bripac_fusilero_mochila","ffaa_bripac_tirador"],
		["ffaa_bripac_jefe_peloton","ffaa_bripac_tirador_ameli","ffaa_bripac_fusilero_mochila","ffaa_bripac_c90"],
		["ffaa_bripac_jefe_peloton","ffaa_bripac_tirador_ameli","ffaa_bripac_fusilero_mochila","ffaa_bripac_ingeniero"]
		];
	//Squads
	FIASquad = ["ffaa_bripac_jefe_escuadra","ffaa_bripac_tirador_ameli","ffaa_bripac_fusilero_mochila","ffaa_bripac_granadero","ffaa_bripac_jefe_peloton","ffaa_bripac_tirador","ffaa_bripac_c90","ffaa_bripac_medico"];
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
if (gameMode != 4) then
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
NATOMG = "I_G_HMG_02_high_F";
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
