// only run on server (including SP, MP, Dedicated) and Headless Client
if (!isServer && hasInterface ) exitWith {};


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//        These Variables should be checked and set as required, to make the mission runs properly.
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//1=Enable or 0=disable debug. In debug could see a mark positioning de leader and another mark of the destination of movement, very useful for editing mission
UPSMON_Debug = 0;

//Max waiting is the maximum time patrol groups will wait when arrived to target for doing another target.
UPSMON_maxwaiting = 10;

// Set How many time a unit will search around a suspect position
UPSMON_SRCHTIME = 90;

// if you are spotted by AI group, how close the other AI group have to be to You , to be informed about your present position. over this, will lose target
UPSMON_sharedist = 800; // org value 800 => increased for ArmA3 map sizes for less predictable missions..

// knowsAbout 0.5 1.03 , 1.49 to add this enemy to "target list" (1-4) the higher number the less detect ability (original in 5.0.7 was 0.5)
// it does not mean the AI will not shoot at you. This means: what must be knowsAbout you to UPSMON adds you to the list of targets (UPSMON list of target)
UPSMON_knowsAboutEnemy = 1.5; // 5

//////////////////////// MODULES ////////////////////////////////////////////
//Enable it to send reinforcements, better done it in a trigger inside your mission.
UPSMON_reinforcement = false; // ToDo Set to true if UPSMON reinf is going ot be used
UPSMON_CIV_Total = 0; //by Barbolani to avoid rpt flood.
UPSMON_UNKNOWN_Total = 0; //by Barbolani to avoid rpt flood.
//Artillery support, better control if set in trigger
UPSMON_ARTILLERY_EAST_FIRE = true; //set to true for doing east to fire //ToDo verify if needed
UPSMON_ARTILLERY_WEST_FIRE = true; //set to true for doing west to fire
UPSMON_ARTILLERY_GUER_FIRE = true; //set to true for doing resistance to fire

// Can the group surrender?
UPSMON_SURRENDER = false;

// Chance of Surrender/100
UPSMON_WEST_SURRENDER = 10;
UPSMON_EAST_SURRENDER = 10;
UPSMON_GUER_SURRENDER = 10;

// Chance of Retreating/100
UPSMON_WEST_RETREAT = 0;
UPSMON_EAST_RETREAT = 0;
UPSMON_GUER_RETREAT = 0;

/// Civilian Hostility (Set to 0 if you want to disable the function)
UPSMON_Ammountofhostility = 0;

UPSMON_WEST_HM = 10;
UPSMON_EAST_HM = 100;
UPSMON_GUER_HM = 100;

//////////////////////// ////////////////////////////////////////////

//Height that heli will fly this input will be randomised in a 10%
UPSMON_flyInHeight = 60; //80;

//Max distance to target for doing para-drop, will be randomised between 0 and 100% of this value.
UPSMON_paradropdist = 400;

//Height that heli will fly if his mission is paradroping.
UPSMON_paraflyinheight = 110;

// Distance from destination for searching vehicles. (Search area is about 200m),
// If your destination point is further than UPSMON_searchVehicledist, AI will try to find a vehicle to go there.
UPSMON_searchVehicledist = 900; // 700, 900

// How far opfor disembark from non armoured vehicle
UPSMON_closeenoughV = 800;

// how close unit has to be to target to generate a new one target or to enter stealth mode
UPSMON_closeenough = 300;  // ToDo investigate effect of decrease of this value to e.g. 50 // 300

//Do the unit react to near dead bodies;
UPSMON_deadBodiesReact = true;

//Do unit can lay down mine (ambush and defense module)
UPSMON_useMines = true;

//Distance from ambush point
UPSMON_ambushdist = 100;

//% of chance to use smoke by team members when someone wounded or killed in the group in %(default 13 & 35).
// set both to 0 -> to switch off this function
UPSMON_USE_SMOKE = 0; // org 13: decreased while AI is popping smoke a bit too often

//Allow Relax units during nightime to create fireplace
UPSMON_Allowfireplace = false;

//Allow Units to Rearm
UPSMON_AllowRearm = true;

//=============================================================================================================================
//=============================== DO NOT TOUCH THESE VARIABLES ================================================================

//UPSMON_Version
UPSMON_Version = "UPSMON 6.0.9.5";
//Misc Array
UPSMON_Total = 0;
UPSMON_Instances = 0;
UPSMON_Exited = 0;
UPSMON_AllWest = 0;
UPSMON_AllEast = 0;
UPSMON_AllRes = 0;
upsmon_west_total = 0;
upsmon_guer_total = 0;
upsmon_east_total = 0;
//Reinforcement group array
UPSMON_REINFORCEMENT_WEST_UNITS = [];
UPSMON_REINFORCEMENT_EAST_UNITS = [];
UPSMON_REINFORCEMENT_GUER_UNITS = [];
//Artillery group array
UPSMON_ARTILLERY_WEST_UNITS = [];
UPSMON_ARTILLERY_EAST_UNITS = [];
UPSMON_ARTILLERY_GUER_UNITS = [];
//Transport group array
UPSMON_TRANSPORT_WEST_UNITS = [];
UPSMON_TRANSPORT_EAST_UNITS = [];
UPSMON_TRANSPORT_GUER_UNITS = [];
//Supply group array
UPSMON_SUPPLY_WEST_UNITS = [];
UPSMON_SUPPLY_EAST_UNITS = [];
UPSMON_SUPPLY_GUER_UNITS = [];
//Supply group array
UPSMON_SUPPORT_WEST_UNITS = [];
UPSMON_SUPPORT_EAST_UNITS = [];
UPSMON_SUPPORT_GUER_UNITS = [];
//tracked units array
UPSMON_Trackednpcs = [];
//Targetpos of groups
UPSMON_targetsPos = [];
//Units array by sides
UPSMON_AllWest = [];
UPSMON_AllEast = [];
UPSMON_AllRes = [];
//UPSMON Array groups
UPSMON_NPCs = [];
UPSMON_Civs = [];
//Markers Array
UPSMON_Markers = [];
//Template Array
UPSMON_TEMPLATES = [];
//EH Killed Civ
KILLED_CIV_COUNTER = [];

UPSMON_FlareInTheAir = false;

UPSMON_GOTKILL_ARRAY = [];
UPSMON_GOTHIT_ARRAY = [];

//===============================================================================
//========================					=====================================

// logic is needed to display rGlobalChat
private ["_center","_group","_UPSMON_Minesclassname","_m"];
_center = createCenter sideLogic; _group = createGroup _center;
UPSMON_Logic_civkill = _group createUnit ["LOGIC", [1,1,1], [], 0, "NONE"];
_group = nil;
_center = nil;

UPSMON = compile preProcessFileLineNumbers "Scripts\UPSMON.sqf";
UPSMON_CreateGroup = compile preProcessFileLineNumbers "Scripts\UPSMON\UPSMON_CreateGroup.sqf";

//Core
call compile preProcessFileLineNumbers "Scripts\UPSMON\COMMON\Core\init.sqf";
call compile preprocessFileLineNumbers "Scripts\UPSMON\Get_pos\UPSMON_pos_init.sqf";
//Params
call compile preProcessFileLineNumbers "Scripts\UPSMON\COMMON\Group\init.sqf";
call compile preProcessFileLineNumbers "Scripts\UPSMON\COMMON\target\init.sqf";
call compile preProcessFileLineNumbers "Scripts\UPSMON\COMMON\unit\init.sqf";
call compile preProcessFileLineNumbers "Scripts\UPSMON\COMMON\Params\init.sqf";
call compile preProcessFileLineNumbers "Scripts\UPSMON\COMMON\buildings\init.sqf";
call compile preProcessFileLineNumbers "Scripts\UPSMON\COMMON\vehicles\init.sqf";
call compile preProcessFileLineNumbers "Scripts\UPSMON\COMMON\cover\init.sqf";
call compile preProcessFileLineNumbers "Scripts\UPSMON\COMMON\terrain\init.sqf";
call compile preProcessFileLineNumbers "Scripts\UPSMON\COMMON\MP\init.sqf";
//Modules
call compile preProcessFileLineNumbers "Scripts\UPSMON\MODULES\init.sqf";
call compile preProcessFileLineNumbers "Scripts\UPSMON\MODULES\FORTIFY\init.sqf";
call compile preProcessFileLineNumbers "Scripts\UPSMON\MODULES\AMBUSH\init.sqf";
call compile preProcessFileLineNumbers "Scripts\UPSMON\MODULES\ARTILLERY\init.sqf";
//Orders
call compile preProcessFileLineNumbers "Scripts\UPSMON\MODULES\ORDERS\UPSMON_PATROL\init.sqf";
call compile preProcessFileLineNumbers "Scripts\UPSMON\MODULES\ORDERS\UPSMON_REINFORCEMENT\init.sqf";
call compile preProcessFileLineNumbers "Scripts\UPSMON\MODULES\ORDERS\UPSMON_Transport\init.sqf";
call compile preProcessFileLineNumbers "Scripts\UPSMON\MODULES\ORDERS\UPSMON_PATROLSRCH\init.sqf";
call compile preProcessFileLineNumbers "Scripts\UPSMON\MODULES\ORDERS\UPSMON_FLANK\init.sqf";
call compile preProcessFileLineNumbers "Scripts\UPSMON\MODULES\ORDERS\UPSMON_ASSAULT\init.sqf";
call compile preProcessFileLineNumbers "Scripts\UPSMON\MODULES\ORDERS\UPSMON_DEFEND\init.sqf";
call compile preProcessFileLineNumbers "Scripts\UPSMON\MODULES\ORDERS\UPSMON_RELAX\init.sqf";
call compile preProcessFileLineNumbers "Scripts\UPSMON\MODULES\ORDERS\UPSMON_SUPPLY\init.sqf";
call compile preProcessFileLineNumbers "Scripts\UPSMON\MODULES\ORDERS\UPSMON_RETREAT\init.sqf";//ADDED BY BARBOLANI

[] execvm "Scripts\UPSMON\COMMON\CORE\fnc\UPSMON_TRACK.sqf";
[] execvm "Scripts\UPSMON\UPSMON_MAINLOOP.sqf";
[] execvm "Scripts\UPSMON\UPSMON_MAINLOOPCiv.sqf";

//get all mines types
_UPSMON_Minesclassname = [] call UPSMON_getminesclass;
UPSMON_Minestype1 = _UPSMON_Minesclassname select 0; // ATmines
UPSMON_Minestype2 = _UPSMON_Minesclassname select 1; // APmines


_m = createMarker ["DummyUPSMONMarker",[0,0]];
_m setmarkerColor "Colorblack";
_m setMarkerShape "ELLIPSE";
_m setMarkerSize [100,100];
_m setMarkerBrush "Solid";
_m setmarkerAlpha 0;



//Initialization done
UPSMON_INIT=1;
