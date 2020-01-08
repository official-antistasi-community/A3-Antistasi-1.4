// by ALIAS
// SNOW STORM SCRIPT DEMO
// Tutorial: https://www.youtube.com/aliascartoons

if (!isServer) exitWith {};
params ["_snowfall","_duration_storm","_ambient_sounds_al","_breath_vapors","_snow_burst","_effect_on_objects","_vanilla_fog","_local_fog","_intensifywind","_unitsneeze"];
[] execVM "AL_snowstorm\alias_hunt.sqf"; waitUntil {!isNil "hunt_alias"};
if (_vanilla_fog) then {al_foglevel = fog; publicVariable "al_foglevel"; 60 setFog [1,0.01,0.5]};
[_duration_storm] spawn {params ["_duration_storm"];al_snowstorm_om=true; publicvariable "al_snowstorm_om"; sleep _duration_storm; al_snowstorm_om=false; publicvariable "al_snowstorm_om"; if (!isNil "al_foglevel") then {60 setFog al_foglevel}};
sleep 5;
["AL_snowstorm\al_check_pos.sqf"] remoteExec ["execVM",0,true];
if (_local_fog) then {["AL_snowstorm\medium_fog.sqf"] remoteExec ["execVM",0,true]};
if (_ambient_sounds_al>0) then {[_ambient_sounds_al] execvm "AL_snowstorm\umblator.sqf"};
if (_breath_vapors) then {["AL_snowstorm\snow_breath.sqf"] remoteExec ["execVM",0,true]};
if (_unitsneeze) then {["AL_snowstorm\al_unit_seeze.sqf"] remoteExec ["execVM",0,true]};
if (_snowfall) then {["AL_snowstorm\alias_snowfall_SFX.sqf"] remoteExec ["execVM",0,true]};
if (_snow_burst>0.5) then {[_effect_on_objects] execvm "AL_snowstorm\rotocol_server.sqf"; interval_burst = _snow_burst; publicVariable "interval_burst"; sleep 10; [[_unitsneeze],"AL_snowstorm\rotocol_client.sqf"] remoteExec ["execVM",0,true]};
if (_intensifywind) then {
	["AL_snowstorm\intens_sound.sqf"] remoteExec ["execVM",0,true];
	al_windlevel	= wind;	for "_i" from 1 to 5 step 0.2 do {setWind [(al_windlevel#0)*_i,(al_windlevel#1)*_i,true]; sleep 4};
	waitUntil {sleep 60; !al_snowstorm_om};
	al_windlevel	= wind;	for "_i" from 1 to 5 step 0.1 do {setWind [(al_windlevel#0)/_i,(al_windlevel#1)/_i,true]; sleep 4};
};
