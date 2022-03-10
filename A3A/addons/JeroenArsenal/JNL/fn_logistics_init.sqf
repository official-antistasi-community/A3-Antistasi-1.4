/*
  As of the MIE project, this file is now only used for defining the arrays and for the code at the bottom.
  All data entry has been moved into the Templates folder.
*/
//This array hold the nodes for attaching weapons and cargo.
//jnl_vehicleHardpoints = [];

//lock seats when cargo is added || Not sure why this is here when it's defined on the node mapping.
jnl_vehicleLockedSeats = [
	["\A3\soft_f\Offroad_01\Offroad_01_unarmed_F",[1,2,3,4]],
	["\A3\soft_f_gamma\van_01\Van_01_transport_F.p3d",[]],
	["\A3\soft_f_beta\Truck_02\Truck_02_transport_F",[2,3,4,5,6,7,8,9,10,11,12,13]]
];

//These are arrays for the weapon sets for different vehicle classes
//jnl_smallVicWeapons = [];
//jnl_largeVicWeapons = [];

//This array lists the static weapons that can be attached to any given vehicle
//jnl_allowedWeapons = [];

//This array holds the list of offsets for static weapons.
//jnl_attachmentOffset = [];

//Beyond this point is code that is still used and has not been touched in the MIE project.
//todo replace with real items that are avalable
jng_staticWeaponList = [];
_defaultCrew = gettext (configfile >> "cfgvehicles" >> "all" >> "crew");
{
	_simulation = gettext (_x >> "simulation");
	if(tolower _simulation isEqualTo "tankx")then{
		if !(getnumber (_x >> "maxspeed") > 0) then {
			jng_staticWeaponList pushBack configName _x;;
		};
	};
} foreach ("isclass _x && {getnumber (_x >> 'scope') == 2} && {gettext (_x >> 'crew') != _defaultCrew}" configclasses (configfile >> "cfgvehicles"));

jnl_initCompleted = true;
