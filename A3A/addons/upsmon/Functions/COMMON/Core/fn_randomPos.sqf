/****************************************************************
File: UPSMON_randomPos.sqf
Author: KRONZKY

Description:

Parameter(s):

Returns:

****************************************************************/
private["_cx","_cy","_rx","_ry","_cd","_sd","_ad","_tx","_ty","_xout","_yout"];

_cx=_this select 0; 
_cy=_this select 1; 
_rx=_this select 2; 
_ry=_this select 3; 
_cd=_this select 4; 
_sd=_this select 5; 
_ad=_this select 6; 
_tx=random (_rx*2)-_rx; 
_ty=random (_ry*2)-_ry; 
_xout=if (_ad!=0) then {_cx+ (_cd*_tx - _sd*_ty)} else {_cx+_tx}; 
_yout=if (_ad!=0) then {_cy+ (_sd*_tx + _cd*_ty)} else {_cy+_ty}; 
[_xout,_yout]