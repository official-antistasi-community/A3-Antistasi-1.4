// by ALIAS
if (!hasInterface) exitWith {};
private ["_sik_unit"];
sneeze = true;
while {sneeze} do {
	if (pos_p in ["open","in_da_house","player_car"]) then 
	{
		enableCamShake true;
		if (eyePos player select 2 > 0) then {_tuse = selectRandom ["tuse_1","tuse_2","tuse_3","tuse_4","tuse_5","tuse_6"];_sik_unit=selectrandom allUnits; [_sik_unit,[_tuse,100]] remoteExec ["say3d",0]};
		if (player == _sik_unit) then {addCamShake [5,1,7]}
	};
	sleep 120+random 900;// >> you can tweak sleep value if you want to hear playable units coughing more or less often	
};	