class A3A
{
	class Base
	{
		class addActionBreachVehicle {};
		class addHC {};
		class addTimeForIdle {};
		class AILoadInfo {};
		class rebelAttack {};
		class blackout {};
		class buildHQ {};
		class citiesToCivPatrol {};
		class citySupportChange {};
		class commsMP {};
		class createControls {};
		class createOutpostsFIA {};
		class createPetros {};
		class deleteControls {};
		class destroyCity {};
		class distance {};
		class distanceUnits {};
		class economicsAI {};
		class ejectPvPPlayerIfInvalidVehicle {};
		class FIAradio {};
		class findBasesForConvoy {};
		class findNearestGoodRoad {};
		class flagaction {};
		class fogCheck {};
		class garbageCleaner {};
		class garrisonInfo {};
		class healAndRepair {};
		class initPetros {};
		class intelFound {};
		class isFrontline {};
		class isTheSameIsland {};
		class keys {};
		class localizar {};
		class location {};
		class logPerformance {};
		class markerChange {};
		class moveHQ {};
		class mrkUpdate {};
		class mrkWIN {};
		class NATOFT {};
		class numericRank {};
		class onHeadlessClientDisconnect {};
		class onPlayerDisconnect {};
		class outpostDialog {};
		class patrolDestinations {};
		class placementSelection {};
		class playerHasBeenPvPCheck {};
		class powerCheck {};
		class powerReorg {};
		class prestige {};
		class radioCheck {};
		class rebuildAssets {};
		class relocateHQObjects {};
		class repairRuinedBuilding {};
		class resourceCheckSkipTime {};
		class resourcesFIA {};
		class returnMuzzle {};
		class revealToPlayer {};
		class scheduler {};
		class sellVehicle {};
		class setMarkerAlphaForSide {};
		class sizeMarker {};
		class startBreachVehicle {};
		class statistics {};
		class stripGearFromLoadout {};
		class teleportVehicleToBase {};
		class timingCA {};
		class translateVariable {};
		class undercover {};
		class unlockVehicle {};
		class zoneCheck {};
	};

	class AI
	{
		class occupantInvaderUnitKilledEH {};
		class airbomb {};
		class airdrop {};
		class AIreactOnKill {};
		class airstrike {};
		class artillery {};
		class artySupport {};
		class askHelp {};
		class assaultBuilding {};
		class attackDrillAI {};
		class autoHealFnc {};
		class autoLoot {};
		class autoRearm {};
		class canConquer {};
		class canFight {};
		class captureX {};
		class chargeWithSmoke {};
		class coverage {};
		class destroyBuilding {};
		class doFlank {};
		class enemyList {};
		class entriesLand {};
		class fastrope {};
		class findSafeRoadToUnload {};
		class guardDog {};
		class hasRadio {};
		class help {};
		class hideInBuilding {};
		class inmuneConvoy {};
		class interrogate {};
		class isBuildingPosition {};
		class landThreatEval {};
		class liberaterefugee {};
		class liberatePOW {};
		class mineSweep {};
		class mortarDrill {};
		class mortarSupport {};
		class mortyAI {};
		class napalm {};
		class napalmDamage {};
		class nearEnemy {};
		class rearmCall {};
		class recallGroup {};
		class smokeCoverAuto {};
		class staticAutoT {};
		class staticMGDrill {};
		class suppressingFire {};
		class surrenderAction {};
		class typeOfSoldier {};
		class undercoverAI {};
		class unitGetToCover {};
		class useFlares {};
		class VANTinfo {};
		class vehicleMarkers {};
	};

	class Convoy
	{
		class createAIAction {file="Convoy\createAIAction.sqf";};
		class createConvoy {file="Convoy\createConvoy.sqf";};
		class convoyMovement {file="Convoy\convoyMovement.sqf";};
		class findAirportForAirstrike {file="Convoy\findAirportForAirstrike.sqf";};

		class SelectAndCreateVehicle {file="Convoy\selectAndCreateVehicle.sqf";};
	}

	class CREATE
	{
		class AAFroadPatrol {};
		class airportCanAttack {};
		class AIVEHinit {};
		class ambientCivs {};
		class cargoSeats {};
		class CIVinit {};
		class civVEHinit {};
		class cleanserVeh {};
		class createAIAirplane {};
		class createAICities {};
		class createAIcontrols {};
		class createAIOutposts {};
		class createAIResources {};
		class createCIV {};
		class createFIAOutposts2 {};
		class createSDKGarrisons {};
		class createSDKgarrisonsTemp {};
		class cycleSpawn {};
		class FIAinitBases {};
		class findSpawnPosition {};
		class freeSpawnPositions {};
		class garrisonReorg {};
		class garrisonSize {};
		class garrisonUpdate {};
		class groupDespawner {};
		class invaderPunish {};
		class milBuildings {};
		class minefieldAAF {};
		class mortarPos {};
		class NATOinit {};
		class patrolCA {};
		class patrolReinf {};
		class reinforcementsAI {};
		class remoteBattle {};
		class removeVehFromPool {};
		class spawnGroup {};
		class vehAvailable {};
		class VEHdespawner {};
		class wavedCA {};
		class WPCreate {};
	};

	class Debugging
	{
		class deleteEmptyGroupsOnSide {};
		class spawnDebuggingLoop {};
	};

	class Dialogs
	{
		class buyVehicle {};
		class buyVehicleCiv {};
		class clearForest {};
		class dialogHQ {};
		class difficultyMenu {};
		class fastTravelRadio {};
		class firstLoad {};
		class mineDialog {};
		class moveHQObject {};
		class skiptime {};
		class squadOptions {};
		class squadRecruit {};
		class unit_recruit {};
	};

	class Garage
	{
		class addToPersonalGarage {};
		class addToPersonalGarageLocal {};
		class attemptPlaceVehicle {};
		class displayVehiclePlacementMessage {};
		class garage {};
		class garageVehicle {};
		class getPersonalGarage {};
		class getPersonalGarageLocal {};
		class handleVehPlacementCancelled {};
		class placeEmptyVehicle {};
		class setPersonalGarage {};
		class setPersonalGarageLocal {};
		class vehPlacementBegin {};
		class vehPlacementCallbacks {};
		class vehPlacementCancel {};
		class vehPlacementChangeVehicle {};
		class vehPlacementCleanup {};
	};

	class Garrison
	{
		class addGarrison {};
		class addRequested {};
		class checkGroupType {};
		class checkVehicleType {};
		class countGarrison {};
		class createGarrison {};
		class createGarrisonLine {};
		class getGarrison {};
		class getGarrisonRatio {};
		class getGarrisonStatus {};
		class getRequested {};
		class getVehicleCrew {};
		class initPreference {};
		class logArray {};
		class replenishGarrison {};
		class selectGroupType {};
		class selectReinfUnits {};
		class selectVehicleType {};
		class shouldReinforce {};
		class updateGarrison {};
		class updatePreference {};
		class updateReinfState {};
		class updateVehicles {};
	};

	class Missions
	{
		class AS_Official {};
		class AS_specOP {};
		class AS_Traitor {};
		class attackHQ {};
		class CON_Outpost {};
		class convoy {};
		class deleteTask {};
		class DES_Antenna {};
		class DES_Heli {};
		class DES_Vehicle {};
		class LOG_Ammo {};
		class LOG_Bank {};
		class LOG_Supplies {};
		class missionRequest {};
		class missionRequestAUTO {};
		class REP_Antenna {};
		class RES_Prisoners {};
		class RES_Refugees {};
		class taskUpdate {};
		class underAttack {};
	};

	class Ammunition
	{
		class ACEpvpReDress {};
		class ammunitionTransfer {};
		class arsenalManage {};
		class boxAAF {};
		class checkRadiosUnlocked {};
		class CSATCrate {};
		class dress {};
		class empty {};
		class getRadio {};
		class NATOCrate {};
		class randomRifle {};
		class transfer {};
	};

	class OrgPlayers
	{
		class assigntheBoss {};
		class donateMoney {};
		class isMember {};
		class memberAdd {};
		class membersList {};
		class playerScoreAdd {};
		class ranksMP {};
		class resourcesPlayer {};
		class theBossInit {};
		class theBossSteal {};
		class tierCheck {};
	};

	class Pathfinding
	{
		//Public API - Call these from anywhere
		class loadNavGrid {file="Convoy\A-star-pathfinding\loadNavGrid.sqf";};
		class findPath {file="Convoy\A-star-pathfinding\startPathfinding.sqf";};

		//Private API - Do NOT call these elsewhere
		class getMainMarkers {file="Convoy\A-star-pathfinding\getMainMarkers.sqf";};
		class getClosestMainMarker {file="Convoy\A-star-pathfinding\getClosestMainMarker.sqf";};
		class getNavPos {file="Convoy\A-star-pathfinding\getNavPos.sqf";};
		class calculateH {file="Convoy\A-star-pathfinding\calculateH.sqf";};
		class setNavOnMarker {file="Convoy\A-star-pathfinding\setNavOnMarker.sqf";};
		class getNavConnections {file="Convoy\A-star-pathfinding\getNavConnections.sqf";};
		class findNearestNavPoint {file="Convoy\A-star-pathfinding\findNearestNavPoint.sqf";};
	};
	
	class Punishment
	{
		class punishment {};
		class punishment_addActionForgive {};
		class punishment_notifyAdmin {};
		class punishment_notifyAllAdmins {};
		class punishment_release {};
		class punishment_sentence {};
		class punishment_warden {};
	};

	class REINF
	{
		class addBombRun {};
		class addFIAsquadHC {};
		class addFIAveh {};
		class addSquadVeh {};
		class autoGarrison {};
		class build {};
		class buildCreateVehicleCallback {};
		class buildMinefield {};
		class enemyNearCheck {};
		class FIAinit {};
		class FIAskillAdd {};
		class garrisonAdd {};
		class garrisonDialog {};
		class NATObomb {};
		class NATOQuadbike {};
		class postmortem {};
		class reDress {};
		class reinfPlayer {};
		class stealStatic {};
		class vehiclePrice {};
		class vehStats {};
	};

	class Revive
	{
		class actionRevive {};
		class carry {};
		class fatalWound {};
		class handleDamage {};
		class handleDamageAAF {};
		class initRevive {};
		class isMedic {};
		class respawn {};
		class unconscious {};
		class unconsciousAAF {};
	};

	class Runways
	{
		class getRunwayTakeoffForAirportMarker {};
		class runwayInfo {};
	};

	class Save
	{
		class loadPlayer {};
		class loadPreviousSession {};
		class loadServer {};
		class playerHasSave {};
		class savePlayer {};
	};

	class Templates
	{
		class getLoadout {};
	};

	class Utility
	{
		class basicBackpack {};
		class dateToTimeString {};
	};

	class init
	{
		class cityinfo {};
		class credits {};
		class getArrayMrks {};
		class initGarrisons {};
		class initGetMissionPath {};
		class initSpawnPlaces {};
		class modBlacklist {};
		class playerMarkers {};
		class prepareMarkerArrays {};
		class reinitY {};
		class resourcecheck {};
		class tags {};
	};
};
