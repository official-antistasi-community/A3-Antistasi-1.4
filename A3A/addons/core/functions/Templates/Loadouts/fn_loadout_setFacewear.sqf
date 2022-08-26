/*
  	Function: A3A_fnc_loadout_setFacewear

  	Author: 
		- dZ

  	Description:
    	Adds facewear to a unit loadout

 	Params:
     	_loadout - Loadout to add facewear to
     	_facewear - Facewear class to add

 	Returns:
     	Modified loadout array

  	Example:
     	[_loadout, "G_Tactical_Clear"] call A3A_fnc_setFacewear
 */

params ["_loadout", "_facewear"];

_loadout set [7, _facewear];

_loadout
