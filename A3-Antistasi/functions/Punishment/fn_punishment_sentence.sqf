params["_detainee"];
_punishmentPlatform = createVehicle ["Land_Sun_chair_green_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_punishmentPlatform enableSimulation false;
_detainee setVariable ["punishment_platform",_punishmentPlatform,true];

_pos2D = [random 100,random 100];

_punishmentPlatform setPos [_pos2D select 0, _pos2D select 1, -0.25];
_detainee setPos [_pos2D select 0, _pos2D select 1, 0.25];