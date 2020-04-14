/*  Handles the despawn and cleanup of dead units
*   Params:
*       _victim : OBJECT : The dead unit
*
*   Returns:
*       Nothing
*/

params ["_victim"];
private _filename = "fn_postmortem";
private _group = group _victim;

[3,"PostMortem Called",_filename] call A3A_fnc_log;
if (isnull _victim)exitwith{[1,"Function failed called with null param.",_filename] call A3A_fnc_log;};

if (isNull _group) then
{
    [3,format["Group for victim :: %1, no group found! Removing from Statics list.",_victim],_filename] call A3A_fnc_log;

	if (_victim in staticsToSave) then
    {
        staticsToSave = staticsToSave - [_victim];
        publicVariable "staticsToSave";
    };
};

cleanSTR = format ["Pausing for %1 minutes before cleaning victim: %2 and group: %3", round cleantime/60, _victim, _group];
[3,cleanSTR, _filename] call A3A_fnc_log;
sleep cleantime;

if !(isnull _victim) then
{
    [3,format["Cleanup complete for %1 victim.", _victim],_filename] call A3A_fnc_log;
    deleteVehicle _victim;
};

if !(isnull _group) then
{
    [3,format["Cleanup complete for %1 group.", _group],_filename] call A3A_fnc_log;
    deleteGroup _group;
};
