#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {}; //only run on server
if !( isClass (missionConfigFile/"A3A") ) exitWith { false }; //not an antistasi mission
// Now it just types stuff into .rpt
diag_log "[ASMS] Info: AntistasiServerMembers: addon has been loaded";

// For compatibility reasons
AS_fnc_getExternalMemberListUIDs = FUNC(getExternalMemberListUIDs);

// Add mission event handler
addMissionEventHandler ["PlayerConnected", FUNC(onPlayerConnected)];
