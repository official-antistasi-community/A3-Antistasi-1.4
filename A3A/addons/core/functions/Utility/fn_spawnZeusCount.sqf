/*
    Author: [Killerswin2]
    Description:
        checks if the the zeus module count has increase

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

A3A_ZeusCountLast = count allCurators; 
A3A_ZeusCountcurrent = 0;

while {true} do {
    A3A_ZeusCountcurrent = count allCurators;
    if (A3A_ZeusCountLast isNotEqualTo A3A_ZeusCountcurrent) then 
    {
        // remove the all events and add them again
        private _curators = allCurators;

        {
            _x removeEventHandler ["CuratorFeedbackMessage", (A3A_zeusLoggingEvents#_forEachIndex)#0];
            _x removeEventHandler ["CuratorGroupDoubleClicked", (A3A_zeusLoggingEvents#_forEachIndex)#1];
            _x removeEventHandler ["CuratorGroupPlaced", (A3A_zeusLoggingEvents#_forEachIndex)#2];
            _x removeEventHandler ["CuratorGroupSelectionChanged", (A3A_zeusLoggingEvents#_forEachIndex)#3];
            _x removeEventHandler ["CuratorMarkerDeleted", (A3A_zeusLoggingEvents#_forEachIndex)#4];
            _x removeEventHandler ["CuratorMarkerDoubleClicked", (A3A_zeusLoggingEvents#_forEachIndex)#5];
            _x removeEventHandler ["CuratorMarkerEdited", (A3A_zeusLoggingEvents#_forEachIndex)#6];
            _x removeEventHandler ["CuratorMarkerPlaced", (A3A_zeusLoggingEvents#_forEachIndex)#7];
            _x removeEventHandler ["CuratorMarkerSelectionChanged", (A3A_zeusLoggingEvents#_forEachIndex)#8];
            _x removeEventHandler ["CuratorObjectDeleted", (A3A_zeusLoggingEvents#_forEachIndex)#9];
            _x removeEventHandler ["CuratorObjectDoubleClicked", (A3A_zeusLoggingEvents#_forEachIndex)#10];
            _x removeEventHandler ["CuratorObjectEdited", (A3A_zeusLoggingEvents#_forEachIndex)#11];
            _x removeEventHandler ["CuratorObjectPlaced", (A3A_zeusLoggingEvents#_forEachIndex)#12];
            _x removeEventHandler ["CuratorObjectRegistered", (A3A_zeusLoggingEvents#_forEachIndex)#13];
            _x removeEventHandler ["CuratorObjectSelectionChanged", (A3A_zeusLoggingEvents#_forEachIndex)#14];
            _x removeEventHandler ["CuratorPinged", (A3A_zeusLoggingEvents#_forEachIndex)#15];
            _x removeEventHandler ["CuratorWaypointDeleted", (A3A_zeusLoggingEvents#_forEachIndex)#16];
            _x removeEventHandler ["CuratorWaypointDoubleClicked", (A3A_zeusLoggingEvents#_forEachIndex)#17];
            _x removeEventHandler ["CuratorWaypointEdited", (A3A_zeusLoggingEvents#_forEachIndex)#18];
            _x removeEventHandler ["CuratorWaypointPlaced", (A3A_zeusLoggingEvents#_forEachIndex)#19];
            _x removeEventHandler ["CuratorWaypointSelectionChanged", (A3A_zeusLoggingEvents#_forEachIndex)#20];
            
        } forEach _curators;
        call A3A_fnc_initZeusLogging;
    };

    sleep 60;
};