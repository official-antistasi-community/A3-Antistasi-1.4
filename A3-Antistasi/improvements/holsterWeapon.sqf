/*
file: holsterWeapon.sqf
by DaVidoSS
adds ability to holster your primary weapon on back (hands free)
created for Barbolani's Antistasi
require CBA
parameters NUMBER
return VOID
*/
if !(hasInterface) exitWith {};

private _key = ["Primary Weapon Holster","holster_pweapon_key", "Put your rifle on the back", {player action ['SWITCHWEAPON',player,player,-1]}, "", [_this select 0, [false, false, false]], false] call CBA_fnc_addKeybind;
sleep 5;
systemChat format ["To put your rifle on the back, press   %1",[[_key select 0] call BIS_fnc_keyCode] call CBA_fnc_capitalize];
