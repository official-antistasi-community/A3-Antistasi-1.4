params ["_posDestination", "_side", ["_supportName", "Small attack"]];

/*  Chooses the type of attack or QRF used against the destination position

    Execution on: HC or Server

    Scope: Internal

    Parameters:
        _posDestination: POSITION : The target destination
        _side: SIDE : The attacking side
        _supportName: STRING : The callname of the support (Optional: default is "Small attack")

    Returns:
        _typeOfAttack: STRING : The type of the attack, "" if no attack should happen
*/
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

//Search for nearby enemies
private _enemyGroups = allGroups select
{
    (side _x != _side) &&
    {side _x != civilian &&
    {(getPos (leader _x) distance2D _posDestination) < distanceSPWN2}}
};
private _nearEnemies = [];
{
    _nearEnemies append ((units _x) select {alive _x});
} forEach _enemyGroups;

//Select the type of attack (or more precise against what the attack will fight)
private _typeOfAttack = "Normal";
{
	if !(isNull (objectParent _x)) then
	{
		private _enemyVehicle = objectParent _x;
		if (_enemyVehicle isKindOf "Plane") exitWith
        {
            _typeOfAttack = "Air"
        };
		if (_enemyVehicle isKindOf "Helicopter") then
		{
			_weapons = getArray (configfile >> "CfgVehicles" >> (typeOf _enemyVehicle) >> "weapons");
			if (_weapons isEqualType []) then
			{
				if (count _weapons > 1) then
                {
                    _typeOfAttack = "Air"
                };
			};
		}
		else
		{
			if (_enemyVehicle isKindOf "Tank") then
            {
                _typeOfAttack = "Tank"
            };
		};
	};
	if (_typeOfAttack != "Normal") exitWith {};
} forEach _nearEnemies;

_typeOfAttack;
