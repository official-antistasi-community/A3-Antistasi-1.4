private ["_grp","_enies","_npcpos","_capacitygrp","_typeofgrp","_list","_points","_armor"];

_grp = _this select 0;
_enies = _this select 1;

_npcpos = getposATL (leader _grp);
_capacitygrp = _grp getvariable ["UPSMON_GroupCapacity",[]];
_typeofgrp = _grp getvariable ["UPSMON_typeofgrp",[]];
_list = [];

{
	If (alive _x) then
	{
		_points = 0;

		//If ([leader _grp,_x,_npcpos vectordistance ((_x getvariable "UPSMON_TargetInfo") select 0),130] call UPSMON_Haslos) then MODIFIED BY BARBOLANI
		If ([leader _grp,_x,_npcpos distance (getPosATL _x),130] call UPSMON_Haslos) then
		{
			_points = _points + 200;
		};

		If (vehicle _x != _x) then
		{
			If ("ship" in _typeofgrp) then
			{
				If ((vehicle _x) iskindof "ship") then
				{
					_points = _points + 200;
				};
			};

			If ("air" in _typeofgrp || "aa1" in _capacitygrp || "aa2" in _capacitygrp) then
			{
				if ("aa1" in _capacitygrp || "aa2" in _capacitygrp) then
				{
					If ((vehicle _x) iskindof "air") then
					{
						_points = _points + 300;
					};
				};
			};

			If ("at1" in _capacitygrp || "at2" in _capacitygrp || "at3" in _capacitygrp) then
			{
				_armor  = getNumber  (configFile >> "CfgVehicles" >> typeof (vehicle _x) >> "armor");
				If (_armor >= 500 && ("at2" in _capacitygrp || "at3" in _capacitygrp)) then
				{
					_points = _points + 300;
				};

				If (_armor < 500 && "at1" in _capacitygrp) then
				{
					_points = _points + 200;
				};

				If (_armor < 250) then
				{
					_points = _points + 200;
				};

				if (!IsNull (Gunner (vehicle _x))) then
				{
					_points = _points + 100;
				};
			};
		};
		//_points = _points - ((_npcpos vectordistance ((_x getvariable "UPSMON_TargetInfo") select 0)) / 10); MODIFIED BY BARBOLANI
		_points = _points - ((_npcpos distance (getPosATL _x)) / 10);
		If (_points < 0) then {_points = 0;};
		_list pushback [_x,_points];
	}
} foreach _enies;

_list = [_list, [], {(_x select 1)}, "DESCEND"] call BIS_fnc_sortBy;

{
	_enies pushback (_x select 0);
} foreach _list;

_enies