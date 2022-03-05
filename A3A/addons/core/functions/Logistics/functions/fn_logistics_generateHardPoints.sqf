/*
    Author: [Håkon]
    [Description]
        Generates a rough node array for you based on the visual start and end of the intended cargo plane,
        in addition visual guides are rendered on screen to give you an idea of where it is relative to you.
        visuals last for 60 seconds.

        These are:
            Green dot   : start position of cargo plane (only visible if you can see the position)
            Red dot     : end position of cargo plane (only visible if you can see the position)
            white line  : cargo plane bounds
            white dots  : Node return positions

    Arguments:
    0. <Object> Vehicle your generating the nodes for
    1. <Array>  Model relativ position of cargo plane start position
    2. <Int>    The lenght of the cargo plane

    Return Value:
    <Array> vehicle hardpoint point [model, node array]

    Scope: Clients
    Environment: unscheduled
    Public: [Yes]
    Dependencies:

    Example: [cursorTarget, [0,-0.7,-0.7], 2.1] call A3A_fnc_logistics_generateHardPoints;
*/
params [["_vehicle", objNull, [objNull]], ["_planeStart", [], [[]], 3], ["_planeSpan", 0, [0]]];

//validate input
if (isNull _vehicle) exitWith {"Null vehicle"};
if (_planeStart isEqualTo []) exitWith {"Invalid start off plane"};
if (_planeSpan < 0) exitWith {"Plane length cannot be negative"};

//get model
private _model = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "model");

//calculate nodes
private _planeEnd = +_planeStart;
_planeEnd set [1, (_planeEnd#1) - _planeSpan];
private _diameter = 0.8;
private _radius = _diameter/2;// get some distance from walls
private _plane = _planeStart vectorDiff _planeEnd;

private _nodeArray = [];
private _node = _planeStart vectorDiff [0,_radius,0];//first point
while {(_radius*1.5) < (_plane#1)} do {
    _plane = _plane vectorDiff [0,_diameter,0];
    _nodeArray pushBack _node;
    _node = _node vectorDiff [0,_diameter,0];
};

//fix nodeArray with rest of information
A3A_Logistics_nodeArray = _nodeArray apply {[1, _x, []]};

//Rendering visuals
A3A_Logistics_vehicle = _vehicle;
A3A_Logistics_pStart = _planeStart;
A3A_Logistics_pEnd = _planeEnd;
A3A_Logistics_RenderTime = time + 60;

if !(isNil "A3A_Logistics_RenderCP") exitWith {[_model, A3A_Logistics_nodeArray]};
A3A_Logistics_RenderCP = addMissionEventHandler ["Draw3D", {
    //get the render position of the start and end cargo plane positions
    private _startPos = A3A_Logistics_vehicle modelToWorldVisual A3A_Logistics_pStart;
    private _startPosASL = A3A_Logistics_vehicle modelToWorldVisualWorld A3A_Logistics_pStart;
    private _endPos = A3A_Logistics_vehicle modelToWorldVisual A3A_Logistics_pEnd;
    private _endPosASL = A3A_Logistics_vehicle modelToWorldVisualWorld A3A_Logistics_pEnd;

    //plane boundries corner positions
    private _startGuide1 = A3A_Logistics_vehicle modelToWorldVisual (A3A_Logistics_pStart vectorAdd [-0.6,0,0]);
    private _startGuide2 = A3A_Logistics_vehicle modelToWorldVisual (A3A_Logistics_pStart vectorAdd [0.6,0,0]);
    private _endGuide1 = A3A_Logistics_vehicle modelToWorldVisual (A3A_Logistics_pEnd vectorAdd [-0.6,0,0]);
    private _endGuide2 = A3A_Logistics_vehicle modelToWorldVisual (A3A_Logistics_pEnd vectorAdd [0.6,0,0]);

    //Plane Start and end
    if (count (lineIntersectsSurfaces [eyePos player, _startPosASL, player]) isEqualTo 0) then {
        drawIcon3D ["\a3\ui_f\data\map\markers\military\dot_ca.paa", [0.1,0.9,0.2,1], _startPos, 0.6, 0.6, 0, "", true, 0.03, "TahomaB", "center"];
    };
    if (count (lineIntersectsSurfaces [eyePos player, _endPosASL, player]) isEqualTo 0) then {
        drawIcon3D ["\a3\ui_f\data\map\markers\military\dot_ca.paa", [0.9,0.1,0.2,1], _endPos, 0.6, 0.6, 0, "", true, 0.03, "TahomaB", "center"];
    };

    //plane boundries
    drawLine3D [_startGuide1, _startGuide2, [0.9,0.9,0.9,1]];
    drawLine3D [_endGuide1, _endGuide2, [0.9,0.9,0.9,1]];
    drawLine3D [_startGuide1, _endGuide1, [0.9,0.9,0.9,1]];
    drawLine3D [_startGuide2, _endGuide2, [0.9,0.9,0.9,1]];

    //nodes
    {
        drawIcon3D ["\a3\ui_f\data\map\markers\military\dot_ca.paa", [0.9,0.9,0.9,1], A3A_Logistics_vehicle modelToWorldVisual (_x#1), 0.6, 0.6, 0, "", true, 0.03, "TahomaB", "center"];
    } forEach A3A_Logistics_nodeArray;


    //remove if render time is out
    if (A3A_Logistics_RenderTime < time || isNull A3A_Logistics_vehicle) then {
        removeMissionEventHandler ["Draw3D", A3A_Logistics_RenderCP];
        A3A_Logistics_RenderCP = nil;
        A3A_Logistics_vehicle = nil;
        A3A_Logistics_pStart = nil;
        A3A_Logistics_pEnd = nil;
        A3A_Logistics_RenderTime = nil;
    };
}];

[_model, A3A_Logistics_nodeArray];
