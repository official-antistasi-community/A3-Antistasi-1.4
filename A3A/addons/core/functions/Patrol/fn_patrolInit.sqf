/*
    Author: [Hazey]
    Description:
		PATCOM Init, starts the Patrol Commander Logic

    Arguments:
    	N/A

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[] call A3A_fnc_patrolInit;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

PATCOM_DEBUG = false; // Enable PATCOM specific debug.
publicVariable "PATCOM_DEBUG";

PATCOM_VISUAL_RANGE = 400; // How far should PATCOM look for Enemies.
publicVariable "PATCOM_VISUAL_RANGE";

PATCOM_ARTILLERY_MANAGER = true;
publicVariable "PATCOM_ARTILLERY_MANAGER";

PATCOM_ARTILLERY_DELAY = 60;
publicVariable "PATCOM_ARTILLERY_DELAY";

// This Hashmap acts as a blacklist to remove unwanted buildings
PATCOM_Building_Blacklist = createHashMap;

// Get bad buildings from VarsCommon
{
	PATCOM_Building_Blacklist set [_x, "REMOVED"];
} forEach bld_remove;

publicVariable "PATCOM_Building_Blacklist";

// This HashMap contains a list of valid garrison positions.
PATCOM_Garrison_Positions = createHashMap;

// ALTIS
PATCOM_Garrison_Positions set ["Land_Cargo_HQ_V1_F", [6,7,8]];
PATCOM_Garrison_Positions set ["Land_Cargo_HQ_V2_F", [6,7,8]];
PATCOM_Garrison_Positions set ["Land_Cargo_HQ_V3_F", [6,7,8]];
PATCOM_Garrison_Positions set ["Land_Medevac_HQ_V1_F", [6,7,8]];
PATCOM_Garrison_Positions set ["Land_Cargo_Tower_V3_F", [15,12,8]];
PATCOM_Garrison_Positions set ["Land_Cargo_Tower_V2_F", [15,12,8]];
PATCOM_Garrison_Positions set ["Land_Cargo_Tower_V1_F", [15,12,8]];
PATCOM_Garrison_Positions set ["Land_Cargo_Patrol_V1_F", [1,0]];
PATCOM_Garrison_Positions set ["Land_Cargo_Patrol_V2_F", [1,0]];
PATCOM_Garrison_Positions set ["Land_Cargo_Patrol_V3_F", [1,0]];
PATCOM_Garrison_Positions set ["Land_CarService_F", [2,5]];

// TANOA
PATCOM_Garrison_Positions set ["Land_u_Barracks_V2_F", [36,37,35,34,32,33,40,44]];
PATCOM_Garrison_Positions set ["Land_i_Barracks_V1_F", [36,37,35,34,32,33,40,44]];
PATCOM_Garrison_Positions set ["Land_i_Barracks_V2_F", [36,37,35,34,32,33,40,44]];
PATCOM_Garrison_Positions set ["Land_BagBunker_Small_F", [2,3]];
PATCOM_Garrison_Positions set ["Land_Barracks_01_dilapidated_F", [0,34,1,18,17,35,36,37,10,11,12,13,14,15,16,19,20,2,3,4,5,6,7,8,9,21,22,23,24,25,26,27,28,29,30,31,32]];
PATCOM_Garrison_Positions set ["Land_BagBunker_01_large_green_F", [1,3,5,0,11,12,6,4,2,7,8,9,10]];
PATCOM_Garrison_Positions set ["Land_BagBunker_01_small_green_F", [2,3]];
PATCOM_Garrison_Positions set ["Land_Cargo_House_V4_F", [1]];
PATCOM_Garrison_Positions set ["Land_Cargo_HQ_V4_F", [2,3,4,5,6,7,8,9,10,11,12,13]];
PATCOM_Garrison_Positions set ["Land_Cargo_Patrol_V4_F", [1,2]];
PATCOM_Garrison_Positions set ["Land_Cargo_Tower_V4_F", [0,5,3,4,6,7,17,1,16,12,13,15,1,2,8,9,10,11,14]];
PATCOM_Garrison_Positions set ["Land_PillboxBunker_01_big_F", [2,0,3,1,4,5]];
PATCOM_Garrison_Positions set ["Land_PillboxBunker_01_hex_F", [0,2,3,1,4]];
PATCOM_Garrison_Positions set ["Land_PillboxBunker_01_rectangle_F", [2,3,4]];

// CHERNARUS
//PATCOM_Garrison_Positions set ["", []];
PATCOM_Garrison_Positions set ["Land_GuardTower_01_F", [2,3,4,5]];
PATCOM_Garrison_Positions set ["Land_GuardTower_02_F", [0]];
PATCOM_Garrison_Positions set ["Land_Radar_01_HQ_F", [30,31,32,33,34,35]];
PATCOM_Garrison_Positions set ["land_bunker_garage", [17,13,16,15,14,18]];
PATCOM_Garrison_Positions set ["Land_GuardHouse_03_F", [1,2]];
PATCOM_Garrison_Positions set ["Land_DeerStand_01_F", [1]];
PATCOM_Garrison_Positions set ["Land_DeerStand_02_F", [2]];
PATCOM_Garrison_Positions set ["Land_Sawmill_01_illuminati_tower_F", [0]];
PATCOM_Garrison_Positions set ["Land_Nasypka", [3]];
PATCOM_Garrison_Positions set ["Land_Ind_TankBig", [2,3,4,5,6,7]];
PATCOM_Garrison_Positions set ["Land_Ind_Expedice_1", [7,8,10,6,13,12,11]];
PATCOM_Garrison_Positions set ["Land_A_Office01", [0,1,8,6,9]];
PATCOM_Garrison_Positions set ["Land_A_Crane_02b", [7,1]];
PATCOM_Garrison_Positions set ["Land_A_Crane_02a", [2,3,4,5,6,7]];
PATCOM_Garrison_Positions set ["Land_A_CraneCon", [1,2,3]];
PATCOM_Garrison_Positions set ["Land_A_MunicipalOffice", [15,17,10,9,11,12,13,14]];
PATCOM_Garrison_Positions set ["Land_Smokestack_01_F", [5,6,4]];
PATCOM_Garrison_Positions set ["Land_ControlTower_02_F", [10,9,13,12,8,1]];
PATCOM_Garrison_Positions set ["Land_ServiceHangar_01_L_F", [10,11]];
PATCOM_Garrison_Positions set ["Land_ServiceHangar_01_L_F", [10,9,8]];
PATCOM_Garrison_Positions set ["Land_MobileRadar_01_radar_F", [0,1,2,3,4]];
PATCOM_Garrison_Positions set ["Land_dp_bigTank_F", [0,5,4,3,2,1]];
PATCOM_Garrison_Positions set ["Land_Ind_SiloVelke_01", [7,3,1,4,5,2,6]];
PATCOM_Garrison_Positions set ["Land_Ind_Mlyn_01", [9,5,7,6,4,3]];

publicVariable "PATCOM_Garrison_Positions";

PATCOM_Patrol_Animations = [
	"acts_rifle_operations_back",
	"acts_rifle_operations_barrel",
	"acts_rifle_operations_checking_chamber",
	"acts_rifle_operations_front",
	"acts_rifle_operations_right",
	"acts_rifle_operations_left",
	"acts_rifle_operations_zeroing",
	"acts_ambient_cleaning_nose",
	"acts_ambient_gestures_sneeze",
	"acts_ambient_gestures_tired",
	"acts_ambient_gestures_yawn",
	"acts_ambient_picking_up",
	"acts_ambient_relax_1",
	"acts_ambient_relax_2",
	"acts_ambient_relax_3",
	"acts_ambient_relax_4",
	"acts_ambient_rifle_drop",
	"acts_ambient_shoelaces",
	"acts_ambient_stretching",
	"acts_shieldfromsun_in"
];

publicVariable "PATCOM_Patrol_Animations";

[] spawn {
	while {true} do {
		PATCOM_AI_LOAD = (count allunits);
		publicVariable "PATCOM_AI_LOAD";
		sleep 30;
	};
};

PATCOM_INIT_COMPLETE = true;
publicVariable "PATCOM_INIT_COMPLETE";

Info("PATCOM | Init Complete");