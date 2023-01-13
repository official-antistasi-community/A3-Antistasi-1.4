/*
    Set face, voice, pitch and name of unit. Global effect and JIP-safe.

Scope: Any
Environment: Any
Public: Yes

Arguments:
    <OBJECT> Object to set identity for
    <STRING> Optional: Face of unit
    <STRING> Optional: Voice/speaker of unit
    <STRING> Optional: (Voice) pitch of unit
    <STRING> Optional: Name of unit
*/

params ["_unit"];           // Don't care about the other params here

if (isNull _unit) exitWith {};
private _JIPID = "identity_" + netId _unit;
([_JIPID] + _this) remoteExec ["A3A_fnc_setIdentityLocal", 0, _JIPID];

// This won't be 100% reliable because it's only installed locally, but it'll avoid remoteExec spam on connection
_unit addEventHandler ["Deleted", {
    remoteExec ["", "identity_" + netId _unit];
}];
