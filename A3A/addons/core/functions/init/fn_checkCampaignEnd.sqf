/*
Maintainer: Tiny
    Checks current server variables to see if a win or loss is in order, and executes immediately.
	If future changes are made to the win/loss routine, they should be done here.
	This check is run in three places: 
		invaderPunish (to check for loss when a town is destroyed)
		markerChange (to check for win on airbase capture)
		resourceCheck (if either previous check messes up, or in the edge case that 50% support is achieved after all airbases)
Scope: Server
Environment: Scheduled

Arguments:
    None
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

sleep 5; //This lets players have a few seconds after an event before the win/loss screen shows

private _popReb = 0;
private _popGov = 0;
private _popKilled = 0;
private _popTotal = 0;

{
	private _city = _x;
	private _cityData = server getVariable _city;
	_cityData params ["_numCiv", "_numVeh", "_supportGov", "_supportReb"];	
	_popTotal = _popTotal + _numCiv;
	if (_city in destroyedSites) then { _popKilled = _popKilled + _numCiv} else 
	{
	_popReb = _popReb + (_numCiv * (_supportReb / 100));
	_popGov = _popGov + (_numCiv * (_supportGov / 100)); // support only matters if the city isnt destroyed
	};
} forEach citiesX;

Info(format["fn_checkCampaignEnd | Total Pop: %1, Dead Pop: %2, Rebel Support: %3, Gov Support: %4"]);

if (_popKilled > (_popTotal / 3)) then {
	isNil { ["ended", true] call A3A_fnc_writebackSaveVar };
	["destroyedSites",false,true] remoteExec ["BIS_fnc_endMission"];
};
if ((_popReb > _popGov) and ({sidesX getVariable [_x,sideUnknown] == teamPlayer} count airportsX == count airportsX)) then {
	isNil { ["ended", true] call A3A_fnc_writebackSaveVar };
	["end1",true,true,true,true] remoteExec ["BIS_fnc_endMission",0];
};