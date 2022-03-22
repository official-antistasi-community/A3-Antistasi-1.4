params ["_building","_light","_brightness","_colour"];

if (hasInterface) then {
    _light setLightBrightness _brightness;
    _light setLightColor _colour;
    _light lightAttachObject [_building, [1,1,1]];
};