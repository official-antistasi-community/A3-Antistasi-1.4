/*
Maintainer: Caleb Serafin
    navRoadHM is Modified by reference
    If a node is within the tolerance azimuth to its neighbours, and it is not a junction:
    It's neighbours will be connected directly with the distance equal to the distance to each summed (maintaining true distance)

Arguments:
    <navRoadHM> navRoadHM is Modified by reference
    <SCALAR> Max drift the simplified line segment can stray from the road in metres. (Default = 50)

Return Value:
    <navRoadHM> same reference

Scope: Any, Global Arguments
Environment: Scheduled
Public: No

Example:
    [_navRoadHM,50] call A3A_fnc_NG_simplify_flat;
*/
params [
    "_navRoadHM",
    ["_maxDrift",50,[ 0 ]]
];
private _maxDriftSqr = _maxDrift^2;

private _fnc_diag_render = { // [] call _fnc_diag_render;
    params [["_diag_step_sub",""]];
    ["Simplifying Flat Segments",_diag_step_sub,true,400] call A3A_fnc_customHint;
};

private _fnc_replaceRoadConnection = {
    params ["_roadStruct","_oldRoadConnection","_newRoadConnection","_newDistance"];
    private _connectionRoads = _roadStruct#1;
    private _conIndex = _connectionRoads find _oldRoadConnection;
    if (_conIndex == -1) exitWith {
        private _crashText = "Road '"+str (_roadStruct#0)+"' " + str getPosATL (_roadStruct#0) + " was not connected to old road '"+str _oldRoadConnection+"' " + str getPosATL _oldRoadConnection + ".";
        [4,_crashText,"fn_NG_simplify_flat"] call A3A_fnc_log;
        ["fn_NG_simplify_flat Error","Please check RPT.<br/>"+_crashText,false,600] call A3A_fnc_customHint;
    };
    _connectionRoads set [_conIndex,_newRoadConnection];
    (_roadStruct#2) set [_conIndex,_newDistance];
};
private _fnc_removeRoadConnection = {
    params ["_roadStruct","_oldRoadConnection"];
    private _connectionRoads = _roadStruct#1;
    private _conIndex = _connectionRoads find _oldRoadConnection;
    _connectionRoads deleteAt _conIndex;
    (_roadStruct#2) deleteAt _conIndex;
};

[] call _fnc_diag_render;

private _fnc_canSimplify = {
    params ["_leftRoad","_rightRoad","_realDistance","_middleRoad",[ "_excludedRoads",[] ],[ "_OUT_andSimplifyRoads",[] ]];

    if !(getRoadInfo _leftRoad#0 isEqualTo getRoadInfo _rightRoad#0) exitWith {false;};   // Must be same type

    private _straightDistance = _leftRoad distance _rightRoad;
    if (_straightDistance > A3A_NGSA_const_maxConnectionLength) exitWith {false;};   // Node searches expect a node within a reasonable distance from a road.

    private _base = 0.5 * _straightDistance;
    private _hypotenuse = 0.5 * _realDistance; //  The hypotenuse is half, as the worst real road can do is climb to a point, then come back down.

    if ((_hypotenuse^2 - _base^2) > _maxDriftSqr) exitWith { false; };

    private _midPoint = getPosATL _leftRoad vectorAdd getPosATL _rightRoad vectorMultiply 0.5;
    private _nearRoads = (nearestTerrainObjects [_midPoint, A3A_NG_const_roadTypeEnum, _base, false, false]) - [_leftRoad,_rightRoad,_middleRoad] - _excludedRoads;
    if (_nearRoads findIf {str _x in _navRoadHM} == -1) exitWith { true; }; // There cannot be any nodes from other roads nearby.

    // Try exclude parallel roads.
    if (count _excludedRoads != 0) exitWith { false; }; // No recursion.

    _nearRoads = _nearRoads select {str _x in _navRoadHM};
    if (_nearRoads findIf {str _x in _navRoadHM} == -1) exitWith {
        true;
    };
    private _canRemoveParallel = true;
    {
        private _road = _x;
        private _currentStruct = _navRoadHM get str _road;

        private _connectedRoads = _currentStruct#1;
        if ((count _connectedRoads) == 2) then {

            private _leftRoad = _connectedRoads#0;
            private _rightRoad = _connectedRoads#1;

            private _connectionDistances = _currentStruct#2;
            private _newDistance = _connectionDistances#0 + _connectionDistances#1;

            if !([_leftRoad,_rightRoad,_newDistance,_road,_nearRoads + [_middleRoad]] call _fnc_canSimplify) exitWith {_canRemoveParallel = false};  // Only merge same types of roads and similar azimuth, this will preserve road types and corners
        };
    } forEach _nearRoads;
    if (!_canRemoveParallel) exitWith {false};

    _OUT_andSimplifyRoads append _nearRoads;
    true;
};

private _trySimplify = {
    params ["_name","_force"];

    if !(_name in _navRoadHM) exitWith {};

    private _currentStruct = _navRoadHM get _name;
    if (_currentStruct#3 isNotEqualTo A3A_NG_const_emptyArray) exitWith {};  // Has forced connection. The roads are exempt from simplification and are resolved in the road to navGrid conversion.
    private _myRoad = _currentStruct#0;
    private _connectedRoads = _currentStruct#1;
    if (count _connectedRoads != 2) exitWith {};

    private _leftRoad = _connectedRoads#0;
    private _rightRoad = _connectedRoads#1;

    private _connectionDistances = _currentStruct#2;
    private _newDistance = _connectionDistances#0 + _connectionDistances#1;


    private _andSimplifyRoads = [];
    if !(_force || {[_leftRoad,_rightRoad,_newDistance,_myRoad,nil,_andSimplifyRoads] call _fnc_canSimplify}) exitWith {};
    if (count _andSimplifyRoads != 0) exitWith {};

    private _leftStruct = _navRoadHM get str _leftRoad;
    private _rightStruct = _navRoadHM get str _rightRoad;

    if (_rightRoad in (_leftStruct#1)) then {  // If our neighbours are not already connected:
        [_leftStruct,_myRoad] call _fnc_removeRoadConnection;
        [_rightStruct,_myRoad] call _fnc_removeRoadConnection;
    } else {
        [_leftStruct,_myRoad,_rightRoad,_newDistance] call _fnc_replaceRoadConnection;       // We connect our two neighbors together, replacing our own connection
        [_rightStruct,_myRoad,_leftRoad,_newDistance] call _fnc_replaceRoadConnection;
    };
    _navRoadHM deleteAt (str _myRoad);

    if (!_force) then {
        {
            [str _x,true] call _trySimplify;
        } forEach _andSimplifyRoads;
    };
};

private _diag_totalSegments = count _navRoadHM;
{
    if (_forEachIndex mod 100 == 0) then {
        ("Completion &lt;" + ((100*_forEachIndex /_diag_totalSegments) toFixed 1) + "% &gt; Processing segment &lt;" + (str _forEachIndex) + " / " + (str _diag_totalSegments) + "&gt;") call _fnc_diag_render;
    };
    [_x,false] call _trySimplify;
} forEach keys _navRoadHM;

_navRoadHM;
