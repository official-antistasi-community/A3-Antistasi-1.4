// adds all covered vehicles to the blacklist for weapon loading
{
    private _blackList = (_x#1);
    {
        private _model = _x call A3A_fnc_classNameToModel;
        if !(_model isEqualTo "") then {_blackList pushBack _model};
    } forEach logistics_coveredVehicles;
} forEach logistics_weapons;

publicVariable "logistics_vehicleHardpoints";
publicVariable "logistics_attachmentOffset";
publicVariable "logistics_coveredVehicles";
publicVariable "logistics_weapons";
