// by ALIAS
if (!hasInterface) exitWith {};
if (!isNil {player getVariable "ck_ON"}) exitwith {};
player setVariable ["ck_ON",true];

alias_snow = "Land_HelipadEmpty_F" createVehiclelocal [0,0,0];
//alias_snow = "Sign_Sphere100cm_F" createVehiclelocal [0,0,0];

KK_fnc_inHouse = 
{
	_house = lineIntersectsSurfaces [getPosWorld _this,getPosWorld _this vectorAdd [0,0,50],_this,objNull,true,1,"GEOM","NONE"];
	if (((_house select 0) select 3) isKindOf "house") exitWith	{pos_p = "in_da_house"; cladire = ((_house select 0) select 3); casa= typeOf ((_house select 0) select 3); raza_snow = sizeof casa};
	if ((getPosASL player select 2 < 0)&&(getPosASL player select 2 > -3)) exitWith	{pos_p = "under_water"; alias_snow setPosASL [getPosASL player #0,getPosASL player #1,1]};
	if (getPosASL player select 2 < -3) exitWith {pos_p = "deep_sea"};
	if ((player != vehicle player)&&(getPosASL player select 2 > 0)) exitWith {pos_p = "player_car"; /*alias_snow attachTo [player,[0,0,15]]*/};
	pos_p = "open";
};
while {!isNull player} do {while {al_snowstorm_om} do {player call KK_fnc_inHouse;/* player sideChat (format ["%1",pos_p]);*/ sleep 0.5};waitUntil {sleep 10; al_snowstorm_om}};