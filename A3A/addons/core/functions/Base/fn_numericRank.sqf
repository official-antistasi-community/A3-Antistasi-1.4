private ["_unit","_idRank","_newRank","_result"];
_unit = _this select 0;
//_idRank = rankId _unit + 1;
_rankX = _unit getVariable ["rankX","PRIVATE"];
switch (_rankX) do
	{
	case "PRIVATE": {_idRank= 1; _newRank = "CORPORAL"};
	case "CORPORAL": {_idRank = 2; _newRank = "SERGEANT"};
	case "SERGEANT": {_idRank = 3; _newRank = "LIEUTENANT"};
	case "LIEUTENANT": {_idRank = 4; _newRank = "CAPTAIN"};
	case "CAPTAIN": {_idRank = 5; _newRank = "MAJOR"};
	case "MAJOR": {_idRank = 6; _newRank = "COLONEL"};
	case "COLONEL": {_idRank = 7; _newRank = "COLONEL"};
	};
_result = [_idRank,_newRank];
_result