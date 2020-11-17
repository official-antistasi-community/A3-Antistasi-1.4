/*
 * File: fn_logistics_addOrRemoveObjectMass.sqf
 * Author: Ayla (Alsekwolf) and Spoffy, modified for new system by Håkon
 * Description:
 *    Adds or removes mass from a vehicle based on the item being loaded into it.
 * Params:
 *    _vehicle - Vehicle the object is being added to
 *    _object - Object being added to the vehicle
 *    _removeObject - Whether the item is being removed from the vehicle, or added.
 * Returns:
 *    None
 * Example Usage:
 *    [vehicle player, _supplyCrate] call A3A_fnc_logistics_addOrRemoveObjectMass;
 */

params["_vehicle","_object", ["_removeObject", false]];

private _displayVehicleMessage = {
    params ["_veh", "_msg", "_cargoMass"];

    private _vehDefaultMass = _vehicle getVariable "default_mass";

    private _text = format [
        "
        <img image='%1' size='2' align='left'/>
        <t color='#a02e69' size='1.2' shadow='1' shadowColor='#000000' align='center'>%2</t><br/>
        <t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>Default mass: </t>
        <t color='#00ff59' size='1.2' shadow='1' shadowColor='#000000' align='left'>%3</t><br/>
        <t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>Cargo mass: </t>
        <t color='#00ff59' size='1.2' shadow='1' shadowColor='#000000' align='left'>%4</t><br/>
        <t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>Current mass: </t>
        <t color='#00ff59' size='1.2' shadow='1' shadowColor='#000000' align='left'>%5</t><br/>
        ",
        getText(configFile >> "cfgVehicles" >> typeOf _veh >> "picture"),
        getText(configFile >> "cfgVehicles" >> typeOf _veh >> "displayName"),
        _vehDefaultMass,
        _cargoMass,
        _vehDefaultMass + _cargoMass
    ];
    _text = _text + _msg;

    //Don't use customHint, as we've got a lot of custom formatting.
    ["LogisticsInfo", parseText _text] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner];
    ["LogisticsInfo", parseText _text] remoteExec ["A3A_fnc_customHint", crew _vehicle];
};

if (isNil {_vehicle getVariable "default_mass"}) then {
    //Doesn't matter if we're unloading or loading.
    //If this isn't set, the script has never run - so the mass has never changed! So either way, its currently at the default mass.
    _vehicle setVariable ["default_mass", getMass _vehicle];
};

private _defaultMass = _vehicle getVariable "default_mass";


private _objectMass = getMass _object;
private _currentMass = getMass _vehicle;

private _newMass = _currentMass;

//Figure out our new mass value
if (_removeObject) then {
    //Never go lower than the base vehicle's mass.
    _newMass = (_currentMass - _objectMass) max _defaultMass;
} else {
    _newMass = _currentMass + _objectMass;
};

[_vehicle, _newMass] remoteExec ["setMass", _vehicle];

//Pull data on available nodes, so we can display it to the user.
private _nodes = _vehicle getVariable ["logisticsCargoNodes",[]];
private _availableNodes = { (_x#0) isEqualTo 1 } count _nodes;

private _objectName = getText (configFile >> "cfgVehicles" >> typeOf _object >> "displayName");
private _vehicleName = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName");
//Mass of all cargo attached to the vehicle.
private _cargoMass = _newMass - _defaultMass;

//Output the final message.
if (!_removeObject) then
{
    if (_availableNodes == 0) then
    {
        [_vehicle, Format ["<t color='#00fff3'>""%1"" is loaded onto ""%2"" There is no more space.</t>", _objectName, _vehicleName, _availableNodes], _cargoMass] call _displayVehicleMessage;
    }
    else
    {
        [_vehicle, Format ["<t color='#00fff3'>""%1"" is loaded onto ""%2"". Free slots: ""%3"".</t>", _objectName, _vehicleName, _availableNodes], _cargoMass] call _displayVehicleMessage;
    };
}
else
{
    [_vehicle, Format ["<t color='#00fff3'>""%1"" was unloaded from ""%2"". Free slots: ""%3"".</t>", _objectName, _vehicleName, _availableNodes], _cargoMass] call _displayVehicleMessage;
};
