//handles confiming vehicle selection
HR_GRG_SelectedVehicles params ["_catIndex", "_vehUID", "_class"];
[
    _class
    , HR_GRG_Mounts
    , if (HR_GRG_hasAmmoSource) then {HR_GRG_Pylons} else {nil}
    , HR_GRG_previewVehState
] call HR_GRG_fnc_confirmPlacement;
closeDialog 2;
