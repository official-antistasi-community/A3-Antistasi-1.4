/*
  Function: A3A_fnc_itemset_miscEssentials

  Author: 
  		- Spoffy

  Description:
     Generates list of miscellaneous essential items needed by each soldier

  Params:
     	None

  Returns:
     	None
  
 Example Usage:
     	- _loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];
*/

private _items = [];

if (A3A_hasACE) then {
	_items append [
		["ACE_EarPlugs", 1],
		["ACE_MapTools", 1],
		["ACE_CableTie", 1],
		["ACE_Flashlight_XL50", 1]
	];
};

_items