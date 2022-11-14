/****************************************************************
File: UPSMON_checkwindowposition.sqf
Author: Azroul13

Description:
	Get all windows position of the building

Parameter(s):
	<--- Building
Returns:
	windows positions.
****************************************************************/

private ["_model_pos","_world_pos","_armor","_cfg_entry","_veh","_house","_window_pos_arr","_cfgHitPoints","_cfgDestEff","_brokenGlass","_selection_name"];

_house = _this select 0;
_window_pos_arr = [];

_cfgHitPoints = (configFile >> "cfgVehicles" >> (typeOf _house) >> "HitPoints");

for "_i" from 0 to count _cfgHitPoints - 1 do 
{
	_cfg_entry = _cfgHitPoints select _i;
    
	if (isClass _cfg_entry) then
	{
		_armor = getNumber (_cfg_entry / "armor");

		if (_armor < 10) then
		{
			_cfgDestEff = (_cfg_entry / "DestructionEffects");
			_brokenGlass = _cfgDestEff select 0;
			_selection_name = getText (_brokenGlass / "position");
			_model_pos = _house selectionPosition _selection_name;
			_world_pos = _house modelToWorld _model_pos;
			_window_pos_arr pushback _world_pos;
		};
	};
};
_window_pos_arr