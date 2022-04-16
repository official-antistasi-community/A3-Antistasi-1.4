/*
	Author: Genesis

	Description:
		Returns if a vehicle is a transport vehicle. Will only consider vehicles "transport" vehicles IF they have AI in cargo slots.

	Parameter(s):
		0: GROUP

	Returns:
		0: BOOL - true = transport vehicle, false = normal vehicle
*/


private _TransportVehicle = false;

{
	{
		if (_x select 1 isEqualTo "cargo") exitWith
		{
			_TransportVehicle = true;
		};
	} foreach (fullcrew [_x,"cargo",false]);
} foreach _this;


_TransportVehicle