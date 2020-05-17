if (_this select 0) then {
	[] call A3A_fnc_loadPlayer;
}
else {
	player setVariable ["score",0,true];
	player setVariable ["moneyX",95,true];
	player setUnitRank "PRIVATE";
	player setVariable ["rankX",rank player,true];
};