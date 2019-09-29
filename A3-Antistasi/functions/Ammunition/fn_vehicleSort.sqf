/////////////////////////////
//      Static Weapons    ///
/////////////////////////////
{
if (getText (configfile >> "CfgVehicles" >> "B_static_AA_F" >> "editorSubcategory") isEqualTo "EdSubcat_Turrets") then
	{
	_staticSide = getText (configfile >> "CfgVehicles" >> "B_static_AA_F" >> "side");
	switch (_staticSide) do
		{
		case 0: {eastStaticWeapon pushBack _x};
		case 1: {westStaticWeapon pushBack _x};
		case 2: {independentStaticWeapon pushBack _x};
		};
	};
} forEach allUnknown;
