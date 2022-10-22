#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (isRemoteExecuted and remoteExecutedOwner != owner A3A_setupPlayer) exitWith {
    Error_1("Wrong player (%1) attempted to start game, ignoring", remoteExecutedOwner);
};

params ["_saveData"];
Info_1("startGame called with data %1", _saveData);

// savedata sanity checks could go here 



// Save to global to trigger init progression and for later save operations
A3A_saveData = _saveData;

// Throw message if background init isn't done
if (isNil "A3A_backgroundInitDone") then {
    Info("Waiting for background init to complete");
    [localize "STR_A3A_feedback_serverinfo", localize "STR_A3A_feedback_serverinfo_background"] remoteExec ["A3A_fnc_customHint", 0];
};
