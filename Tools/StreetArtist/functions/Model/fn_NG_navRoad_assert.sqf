/*
Maintainer: Caleb Serafin
    Checks that the passed navRoad class instance is not malformed.
    Logs errors tp RPT and hint display.

Arguments:
    <NavRoad> The tested navigation road.
    <NavRoadHM> To test known connections and back connections (default: nil)
    <STRING> Calling function's name (default: nil)

Return Value: <BOOL> If assertion passed.

Environment: Any
Public: No

Example:
    [objNull, [objNull,objNull], [123,456], []] call A3A_fnc_NG_navRoad_assert; // false // Logs that current road was null.
*/
if (isNil{A3A_NGSA_navRoad_assert}) exitWith {true};

private _navRoad = _this;
params [
    ["_navRoad",nil],
    ["_navRoadHM",nil],
    ["_parentFncName", "No Parent", [""]]
];

private _testWithNavRoadHM = !isNil {_navRoadHM};

private _fnc_reportFailedAssertion = {
    params [["_details","!Sub Error, error details failed to created.", [ "" ]]];
    private _errorTitle = "NavRoad Assertion Failed";
    [1, _parentFncName + " | " + _details,"fn_NG_navRoad_assert"] call A3A_fnc_log;
    [_errorTitle,"Please check RPT.<br/>" + _details,true,600] call A3A_fnc_customHint;
    false;
};

if (isNil {_navRoad}) exitWith {
    ("_navRoad was nil.") call _fnc_reportFailedAssertion;
    false;
};

private _type_array = [];
if !(_navRoad isEqualType _type_array) exitWith {
    ("Value was type &lt;"+ str typeName _navRoad +"&gt;.") call _fnc_reportFailedAssertion;
};

private _fnc_getTypeInArray = {
    if (count _this == 0) exitWith {
        "&lt;&gt;"
    };
    private _lastFoundType = _this#0;
    if (isNil{_lastFoundType}) exitWith {
        "&lt;ANY&gt;"
    };
    private _sameTypes = _this isEqualTypeAll _lastFoundType;
    if (_sameTypes) exitWith {
        "&lt;" + typeName _lastFoundType + "&gt;";
    };
    "&lt;Mixed&gt;"
};
private _fnc_listArrayTypes = {
    private _foundTypes = _this apply {
        if (isNil {_x}) then { continueWith "&lt;ANY&gt;" };
        if (_x isEqualType _type_array) then {
            private _count = count _x toFixed 0;
            private _subTypes = _x call _fnc_getTypeInArray;
            continueWith ("<ARRAY,"+ _count + _subTypes + "&gt;");
        };
        "&lt;" + typeName _x + "&gt;";
    };
    "&lt;" + (_foundTypes joinString ", ") + "&gt;";
};

if !(_navRoad isEqualTypeParams [objNull, [], [], []]) exitWith {
    private _types = _navRoad call _fnc_listArrayTypes;
    ("Level 1 mismatch. navRoad has types " + _types) call _fnc_reportFailedAssertion;
};

if (count _navRoad > 4) exitWith {
    private _types = _navRoad call _fnc_listArrayTypes;
    ("Level 1 mismatch. navRoad has too many elements " + _types) call _fnc_reportFailedAssertion;
};

private _thisRoad = _navRoad#0;

if (isNull _thisRoad) exitWith {
    private _types = _navRoad call _fnc_listArrayTypes;
    ("Level 1 mismatch. Current road was null " + _types) call _fnc_reportFailedAssertion;
};

private _connectedRoads = _navRoad#1;
private _connectedDistances = _navRoad#2;
private _forcedConnections = _navRoad#3;

private _connectedRoadsCount = count _connectedRoads;
private _connectedDistancesCount = count _connectedDistances;
private _forcedConnectionsCount = count _forcedConnections;

if (_connectedRoadsCount != _connectedDistancesCount) exitWith {
    private _types = _navRoad call _fnc_listArrayTypes;
    ("Level 2 mismatch. ConnectedRoads not synced with ConnectedDistances." + _types) call _fnc_reportFailedAssertion;
};

if (_connectedRoadsCount > 0 && {!(_connectedRoads isEqualTypeAll objNull)}) exitWith {
    private _types = _navRoad call _fnc_listArrayTypes;
    ("Level 2 mismatch. ConnectedRoads has wrong sub-types " + _types) call _fnc_reportFailedAssertion;
};

if (_connectedDistancesCount > 0 && {!(_connectedDistances isEqualTypeAll 0)}) exitWith {
    private _types = _navRoad call _fnc_listArrayTypes;
    ("Level 2 mismatch. ConnectedDistances Sub-array has wrong sub-types " + _types) call _fnc_reportFailedAssertion;
};

if (_forcedConnectionsCount > 0 && {!(_forcedConnections isEqualTypeAll objNull)}) exitWith {
    private _types = _navRoad call _fnc_listArrayTypes;
    ("Level 2 mismatch. ForcedConnections has wrong sub-types " + _types) call _fnc_reportFailedAssertion;
};



if (objNull in _connectedRoads) exitWith {
    private _types = _connectedRoads call _fnc_listArrayTypes;
    ("Level 3 mismatch. ConnectedRoads has a null value " + _types) call _fnc_reportFailedAssertion;
};

if (objNull in _forcedConnections) exitWith {
    private _types = _forcedConnections call _fnc_listArrayTypes;
    ("Level 3 mismatch. ForcedConnections has a null value " + _types) call _fnc_reportFailedAssertion;
};

if ((_forcedConnections - _connectedRoads) isNotEqualTo _type_array) exitWith {
    private _connectRoadPosses = _connectedRoads apply {str getPosATL _x} joinString ", ";
    private _forcedRoadPosses = _forcedConnections apply {str getPosATL _x} joinString ", ";
    ("Level 3 mismatch. ForcedConnections has a bonus entry. ConnectedRoads: ("+_connectRoadPosses+"), ForcedRoads: ("+_forcedRoadPosses+")") call _fnc_reportFailedAssertion;
};



if (!_testWithNavRoadHM) exitWith {
    true;
};

if !(_navRoadHM isEqualType createHashMap) exitWith {
    ("_navRoadHM was type &lt;"+ str typeName _navRoadHM +"&gt;.") call _fnc_reportFailedAssertion;
};

private _connectionIndex = _connectedRoads findIf {!(str _x in _navRoadHM)};
if (_connectionIndex != -1) exitWith {
    ("Level 4 mismatch. ConnectedRoads has an unkown connection to road at " + str getPosATL (_connectedRoads #_connectionIndex)) call _fnc_reportFailedAssertion;
};

private _forcedIndex = _forcedConnections findIf {!(str _x in _navRoadHM)};
if (_forcedIndex != -1) exitWith {
    ("Level 4 mismatch. ConnectedRoads has an unkown connection to road at " + str getPosATL (_forcedConnections #_forcedIndex)) call _fnc_reportFailedAssertion;
};


private _fnc_roadConnections = {
    (_navRoadHM get str _this)#1;
};

private _connectionBackIndex = _connectedRoads findIf {!(_thisRoad in (_x call _fnc_roadConnections) )};
if (_connectionBackIndex != -1) exitWith {
    ("Level 5 mismatch. ConnectedRoads has a one-way connection to road at " + str getPosATL (_connectedRoads #_connectionBackIndex)) call _fnc_reportFailedAssertion;
};

private _forcedBackIndex = _forcedConnections findIf {!(_thisRoad in (_x call _fnc_roadConnections) )};
if (_forcedBackIndex != -1) exitWith {
    ("Level 5 mismatch. ConnectedRoads has a one-way connection to road at " + str getPosATL (_forcedConnections #_forcedBackIndex)) call _fnc_reportFailedAssertion;
};



// Everything Passed 🥳 !!!
true;
