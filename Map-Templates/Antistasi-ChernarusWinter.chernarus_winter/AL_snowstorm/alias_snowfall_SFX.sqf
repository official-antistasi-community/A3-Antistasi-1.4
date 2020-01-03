// by ALIAS
// Tutorial: https://www.youtube.com/user/aliascartoons

if (!hasInterface) exitWith {};

waitUntil {!isNil "pos_p"};
//al_snow =true; pos_p = "open";
while {al_snowstorm_om} do 
{
	if (pos_p=="open") then 
	{
		_fulg_nea  = "#particlesource" createVehiclelocal getposaTL player;
		_fulg_nea setParticleCircle [0,[0,0,0]];
		_fulg_nea setParticleRandom [0,[20,20,9],[0,0,0],0,0.1,[0,0,0,0.1],0,0];
		_fulg_nea setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8,1],"","Billboard",1,7,[0,0,10],[0,0,0],3,1.7,1,1,[0.1],[[1,1,1,1]],[1],0.3,1,"","",player];
		_fulg_nea setDropInterval 0.005;
		waitUntil {pos_p!="open"};
		deleteVehicle _fulg_nea;
	};
	if (pos_p=="player_car") then 
	{
		_fulg_nea  = "#particlesource" createVehiclelocal getposaTL player;
		_fulg_nea setParticleCircle [0,[0,0,0]];
		_fulg_nea setParticleRandom [0,[20,20,9],[0,0,0],0,0.1,[0,0,0,0.1],0,0];
		_fulg_nea setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8,1],"","Billboard",1,7,[0,0,10],[0,0,0],3,1.7,1,1,[0.1],[[1,1,1,1]],[1],0.3,1,"","",player];
		_fulg_nea setDropInterval 0.005;
		waitUntil {pos_p!="player_car"};
		deleteVehicle _fulg_nea;	
/*	
		_fulg_nea  = "#particlesource" createVehiclelocal getposasl alias_snow;
		_fulg_nea setParticleCircle [20,[0,0,0]];
		_fulg_nea setParticleRandom [0,[5,5,1],[0,0,0],0,0.1,[0,0,0,0.1],0,0];
		_fulg_nea setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8,1],"","Billboard",1,6,[0,0,0],[0,0,0],3,1.5,1,0,[0.1],[[1,1,1,1]],[1],1,0,"","",alias_snow];
		_fulg_nea setDropInterval 0.005;		
		waitUntil {pos_p!="player_car"};
		deleteVehicle _fulg_nea;
*/
	};
	if (pos_p=="under_water") then  
	{
		_fulg_nea  = "#particlesource" createVehiclelocal getposasl alias_snow;
		_fulg_nea setParticleCircle [0,[0,0,0]];
		_fulg_nea setParticleRandom [0,[25,25,0],[0,0,0],0,0.1,[0,0,0,0.1],1,1];
		_fulg_nea setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8,1],"","Billboard",1,4,[0,0,15],[0,0,0],3,2,1,0.7,[0.1],[[1,1,1,1]],[1],1,1,"","",alias_snow];
		_fulg_nea setDropInterval 0.005;
		waitUntil {pos_p!="under_water"};
		deleteVehicle _fulg_nea;
	};
	if (pos_p=="deep_sea") then {waitUntil {pos_p!="deep_sea"}};
	if (pos_p=="in_da_house") then
	{
		_fulg_nea_1  = "#particlesource" createVehiclelocal getposATL cladire;
		_fulg_nea_1 setParticleCircle [raza_snow,[0,0,0]];
		_fulg_nea_1 setParticleRandom [0,[5,5,0],[0,0,0],0,0,[0,0,0,0],0,0.5];
		_fulg_nea_1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8,1],"","Billboard",1,0.2,[0,0,1],[0,0,0],3,2,1,0,[0.1],[[1,1,1,1]],[1],0,1,"","AL_snowstorm\snow_drop.sqf",cladire,0,true];
		_fulg_nea_1 setDropInterval 0.01;		
		waitUntil {pos_p!="in_da_house"};
		deleteVehicle _fulg_nea_1;
	};	
};
//al_snow =false; pos_p = "open";