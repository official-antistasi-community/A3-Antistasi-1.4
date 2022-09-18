/*  
Maintainer: John Jordan
    Returns recent losses (in resource units) taken by side within specified area 

Scope: Server only

Arguments:
    <SIDE> The side that took the damage (occupants or invaders)
    <POS2D> Center position
    <SCALAR> Radius in metres

Return value:
    <SCALAR> Recent damage taken by side within area
*/

params ["_side", "_center", "_radius"];

private _recentDamage = 0;
private _damageEvents = [A3A_recentDamageOcc, A3A_recentDamageInv] select (_side == Invaders);
_damageEvents = _damageEvents inAreaArray [_center, _radius, _radius];     // should this be related to marker size? hmm
{ _recentDamage = _recentDamage + (_x#2) % 1000 } forEach _damageEvents;
_recentDamage;
