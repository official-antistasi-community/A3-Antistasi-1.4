/*
    Author: [Hazey]
    Description:
		Add Ambient room light to civilian house

    Arguments:
    	N/A

    Return Value:
    	<Object> Building to add light to.

    Scope: Any
    Environment: Any
    Public: Yes

    Example: 
		_light = [_building] call A3A_FNC_createRoomLight;

    License: MIT License
*/
params ["_building"];

private _colours = [[255,217,66],[255,162,41],[221,219,206]];
private _colour = _colours select (random((count _colours)-1));
private _brightness = random 10 / 100;

// Create light source
private _light = "#lightpoint" createVehicle getPos _building;

// Create Lightpoint on Multiplayer else create it for single player use.
if(isMultiplayer) then {
    [_building, _light, _brightness, _colour] remoteExec ["A3A_fnc_clientCreateRoomLight"];
} else {
    _light setLightBrightness _brightness;
    _light setLightColor _colour;
    _light lightAttachObject [_building, [1,1,1]];
};

_light