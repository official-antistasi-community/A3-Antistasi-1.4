#include "defineCommon.inc"

params["_vehicle"];

private _type = typeOf _vehicle;
private _cfg = (configfile >> "CfgVehicles" >> _type);
private _simulation = gettext (_cfg >> "simulation");


private _index = switch (tolower _simulation) do {
	case "car";
	case "carx": {
		IDC_JNG_TAB_CAR;
	};
	case "tank";
	case "tankx": {
		if (getnumber (_cfg >> "maxspeed") > 0) then {
			IDC_JNG_TAB_ARMOR;
		} else {
			IDC_JNG_TAB_STATIC;
		};
	};
	case "helicopter";
	case "helicopterx";
	case "helicopterrtd": {
		IDC_JNG_TAB_HELI;
	};
	case "airplane";
	case "airplanex": {
		IDC_JNG_TAB_PLANE;
	};
	case "ship";
	case "shipx";
	case "submarinex": {
		IDC_JNG_TAB_NAVAL;
	};
	default {-1};
};

//return
_index
