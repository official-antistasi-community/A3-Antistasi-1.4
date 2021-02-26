//handles confiming vehicle selection
HR_GRG_SelectedVehicles params ["_catIndex", "_vehUID", "_class"];

//get mounts state
HR_GRG_Mounts apply {
    private _static = (HR_GRG_Vehicles#4) get (_x#1);
    _x pushBack (_static#4);
    _x
};

[
    _class
    , HR_GRG_Mounts
    , if (
            HR_GRG_Pylons_Enabled //Pylon editing enabled
            && { HR_GRG_hasAmmoSource } //or ammo source registered
    ) then {HR_GRG_Pylons} else {nil}
    , HR_GRG_previewVehState
] call HR_GRG_fnc_confirmPlacement;
closeDialog 2;
