private ["_typeX","_positionTel","_nearX","_garrison","_costs","_hr","_size"];
_typeX = _this select 0;

if (_typeX == "add") then {hint "Select a zone to add garrisoned troops"} else {hint "Select a zone to remove it's Garrison"};

if (!visibleMap) then {openMap true};
positionTel = [];

onMapSingleClick "positionTel = _pos;";

waitUntil {sleep 1; (count positionTel > 0) or (not visiblemap)};
onMapSingleClick "";

if (!visibleMap) exitWith {};

_positionTel = positionTel;
positionXGarr = "";

_nearX = [markersX,_positionTel] call BIS_fnc_nearestPosition;
_positionX = getMarkerPos _nearX;

if (getMarkerPos _nearX distance _positionTel > 40) exitWith {hint "You must click near a marked zone"; _nul=CreateDialog "build_menu";};

if (not(sidesX getVariable [_nearX,sideUnknown] == rebelSide)) exitWith {hint format ["That zone does not belong to %1",rebelFactionName]; _nul=CreateDialog "build_menu";};
if ([_positionX,500] call A3A_fnc_enemyNearCheck) exitWith {hint "You cannot manage this garrison while there are enemies nearby";_nul=CreateDialog "build_menu"};
//if (((_nearX in rebelWatchpostsAndRoadblocks) and !(isOnRoad _positionX)) /*or (_nearX in citiesX)*/ or (_nearX in controlsX)) exitWith {hint "You cannot manage garrisons on this kind of zone"; _nul=CreateDialog "garrison_menu"};
_rebelOutpost = if (_nearX in rebelWatchpostsAndRoadblocks) then {true} else {false};
_wPost = if (_rebelOutpost and !(isOnRoad getMarkerPos _nearX)) then {true} else {false};
_garrison = if (! _wpost) then {garrison getVariable [_nearX,[]]} else {rebelSniper};

if (_typeX == "rem") then
	{
	if ((count _garrison == 0) and !(_nearX in rebelWatchpostsAndRoadblocks)) exitWith {hint "The place has no garrisoned troops to remove"; _nul=CreateDialog "build_menu";};
	_costs = 0;
	_hr = 0;
	{
	if (_x == rebelStaticCrew) then {if (_rebelOutpost) then {_costs = _costs + ([rebelVehLiteArmed] call A3A_fnc_vehiclePrice)} else {_costs = _costs + ([rebelMortar] call A3A_fnc_vehiclePrice)}};
	_hr = _hr + 1;
	_costs = _costs + (server getVariable [_x,0]);
	} forEach _garrison;
	[_hr,_costs] remoteExec ["A3A_fnc_rebelResources",2];
	if (_rebelOutpost) then
		{
		garrison setVariable [_nearX,nil,true];
		rebelWatchpostsAndRoadblocks = rebelWatchpostsAndRoadblocks - [_nearX]; publicVariable "rebelWatchpostsAndRoadblocks";
		markersX = markersX - [_nearX]; publicVariable "markersX";
		deleteMarker _nearX;
		sidesX setVariable [_nearX,nil,true];
		}
	else
		{
		garrison setVariable [_nearX,[],true];
		//[_nearX] call A3A_fnc_mrkUpdate;
		//[_nearX] remoteExec ["tempMoveMrk",2];
		{if (_x getVariable ["markerX",""] == _nearX) then {deleteVehicle _x}} forEach allUnits;
		};
	[_nearX] call A3A_fnc_mrkUpdate;
	hint format ["Garrison removed\n\nRecovered Money: %1 €\nRecovered HR: %2",_costs,_hr];
	_nul=CreateDialog "build_menu";
	}
else
	{
	positionXGarr = _nearX;
	publicVariable "positionXGarr";
	hint format ["Info%1",[_nearX] call A3A_fnc_garrisonInfo];
	closeDialog 0;
	_nul=CreateDialog "garrison_recruit";
	sleep 1;
	disableSerialization;

	_display = findDisplay 100;

	if (str (_display) != "no display") then
		{
		_ChildControl = _display displayCtrl 104;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable (rebelLiteAT select 0)];
		_ChildControl = _display displayCtrl 105;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable (rebelHeavyGunner select 0)];
		_ChildControl = _display displayCtrl 126;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable (rebelMedic select 0)];
		_ChildControl = _display displayCtrl 107;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable (rebelSquadLeader select 0)];
		_ChildControl = _display displayCtrl 108;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",(server getVariable rebelStaticCrew) + ([rebelMortar] call A3A_fnc_vehiclePrice)];
		_ChildControl = _display displayCtrl 109;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable (rebelGrenadier select 0)];
		_ChildControl = _display displayCtrl 110;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable (rebelSniper select 0)];
		_ChildControl = _display displayCtrl 111;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable (rebelAT select 0)];
		};
	};