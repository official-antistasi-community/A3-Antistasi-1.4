/*
Author: [Killerswin2]
    creates the buildable object list on clients.
Arguments:
    None
Return Value:
NONE
Scope: Client
Environment: Unscheduled
Public: 
no
Example:
call A3A_fnc_initBuildableObjects;
*/

private _mapInfo = missionConfigFile/"A3A"/"mapInfo"/toLower worldName;
if (!isClass _mapInfo) then {_mapInfo = configFile/"A3A"/"mapInfo"/toLower worldName};
A3A_buildableObjects = getArray (_mapInfo/"buildObjects");


// Vanilla terrain-coloured objects
if (A3A_climate == "arid") then {
    A3A_buildableObjects append [
        ["Land_BagBunker_Large_F", 300],
        ["Land_BagBunker_Tower_F", 300],
        ["Land_BagBunker_Small_F", 50],
//        ["Land_BagFence_Corner_F", 5],
//        ["Land_BagFence_End_F", 5],
        ["Land_BagFence_Long_F", 10],
        ["Land_BagFence_Round_F", 10],
        ["Land_BagFence_Short_F", 10]];
} else {
    A3A_buildableObjects append [
        ["Land_BagBunker_01_large_green_F", 300],
        ["Land_HBarrier_01_tower_green_F", 300],
        ["Land_BagBunker_01_small_green_F", 50],
//        ["Land_BagFence_01_end_green_F", 5],
//        ["Land_BagFence_01_corner_green_F", 5],
        ["Land_BagFence_01_short_green_F", 10],
        ["Land_BagFence_01_round_green_F", 10],
        ["Land_BagFence_01_long_green_F", 10]];
};

// Non-camo vanilla stuff, should kinda work anywhere
A3A_buildableObjects append [
// Not inclined to let players make high opaque walls
//        ["Land_Bunker_01_blocks_1_F", 50],
//        ["Land_Stone_4m_F", 40],
//        ["Land_Stone_8m_F", 80],
    ["Land_SandbagBarricade_01_half_F", 20],
    ["Land_SlumWall_01_s_2m_F", 5],
    ["Land_PillboxBunker_01_hex_F", 200],
    ["Land_Barricade_01_4m_F", 30],
    ["Land_GuardBox_01_brown_F", 80],
    ["Land_Tyres_F", 10]];


//A3A_buildableObjects append [[A3A_faction_reb get "flag", 0, 2]];
