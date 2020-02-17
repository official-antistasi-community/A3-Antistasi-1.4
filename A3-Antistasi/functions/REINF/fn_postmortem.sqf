params ["_victim"];

/*  Handles the despawn and cleanup of dead units
*   Params:
*       _victim : OBJECT : The dead unit
*
*   Returns:
*       Nothing
*/

private _group = group _victim;
if (isNull _group) then
{
	if (_victim in staticsToSave) then
    {
        staticsToSave = staticsToSave - [_victim];
        publicVariable "staticsToSave";
    };
};

sleep cleantime;
deleteVehicle _victim;
deleteGroup _group;
