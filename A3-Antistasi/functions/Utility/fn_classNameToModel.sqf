/*
	Funtion name: classNameToModel

	Autor: Håkon R. Rydland

	Function: converts a classname to model

	params: <String> className

	Return: <String> Model
*/
params ["_className"];
getText (configFile >> "CfgVehicles" >> _className >> "model");