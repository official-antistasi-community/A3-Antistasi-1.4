
params ["_unit", "_helped", "_enemy"];

if !(_unit call A3A_fnc_canFight) exitWith {false};
if (vehicle _unit != _unit) exitWith {false};

if (time < _unit getVariable ["smokeUsed",time - 1]) exitWith {false};
_unit setVariable ["smokeUsed",time + 60];

private _smokeMags = magazines _unit select { _x in A3A_smokeMuzzleHM };
if (isNil "_enemy") then { _enemy = _unit findNearestEnemy _unit };

private _return = false;
if (_smokeMags isNotEqualTo []) then
{
    if (!isNull _enemy and {_enemy distance _unit > random 75}) then			// higher chance of throwing smoke for far enemies
    {
        // Is eyePos _helped really the best thing to use here? 
        if (behaviour _unit == "COMBAT" or isPlayer _helped or {([objNull, "VIEW"] checkVisibility [eyePos _enemy, eyePos _helped]) > 0}) then
        {
            _muzzle = A3A_smokeMuzzleHM get selectRandom _smokeMags;
            _unit disableAI "PATH";
            _unit doWatch getPosATL _enemy;				// required for non-visible enemies
            _unit doTarget _enemy;						// less glitchy if enemy is visible
            sleep (abs (_unit getRelDir _enemy) / 90);
            _unit disableAI "MOVE";						// this and the sleep 1 are required so grenade is thrown in correct direction
            _unit setDir ((_unit getDir _enemy) - 10 + random 20);
            _unit forceWeaponFire [_muzzle,_muzzle];	// fails to work sometimes when unit is in a reload animation. Not worth fixing 
            sleep 1;
            _unit enableAI "MOVE";
            _unit enableAI "PATH";
            _unit doWatch objNull;
            _unit doFollow (leader _unit);
            _return = true;
        };
    };
};
_return
