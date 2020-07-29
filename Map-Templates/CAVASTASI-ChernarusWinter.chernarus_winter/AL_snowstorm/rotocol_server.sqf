// by ALIAS
params ["_effect_on_objects"];//rotocol = true; publicVariable "rotocol";
while {al_snowstorm_om} do 
{
	snow_gust=selectrandom [["rafala_1",12],["rafala_2",8.5],["rafala_3",17],["rafala_5",13],["rafala_6",16],["rafala_7",13.5]]; publicVariable "snow_gust";
	vit_x = (selectrandom [1,-1])*round(2+random 5); vit_y = (selectrandom [1,-1])*round(2+random 5);	publicVariable "vit_x";publicVariable "vit_y";
	if (_effect_on_objects) then {[vit_x,vit_y] execvm "AL_snowstorm\al_blow_objects.sqf"};
	sleep 60;
};