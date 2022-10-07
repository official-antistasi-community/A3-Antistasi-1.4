/*
Author: [Killerswin2]
	creates the object list that the teamleader has access to.
Arguments:
	None
Return Value:
NONE
Scope: Client
Environment: Unscheduled
Public: 
no
Example:
call A3A_fnc_initTeamLeaderObjects;
*/

A3A_buildableObjects = [
	["Land_BagBunker_Large_F", 50, 15],
	["Land_BagBunker_Small_F", 0, 12],
	["Land_BagBunker_Tower_F", 5, 10],
	["Land_BagFence_Corner_F", 0, 5],
	["Land_BagFence_End_F", 0, 5],
	["Land_BagFence_Long_F", 0, 5],
	["Land_BagFence_Round_F", 0, 5],
	["Land_BagFence_Short_F", 0, 5],
	["Land_PillboxBunker_01_hex_F", 50, 20],
	["Land_Bunker_01_blocks_1_F", 0, 5],
	["Land_Stone_4m_F", 0, 2],
	["Land_Stone_8m_F", 0, 5],
	["Flag_AAF_F", 0, 2]
];

if (A3A_hasCUPCoreMap) then {
	A3A_buildableObjects append [
		["Fortress1", 10, 15],
		["Fortress2", 0, 12],
		["Land_fort_artillery_nest_EP1", 10, 15],
		["Land_fort_rampart_EP1", 0, 10],
		["Land_fortified_nest_small_EP1", 5, 12],
		["Land_Fort_Watchtower_EP1", 5, 10],
		["Land_BagFenceLong", 0, 5],
		["Land_BagFenceEnd", 0, 5],
		["Land_BagFenceShort", 0, 5],
		["Land_BagFenceRound", 0, 5],
		["Land_fortified_nest_big_EP1", 50, 15]
	];
};

if (A3A_hasVN) then {
	A3A_buildableObjects append [
		["Land_vn_b_trench_wall_05_02", 10, 10],
		["Land_vn_b_trench_revetment_90_01", 10, 10],
		["Land_vn_b_trench_revetment_tall_03", 10, 10],
		["Land_vn_b_trench_firing_02", 10, 10],
		["Land_vn_bagfence_01_long_green_f", 0, 5],
		["Land_vn_bagfence_01_short_green_f", 0, 5],
		["Land_vn_bagfence_01_round_green_f", 0, 5],
		["Land_vn_bagfence_01_end_green_f", 0, 5],
		["Land_vn_bagfence_01_corner_green_f", 0, 5]
	];
};


publicVariable "A3A_buildableObjects";