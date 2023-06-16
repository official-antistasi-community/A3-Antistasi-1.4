/*
    Author: [Killerswin2]
    Description:
        inits the zeus logging.

    Argument:
	None

    Return Value:
    <nil>

    Scope: scheduled
    Environment: server
    Public: no
    Dependencies:


    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_curatorModules"]


{
	private _logEventId = [];
	_x addEventHandler ["CuratorFeedbackMessage", {
		params ["_curator", "_errorID"];
		ServerInfo_2("Event: CuratorFeedbackMessage, Curator: %1, ErrorID: %2",name player,_errorID);
	}];

	_x addEventHandler ["CuratorGroupDoubleClicked", {
		params ["_curator", "_group"];
		ServerInfo_2("Event: CuratorGroupDoubleClicked, Curator: %1, Group: %2",name player,_group);
	}];

	_x addEventHandler ["CuratorGroupPlaced", {
		params ["_curator", "_group"];
		ServerInfo_2("Event: CuratorGroupPlaced, Curator: %1, Group: %2",name player,_group);
	}];

	_x addEventHandler ["CuratorGroupSelectionChanged", {
		params ["_curator", "_group"];
		ServerInfo_2("Event: CuratorGroupSelectionChanged, Curator: %1, Group: %2",name player,_group);
	}];

	_x addEventHandler ["CuratorMarkerDeleted", {
		params ["_curator", "_marker"];
		ServerInfo_2("Event: CuratorMarkerDeleted, Curator: %1, Marker: %2",name player,_marker);
	}];

	_x addEventHandler ["CuratorMarkerDoubleClicked", {
		params ["_curator", "_marker"];
		ServerInfo_2("Event: CuratorMarkerDoubleClicked, Curator: %1, Marker: %2",name player,_marker);
	}];

	_x addEventHandler ["CuratorMarkerEdited", {
		params ["_curator", "_marker"];
		ServerInfo_2("Event: CuratorMarkerEdited, Curator: %1, Marker: %2",name player,_marker);
	}];

	_x addEventHandler ["CuratorMarkerPlaced", {
		params ["_curator", "_marker"];
		ServerInfo_2("Event: CuratorMarkerPlaced, Curator: %1, Marker: %2",name player,_marker);
	}];

	_x addEventHandler ["CuratorMarkerSelectionChanged", {
		params ["_curator", "_marker"];
		ServerInfo_2("Event: CuratorMarkerSelectionChanged, Curator: %1, Marker: %2",name player,_marker);
	}];

	_x addEventHandler ["CuratorObjectDeleted", {
		params ["_curator", "_entity"];
		ServerInfo_3("Event: CuratorObjectDeleted, Curator: %1, Object: %2, Object Type: %3",name player,_entity,typeOf _entity);
	}];

	_x addEventHandler ["CuratorObjectDoubleClicked", {
		params ["_curator", "_entity"];
		ServerInfo_3("Event: CuratorObjectDoubleClicked, Curator: %1, Object: %2, Object Type: %3",name player,_entity,typeOf _entity);
	}];

	_x addEventHandler ["CuratorObjectEdited", {
		params ["_curator", "_entity"];
		ServerInfo_3("Event: CuratorObjectEdited, Curator: %1, Object: %2, Object Type: %3",name player,_entity,typeOf _entity);
	}];

	_x addEventHandler ["CuratorObjectPlaced", {
		params ["_curator", "_entity"];
		ServerInfo_3("Event: CuratorObjectPlaced, Curator: %1, Object: %2, Object Type: %3",name player,_entity,typeOf _entity);
	}];

	_x addEventHandler ["CuratorObjectSelectionChanged", {
		params ["_curator", "_entity"];
		ServerInfo_3("Event: CuratorObjectSelectionChanged, Curator: %1, Object: %2, Object Type: %3",name player,_entity,typeOf _entity);
	}];

	_x addEventHandler ["CuratorPinged", {
		params ["_curator", "_playerPing"];
		ServerInfo_2("Event: CuratorPinged, Curator: %1, Player: %2",name player,name _playerPing);
	}];

	_x addEventHandler ["CuratorWaypointDeleted", {
		params ["_curator", "_waypoint"];
		ServerInfo_2("Event: CuratorWaypointDeleted, Curator: %1, Waypoint: %2",name player,_waypoint);
	}];

	_x addEventHandler ["CuratorWaypointDoubleClicked", {
		params ["_curator", "_waypoint"];
		ServerInfo_2("Event: CuratorWaypointDoubleClicked, Curator: %1, Waypoint: %2",name player,_waypoint);
	}];

	_x addEventHandler ["CuratorWaypointEdited", {
		params ["_curator", "_waypoint"];
		ServerInfo_2("Event: CuratorWaypointEdited, Curator: %1, Waypoint: %2",name player,_waypoint);
	}];

	_x addEventHandler ["CuratorWaypointPlaced", {
		params ["_curator", "_group", "_waypointID"];
		ServerInfo_3("Event: CuratorWaypointPlaced, Curator: %1, Group: %2, WaypointID: %3",name player,_group,_waypointID);
	}];

	_x addEventHandler ["CuratorWaypointSelectionChanged", {
		params ["_curator", "_waypoint"];
		ServerInfo_2("Event: CuratorWaypointSelectionChanged, Curator: %1, Waypoint: %2",name player,_waypoint);
	}];

} forEach _curatorModules;