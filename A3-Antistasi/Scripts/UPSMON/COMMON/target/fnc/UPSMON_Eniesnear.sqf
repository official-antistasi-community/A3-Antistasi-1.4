private ["_npc","_enies","_nbr","_unitsnear"];

_npc = _this select 0;
_enies = _this select 1;

_enies = _enies - _npc;
_unitsnear = nearestobjects [getposATL _npc,["CAManBase","TANK","CAR"],100];
_nbr = 0;

{
	If (alive _x) then
	{
		If (_x in _enies) then
		{
			_nbr = _nbr +1;
		};
	}
} foreach _unitsnear;

_nbr