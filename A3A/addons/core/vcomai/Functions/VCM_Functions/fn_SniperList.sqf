
/*
	Author: Genesis

	Description:
		This function checks all AI in a group, and exports a list of all units deemed as snipers.

	Parameter(s):
		0: GROUP - Group to check

	Returns:
		ARRAY - Format [_Unit1,_Unit2,_Unit3,_Unit4,etc]
*/

private _RtrnList = [];

{
	private _Items = primaryWeaponItems _x;
	private _Item = _Items # 2;	
	if !(_Item isEqualTo "") then
	{
		private _Unit = _x;
		private _SightTypes = (configfile >> "CfgWeapons" >> _Item >> "ItemInfo" >> "OpticsModes") call BIS_fnc_getCfgSubClasses;
		
		{
			if (getNumber (configfile >> "CfgWeapons" >> _Item >> "ItemInfo" >> "OpticsModes" >> _x >> "distanceZoomMax") > 800) exitwith
			{
				_RtrnList pushback _Unit;
				_Unit setSkill ["spotTime",1];
				_Unit setSkill ["spotDistance",1];
				_Unit setCustomAimCoef 0;
			};
		} foreach _SightTypes;
		
	}; 
	
} foreach (units _this);


_RtrnList
