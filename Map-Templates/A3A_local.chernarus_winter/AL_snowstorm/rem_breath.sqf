// by ALIAS
if (!hasInterface) exitWith {};
params ["_alias_breath","_flow"];
drop [["\A3\data_f\ParticleEffects\Universal\Universal",16,12,8,1],"","Billboard",0.15,0.3,[0,0,0],[_flow#0,_flow#1,-0.2],3,1.2,1,0.7,[0.1,.2,.3],[[1,1,1,0.05],[1,1,1,0.2],[1,1,1,0.05]],[0.1],0,0.04,"","AL_snowstorm\al_breath.sqf",_alias_breath,90];
sleep 0.15;
drop [["\A3\data_f\ParticleEffects\Universal\Universal",16,12,8,1],"","Billboard",0.15,0.3,[0,0,0],[_flow#0/2,_flow#1/2,-0.2],3,1.2,1,0.7,[0.1,.2,.3],[[1,1,1,0.05],[1,1,1,0.2],[1,1,1,0]],[0.1],0,0.04,"","",_alias_breath,90];