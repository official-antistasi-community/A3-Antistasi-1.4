// by ALIAS
params ["_vit_x","_vit_y"];
waitUntil {!isNil "rafala"};
if (rafala) then {
	al_nearobjects = nearestObjects [hunt_alias,[],50];
	ar_obj_eligibl = [];
	{if((_x isKindOf "LandVehicle") or (_x isKindOf "Man") or (_x isKindOf "Air") or (_x isKindOf "Wreck")) then {ar_obj_eligibl pushBack _x;}} foreach al_nearobjects;
	sleep 1;
	if (count ar_obj_eligibl > 0) then {
		_blowobj= selectRandom ar_obj_eligibl;
		_blowobj setvelocity [_vit_x,_vit_y,random 0.1];sleep 0.1;_blowobj setvelocity [_vit_x*1.5,_vit_y*1.5,random 0.1];sleep 0.1; _blowobj setvelocity [wind#0/4,wind#0/4,random 0.1];
	}	
};