/*
Author: Håkon
Description:
    Generates a list off all assets used by the factions, replaces old global variables like vehAttack

Arguments: <Nil>

Return Value: <Hashmap> the hashmap A3A_faction_all

Scope: Server
Environment: unscheduled
Public: No
Dependencies:

Example:

License: MIT License
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

#define OccAndInv(VAR) (FactionGetOrDefault(occ, VAR, []) + FactionGetOrDefault(inv, VAR, []))
#define Reb(VAR) FactionGetOrDefault(reb, VAR, [])

A3A_faction_all = createHashMap;
//setVar expects an array
#define setVar(VAR, VALUE) A3A_faction_all set [VAR, (VALUE) arrayIntersect (VALUE)];
#define getVar(VAR) (A3A_faction_all get VAR)

  //=====\\
 // Units \\
// ======= \\
Info("Identifying unit types");

//create empty lists
private _squadLeaders = [];
private _medics = [];

//add occ and inv units to the lists
{
    private _prefix = _x;
    {
        _squadLeaders pushBack ('loadouts_'+_prefix+_x+'SquadLeader');//type
        _medics pushBack ('loadouts_'+_prefix+_x+'Medic');
    } forEach ["militia_","military_","SF_"];//section
} forEach ["occ_", "inv_"];//prefix

//then rebel units
_squadLeaders pushBack 'loadouts_reb_militia_SquadLeader';
_medics pushBack 'loadouts_reb_militia_Medic';

//set the lists in the hm
setVar("SquadLeaders", _squadLeaders);
setVar("Medics", _medics);

  //========\\
 // Vehicles \\
// ========== \\
Info("Identifying vehicle types");

//Occ&Inv X vehicles
setVar("vehiclesPolice", OccAndInv("vehiclesPolice"));
setVar("vehiclesAttack", OccAndInv("vehiclesAttack") );
setVar("vehiclesUAVs", OccAndInv("uavsAttack")+ OccAndInv("uavsPortable") );
setVar("vehiclesAmmoTrucks", OccAndInv("vehiclesAmmoTrucks") );
setVar("vehiclesAPCs", OccAndInv("vehiclesAPCs") );
setVar("vehiclesTanks", OccAndInv("vehiclesTanks"));
setVar("vehiclesAA", OccAndInv("vehiclesAA") );
setVar("vehiclesArtillery", OccAndInv("vehiclesArtillery"));
setVar("vehiclesTransportAir", OccAndInv("vehiclesHelisLight") + OccAndInv("vehiclesHelisTransport") + OccAndInv("vehiclesPlanesTransport") );
setVar("vehiclesHelisLight", OccAndInv("vehiclesHelisLight"));
setVar("vehiclesHelisAttack", OccAndInv("vehiclesHelisAttack"));
setVar("vehiclesHelisTransport", OccAndInv("vehiclesHelisTransport"));
setVar("vehiclesPlanesTransport", OccAndInv("vehiclesPlanesTransport"));
setVar("staticMortars", OccAndInv("staticMortars") + [Reb("staticMortar")]);

private _vehMilitia = OccAndInv("vehiclesMilitiaCars")
+ OccAndInv("vehiclesMilitiaTrucks")
+ OccAndInv("vehiclesMilitiaLightArmed");
setVar("vehiclesMilitia", _vehMilitia);

//boats
private _vehBoats = OccAndInv("vehiclesTransportBoats") + OccAndInv("vehiclesGunBoats") + [Reb("vehicleBoat")];
setVar("vehiclesBoats", _vehBoats);

//Occ&Inv helicopters
private _vehHelis =
OccAndInv("vehiclesHelisTransport")
+ OccAndInv("vehiclesHelisAttack")
+ OccAndInv("vehiclesHelisLight");
setVar("vehiclesHelis", _vehHelis);

//fixed winged aircrafts
private _vehFixedWing =
OccAndInv("vehiclesPlanesCAS")
+ OccAndInv("vehiclesPlanesAA")
+ OccAndInv("vehiclesPlanesTransport")
+ [Reb("vehiclePlane")];
setVar("vehiclesFixedWing", _vehFixedWing);

//trucks to carry infantry
private _vehTrucks =
OccAndInv("vehiclesTrucks")
+ OccAndInv("vehiclesMilitiaTrucks")
+ [Reb("vehicleTruck")];
setVar("vehiclesTrucks", _vehTrucks);

//all Occ&Inv armor
private _vehArmor =
getVar("vehiclesTanks")
+ getVar("vehiclesAA")
+ getVar("vehiclesArtillery")
+ getVar("vehiclesAPCs");
setVar("vehiclesArmor", _vehArmor);

//vehicles that the AI have "unlimited" of
private _vehUnlimited =
OccAndInv("vehiclesLight")
+ OccAndInv("vehiclesTrucks")
+ OccAndInv("vehiclesAmmoTrucks")
+ OccAndInv("vehiclesRepairTrucks")
+ OccAndInv("vehiclesFuelTrucks")
+ OccAndInv("vehiclesMedical")
+ OccAndInv("vehiclesTransportBoats")
+ OccAndInv("vehiclesHelisLight")
+ OccAndInv("uavsAttack")
+ OccAndInv("uavsPortable")
+ OccAndInv("staticMGs")
+ OccAndInv("staticMortars");
setVar("vehiclesUnlimited", _vehUnlimited);

//rebel vehicles
private _vehReb = [
    Reb("vehicleBasic"), Reb("vehicleTruck"), Reb("vehicleRepair"), Reb("vehicleBoat")
    , Reb("vehicleAT"), Reb("vehicleLightArmed"), Reb("vehicleLightUnarmed")
    , Reb("staticMG"), Reb("staticAT"), Reb("staticAA"), Reb("staticMortar")
];
setVar("vehiclesReb", _vehReb);

//trucks that can cary logistics cargo
private _vehCargoTrucks = (_vehTrucks + OccAndInv("vehiclesCargoTrucks")) select { [_x] call A3A_fnc_logistics_getVehCapacity > 1 };
setVar("vehiclesCargoTrucks", _vehCargoTrucks);

missionNamespace setVariable ["A3A_faction_all", A3A_faction_all, true];
A3A_faction_all
