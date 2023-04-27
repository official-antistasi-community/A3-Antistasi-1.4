/*
    Author: [Killerswin2]
    Description:
        logs all the stuff that zeus is doing

    Argument: 
	0: event params
	1: event name

    Return Value:
    <nil>

    Scope: scheduled
    Environment: server
    Public: Yes
    Dependencies:

    Example:
	[_this, "CuratorWaypointSelectionChanged", player] remoteExec ["A3A_fnc_zeusLogging", 2];

    License: MIT License
*/

#include "..\..\script_component.hpp"

if(!isServer) exitwith {Error("None Server Called Zues Logging!")};

params ["_eventParams", "_eventName", "_player"];

switch (_eventName) do {
	case "CuratorFeedbackMessage": {
		_eventParams params ["_curator", "_errorID"];
		Info_2("Event: CuratorFeedbackMessage, Curator: %1, ErrorID: %2",name _player,_errorID);
	};
	case "CuratorGroupDoubleClicked": {
		_eventParams params ["_curator", "_group"];
		Info_2("Event: CuratorGroupDoubleClicked, Curator: %1, Group: %2",name _player,_group);
	};
	case "CuratorGroupPlaced": {
		_eventParams params ["_curator", "_group"];
		Info_2("Event: CuratorGroupPlaced, Curator: %1, Group: %2",name _player,_group);
	};
	case "CuratorGroupSelectionChanged": {
		_eventParams params ["_curator", "_group"];
		Info_2("Event: CuratorGroupSelectionChanged, Curator: %1, Group: %2",name _player,_group);
	};
	case "CuratorMarkerDeleted": {
		_eventParams params ["_curator", "_marker"];
		Info_2("Event: CuratorMarkerDeleted, Curator: %1, Marker: %2",name _player,_marker);
	};
	case "CuratorMarkerDoubleClicked": {
		_eventParams params ["_curator", "_marker"];
		Info_2("Event: CuratorMarkerDoubleClicked, Curator: %1, Marker: %2",name _player,_marker);
	};
	case "CuratorMarkerEdited": {
		_eventParams params ["_curator", "_marker"];
		Info_2("Event: CuratorMarkerEdited, Curator: %1, Marker: %2",name _player,_marker);
	};
	case "CuratorMarkerPlaced": {
		_eventParams params ["_curator", "_marker"];
		Info_2("Event: CuratorMarkerPlaced, Curator: %1, Marker: %2",name _player,_marker);
	};
	case "CuratorMarkerSelectionChanged": {
		_eventParams params ["_curator", "_marker"];
		Info_2("Event: CuratorMarkerSelectionChanged, Curator: %1, Marker: %2",name _player,_marker);
	};
	case "CuratorObjectDeleted": {
		_eventParams params ["_curator", "_entity"];
		Info_3("Event: CuratorObjectDeleted, Curator: %1, Object: %2, Object Type: %3",name _player,_entity,typeOf _entity);
	};
	case "CuratorObjectDoubleClicked": {
		_eventParams params ["_curator", "_entity"];
		Info_3("Event: CuratorObjectDoubleClicked, Curator: %1, Object: %2, Object Type: %3",name _player,_entity,typeOf _entity);
	};
	case "CuratorObjectEdited": {
		_eventParams params ["_curator", "_entity"];
		Info_3("Event: CuratorObjectEdited, Curator: %1, Object: %2, Object Type: %3",name _player,_entity,typeOf _entity);
	};
	case "CuratorObjectPlaced": {
		_eventParams params ["_curator", "_entity"];
		Info_3("Event: CuratorObjectPlaced, Curator: %1, Object: %2, Object Type: %3",name _player,_entity,typeOf _entity);
	};
	case "CuratorObjectRegistered": {
		_eventParams params ["_curator", "_input"];
		// don't log this, the array can be long
		//Info_2("Event: CuratorObjectRegistered, Curator: %1, Object: %2",name _player,_input);
	};
	case "CuratorObjectSelectionChanged": {
		_eventParams params ["_curator", "_entity"];
		Info_3("Event: CuratorObjectSelectionChanged, Curator: %1, Object: %2, Object Type: %3",name _player,_entity,typeOf _entity);
	};
	case "CuratorPinged": {
		_eventParams params ["_curator", "_playerPing"];
		Info_2("Event: CuratorPinged, Curator: %1, Player: %2",name _player,name _playerPing);
	};
	case "CuratorWaypointDeleted": {
		_eventParams params ["_curator", "_waypoint"];
		Info_2("Event: CuratorWaypointDeleted, Curator: %1, Waypoint: %2",name _player,_waypoint);
	};
	case "CuratorWaypointDoubleClicked": {
		_eventParams params ["_curator", "_waypoint"];
		Info_2("Event: CuratorWaypointDoubleClicked, Curator: %1, Waypoint: %2",name _player,_waypoint);
	};
	case "CuratorWaypointEdited": {
		_eventParams params ["_curator", "_waypoint"];
		Info_2("Event: CuratorWaypointEdited, Curator: %1, Waypoint: %2",name _player,_waypoint);
	};
	case "CuratorWaypointPlaced": {
		_eventParams params ["_curator", "_group", "_waypointID"];
		Info_3("Event: CuratorWaypointPlaced, Curator: %1, Group: %2, WaypointID: %3",name _player,_group,_waypointID);
	};
	case "CuratorWaypointSelectionChanged": {
		_eventParams params ["_curator", "_waypoint"];
		Info_2("Event: CuratorWaypointSelectionChanged, Curator: %1, Waypoint: %2",name _player,_waypoint);
	};
	default { };
};
