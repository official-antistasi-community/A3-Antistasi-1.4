/*
    Author: [Hazey]
    Description:
		Set's Rain texture for snow based on selectedWeather or AllowSnow param.

    Arguments:
		<Number> Currently Selected weather Type.
		<Bool> Allow snow effect? True = Yes, False = No.

    Return Value:
        N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[3, true] call A3A_fnc_setRainTexture;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_selectedWeather", ["_allowSnow", false]];

// It doesn't always snow in the winter.
private _snowEffectEnabled = false;
if (_allowSnow) then {
	if(random 100 > 75) then {
		_snowEffectEnabled = true;
	};
};

// If Artic weather selected, raindrops are converted to Snowflakes.
// Set our raindrop texture using engine provided method.
if ((_selectedWeather == 3) || _snowEffectEnabled) then {
	[
		"a3\data_f\snowflake4_ca.paa",	// rainDropTexture
		4, 								// texDropCount
		0.01, 							// minRainDensity
		25, 							// effectRadius
		0.05, 							// windCoef
		2.5, 							// dropSpeed
		0.5, 							// rndSpeed
		0.5, 							// rndDir
		0.07, 							// dropWidth
		0.07, 							// dropHeight
		[1, 1, 1, 0.5], 				// dropColor
		0.0, 							// lumSunFront
		0.2, 							// lumSunBack
		0.5, 							// refractCoef
		0.5, 							// refractSaturation
		true, 							// snow
		false 							// dropColorStrong
	] call BIS_fnc_setRain;
} else {
	[
		"a3\data_f\rainnormal_ca.paa",			// rainDropTexture
		4,										// texDropCount
		0.01,									// minRainDensity
		15,										// effectRadius
		0.05,									// windCoef
		25,										// dropSpeed
		0.2,									// rndSpeed
		0.02,									// rndDir
		0.02,									// dropWidth
		0.8,									// dropHeight
		[0.101961,0.101961,0.101961,0.14902],	// dropColor
		0.1,									// lumSunFront
		0.1,									// lumSunBack
		0.5,									// refractCoef
		0.3,									// refractSaturation
		false,									// snow
		false									// dropColorStrong
	] call BIS_fnc_setRain;
};