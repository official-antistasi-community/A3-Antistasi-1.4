private ["_unit","_muzzles","_muzzle","_magazines"];

_unit = _this select 0;

_muzzles = [];
_muzzle = "";
_magazines = magazines _unit select {_x in allSmokeGrenades};

{
switch (_x) do
	{
	case "SmokeShell": {_muzzles pushBack "SmokeShellMuzzle"};
	case "SmokeShellRed": {_muzzles pushBack "SmokeShellRedMuzzle"};
	case "SmokeShellGreen": {_muzzles pushBack "SmokeShellGreenMuzzle"};
	case "SmokeShellBlue": {_muzzles pushBack "SmokeShellBlueMuzzle"};
	case "SmokeShellYellow": {_muzzles pushBack "SmokeShellYellowMuzzle"};
	case "SmokeShellPurple": {_muzzles pushBack "SmokeShellPurpleMuzzle"};
	case "SmokeShellOrange": {_muzzles pushBack "SmokeShellOrangeMuzzle"};

	case "LIB_NB39": {_muzzles pushBack "LIB_SmokeShellMuzzle"};
	case "LIB_RDG": {_muzzles pushBack "LIB_SmokeShellMuzzle"};

	case "rhs_mag_an_m8hc": {_muzzles pushBack "Rhsusf_Throw_Smoke_white"};
	case "rhs_mag_m18_green": {_muzzles pushBack "Rhsusf_Throw_Smoke_green"};
	case "rhs_mag_m18_red": {_muzzles pushBack "Rhsusf_Throw_Smoke_red"};
	case "rhs_mag_m18_yellow": {_muzzles pushBack "Rhsusf_Throw_Smoke_yellow"};
	case "rhs_mag_m18_purple": {_muzzles pushBack "Rhsusf_Throw_Smoke_purple"};
	case "rhs_mag_rdg2_white": {_muzzles pushBack "Rhs_Throw_Smoke"};
	case "rhs_mag_rdg2_black": {_muzzles pushBack "Rhs_Throw_Smoke_black"};
	case "rhs_mag_nspd": {_muzzles pushBack "Rhs_Throw_Smoke_nspd"};
	};
} forEach _magazines;

if (count _muzzles > 0) then {_muzzle = selectRandom _muzzles};

_muzzle
