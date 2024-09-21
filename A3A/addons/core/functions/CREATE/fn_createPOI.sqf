if (!isServer and hasInterface) exitWith{};
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private ["_pos","_veh","_roads","_conquered","_dirVeh","_markerX","_positionX","_vehiclesX","_soldiers","_radiusX","_bunker","_groupE","_unit","_typeGroup","_groupX","_timeLimit","_dateLimit","_dateLimitNum","_base","_dog","_sideX","_cfg","_isFIA","_leave","_isControl","_radiusX","_typeVehX","_typeUnit","_markersX","_frontierX","_uav","_groupUAV","_allUnits","_closest","_winner","_timeLimit","_dateLimit","_dateLimitNum","_size","_base","_mineX","_loser","_sideX"];
private _params = [_pos,_veh,_roads,_conquered,_dirVeh,_markerX,_positionX,_vehiclesX,_soldiers,_radiusX,_bunker,_groupE,_unit,_typeGroup,_groupX,_timeLimit,_dateLimit,_dateLimitNum,_base,_dog,_sideX,_cfg,_isFIA,_leave,_isControl,_radiusX,_typeVehX,_typeUnit,_markersX,_frontierX,_uav,_groupUAV,_allUnits,_closest,_winner,_timeLimit,_dateLimit,_dateLimitNum,_size,_base,_mineX,_loser,_sideX];

private _A3A_fnc_POI_Battle = { 
	#include "..\POI\poi_CivPolBattle.sqf"
};


private _invaderEvents = [];
private _militaryEvents = [];
private _militiaEvents = [];
private _policeEvents = [];
private _civilianEvents = [];
private _rebelEvents = [];

//private _eventType = ["INVADER", "MILITARY", "MILITIA", "POLICE", "CIV", "REBEL"];
private _eventType = "REBEL";
private _eventFunc = _A3A_fnc_POI_Battle;

switch (_eventType) do {
	case "INVADER": {};
	case "MILITARY": {};
	case "MILITIA": {};
	case "POLICE": {};
	case "CIV": {};
	case "REBEL": {
		_params call _eventFunc;
	};
};
