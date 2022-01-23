/****************************************************************
File: UPSMON_stayInside.sqf
Author: KRONZKY

Description:

Parameter(s):

Returns:

****************************************************************/
private["_np","_nx","_ny","_cp","_cx","_cy","_rx","_ry","_d","_tp","_tx","_ty","_fx","_fy"];

_np=_this select 0;	_nx=_np select 0;	_ny=_np select 1;
_cp=_this select 1;	_cx=_cp select 0;	_cy=_cp select 1;
_rx=_this select 2;	_ry=_this select 3;	_d=_this select 4;
_tp = [_cp,_d,(_nx-_cx),(_ny-_cy)] call UPSMON_rotpoint;
_tx = _tp select 0; _fx=_tx;
_ty = _tp select 1; _fy=_ty;
if (_tx<(_cx-_rx)) then {_fx=_cx-_rx};
if (_tx>(_cx+_rx)) then {_fx=_cx+_rx};
if (_ty<(_cy-_ry)) then {_fy=_cy-_ry};
if (_ty>(_cy+_ry)) then {_fy=_cy+_ry};
if ((_fx!=_tx) || (_fy!=_ty)) then {_np = [_cp,_d*-1,(_fx-_cx),(_fy-_cy)] call UPSMON_rotpoint};
_np;