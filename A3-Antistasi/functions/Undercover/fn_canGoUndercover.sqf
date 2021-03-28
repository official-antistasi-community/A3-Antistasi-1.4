/*
Author: Wurzel0701
    Checks if the player is able to go undercover

Arguments:
    <NIL>

Return Value:
    ARRAY<BOOL, STRING> The result of the check and a small reason

Scope: Local
Environment: Any
Public: Yes
Dependencies:
    <ARRAY> controlsX
    <ARRAY> airportsX
    <ARRAY> outposts
    <ARRAY> seaports
    <ARRAY> undercoverVehicles
    <ARRAY> reportedVehs
    <ARRAY> allArmoredHeadgear
    <ARRAY> allCivilianUniforms
    <NAMESPACE> sidesX
    <SIDE> teamPlayer
    <SIDE> Invaders
    <SIDE> Occupants

Example:
    [] call A3A_fnc_canGoUndercover;
*/

private _reasons = [];

if (player != player getVariable["owner", player]) exitWith
{
	["Undercover", "You cannot go Undercover while you are controlling AI"] call A3A_fnc_customHint;
    [false, "No Undercover while controlling AI"];
};

if (captive player) exitWith
{
	["Undercover", "You are Undercover already"] call A3A_fnc_customHint;
    [false, "Already undercover"];
};

private _changeState = "";
private _roadblocks = controlsX select {isOnRoad(getMarkerPos _x)};
private _secureBases = airportsX + outposts + seaports + _roadblocks;
private _compromised = player getVariable "compromised";
private _result = [];

if !(isNull (objectParent object)) then
{
	if (!(typeOf(objectParent player) in undercoverVehicles)) exitWith
    {
		["Undercover", "You are not in a civilian vehicle"] call A3A_fnc_customHint;
		_result = [false, "In non civilian vehicle"];
	};
	if ((objectParent player) in reportedVehs) then
    {
		["Undercover", "This vehicle has been reported to the enemy. Change or renew your vehicle in the Garage to go Undercover"] call A3A_fnc_customHint;
		_result = [false, "In reported vehicle"];
	};
}
else
{
    if (dateToNumber date < _compromised) exitWith
    {
        ["Undercover", "You have been reported in the last 30 minutes therefore you cannot go Undercover"] call A3A_fnc_customHint;
        _result = [false, "Recently reported"];
    };

    private _text = "You cannot go Undercover while:<br/>";
    _result = [true];
    switch (true) do
    {
        case (primaryWeapon player != "" || secondaryWeapon player != "" || handgunWeapon player != ""):
        {
            _text format ["%1<br/>A weapon is visible", _text];
            _result set [0, false];
            _result pushBack "Weapon visible";
        };
        case (vest player != ""):
        {
            _text format ["%1<br/>Wearing a vest", _text];
            _result set [0, false];
            _result pushBack "Vest visible";
        };
        case (headgear player in allArmoredHeadgear):
        {
            _text format ["%1<br/>Wearing a helmet", _text];
            _result set [0, false];
            _result pushBack "Helmet visible";
        };
        case (hmd player != ""):
        {
            _text format ["%1<br/>Wearing NVGs", _text];
            _result set [0, false];
            _result pushBack "NVG visible";
        };
        case (!(uniform player in allCivilianUniforms)):
        {
            _text format ["%1<br/>Suspicious uniform", _text];
            _result set [0, false];
            _result pushBack "Suspicious uniform";
        };
    };
    if !(_result select 0) then
    {
        ["Undercover", _text] call A3A_fnc_customHint;
    };
};

if (count _result != 0 && !(_result select 0)) exitWith
{
    _result;
};

_result = [];

private _base = [_secureBases, player] call BIS_fnc_nearestPosition;
private _size = [_base] call A3A_fnc_sizeMarker;
if ((player distance2D getMarkerPos _base < _size * 2) && (!(sidesX getVariable [_base, sideUnknown] == teamPlayer))) exitWith
{
	["Undercover", "You cannot go Undercover near Airports, Outposts, Seaports or Roadblocks"] call A3A_fnc_customHint;
    [false, "Near enemy territory"];
};

if
(
    {
        ((side _x == Invaders) || (side _x == Occupants)) &&
        {(_x knowsAbout player > 1.4) &&
        {_x distance player < 500}}
    } count allUnits > 0
) exitWith
{
	["Undercover", "You cannot go Undercover while enemies are spotting you"] call A3A_fnc_customHint;
    _result = [false, "Spotted by enemies"];
};

[true, ""];
