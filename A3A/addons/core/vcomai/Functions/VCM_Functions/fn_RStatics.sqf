
/*
	Author: Genesis

	Description:
		Function for defining the list of units with statics and etc.

	Parameter(s):
		0: GROUP - Group to check for statics.

	Returns:
		ARRAY - Format [staticList, satchelList, mineList]
*/

private _staticList = [];

{
	if (isNull objectParent _x) then {
		//Define static weapon
		private _currentBackPack = backpack _x;
		private _class = "";
		if !(_currentBackPack isEqualTo "") then {
			_class = [_currentBackPack] call VCM_fnc_Classname;
			private _parents = [_class,true] call BIS_fnc_returnParents;
			if (!(isNil "_parents")) then {
				if (("StaticWeapon" in _parents) || {("Weapon_Bag_Base" in _parents)}) then {
					private _VCOM_HASUAV = false;
					if (["UAV",_currentBackPack, false] call BIS_fnc_inString) then {_VCOM_HASUAV = true;};
					_staticList pushBack [_x, _currentBackPack, _VCOM_HASUAV];
				};
			};
		};

		if (VCM_ARTYENABLE) then {_x call VCM_fnc_CheckArty;};
	};
} forEach (units _this);

_staticList