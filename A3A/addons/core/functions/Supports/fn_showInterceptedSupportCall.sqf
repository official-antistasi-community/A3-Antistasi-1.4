/*  Shows the intercepted radio message to the players

    Execution on: Server

    Scope: Internal

    Parameters:
        _reveal: NUMBER : 0-1, determines how much info will be revealed
        _position: POSITION : The position where the support is called to
        _side: SIDE : The side which called in the support
        _supportType: STRING : The type string of the support (not the support name)
        _markerType: NUMBER or OBJECT : Either the radius (for area attacks) or target object for the marker
        _markerLifeTime: NUMBER : Time in seconds for the marker to survive

    Returns:
        Nothing
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_reveal", "_position", "_side", "_supportType", "_markerType", "_markerLifeTime"];

//Nothing will be revealed
if(_reveal <= 0.2) exitWith {};

private _text = "";
private _markerText = "";
private _sideName = if(_side == Occupants) then {FactionGet(occ,"name")} else {FactionGet(inv,"name")};
if (_reveal <= 0.5) then
{
    //Side and call is reveal
    _text = format ["%1 is executing an unknown support now", _sideName]; //TODO: Localize
}
else
{
    switch (toupper _supportType) do
    {
        case ("QRFLAND"):
        {
            _text = format ["A %1 land QRF just arrived", _sideName]; //TODO: Localize
            _markerText = "Land QRF"; //TODO: Localize
        };
        case ("QRFAIR"):
        {
            _text = format ["A %1 air QRF just arrived", _sideName]; //TODO: Localize
            _markerText = "Air QRF"; //TODO: Localize
        };
        case ("AIRSTRIKE"):
        {
            _text = format ["%1 is about to execute an airstrike", _sideName]; //TODO: Localize
            _markerText = "Airstrike"; //TODO: Localize
        };
        case ("ARTILLERY"):
        {
            _text = format ["A %1 artillery piece has opened fire", _sideName]; //TODO: Localize
            _markerText = "Artillery strike"; //TODO: Localize
        };
        case ("MORTAR"):
        {
            _text = format ["A %1 mortar has opened fire", _sideName]; //TODO: Localize
            _markerText = "Mortar strike"; //TODO: Localize
        };
        case ("ORBITALSTRIKE"):
        {
            _text = format ["A %1 satellite has fired the orbital strike", _sideName]; //TODO: Localize
            _markerText = "Orbital strike"; //TODO: Localize
        };
        case ("CRUISEMISSILE"):
        {
            _text = format ["%1 cruise missile launched", _sideName]; //TODO: Localize
            _markerText = "Cruise missile"; //TODO: Localize
        };
        case ("SAM"):
        {
            _text = format ["%1 SAM launcher is acquiring a target", _sideName]; //TODO: Localize
            _markerText = "SAM target"; //TODO: Localize
        };
        case ("CARPETBOMBS"):
        {
            _text = format ["%1 bomber is carrying out a carpet bombing", _sideName]; //TODO: Localize
            _markerText = "Carpet bombing"; //TODO: Localize
        };
        case ("ASF"):
        {
            _text = format ["%1 fighter started chasing a target", _sideName]; //TODO: Localize
            _markerText = "Air superiority target"; //TODO: Localize
        };
        case ("CAS"):
        {
            _text = format ["A %1 CAS bomber is acquiring a target", _sideName]; //TODO: Localize
            _markerText = "CAS target"; //TODO: Localize
        };
        case ("GUNSHIP"):
        {
            _text = format ["A %1 heavy gunship started circling the area", _sideName]; //TODO: Localize
            _markerText = "Gunship"; //TODO: Localize
        };
        default
        {
            _text = format ["%1 is executing %2 support now", _sideName, _supportType]; //TODO: Localize
            _markerText = format ["%1 support", _supportType]; //TODO: Localize
        };
    };

    if(_reveal < 0.8) exitWith {};

    _text = format ["%1. Target marked on map!", _text]; //TODO: Localize
    private _targetMarker = format ["%1_target_%2", _supportType, A3A_supportMarkerCount];
    private _textMarker = format ["%1_text_%2", _supportType, A3A_supportMarkerCount];
    A3A_supportMarkerCount = A3A_supportMarkerCount + 1;

    if (_markerType isEqualType 0) then
    {
        createMarkerLocal [_targetMarker, _position];
        _targetMarker setMarkerShapeLocal "ELLIPSE";
        _targetMarker setMarkerBrushLocal "Grid";
        _targetMarker setMarkerSizeLocal [_markerType, _markerType];        // actually a radius
        _targetMarker setMarkerColorLocal (if(_side == Occupants) then { colorOccupants } else { colorInvaders });
        _targetMarker setMarkerAlpha 1;

        createMarkerLocal [_textMarker, _position];
        _textMarker setMarkerShapeLocal "ICON";
        _textMarker setMarkerTypeLocal "mil_dot";
        _textMarker setMarkerTextLocal _markerText;
        _textMarker setMarkerAlpha 0.75;

        [_textMarker, _targetMarker, _markerLifeTime] spawn {
            params ["_textMarker", "_targetMarker", "_lifeTime"];
            sleep _lifeTime;
            deleteMarker _textMarker;
            deleteMarker _targetMarker;
        };
    }
    else
    {
        createMarkerLocal [_textMarker, _position];
        _textMarker setMarkerShapeLocal "ICON";
        _textMarker setMarkerTypeLocal "mil_objective";
        _textMarker setMarkerTextLocal _markerText;
        _textMarker setMarkerAlphaLocal 0.75;

        [_textMarker, _markerType, time + _markerlifeTime] spawn {
            params ["_marker", "_target", "_timeout"];
            while { time < _timeout and alive _target } do {
                _marker setMarkerPos getPos _target;
                sleep 5;
            };
            deleteMarker _marker;
        };
    };
};

//Broadcast message to nearby players
private _nearbyPlayers = allPlayers select {(_x distance2D _position) <= 2000};
if(count _nearbyPlayers > 0) then
{
    ["RadioIntercepted", [_text]] remoteExec ["BIS_fnc_showNotification",_nearbyPlayers];
};
