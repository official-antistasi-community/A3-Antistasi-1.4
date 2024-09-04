/*
    Author:
        Silence

    Description:
        Handles grabbing seat positions and index then drawing them to 3D space.

    Params:
	    _vehicle    <OBJECT>

    Usage:
        [cursorObject] call A3A_logistics_fnc_drawSeats;
*/

params [["_vehicle", ObjNull]];

if (_vehicle isEqualTo ObjNull) exitWith {false};

textSize = 0.05;
iconSize = 1.5;
icon = "a3\ui_f\data\Map\Markers\Military\dot_ca.paa";
colour = [1,1,1,0.8];
canDraw = true;

if (_vehicle getVariable ["A3A_helper_seatDrawer", ""] isNotEqualTo "") then {
    removeMissionEventHandler ["Draw3D", _vehicle getVariable "A3A_helper_seatDrawer"];
};

private _selections = _vehicle selectionNames "FireGeometry";
private _selectionsNames = [];
private _selectionsCoords = [];

{
    private _inModelPosition = _vehicle selectionPosition [_x, "FireGeometry", "FirstPoint"];

	private _splitSelections = _x splitString "";
	private _splitSelection = (_splitSelections select -3) + (_splitSelections select -2) + (_splitSelections select -1); // get the last 3 numbers for index

    if !("cargo" in _x && {!("gunner" in _x)}) then {continue}; // if seat is not a cargo or gunner seat, do not add to the drawing list

    _selectionsCoords pushBack _inModelPosition;
    _selectionsNames pushBack _splitSelection;
} forEach _selections;

private _helperID = addMissionEventHandler ["Draw3D", {
    private _selectionsNames = (_thisArgs select 0);
    private _selectionsCoords = (_thisArgs select 1);
    private _vehicle = (_thisArgs select 2);
    
    if !(canDraw) exitWith {nil};

    {
        private _name = _selectionsNames select _forEachIndex;
        drawIcon3D [
            icon,
            colour,
            _vehicle modelToWorldVisual (_selectionsCoords select _forEachIndex),
            iconSize,iconSize,0,
            _name,
            0,
            textSize
        ];
    } forEach _selectionsCoords;
}, [_selectionsNames, _selectionsCoords, _vehicle]];

_vehicle setVariable ["A3A_helper_seatDrawer", _helperID];