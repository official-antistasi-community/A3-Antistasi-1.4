#define POP_RAND(array) (array deleteAt floor random count array)

params ["_group", ["_range", 50]];

// leader should not issue attack orders
_group enableAttack false;

private _position = getPos (leader _group);
private _staticWeapons = _position nearObjects ["StaticWeapon", _range] select {locked _x != 2 && {_x emptyPositions "gunner" > 0}};
private _buildings = (nearestObjects [_position, ["Building"], _range]) apply {_x buildingPos -1} select {count _x > 0};
diag_log text format["Hazey Debug--- Buildings: %1", _buildings];

{
    if (count _staticWeapons > 0 && {random 1 < 0.31}) then {
        _x assignAsGunner (_staticWeapons deleteAt 0);
        [_x] orderGetIn true;
    } else {
        if (count _buildings > 0 && {random 1 < 0.90}) then {
            private _building = selectRandom _buildings;
            private _position = POP_RAND(_building);

            // if building positions are all taken, remove from possible buildings
            if (_building isEqualTo []) then {
                _buildings = _buildings select {count _x > 0};
            };

            // prevent units from crouching or going prone
            _x setUnitPos "UP";

            // doMoveAndStay
            [_x, _position] spawn {
                params ["_unit", "_position"];

                _unit doMove _position;
                waitUntil {unitReady _unit};
                doStop _unit;
            };
        } else {
            _x doMove _position;
        };
    };
} forEach units _group;