private ["_unit"];
_unit = _this select 0;
if (!local _unit) exitWith {};
if (_unit getVariable "respawning") exitWith {};
//if (not( _unit getVariable "inconsciente")) exitWith {};
if (_unit != _unit getVariable ["owner",_unit]) exitWith {};
if (!isPlayer _unit) exitWith {};
_unit setVariable ["respawning",true];
//_unit enableSimulation true;
["Respawning",0,0,3,0,0,4] spawn bis_fnc_dynamicText;
//titleText ["", "BLACK IN", 0];
if (!isNil "respawnMenu") then {(findDisplay 46) displayRemoveEventHandler ["KeyDown", respawnMenu]};
if (isMultiplayer) exitWith
	{
	if (captive _unit) then {[_unit,false] remoteExec ["setCaptive",0,_unit]; _unit setCaptive false};
	//_unit setVariable ["inconsciente",false,true];
	_unit setVariable ["respawning",false];
	//if (captive _unit) then {[_unit,false] remoteExec ["setCaptive"]};
	_unit setDamage 1;
	};
private ["_posicion","_tam","_roads","_road","_pos"];
_posicion = getMarkerPos respawnBuenos;
if (lifeState _unit == "INCAPACITATED") then {_unit setUnconscious false};
_unit setVariable ["ayudado",objNull];
_unit setVariable ["ayudando",false];
_unit setDamage 0;
_unit setVariable ["compromised",0];
_unit setVariable ["disfrazado",false];
_unit setVariable ["INCAPACITATED",false];

if (rating _unit < 0) then {_unit addRating (rating _unit * -1)};
_nul = [0,-1,getPos _unit] remoteExec ["A3A_fnc_citySupportChange",2];

_hr = round ((server getVariable "hr") * 0.1);
_resourcesFIA = round ((server getVariable "resourcesFIA") * 0.05);

[- _hr, - _resourcesFIA] remoteExec ["A3A_fnc_resourcesFIA",2];

{
//_x hideObject true;
if ((_x != vehicle _x) and (driver vehicle _x == _x)) then
	{
	sleep 3;
	_tam = 10;
	while {true} do
		{
		_roads = _posicion nearRoads _tam;
		if (count _roads > 0) exitWith {};
		_tam = _tam + 10;
		};
	_road = _roads select 0;
	_pos = position _road findEmptyPosition [1,50,typeOf (vehicle _unit)];
	vehicle _x setPos _pos;
	}
else
	{
	if ([_x] call A3A_fnc_canFight) then
		{
		_x setPosATL _posicion;
		_x setVariable ["rearming",false];
		_x doWatch objNull;
		_x doFollow leader _x;
		}
	else
		{
		_x setDamage 1;
		};
	};
//_x hideObject false;
} forEach (units group _unit) + (units rezagados) - [_unit];
removeAllItemsWithMagazines _unit;
_hmd = hmd _unit;
if (_hmd != "") then
	{
	_unit unassignItem _hmd;
	_unit removeItem _hmd;
	};
{_unit removeWeaponGlobal _x} forEach weapons _unit;
removeBackpack _unit;
removeVest _unit;
_unit setPosATL _posicion;
_unit setCaptive false;
_unit setUnconscious false;
_unit playMoveNow "AmovPpneMstpSnonWnonDnon_healed";
sleep 4;
_unit setVariable ["respawning",false];