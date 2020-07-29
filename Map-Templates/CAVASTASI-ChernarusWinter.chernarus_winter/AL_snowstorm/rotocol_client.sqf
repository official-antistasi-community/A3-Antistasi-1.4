// by ALIAS
// Tutorial: https://www.youtube.com/user/aliascartoons

if (!hasInterface) exitWith {};
params ["_unit_cold"];
if (_unit_cold) then {player_act_cold = true} else {player_act_cold = false};
while {al_snowstorm_om} do 
{
	if ((pos_p=="open")&&(player == hunt_alias)) then 
	{
		rafala = true; publicVariable "rafala";
		_pozitie_x = (selectrandom [1,-1])*round(random 50); _pozitie_y = (selectrandom [1,-1])*round(random 50);
		[[_pozitie_x,_pozitie_y],"AL_snowstorm\al_trembling.sqf"] remoteExec ["execVM",0];
		sleep (snow_gust#1);
		rafala = false; publicVariable "rafala";
	};
	sleep 20+random interval_burst;
};