/*
Author: Jeroen Notenbomer
    Adds items of passed container directly to JNA.
    Usually called on "To Cargo" button inside the JNA interface.

Arguments:
    <OBJECT> Container to add contents directly to JNA.

Scope: Server, Global Arguments, Global Effect
Environment: Any
Public: Yes

Example:
    private _object = missionNamespace getVariable ["jna_object",objNull];
    [_object] remoteExec ["jn_fnc_arsenal_cargoToArsenal",2];
*/

if (!isServer) exitWith {};

params [["_object",objNull,[objNull]]];
if (isNull _object) exitWith {["Error: wrong input given '%1'",_object] call BIS_fnc_error;};

if (isNil { // Run in unschedule scope.
    if (_object getVariable ["A3A_JNA_cargoToArsenal_busy",false]) then {
        nil;  // will lead to exit.
    } else {
        _object setVariable ["A3A_JNA_cargoToArsenal_busy",true];
        0;  // not nil, will allow script to continue.
    };
}) exitWith {};  //  // Silent exit, likely due to spamming

// Grab contents before being cleared.
private _array = _object call jn_fnc_arsenal_cargoToArray;
// Clear cargo
clearMagazineCargoGlobal _object;
clearItemCargoGlobal _object;
clearweaponCargoGlobal _object;
clearbackpackCargoGlobal _object;
// Update datalist on server and client
_array call jn_fnc_arsenal_addItem;

//updated unlocked weapons
/*[] spawn {
    sleep 3;
    [unlockedWeapons,true] call AS_fnc_weaponsCheck;
};*/
if (!isNull _object) then {
    _object setVariable ["A3A_JNA_cargoToArsenal_busy",false];
};
