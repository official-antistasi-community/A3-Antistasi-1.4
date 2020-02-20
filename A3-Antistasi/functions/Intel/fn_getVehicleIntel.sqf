#define ACCESS_CAR      102
#define ACCESS_ARMOR    200
#define ACCESS_AIR      201
#define ACCESS_HELI     202

params ["_side", "_type"];

/*  Creates the intel text of enemy vehicles for all sides and classes
*   Params:
*       _side : SIDE : The side of the enemy
*       _type : NUMBER : One of 102, 200, 201, 202
*
*   Returns:
*       _text : TEXT : The text for the intel
*/

private _allVehicles = [];
switch (_type) do
{
    case (ACCESS_CAR):
    {
        if(_side == Occupants) then
        {
            _allVehicles = +vehNATOLight;
        }
        else
        {
            _allVehicles = +vehCSATLight;
        };
    };
    case (ACCESS_HELI):
    {
        if(_side == Occupants) then
        {
            _allVehicles = vehNATOTransportHelis + vehNATOAttackHelis;
        }
        else
        {
            _allVehicles = vehCSATTransportHelis + vehCSATAttackHelis;
        };
    };
    case (ACCESS_ARMOR):
    {
        if(_side == Occupants) then
        {
            _allVehicles = +vehNATOAttack;
        }
        else
        {
            _allVehicles = +vehCSATAttack;
        };
    };
    case (ACCESS_AIR):
    {
        if(_side == Occupants) then
        {
            _allVehicles = [vehNATOPlane, vehNATOPlaneAA, vehNATOUAV, vehNATOUAVSmall] + vehNATOTransportPlanes;
        }
        else
        {
            _allVehicles = [vehCSATPlane, vehCSATPlaneAA, vehCSATUAV, vehCSATUAVSmall] + vehCSATTransportPlanes;
        };
    };
};
private _text = "";
private _revealCount = 1 + round (random ((count _allVehicles) - 1));

for "_i" from 1 to _revealCount do
{
    private _vehicle = selectRandom _allVehicles;
    _allVehicles = _allVehicles - [_vehicle];

    private _vehicleName = getText (configFile >> "CfgVehicles" >> _vehicle >> "displayName");
    if([_vehicle] call A3A_fnc_vehAvailable) then
    {
        private _amount = round (timer getVariable [_vehicle, -1]);
        if(_amount == -1) then
        {
            _amount = "∞";
        };
        _text = format ["%1 %2 %3<br/>", _text, _amount, _vehicleName];
    }
    else
    {
        _text = format ["%1 0 %2<br/>", _text, _vehicleName];
    };
};

_text;
