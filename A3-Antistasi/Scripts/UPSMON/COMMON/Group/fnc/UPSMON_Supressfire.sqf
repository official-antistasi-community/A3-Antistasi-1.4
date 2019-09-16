private ["_units","_targetpos","_timeout","_delete","_unit","_target","_Pos","_direction"];

_units = _this select 0;
_targetpos = _this select 1;

_timeout = time + 15;
while {_timeout > time && {alive _x} count _units > 0} do
{
	{
		_delete = false;
		If (alive _x) then
		{
			_unit = _x;
			_target = _targetpos;
			If (typename _targetpos == "ARRAY") then
			{
				_Pos = [_targetpos,[0,20],[0,360],0,[0,100],0] call UPSMON_pos;
				_target = createVehicle ["UserTexture1m_F",[_Pos select 0,_Pos select 1,1], [], 0, "NONE"];
				_delete = true;
			};

			If ([_unit,_target,300,130] call UPSMON_Haslos) then
			{
				[_unit,_target,100] call UPSMON_DOwatch;
				sleep 1;
				_direction = [_unit, _target] call BIS_fnc_dirTo;
				_unit setDir _direction;
				_weapon = primaryweapon _unit;
				_mode = getArray (configFile >> "cfgweapons" >> _weapon >> "modes");
				_firemode = "SINGLE";
				If (random 100 < 60) then
				{
					If ("fullauto_medium" in _mode) then {_firemode = "fullauto_medium";};
					If ("short" in _mode) then {_firemode = "short";};
				};
				if ((_mode select 0) == "this") then {_mode = _weapon};
				If (needReload _unit == 1) then {reload _unit};
				_unit selectWeapon (primaryweapon _unit);
				_unit forceWeaponFire [ weaponState _unit select 1,_firemode];
				[_unit] spawn 
				{
					sleep 5; 
					(_this select 0) doTarget ObjNull;
					(_this select 0) dofire ObjNull;
					(_this select 0) doWatch ObjNull;
				};
			};
			
			if (_delete) then
			{
				[_target] spawn {sleep 5; Deletevehicle (_this select 0)};
			};
		};
	} foreach _units;
	sleep ((random 0.4) +0.4);
};