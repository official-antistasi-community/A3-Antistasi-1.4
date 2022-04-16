/*
	Author: Genesis

	Description:
		Function for checking if AI is the driver.

	Parameter(s):
		0: Unit

	Returns:
		NOTHING
	Example1:  unit call VCM_fnc_IsDriver;
*/

_NotDriver = 0;

_Vehicle = (vehicle _this);

_ActualDriver = driver _Vehicle;

if (_this isEqualTo _ActualDriver) then 
{
  
  _NotDriver = 1;
  
};

_NotDriver
