/*
    Author: [Killerswin2]
    Description:
        inits the zues logging.

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

private _curatorModules = allCurators;


{
	_x addEventHandler ["CuratorFeedbackMessage", {
		[_this, "CuratorFeedbackMessage", player] remoteExec ["A3A_fnc_zuesLogging", 2];
	}];

	_x addEventHandler ["CuratorGroupDoubleClicked", {
		[_this, "CuratorGroupDoubleClicked", player] remoteExec ["A3A_fnc_zuesLogging", 2];
	}];

	_x addEventHandler ["CuratorGroupPlaced", {
		[_this, "CuratorGroupPlaced", player] remoteExec ["A3A_fnc_zuesLogging", 2];
	}];

	_x addEventHandler ["CuratorGroupSelectionChanged", {
		[_this, "CuratorGroupSelectionChanged", player] remoteExec ["A3A_fnc_zuesLogging", 2];
	}];

	_x addEventHandler ["CuratorMarkerDeleted", {
		params ["_curator", "_marker"];
		[_this, "CuratorMarkerDeleted", player] remoteExec ["A3A_fnc_zuesLogging", 2];
	}];

	_x addEventHandler ["CuratorMarkerDoubleClicked", {
		[_this, "CuratorMarkerDoubleClicked", player] remoteExec ["A3A_fnc_zuesLogging", 2];
	}];

	_x addEventHandler ["CuratorMarkerEdited", {
		[_this, "CuratorMarkerEdited", player] remoteExec ["A3A_fnc_zuesLogging", 2];
	}];

	_x addEventHandler ["CuratorMarkerPlaced", {
		[_this, "CuratorMarkerPlaced", player] remoteExec ["A3A_fnc_zuesLogging", 2];
	}];

	_x addEventHandler ["CuratorMarkerSelectionChanged", {
		[_this, "CuratorMarkerSelectionChanged", player] remoteExec ["A3A_fnc_zuesLogging", 2];
	}];

	_x addEventHandler ["CuratorObjectDeleted", {
		// need to do this to log the object as by the time we log, the object is nil
		private _passedParam = [_this#0, str (_this#1)];
		[_passedParam, "CuratorObjectDeleted", player] remoteExec ["A3A_fnc_zuesLogging", 2];
	}];

	_x addEventHandler ["CuratorObjectDoubleClicked", {
		[_this, "CuratorObjectDoubleClicked", player] remoteExec ["A3A_fnc_zuesLogging", 2];
	}];

	_x addEventHandler ["CuratorObjectEdited", {
		[_this, "CuratorObjectEdited", player] remoteExec ["A3A_fnc_zuesLogging", 2];
	}];

	_x addEventHandler ["CuratorObjectPlaced", {

		[_this, "CuratorObjectPlaced", player] remoteExec ["A3A_fnc_zuesLogging", 2];
	}];

	_x addEventHandler ["CuratorObjectRegistered", {
		[_this, "CuratorObjectRegistered", player] remoteExec ["A3A_fnc_zuesLogging", 2];
	}];

	_x addEventHandler ["CuratorObjectSelectionChanged", {
		[_this, "CuratorObjectSelectionChanged", player] remoteExec ["A3A_fnc_zuesLogging", 2];
	}];

	_x addEventHandler ["CuratorPinged", {
		[_this, "CuratorPinged", player] remoteExec ["A3A_fnc_zuesLogging", 2];
	}];

	_x addEventHandler ["CuratorWaypointDeleted", {
		[_this, "CuratorWaypointDeleted", player] remoteExec ["A3A_fnc_zuesLogging", 2];
	}];

	_x addEventHandler ["CuratorWaypointDoubleClicked", {
		[_this, "CuratorWaypointDoubleClicked", player] remoteExec ["A3A_fnc_zuesLogging", 2];
	}];

	_x addEventHandler ["CuratorWaypointEdited", {
		[_this, "CuratorWaypointEdited", player] remoteExec ["A3A_fnc_zuesLogging", 2];
	}];

	_x addEventHandler ["CuratorWaypointPlaced", {
		[_this, "CuratorWaypointPlaced", player] remoteExec ["A3A_fnc_zuesLogging", 2];
	}];

	_x addEventHandler ["CuratorWaypointSelectionChanged", {
		[_this, "CuratorWaypointSelectionChanged", player] remoteExec ["A3A_fnc_zuesLogging", 2];
	}];

} forEach _curatorModules;