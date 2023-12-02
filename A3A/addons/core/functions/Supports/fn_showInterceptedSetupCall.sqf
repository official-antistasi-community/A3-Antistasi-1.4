#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

/*  Shows the intercepted radio setup message to the players

    Execution on: Server

    Scope: Internal

    Parameters:
        _reveal: NUMBER : 0-1, determines how much info to revealed
        _side: SIDE : The side which called in the support
        _supportType: STRING : The type of the support
        _position: ARRAY : Target position of support
        _setupTime : NUMBER : Approximate setup time in seconds

    Returns:
        Nothing
*/

// TODO: add source/setup position?

params ["_reveal", "_side", "_supportType", "_position", "_setupTime"];

//Nothing will be revealed
if(_reveal <= 0.2) exitWith {};

private _text = "";
private _sideName = Faction(_side) get "name";
if (_reveal <= 0.5) then
{
    //Side and setup is revealed
    _text = format [localize "STR_A3A_fn_swIntStpCll_unknown", _sideName]; //TODO: Localize
}
else
{
    switch (toupper _supportType) do
    {
        case ("MAJORATTACK"):
        {
            _text = format [localize "STR_A3A_fn_swIntStpCll_MAJORATTACK", _sideName];
        };
        case ("COUNTERATTACK"):
        {
            _text = format [localize "STR_A3A_fn_swIntStpCll_COUNTERATTACK", _sideName];
        };
        case ("QRFAIR"):
        {
            _text = format [localize "STR_A3A_fn_swIntStpCll_QRFAIR", _sideName];
        };
        case ("QRFLAND"):
        {
            _text = format [localize "STR_A3A_fn_swIntStpCll_QRFLAND", _sideName];
        };
        case ("AIRSTRIKE"):
        {
            _text = format [localize "STR_A3A_fn_swIntStpCll_AIRSTRIKE", _sideName];
        };
        case ("MORTAR"):
        {
            _text = format [localize "STR_A3A_fn_swIntStpCll_MORTAR", _sideName];
        };
        case ("ARTILLERY"):
        {
            _text = format [localize "STR_A3A_fn_swIntStpCll_ARTILLERY", _sideName];
        };
        case ("ORBITALSTRIKE"):
        {
            _text = format [localize "STR_A3A_fn_swIntStpCll_ORBITALSTRIKE", _sideName];
        };
        case ("CRUISEMISSILE"):
        {
            _text = format [localize "STR_A3A_fn_swIntStpCll_CRUISEMISSILE", _sideName];
        };
        case ("SAM"):
        {
            _text = format [localize "STR_A3A_fn_swIntStpCll_SAM", _sideName];
        };
        case ("CARPETBOMBS"):
        {
            _text = format [localize "STR_A3A_fn_swIntStpCll_CARPETBOMBS", _sideName];
        };
        case ("ASF"):
        {
            _text = format [localize "STR_A3A_fn_swIntStpCll_ASF", _sideName];
        };
        case ("CAS"):
        {
            _text = format [localize "STR_A3A_fn_swIntStpCll_CAS", _sideName]; 
        };
        case ("GUNSHIP"):
        {
            _text = format [localize "STR_A3A_fn_swIntStpCll_GUNSHIP", _sideName];
        };
        case ("UAV"):
        {
            _text = format [localize "STR_A3A_fn_swIntStpCll_UAV", _sideName];
        };
        default
        {
            _text = format [localize "STR_A3A_fn_swIntStpCll_default", _sideName, _supportType];
        };
    };
};

// Randomise setup time less with higher reveal value
_setupTime = _setupTime * (_reveal + random (2 - 2*_reveal));
private _timeStr = if(_setupTime < 60) then { "&lt;1" } else { str round (_setupTime / 60) };

if(_reveal >= 0.8) then
{
    if(toupper _supportType in ["QRFLAND", "QRFAIR", "COUNTERATTACK", "MAJORATTACK"]) then
    {
        _text = format [localize "STR_A3A_fn_swIntStpCll_arrivalTime", _text, _timeStr];
    }
    else
    {
        _text = format [localize "STR_A3A_fn_swIntStpCll_setupTime", _text, _timeStr];
    };
};

//Broadcast message to nearby players
private _nearbyPlayers = allPlayers select {(_x distance2D _position) <= 2000};
if(count _nearbyPlayers > 0) then
{
    ["RadioIntercepted", [_text]] remoteExec ["BIS_fnc_showNotification",_nearbyPlayers];
};
