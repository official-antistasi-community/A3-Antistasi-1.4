_sites = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
_tierWar = 1 + (floor (((5*({(_x in outposts) or (_x in resourcesX) or (_x in citiesX)} count _sites)) + (10*({_x in seaports} count _sites)) + (20*({_x in airportsX} count _sites)))/10));
if (_tierWar > 10) then {_tierWar = 10};
if (_tierWar != tierWar) then
{
	tierWar = _tierWar;
	publicVariable "tierWar";
	[petros,"tier",""] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
	//Updates the vehicles and groups for the sites
	[] call A3A_fnc_updatePreference;
	//[] remoteExec ["A3A_fnc_statistics",[teamPlayer,civilian]];
};
