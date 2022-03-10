#include "\a3\ui_f\hpp\defineResincl.inc";

if (!hasInterface) exitWith {};

if (!canSuspend) exitWith {
    [] spawn A3A_fnc_NGSA_mainDialog;
};

waitUntil {
    uiSleep 0.5;
    !isNull findDisplay IDD_MAIN_MAP && !isNull findDisplay IDD_MISSION;
};

if !(createDialog "A3A_NGSA_startup_dialogue") exitWith {
    ["CreateDialogFailed","Failed to create A3A_NGSA_startup_dialogue.",false,500] call A3A_fnc_customHint;
    [];
};
