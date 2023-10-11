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

if(A3A_buildableObjects isEqualTo []) then 
{
    // classname, price, holdtime
    A3A_buildableObjects = [
        ["Land_BagBunker_Large_F", 100, 15],
        ["Land_BagBunker_Small_F", 50, 12],
        ["Land_BagBunker_Tower_F", 75, 10],
        ["Land_BagFence_Corner_F", 5, 5],
        ["Land_BagFence_End_F", 5, 5],
        ["Land_BagFence_Long_F", 10, 5],
        ["Land_BagFence_Round_F", 5, 5],
        ["Land_BagFence_Short_F", 5, 5],
        ["Land_PillboxBunker_01_hex_F", 50, 20],
        ["Land_Bunker_01_blocks_1_F", 50, 5],
        ["Land_Stone_4m_F", 5, 2],
        ["Land_Stone_8m_F", 5, 5]
    ];
};

//A3A_buildableObjects append [[A3A_faction_reb get "flag", 0, 2]];
