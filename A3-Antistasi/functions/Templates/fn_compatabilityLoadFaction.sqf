/*
 * File: fn_compatabilityLoadFaction.sqf
 * Author: Spoffy
 * Description:
 *    Loads a faction definition file, and transforms it into the old global variable system for sides.
 * Params:
 *    _file - Faction definition file path
 *    _side - Side to load them in as
 * Returns:
 *    Namespace containing faction information
 * Example Usage:
 */

params ["_file", "_side"];

private _faction = [_file] call A3A_fnc_loadFaction;

if (_side isEqualTo east) then {
	nameInvaders = _faction getVariable "name";

	//Flag images
	CSATFlag = _faction getVariable "flag";
	CSATFlagTexture = _faction getVariable "flagTexture";
	flagCSATmrk = _faction getVariable "flagMarkerType";

	//Loot crate
	CSATAmmoBox = _faction getVariable "ammobox";
    CSATSurrenderCrate = _faction getVariable "surrenderCrate";
    CSATEquipmentBox = _faction getVariable "equipmentBox";

	//PVP Loadouts
	CSATPlayerLoadouts = _faction getVariable "pvpLoadouts";
	vehCSATPVP = _faction getVariable "pvpVehicles";

	CSATGrunt = "loadouts_military_SquadLeader";
	CSATOfficer = "loadouts_Official";
	CSATBodyG = "loadouts_military_Rifleman";
	CSATCrew = "loadouts_Crew";
	CSATMarksman = "loadouts_military_Marksman";
	staticCrewInvaders = "loadouts_military_Rifleman";
	CSATPilot = "loadouts_Pilot";

	if (gameMode == 4) then {
		FIARifleman = "loadouts_militia_Rifleman";
		FIAMarksman = "loadouts_militia_Marksman";
	};

	groupsCSATSentry = ["loadouts_military_Grenadier", "loadouts_military_Rifleman"];
	//TODO Change Rifleman to spotter.
	groupsCSATSniper = ["loadouts_military_Sniper", "loadouts_military_Rifleman"];
	//TODO Create lighter Recon loadouts, and add a group of them to here.
	groupsCSATSmall = [groupsCSATSentry, groupsCSATSniper];
	//TODO Add ammobearers
	groupsCSATAA = [
		"loadouts_military_SquadLeader",
		"loadouts_military_AA",
		"loadouts_military_AA"
	];
	groupsCSATAT = [
		"loadouts_military_SquadLeader",
		"loadouts_military_AT",
		"loadouts_military_AT"
	];
	private _groupsCSATMediumSquad = [
		"loadouts_military_SquadLeader",
		"loadouts_military_MachineGunner",
		"loadouts_military_Grenadier",
		"loadouts_military_LAT"
	];
	groupsCSATmid = [_groupsCSATMediumSquad, groupsCSATAA, groupsCSATAT];

	groupsCSATSquad = [];
	for "_i" from 1 to 5 do {
		groupsCSATSquad pushBack [
			"loadouts_military_SquadLeader",
			selectRandomWeighted ["loadouts_military_LAT", 2, "loadouts_military_MachineGunner", 1],
			selectRandomWeighted ["loadouts_military_Rifleman", 2, "loadouts_military_Grenadier", 1],
			selectRandomWeighted ["loadouts_military_MachineGunner", 2, "loadouts_military_Marksman", 1],
			selectRandomWeighted ["loadouts_military_Rifleman", 4, "loadouts_military_AT", 1],
			selectRandomWeighted ["loadouts_military_AA", 1, "loadouts_military_Engineer", 4],
			"loadouts_military_Rifleman",
			"loadouts_military_Medic"
		];
	};

	CSATSquad = groupsCSATSquad select 0;
	CSATSpecOp = [
		"loadouts_SF_SquadLeader",
		"loadouts_SF_Rifleman",
		"loadouts_SF_MachineGunner",
		"loadouts_SF_ExplosivesExpert",
		"loadouts_SF_LAT",
		"loadouts_SF_Medic"
	];

	if (gamemode == 4) then {
		groupsFIASmall = [
			["loadouts_military_Grenadier", "loadouts_militia_Rifleman"],
			["loadouts_militia_Marksman", "loadouts_militia_Rifleman"],
			["loadouts_militia_Marksman", "loadouts_military_Grenadier"]
		];
		groupsFIAMid = [];
		for "_i" from 1 to 6 do {
			groupsFIAMid pushBack [
				"loadouts_military_SquadLeader",
				"loadouts_military_Grenadier",
				"loadouts_military_MachineGunner",
				selectRandomWeighted [
					"loadouts_military_LAT", 1,
					"loadouts_militia_Marksman", 1,
					"loadouts_military_Engineer", 1
				]
			];
		};

		groupsFIASquad = [];
		for "_i" from 1 to 5 do {
			groupsFIASquad pushBack [
				"loadouts_military_SquadLeader",
				"loadouts_military_MachineGunner",
				"loadouts_military_Grenadier",
				"loadouts_militia_Rifleman",
				selectRandomWeighted ["loadouts_militia_Rifleman", 1, "loadouts_militia_Marksman", 1],
				selectRandomWeighted ["loadouts_militia_Rifleman", 2, "loadouts_militia_Marksman", 1],
				selectRandomWeighted ["loadouts_militia_Rifleman", 1, "loadouts_military_ExplosivesExpert", 1],
				"loadouts_military_LAT",
				"loadouts_military_Medic"
			];
		};

		FIASquad = groupsFIASquad select 0;
	};

	vehCSATBike = _faction getVariable "vehiclesBasic" select 0;
	vehCSATLightArmed = _faction getVariable "vehiclesLightArmed";
	vehCSATLightUnarmed = _faction getVariable "vehiclesLightUnarmed";
	vehCSATTrucks = _faction getVariable "vehiclesTrucks";
	vehCSATAmmoTruck = _faction getVariable "vehiclesAmmoTrucks" select 0;
	vehCSATLight = vehCSATLightArmed + vehCSATLightUnarmed;

	vehCSATAPC = _faction getVariable "vehiclesAPCs";
	vehCSATTank = _faction getVariable "vehiclesTanks" select 0;
	vehCSATAA = _faction getVariable "vehiclesAA" select 0;
	vehCSATAttack = vehCSATAPC + [vehCSATTank];

	vehCSATBoat = _faction getVariable "vehiclesGunboats" select 0;
	vehCSATRBoat = _faction getVariable "vehiclesTransportBoats" select 0;
	vehCSATBoats = [vehCSATBoat, vehCSATRBoat] + (_faction getVariable "vehiclesAmphibious");

	vehCSATPlane = _faction getVariable "vehiclesPlanesCAS" select 0;
	vehCSATPlaneAA = _faction getVariable "vehiclesPlanesAA" select 0;
	vehCSATTransportPlanes = _faction getVariable "vehiclesPlanesTransport";

	vehCSATPatrolHeli = _faction getVariable "vehiclesHelisLight" select 0;
	vehCSATTransportHelis = (_faction getVariable "vehiclesHelisLight") + (_faction getVariable "vehiclesHelisTransport");
	vehCSATAttackHelis = _faction getVariable "vehiclesHelisAttack";

	vehCSATUAV = _faction getVariable "uavsAttack" select 0;
	vehCSATUAVSmall = _faction getVariable "uavsPortable" select 0;

	vehCSATMRLS = _faction getVariable "vehiclesArtillery" select 0 select 0;
	vehCSATMRLSMags = _faction getVariable "vehiclesArtillery" select 0 select 1 select 0;

	vehCSATNormal =
		  vehCSATLight
		+ vehCSATTrucks
		+ (_faction getVariable "vehiclesAmmoTrucks")
		+ (_faction getVariable "vehiclesRepairTrucks")
		+ (_faction getVariable "vehiclesFuelTrucks")
		+ (_faction getVariable "vehiclesMedical");

	vehCSATAir =
		  vehCSATTransportHelis
		+ vehCSATAttackHelis
		+ [vehCSATPlane, vehCSATPlaneAA]
		+ vehCSATTransportPlanes;

	if (gameMode == 4) then {
		vehFIAArmedCar = _faction getVariable "vehiclesMilitiaLightArmed" select 0;
		vehFIATruck = _faction getVariable "vehiclesMilitiaTrucks" select 0;
		vehFIACar = _faction getVariable "vehiclesMilitiaCars" select 0;
	};

	CSATMG = _faction getVariable "staticMGs" select 0;
	staticATInvaders = _faction getVariable "staticAT" select 0;
	staticAAInvaders = _faction getVariable "staticAA" select 0;
	CSATMortar = _faction getVariable "staticMortars" select 0;

	MGStaticCSATB = _faction getVariable "baggedMGs" select 0 select 0;
	//TODO: Add tall/short support support.
	supportStaticCSATB = _faction getVariable "baggedMGs" select 0 select 1;
	supportStaticCSATB2 = _faction getVariable "baggedMGs" select 0 select 1;
	ATStaticCSATB = _faction getVariable "baggedAT" select 0 select 0;
	AAStaticCSATB = _faction getVariable "baggedAA" select 0 select 0;
	MortStaticCSATB = _faction getVariable "baggedMortars" select 0 select 0;
	supportStaticCSATB3 = _faction getVariable "baggedMortars" select 0 select 1;
};


if (_side isEqualTo west) then {
	nameOccupants = _faction getVariable "name";

	//Militia faction (complete with weird mod compat)
	if ((gameMode != 4) and (!hasFFAA)) then {factionFIA = ""};

	//Flag images
	NATOFlag = _faction getVariable "flag";
	NATOFlagTexture = _faction getVariable "flagTexture";
	flagNATOmrk = _faction getVariable "flagMarkerType";
	if (isServer) then {"NATO_carrier" setMarkerText (_faction getVariable "spawnMarkerName")};

	//Loot crate
	NATOAmmobox = _faction getVariable "ammobox";
    NATOSurrenderCrate = _faction getVariable "surrenderCrate";
    NATOEquipmentBox = _faction getVariable "equipmentBox";

	//PVP Loadouts
	NATOPlayerLoadouts = _faction getVariable "pvpLoadouts";
	vehNATOPVP = _faction getVariable "pvpVehicles";

	NATOGrunt = "loadouts_military_Rifleman";
	NATOOfficer = "loadouts_Official";
	NATOOfficer2 = "loadouts_Traitor";
	NATOBodyG = "loadouts_military_Rifleman";
	NATOCrew = "loadouts_Crew";
	NATOUnarmed = "loadouts_Unarmed";
	NATOMarksman = "loadouts_military_Marksman";
	staticCrewOccupants = "loadouts_military_Rifleman";
	NATOPilot = "loadouts_Pilot";

	if ((gameMode != 4) and (!hasFFAA)) then {
		FIARifleman = "loadouts_militia_Rifleman";
		FIAMarksman = "loadouts_militia_Marksman";
	};

	policeOfficer = "loadouts_police_SquadLeader";
	policeGrunt = "loadouts_police_Standard";
	groupsNATOGen = [policeOfficer, policeGrunt];

	groupsNATOSentry = ["loadouts_military_Grenadier", "loadouts_military_Rifleman"];
	//TODO Change Rifleman to spotter.
	groupsNATOSniper = ["loadouts_military_Sniper", "loadouts_military_Rifleman"];
	//TODO Create lighter Recon loadouts, and add a group of them to here.
	groupsNATOSmall = [groupsNATOSentry, groupsNATOSniper];
	//TODO Add ammobearers
	groupsNATOAA = [
		"loadouts_military_SquadLeader",
		"loadouts_military_AA",
		"loadouts_military_AA"
	];
	groupsNATOAT = [
		"loadouts_military_SquadLeader",
		"loadouts_military_AT",
		"loadouts_military_AT"
	];
	private _groupsNATOMediumSquad = [
		"loadouts_military_SquadLeader",
		"loadouts_military_MachineGunner",
		"loadouts_military_Grenadier",
		"loadouts_military_LAT"
	];
	groupsNATOmid = [_groupsNATOMediumSquad, groupsNATOAA, groupsNATOAT];

	groupsNATOSquad = [];
	for "_i" from 1 to 5 do {
		groupsNATOSquad pushBack [
			"loadouts_military_SquadLeader",
			selectRandomWeighted ["loadouts_military_LAT", 2, "loadouts_military_MachineGunner", 1],
			selectRandomWeighted ["loadouts_military_Rifleman", 2, "loadouts_military_Grenadier", 1],
			selectRandomWeighted ["loadouts_military_MachineGunner", 2, "loadouts_military_Marksman", 1],
			selectRandomWeighted ["loadouts_military_Rifleman", 4, "loadouts_military_AT", 1],
			selectRandomWeighted ["loadouts_military_AA", 1, "loadouts_military_Engineer", 4],
			"loadouts_military_Rifleman",
			"loadouts_military_Medic"
		];
	};

	NATOSquad = groupsNATOSquad select 0;
	NATOSpecOp = [
		"loadouts_SF_SquadLeader",
		"loadouts_SF_Rifleman",
		"loadouts_SF_MachineGunner",
		"loadouts_SF_ExplosivesExpert",
		"loadouts_SF_LAT",
		"loadouts_SF_Medic"
	];

	if ((gameMode != 4) and (!hasFFAA)) then {
		groupsFIASmall = [
			["loadouts_military_Grenadier", "loadouts_militia_Rifleman"],
			["loadouts_militia_Marksman", "loadouts_militia_Rifleman"],
			["loadouts_militia_Marksman", "loadouts_military_Grenadier"]
		];
		groupsFIAMid = [];
		for "_i" from 1 to 6 do {
			groupsFIAMid pushBack [
				"loadouts_military_SquadLeader",
				"loadouts_military_Grenadier",
				"loadouts_military_MachineGunner",
				selectRandomWeighted [
					"loadouts_military_LAT", 1,
					"loadouts_militia_Marksman", 1,
					"loadouts_military_Engineer", 1
				]
			];
		};

		groupsFIASquad = [];
		for "_i" from 1 to 5 do {
			groupsFIASquad pushBack [
				"loadouts_military_SquadLeader",
				"loadouts_military_MachineGunner",
				"loadouts_military_Grenadier",
				"loadouts_militia_Rifleman",
				selectRandomWeighted ["loadouts_militia_Rifleman", 1, "loadouts_militia_Marksman", 1],
				selectRandomWeighted ["loadouts_militia_Rifleman", 2, "loadouts_militia_Marksman", 1],
				selectRandomWeighted ["loadouts_militia_Rifleman", 1, "loadouts_military_ExplosivesExpert", 1],
				"loadouts_military_LAT",
				"loadouts_military_Medic"
			];
		};

		FIASquad = groupsFIASquad select 0;
	};

	vehNATOBike = _faction getVariable "vehiclesBasic" select 0;
	vehNATOLightArmed = _faction getVariable "vehiclesLightArmed";
	vehNATOLightUnarmed = _faction getVariable "vehiclesLightUnarmed";
	vehNATOTrucks = _faction getVariable "vehiclesTrucks";
	vehNATOCargoTrucks = _faction getVariable "vehiclesCargoTrucks";
	vehNATOAmmoTruck = _faction getVariable "vehiclesAmmoTrucks" select 0;
	vehNATORepairTruck = _faction getVariable "vehiclesRepairTrucks" select 0;
	vehNATOLight = vehNATOLightArmed + vehNATOLightUnarmed;

	vehNATOAPC = _faction getVariable "vehiclesAPCs";
	vehNATOTank = _faction getVariable "vehiclesTanks" select 0;
	vehNATOAA = _faction getVariable "vehiclesAA" select 0;
	vehNATOAttack = vehNATOAPC + [vehNATOTank];

	vehNATOBoat = _faction getVariable "vehiclesGunboats" select 0;
	vehNATORBoat = _faction getVariable "vehiclesTransportBoats" select 0;
	vehNATOBoats = [vehNATOBoat, vehNATORBoat] + (_faction getVariable "vehiclesAmphibious");

	vehNATOPlane = _faction getVariable "vehiclesPlanesCAS" select 0;
	vehNATOPlaneAA = _faction getVariable "vehiclesPlanesAA" select 0;
	vehNATOTransportPlanes = _faction getVariable "vehiclesPlanesTransport";

	vehNATOPatrolHeli = _faction getVariable "vehiclesHelisLight" select 0;
	vehNATOTransportHelis = (_faction getVariable "vehiclesHelisLight") + (_faction getVariable "vehiclesHelisTransport");
	vehNATOAttackHelis = _faction getVariable "vehiclesHelisAttack";

	vehNATOUAV = _faction getVariable "uavsAttack" select 0;
	vehNATOUAVSmall = _faction getVariable "uavsPortable" select 0;

	vehNATOMRLS = _faction getVariable "vehiclesArtillery" select 0 select 0;
	vehNATOMRLSMags = _faction getVariable "vehiclesArtillery" select 0 select 1 select 0;

	vehNATONormal =
		  vehNATOLight
		+ vehNATOTrucks
		+ (_faction getVariable "vehiclesAmmoTrucks")
		+ (_faction getVariable "vehiclesRepairTrucks")
		+ (_faction getVariable "vehiclesFuelTrucks")
		+ (_faction getVariable "vehiclesMedical");

	vehNATOAir =
		  vehNATOTransportHelis
		+ vehNATOAttackHelis
		+ [vehNATOPlane, vehNATOPlaneAA]
		+ vehNATOTransportPlanes;

	if ((gameMode != 4) and (!hasFFAA)) then {
		vehFIAArmedCar = _faction getVariable "vehiclesMilitiaLightArmed" select 0;
		vehFIATruck = _faction getVariable "vehiclesMilitiaTrucks" select 0;
		vehFIACar = _faction getVariable "vehiclesMilitiaCars" select 0;
	};

	vehPoliceCar = _faction getVariable "vehiclesPolice" select 0;

	NATOMG = _faction getVariable "staticMGs" select 0;
	staticATOccupants = _faction getVariable "staticAT" select 0;
	staticAAOccupants = _faction getVariable "staticAA" select 0;
	NATOMortar = _faction getVariable "staticMortars" select 0;

	MGStaticNATOB = _faction getVariable "baggedMGs" select 0 select 0;
	//TODO: Add tall/short support support.
	supportStaticNATOB = _faction getVariable "baggedMGs" select 0 select 1;
	supportStaticNATOB2 = _faction getVariable "baggedMGs" select 0 select 1;
	ATStaticNATOB = _faction getVariable "baggedAT" select 0 select 0;
	AAStaticNATOB = _faction getVariable "baggedAA" select 0 select 0;
	MortStaticNATOB = _faction getVariable "baggedMortars" select 0 select 0;
	supportStaticNATOB3 = _faction getVariable "baggedMortars" select 0 select 1;
};

if (_side isEqualTo independent) then {
	nameTeamPlayer = _faction getVariable "name";

	//Flag images
	SDKFlag = _faction getVariable "flag";
	SDKFlagTexture = _faction getVariable "flagTexture";
	typePetros = "loadouts_rebel_Petros";

	staticCrewTeamPlayer = "loadouts_rebel_Rifleman";
	SDKUnarmed = "loadouts_rebel_Unarmed";
	SDKSniper = ["loadouts_rebel_Unarmed", "loadouts_rebel_unarmed"];
	SDKATman = ["loadouts_rebel_lat", "loadouts_rebel_lat"];
	SDKMedic = ["loadouts_rebel_medic", "loadouts_rebel_medic"];
	SDKMG = ["loadouts_rebel_MachineGunner", "loadouts_rebel_MachineGunner"];
	SDKExp = ["loadouts_rebel_ExplosivesExpert", "loadouts_rebel_ExplosivesExpert"];
	SDKGL = ["loadouts_rebel_Grenadier", "loadouts_rebel_Grenadier"];
	SDKMil = ["loadouts_rebel_Rifleman", "loadouts_rebel_Rifleman"];
	SDKSL = ["loadouts_rebel_SquadLeader", "loadouts_rebel_SquadLeader"];
	SDKEng = ["loadouts_rebel_Engineer", "loadouts_rebel_Engineer"];

	groupsSDKmid = [SDKSL,SDKGL,SDKMG,SDKMil];
	groupsSDKAT = [SDKSL,SDKMG,SDKATman,SDKATman,SDKATman];
	groupsSDKSquad = [SDKSL,SDKGL,SDKMil,SDKMG,SDKMil,SDKATman,SDKMil,SDKMedic];
	groupsSDKSquadEng = [SDKSL,SDKGL,SDKMil,SDKMG,SDKExp,SDKATman,SDKEng,SDKMedic];
	groupsSDKSquadSupp = [SDKSL,SDKGL,SDKMil,SDKMG,SDKATman,SDKMedic,[staticCrewTeamPlayer,staticCrewTeamPlayer],[staticCrewTeamPlayer,staticCrewTeamPlayer]];
	groupsSDKSniper = [SDKSniper,SDKSniper];
	groupsSDKSentry = [SDKGL,SDKMil];

	//Rebel Unit Tiers (for costs)
	sdkTier1 = SDKMil + [staticCrewTeamPlayer] + SDKMG + SDKGL + SDKATman;
	sdkTier2 = SDKMedic + SDKExp + SDKEng;
	sdkTier3 = SDKSL + SDKSniper;
	soldiersSDK = sdkTier1 + sdkTier2 + sdkTier3;

	vehSDKBike = _faction getVariable "vehicleBasic";
	vehSDKLightArmed = _faction getVariable "vehicleLightUnarmed";
	vehSDKAT = _faction getVariable "vehicleAT";
	vehSDKLightUnarmed = _faction getVariable "vehicleLightUnarmed";
	vehSDKTruck = _faction getVariable "vehicleTruck";
	vehSDKPlane = _faction getVariable "vehiclePlane";
	vehSDKBoat = _faction getVariable "vehicleBoat";
	vehSDKRepair = _faction getVariable "vehicleRepair";

	SDKMGStatic = _faction getVariable "staticMG";
	staticATteamPlayer = _faction getVariable "staticAT";
	staticAAteamPlayer = _faction getVariable "staticAA";
	SDKMortar = _faction getVariable "staticMortar";
	SDKMortarHEMag = _faction getVariable "staticMortarMagHE";
	SDKMortarSmokeMag = _faction getVariable "staticMortarMagSmoke";

	civCar = _faction getVariable "vehicleCivCar";
	civTruck = _faction getVariable "vehicleCivTruck";
	civHeli = _faction getVariable "vehicleCivHeli";
	civBoat = _faction getVariable "vehicleCivBoat";

	MGStaticSDKB = _faction getVariable "baggedMGs" select 0 select 0;
	ATStaticSDKB = _faction getVariable "baggedAT" select 0 select 0;
	AAStaticSDKB = _faction getVariable "baggedAA" select 0 select 0;
	MortStaticSDKB = _faction getVariable "baggedMortars" select 0 select 0;
	supportStaticSDKB = _faction getVariable "baggedMGs" select 0 select 1;
	supportStaticsSDKB2 = _faction getVariable "baggedMGs" select 0 select 1;
	supportStaticsSDKB3 = _faction getVariable "baggedMortars" select 0 select 1;

	ATMineMag = _faction getVariable "mineAT";
	APERSMineMag = _faction getVariable "mineAPERS";

	breachingExplosivesAPC = _faction getVariable "breachingExplosivesAPC";
	breachingExplosivesTank = _faction getVariable "breachingExplosivesTank";

	initialRebelEquipment = _faction getVariable "initialRebelEquipment";
};
