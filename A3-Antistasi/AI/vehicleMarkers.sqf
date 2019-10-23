private ["_veh","_text","_mrkfin","_pos","_side","_tipo","_newPos","_road","_amigos"];

_veh = _this select 0;
_text = _this select 1;
_convoy = false;
if ((_text == "Convoy Objective") or (_text == "Mission Vehicle") or (_text == "Supply Box")) then {_convoy = true};
_side = side (group (driver _veh));
_tipo = "_unknown";
_formato = "";
_color = colorMalos;
if (_veh isKindOf "Truck") then {_tipo = "_motor_inf"}
	else
		{
		if (_veh isKindOf "Wheeled_APC_F") then {_tipo = "_mech_inf"}
		else
			{
			if (_veh isKindOf "Tank") then {_tipo = "_armor"}
			else
				{
				if (_veh isKindOf "Plane_Base_F") then {_tipo = "_plane"}
				else
					{
					if (_veh isKindOf "UAV_02_base_F") then {_tipo = "_uav"}
					else
						{
						if (_veh isKindOf "Helicopter") then {_tipo = "_air"}
						else
							{
							if (_veh isKindOf "Boat_F") then {_tipo = "_naval"}
							};
						};
					};
				};
			};
		};

if ((_side == buenos) or (_side == sideUnknown)) then
	{
	_enemigo = false;
	_formato = "n";
	_color = colorBuenos;
	}
else
	{
	if (_side == malos) then
		{
		_formato = "b";
		}
	else
		{
		if (_side == muyMalos) then
			{
			_formato = "o";
			_color = colorMuyMalos;
			};
		};
	};

_tipo = format ["%1%2",_formato,_tipo];

if ((side group (driver _veh) != buenos) and (side driver _veh != sideUnknown)) then {["TaskSucceeded", ["", format ["%1 Spotted",_text]]] spawn BIS_fnc_showNotification};

_mrkfin = createMarkerLocal [format ["%2%1", random 100,_text], position _veh];
_mrkfin setMarkerShapeLocal "ICON";
_mrkfin setMarkerTypeLocal _tipo;
_mrkfin setMarkerColorLocal _color;
_mrkfin setMarkerTextLocal _text;

while {(alive _veh) and !(isNull _veh) and (revelar or _convoy or (_veh getVariable ["revelado",false]))} do
	{
	_pos = getPos _veh;
	_mrkfin setMarkerPosLocal _pos;
	sleep 60;
	};
deleteMarkerLocal _mrkfin;
//if (alive _veh) then {_veh setVariable ["revelado",false,true]};