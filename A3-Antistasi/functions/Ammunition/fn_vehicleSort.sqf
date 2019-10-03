////////////////////////////////////
//      Static Weapons List      ///
////////////////////////////////////
{
if (getText (configfile >> "CfgVehicles" >> _x >> "editorSubcategory") isEqualTo "EdSubcat_Turrets") then
	{
	_staticSide = getNumber (configfile >> "CfgVehicles" >> _x >> "side");
	switch (_staticSide) do
		{
		case 0: {eastStaticWeapon pushBack _x};
		case 1: {westStaticWeapon pushBack _x};
		case 2: {independentStaticWeapon pushBack _x};
		};
	};
} forEach allUnknown;

//Clean allUnknown of Statics
{
allUnknown deleteAt (allUnknown find _x);
} forEach eastStaticWeapon + westStaticWeapon + independentStaticWeapon;
