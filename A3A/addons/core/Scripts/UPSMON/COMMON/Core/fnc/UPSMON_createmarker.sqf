/****************************************************************
File: UPSMON_createmarker.sqf
Author: Azroul13

Description:

Parameter(s):

Returns:

****************************************************************/
private["_pos","_m","_shape","_type","_color","_size"];

_pos = _this select 0;
_shape = _this select 1;
_type = _this select 2;
_color = _this select 3;
_size = 1;
If (count _this > 4) then {_size = _this select 4;};

_m = createMarker [format["mPos%1%2",(floor(_pos select 0)),(floor(_pos select 1))],_pos];
_m setmarkerColor _color;
_m setMarkerShape _shape;
If (_shape != "ICON") then 
{
	_m setMarkerSize _size;
	_m setMarkerBrush _type
}
else
{
	_m setMarkerType _type;
	If (count _this > 4) then {_m setMarkerText (_this select 4);};
};
