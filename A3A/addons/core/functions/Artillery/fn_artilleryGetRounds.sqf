#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_roundType", "_vehicle"];

private _rounds = 0;
private _class = ObjNull;
private _mags = [];

_mags = [_mags, magazinesAmmo _vehicle] call BIS_fnc_arrayPushStack;

//ServerDebug_1("Mags: %1", _mags);

{
	switch (_roundType) do {
		case "HE": 
		{
			private _ammo = tolower gettext (configFile>> "CfgMagazines" >> (_x select 0) >> "ammo");
			private _parents = [(configFile>> "CfgAmmo" >> _ammo), true] call BIS_fnc_returnParents;
	
			If ("ShellBase" in _parents) then {
				_class = _x select 0;
				_rounds = _rounds + (_x select 1);
			};
		};
		
		case "AT": 
		{
			private _ammo = tolower gettext (configFile>> "CfgMagazines" >> (_x select 0) >> "ammo");
			private _cfg = tolower gettext (configFile>> "CfgAmmo" >> _ammo >> "submunitionAmmo");
	
			If (_cfg == "M_Mo_82mm_AT_LG") then {
				_class = _x select 0;
				_rounds = _rounds + (_x select 1);
			};
		};
		
		case "SMOKE": 
		{
			private _ammo = tolower gettext (configFile>> "CfgMagazines" >> (_x select 0) >> "ammo");
			private _cfg = tolower gettext (configFile>> "CfgAmmo" >> _ammo >> "submunitionAmmo");
	
			If (_cfg == "SmokeShellArty") then {
				_class = _x select 0;
				_rounds = _rounds + (_x select 1);
			};

			if (A3A_hasRHS) then {
				if (_cfg == "rhs_ammo_d832du_smoke") then {
					_class = _x select 0;
					_rounds = _rounds + (_x select 1);
				};
			};
		};
		
		case "ILLUM": 
		{
			private _ammo = tolower gettext (configFile>> "CfgMagazines" >> (_x select 0) >> "ammo");
			private _parents = [(configFile>> "CfgAmmo" >> _ammo),true] call BIS_fnc_returnParents;
	
			If ("FlareCore" in _parents) then {
				_class = _x select 0;
				_rounds = _rounds + (_x select 1);
			};

			if (A3A_hasRHS) then {
				_ammo = tolower gettext (configFile>> "CfgMagazines" >> (_x select 0) >> "ammo");

				if (_ammo == "rhs_ammo_3vs25m") then {
					_class = _x select 0;
					_rounds = _rounds + (_x select 1);
				};
			};
		};

		default
		{
			private _ammo = tolower gettext (configFile>> "CfgMagazines" >> (_x select 0) >> "ammo");
			private _parents = [(configFile>> "CfgAmmo" >> _ammo), true] call BIS_fnc_returnParents;
	
			If ("ShellBase" in _parents) then {
				_class = _x select 0;
				_rounds = _rounds + (_x select 1);
			};
		};
	};	
} foreach _mags;

private _result = [_rounds, _class];
//ServerDebug_1("_result: %1", _result);
_result