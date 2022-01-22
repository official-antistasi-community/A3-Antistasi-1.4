/****************************************************************
File: UPSMON_rotpoint.sqf
Author: KRONZKY

Description:

Parameter(s):

Returns:

****************************************************************/
private["_cp","_a","_tx","_ty","_cd","_sd","_cx","_cy","_xout","_yout"];

_cp=_this select 0; 
_cx=_cp select 0; 
_cy=_cp select 1; 
_a=_this select 1; 
_cd=cos(_a*-1); 
_sd=sin(_a*-1); 
_tx=_this select 2; 
_ty=_this select 3; 
_xout=if (_a!=0) then 
{
	_cx+ (_cd*_tx - _sd*_ty)
} else 
{
	_cx+_tx
}; 
_yout=if (_a!=0) then {_cy+ (_sd*_tx + _cd*_ty)} else {_cy+_ty}; 
	
[_xout,_yout,0]