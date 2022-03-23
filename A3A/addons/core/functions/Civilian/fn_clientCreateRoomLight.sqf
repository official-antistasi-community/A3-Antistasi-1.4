/*
    Author: [Hazey]
    Description:
		Add Ambient room light to civilian house (Multiplayer)

    Arguments:
    	<Object> Building to add light to.
        <Object> Light source emitter.
        <Number> Light brightness.
        <Array> Light Color [r, g, b].

    Return Value:
        N/A

    Scope: Any
    Environment: Any
    Public: Yes

    Example: 
		[_building, _light, _brightness, _colour] remoteExec ["A3A_fnc_clientCreateRoomLight"];

    License: MIT License
*/

params ["_building","_light","_brightness","_colour"];

if (hasInterface) then {
    _light setLightBrightness _brightness;
    _light setLightColor _colour;
    _light lightAttachObject [_building, [1,1,1]];
};