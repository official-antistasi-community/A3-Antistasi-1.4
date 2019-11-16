#include "defineCommon.inc"

params [ ["_vehicle",objNull,[objNull]] ];

//incase you are looking to attached item
if !(isnull (attachedto _vehicle))then{_vehicle = attachedto _vehicle};

//close if it couldnt save
_message = _vehicle call jn_fnc_garage_canGarageVehicle;
if!(_message isEqualTo "")exitWith {hint _message};

//save it on server
_dataAndIndex = _vehicle call jn_fnc_garage_getVehicleData;
_dataAndIndex remoteExecCall ["jn_fnc_garage_addVehicle",2];

//delete attach weapon
private _attachItems = [];
{
	private _type = (_x getVariable ["jnl_cargo",[-1,0]]) select 0;
	if(_type == 0)then{
		_x hideObject true;
		detach _x;
		deleteVehicle _x;
	};
} forEach attachedObjects _vehicle;

deleteVehicle _vehicle;

//set message it was saved
_data = _dataAndIndex select 0;
SPLIT_SAVE
hint (_name + " stored in garage");
