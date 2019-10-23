private ["_marcador","_nombreDest","_nombreEny"];
_marcador = _this select 0;
_nombreDest = [_marcador] call A3A_fnc_localizar;
_sideEny = _this select 1;
_nombreEny = if (_sideEny == buenos) then
				{
				nameBuenos
				}
			else
				{
				if (_sideEny == muyMalos) then {nameMuyMalos} else {nameMalos};
				};
_lado = _this select 2;
if (_lado == buenos) then {_lado = [buenos,civilian]};

[_lado,_marcador,[format ["%2 is attacking us in %1. Help the defense if you can",_nombreDest,_nombreEny],format ["%1 Contact Rep",_nombreEny],_marcador],getMarkerPos _marcador,false,0,true,"Defend",true] call BIS_fnc_taskCreate;

if (_lado isEqualType []) then {_lado = buenos};

waitUntil {sleep 10; (lados getVariable [_marcador,sideUnknown] != _lado) or (spawner getVariable _marcador == 2)};

[0,_marcador] spawn A3A_fnc_borrarTask;