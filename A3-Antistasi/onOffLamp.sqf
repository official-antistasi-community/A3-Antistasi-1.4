_tipoFuego = if (typeOf fuego == "Land_Camping_Light_F") then {"Land_Camping_Light_off_F"} else {"Land_Camping_Light_F"};
_pos = getPos fuego;
deleteVehicle fuego;
fuego = createVehicle [_tipoFuego,_pos, [], 0, "CAN_COLLIDE"];
publicVariable "fuego";
fuego allowDamage false;
[fuego,"fuego"] remoteExec ["A3A_fnc_flagaction",[buenos,civilian]];

