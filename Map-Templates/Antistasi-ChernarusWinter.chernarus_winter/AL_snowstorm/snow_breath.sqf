// by ALIAS
// Tutorial: https://www.youtube.com/user/aliascartoons
private ["_footmobile","_alias_breath"];
if (!hasInterface) exitWith {};
_alias_breath = "Land_HelipadEmpty_F" createVehiclelocal [0,0,0];
_alias_breath attachto [player,[0,0.2,0],"head"];
while {!isnull player} do 
{
	if ((alive player)&&(eyePos player select 2 > 0)) then 
	{
		_footmobile= player nearEntities ["Man",20];
		_alias_breath attachto [selectrandom _footmobile,[0,0.1,0],"head"];
		_flow = (getposasl _alias_breath vectorFromTo (_alias_breath getRelPos [10,90])) vectorMultiply 0.5;
		drop [["\A3\data_f\ParticleEffects\Universal\Universal",16,12,8,1],"","Billboard",0.15,0.3,[0,0,0],[_flow#0,_flow#1,-0.2],3,1.2,1,0,[0.1,.2,.3],[[1,1,1,0.05],[1,1,1,0.2],[1,1,1,0.05]],[0.1],0,0.04,"","AL_snowstorm\al_breath.sqf",_alias_breath,90];
		sleep 0.15; drop [["\A3\data_f\ParticleEffects\Universal\Universal",16,12,8,1],"","Billboard",0.15,0.3,[0,0,0],[_flow#0/2,_flow#1/2,-0.2],3,1.2,1,0,[0.1,.2,.3],[[1,1,1,0.05],[1,1,1,0.1],[1,1,1,0]],[0.1],0,0.04,"","",_alias_breath,90];
		sleep 5+random 5;
	} else {sleep 10};
};