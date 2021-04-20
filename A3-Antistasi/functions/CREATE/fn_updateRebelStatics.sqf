
params ["_marker"];

// do we need specified _possibleCrew and _freeStatics, plus return value?

//principle...
// call this function whenever:
// 1. A static weapon is added to a marker (area)
// 2. Riflemen are added to a marker
// 3. A static weapon is changed from locked to unlocked

// how does this work with spawning?
// spawn group of riflemen equal to unlocked statics, then call the function. lol.

// scope would be HC or server then?
// rebel garrison spawn would be HC target
// player usage would be server target

// now *ideally* we use same group for init and later changes
// but that's difficult to arrange
// can simplify a lot with group-per-machine?

// sanity check that marker is rebel?
// sanity check that the marker is spawned...

private _statics = staticsToSave inAreaArray _marker;
_statics = _statics select { !(_x isKindOf "StaticMortar") };           // don't bother with mortars yet
if (count _statics == 0) exitWith {};

// Find unlocked & unoccupied statics
private _freeStatics = _statics select {
    isNil { _x getVariable "lockedForAI" }
    and isNull (gunner _x)
};
if (count _freeStatics == 0) exitWith {};

// Identify all garrison riflemen in area
private _possibleCrew = allUnits inAreaArray _marker;
_possibleCrew = _possibleCrew select {
    _x getVariable ["markerX", ""] isEqualTo _marker
    and _x getVariable ["UnitType", ""] isEqualTo SDKMil
    and isNull objectParent _x
    and side group _x isEqualTo teamPlayer
};
if (count _possibleCrew == 0) exitWith {};

// Identify current local static group for marker, if any
private _staticGroup = grpNull;
{
    if (isNull gunner _x) continue;
    if !(local gunner _x) continue;
    if !(gunner _x getVariable ["markerX", ""] isEqualTo _marker) continue;
    _staticGroup = group gunner _x; break;
} forEach _statics;

if (isNull _staticGroup) { _staticGroup = createGroup [teamPlayer, true] };

{
    if (count _possibleCrew == 0) exitWith {};
    private _unit = _possibleCrew deleteAt 0;
    [_unit] joinSilent _staticGroup;

    // Wait until the unit is local before we do anything else
    [_unit, _x] spawn {
        params ["_unit", "_static"];
        private _timeout = 10;
        waitUntil { sleep 1; _timeout = _timeout-1; _timeout < 0 or local _unit };
        if (isNull objectParent _unit and isNull gunner _static) then {
            _unit assignAsGunner _x;
            _unit moveInGunner _x;
        };
    };
} forEach _freeStatics;

// what about spamming?
// ok, kinda handled...
// it's probably fine lol

// so ideally, each garrison is strictly assigned to a HC/server
// and statics per garrison are stored in a setVariable


// hokay...
// need to see how fast joinSilent works wrt. locality changes
// minimum: a few frames. So we need to delay.

// need to think about mortars at some point...
// ideally move those into same structure? Any issues aside from UPSMON?

// don't fuck around, just chuck them straight in there?
// potential locality problems. Not guaranteed that all AIs are local on same machine.
// subfunction to do the actual move-in?

// do the commander too?
