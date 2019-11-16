/****************************************************************
File: UPSMON_checkdoorposition.sqf
Author: Azroul13

Description:
	Get all doors position of the building

Parameter(s):
	<--- Building
Returns:
	Doors positions.
****************************************************************/
private ["_model_pos","_world_pos","_armor","_cfg_entry","_veh","_house","_window_pos_arr","_cfgHitPoints","_cfgDestEff","_brokenGlass","_selection_name"];

_house = _this select 0;
_anim_source_pos_arr = [];
	
_cfgUserActions = (configFile >> "cfgVehicles" >> (typeOf _house) >> "UserActions");

for "_i" from 0 to count _cfgUserActions - 1 do 
{
	_cfg_entry = _cfgUserActions select _i;
    
	if (isClass _cfg_entry) then
	{
		_display_name = getText (_cfg_entry / "displayname");
		if (_display_name == "Open hatch" or {_display_name == "Open door"}) then
		{
			_selection_name = getText (_cfg_entry / "position");
			_model_pos = _house selectionPosition _selection_name;
			_world_pos = _house modelToWorld _model_pos;
			_anim_source_pos_arr pushback _world_pos;
		};
	};
};

_anim_source_pos_arr