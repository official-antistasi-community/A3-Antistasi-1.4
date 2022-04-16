/*
	Author: Genesis

	Description:
		Movement Prediction base on velocity and multipler

	Parameter(s):
		0: unit
		1: multiplier

	Returns:
		Predicted Position
	Example1:  [_Unit,4] call VCM_fnc_MovePrediction;
*/
//Predict motion of an object, and return the predicted position
params ["_Unit","_Multiplier"];
if (isNil "_Unit") exitWith {_predictPos = [0,0,0];_predictPos};

(getPosWorld _Unit) params ["_plrPosX","_plrPosY","_plrPosZ"];
(velocity _Unit) params ["_velX","_velY"];
private _predictPos = [(_plrPosX + (_velX * _Multiplier)),(_plrPosY + (_velY * _Multiplier)),_plrPosZ];
_predictPos
