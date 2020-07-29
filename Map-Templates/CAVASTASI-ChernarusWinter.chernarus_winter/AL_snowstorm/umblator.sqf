// by Alias
// nul = [] execvm "scriptsmisc\umblator.sqf";
params ["_ambient_sounds_al"];

_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
lup_01 = _soundPath + "sound\lup_01.ogg";
lup_02 = _soundPath + "sound\lup_02.ogg";
lup_03 = _soundPath + "sound\lup_03.ogg";
//p_location = ["open","in_da_house","player_car"];

while {al_snowstorm_om} do 
{
// >> you can tweak sleep value if you want to hear ambient sounds more or less often
	sleep 120+random _ambient_sounds_al;
	if (pos_p in ["open","in_da_house","player_car"]) then 
	{
		_natura = selectRandom [lup_01,lup_02,lup_03];
		_relpos = hunt_alias getRelPos [100+random 200,360];
		playSound3D [_natura,"",false,[_relpos#0,_relpos#1,50+random 100],0.2,0.7,2000]
	};
};