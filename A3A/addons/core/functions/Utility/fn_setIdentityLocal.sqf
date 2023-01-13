/*
    Sets specified identity of unit locally. Clears JIP if unit no longer present

Scope: Any
Environment: Any
Public: No, should only be called by setIdentity

Arguments:
    <STRING> JIP ID of operation
    <OBJECT> Object to set identity for
    <STRING> Optional: Face of unit
    <STRING> Optional: Voice/speaker of unit
    <STRING> Optional: (Voice) pitch of unit
    <STRING> Optional: Name of unit
*/

params ["_JIPID", "_unit", "_face", "_speaker", "_pitch", "_name"];

// isRemoteExecutedJIP is not trustworthy from HC->client, so just do it anyway
if (isNull _unit) exitWith { remoteExec ["", _JIPID] };

if !(isNil "_face") then { _unit setFace _face };
if !(isNil "_speaker") then { _unit setSpeaker _speaker };
if !(isNil "_pitch") then { _unit setPitch _pitch };
if !(isNil "_name") then { _unit setName [_name, "", ""] };
