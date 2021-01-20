// adds all covered vehicles to the blacklist for weapon loading
{
    private _blackList = (_x#1);
    {
        private _model = _x call A3A_fnc_classNameToModel;
        if !(_model isEqualTo "") then {_blackList pushBack _model};
    } forEach A3A_logistics_coveredVehicles;
} forEach A3A_logistics_weapons;

publicVariable "A3A_logistics_vehicleHardpoints";
publicVariable "A3A_logistics_attachmentOffset";
publicVariable "A3A_logistics_coveredVehicles";
publicVariable "A3A_logistics_weapons";
