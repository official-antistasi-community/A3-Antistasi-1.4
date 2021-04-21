_veh addEventHandler
[
    "Fired",
    {
        params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
        _projectile spawn
        {
            sleep 0.05;

            private _smoke = "SmokeShell_Infinite" createVehicle (getPos _this);
            _smoke attachTo [_this, [0, -1, 0]];

            waitUntil {sleep 0.1; !(alive _this)};
            deleteVehicle _smoke;
        };
    }
];
