
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the players terraingrid when called.
*/
private "_type";
_type = param [0,"",[""]];
if(_type == "") exitWith {};
	
switch (_type) do {
	case "none": {if(isNil "tawvd_disablenone") then {setTerrainGrid 50;};};
	case "low": {setTerrainGrid 30;};
	case "norm": {setTerrainGrid 12.5;};
	case "high": {setTerrainGrid 3.125;};
};