params ["_plane", "_type"];

/*  Equips a plane with the needed loadout
    Params:
        _plane: OBJECT : The actual plane object
        _type: STRING : The type of attack plane, either "CAS" or "AA"
    Returns:
        Nothing
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _loadout = [];

if (_type == "CAS") then
{
    private _configPath = configFile >> "A3A" >> "Loadouts" >> "CASPlane" >> typeOf _plane;

    if(isNull _configPath) then {
        Error_1("%1 has no loadout set", typeOf _plane);
    };

    _loadout = getArray(_configPath >> "loadout");

    _plane setVariable ["mainGun", getArray(_configPath >> "mainGun") select 0];
    _plane setVariable ["rocketLauncher", getArray(_configPath >> "rocketLauncher")];
    _plane setVariable ["missileLauncher", getArray(_configPath >> "missileLauncher")];

    _plane setVariable ["bombRacks", getArray(_configPath >> "bombRacks")];
    _plane setVariable ["diveParams", getArray(_configPath >> "diveParams")];

    [_plane, _type] call (compile (getText(_configPath >> "code")));
};
if (_type == "AA") then
{
    private _configPath = configFile >> "A3A" >> "Loadouts" >> "CAPPlane" >> typeOf _plane;

    if(isNull _configPath) then {
        Error_1("%1 has no loadout set", typeOf _plane);
    };

    _loadout = getArray(_configPath >> "loadout");
    [_plane, _type] call (compile (getText(_configPath >> "code")));
};

if !(_loadout isEqualTo []) then
{
    Debug("Selected new loadout for plane, now equiping plane with it");
    {
        _plane setPylonLoadout [_forEachIndex + 1, _x, true];
        _plane setVariable ["loadout", _loadout];
    } forEach _loadout;
};
