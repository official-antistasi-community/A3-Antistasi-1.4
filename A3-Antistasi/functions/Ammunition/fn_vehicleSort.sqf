////////////////////////////////////
//      Static Weapons List      ///
////////////////////////////////////
{
if (getText (configfile >> "CfgVehicles" >> _x >> "editorSubcategory") isEqualTo "EdSubcat_Turrets") then
	{
	private _staticSide = getNumber (configfile >> "CfgVehicles" >> _x >> "side");
	switch (_staticSide) do
		{
		case 0: {invaderStaticWeapon pushBack _x};
		case 1: {occupantStaticWeapon pushBack _x};
		case 2: {rebelStaticWeapon pushBack _x};
		};
	};
} forEach allUnknown;

//Clean allUnknown of Statics
{
allUnknown deleteAt (allUnknown find _x);
} forEach invaderStaticWeapon + occupantStaticWeapon + rebelStaticWeapon;

///////////////////////////////////
//      Civilian Vehicles       ///
///////////////////////////////////
