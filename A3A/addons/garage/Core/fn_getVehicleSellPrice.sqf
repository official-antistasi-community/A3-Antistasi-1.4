#include "defines.inc"
FIX_LINE_NUMBERS()

#define OccAndInv(VAR) (FactionGet(occ, VAR) + FactionGet(inv, VAR))

params [["_veh",objNull],["_isGRG",false]];

/*
Blacklisted Assets

The array below contains classnames of assets which are not allowed to be sold within Antistasi.
Reason for this is that those items are one or more of the following:
- can be aquired by means that don't cost anything and the ability to sell those would be an infinite money exploit.
- are no proper "statics" in terms of weaponized statics but for example the ACE spotting scoped
- something else
*/
private _blacklistedAssets = [
"ACE_I_SpottingScope","ACE_O_SpottingScope","ACE_O_T_SpottingScope","ACE_B_SpottingScope","ACE_B_T_SpottingScope","ACE_SpottingScopeObject",
"O_Static_Designator_02_F","B_Static_Designator_01_F","B_W_Static_Designator_01_F",
"vn_o_nva_spiderhole_01","vn_o_nva_spiderhole_02","vn_o_nva_spiderhole_03",
"vn_o_pl_spiderhole_01","vn_o_pl_spiderhole_02","vn_o_pl_spiderhole_03",
"vn_o_vc_spiderhole_01","vn_o_vc_spiderhole_02","vn_o_vc_spiderhole_03"];

private _typeX = if (_isGRG) then {_veh;} else {typeOf _veh;};

if (_typeX in _blacklistedAssets) exitWith {0};

if (_veh isKindOf "StaticWeapon") exitWith {100};			// in case rebel static is same as enemy statics

if (_typeX in FactionGet(all,"vehiclesReb")) exitWith { ([_typeX] call A3A_fnc_vehiclePrice) / 2 };

if (
    (_typeX in arrayCivVeh)
    or (_typeX in civBoats)
    or (_typeX in (FactionGet(reb,"vehiclesCivBoat") + FactionGet(reb,"vehiclesCivCar") + FactionGet(reb,"vehiclesCivTruck")))
) exitWith {25};

if (
    (_typeX in FactionGet(all,"vehiclesLight"))
    or (_typeX in OccAndInv("vehiclesTrucks"))
    or (_typeX in OccAndInv("vehiclesCargoTrucks"))
    or (_typeX in OccAndInv("vehiclesMilitiaTrucks"))
    or (_typeX in FactionGet(reb,"vehiclesTruck"))
) exitWith {100};

if (
    (_typeX in FactionGet(all,"vehiclesBoats"))
    or (_typeX in FactionGet(all,"vehiclesLightAPCs"))
    or (_typeX in OccAndInv("vehiclesAmmoTrucks"))
    or (_typeX in OccAndInv("vehiclesRepairTrucks"))
    or (_typeX in OccAndInv("vehiclesFuelTrucks"))
    or (_typeX in OccAndInv("vehiclesMedical"))
) exitWith {200};

if (_typeX in (FactionGet(all,"vehiclesHelisLight") + FactionGet(reb,"vehiclesCivHeli"))) exitWith {500};

if (
    (_typeX in FactionGet(all,"vehiclesAPCs"))
    || (_typeX in FactionGet(all,"vehiclesIFVs"))
    || (_typeX in FactionGet(all,"vehiclesLightTanks"))
    || (_typeX in FactionGet(all,"vehiclesHelisLightAttack"))
    || (_typeX in FactionGet(all,"vehiclesTransportAir"))
    || (_typeX in FactionGet(all,"vehiclesUAVs"))
) exitWith {1000};

if (
    (_typeX in FactionGet(all,"vehiclesHelisAttack"))
    or (_typeX in FactionGet(all,"vehiclesTanks"))
    or (_typeX in FactionGet(all,"vehiclesAA"))
    or (_typeX in FactionGet(all,"vehiclesArtillery"))
) exitWith {3000};

if (_typeX in (FactionGet(all,"vehiclesPlanesCAS") + FactionGet(all,"vehiclesPlanesAA"))) exitWith {4000};

0;