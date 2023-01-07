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

private _mapInfo = missionConfigFile/"A3A"/"mapInfo"/toLower worldName;
if (!isClass _mapInfo) then {_mapInfo = configFile/"A3A"/"mapInfo"/toLower worldName};
private _buildObjects = getArray (_mapInfo/"buildObjects");

// classname, price, holdtime
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

A3A_buildableObjects append _buildObjects;


publicVariable "A3A_buildableObjects";