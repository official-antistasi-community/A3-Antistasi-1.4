/**
	Unlocks the specified item of equipment for use in the arsenal.
	
	Updates the appropriate global arrays for quick reference.
	You can also find unlockedRifles and other variables constructed here. - FrostsBite.

	Params:
		_className - Class of the equipment to unlock.
		
		_dontAddToArsenal - Avoid adding the item to the arsenal, and simply updates the appropriate variables. DO NOT USE UNLESS YOU HAVE A *VERY* GOOD REASON. Primarily used in save/loads.
		
	Returns:
		None
**/

params ["_className", ["_dontAddToArsenal", false]];

private _categories = _className call A3A_fnc_equipmentClassToCategories;

if (!_dontAddToArsenal) then {
	//Add the equipment to the arsenal.
	private _arsenalTab = _className call jn_fnc_arsenal_itemType;
	[_arsenalTab,_className,-1] call jn_fnc_arsenal_addItem;
};

{
	private _categoryName = _x;
	//Consider making this pushBackUnique.
	(missionNamespace getVariable ("unlocked" + _categoryName)) pushBack _className;
	publicVariable ("unlocked" + _categoryName);
} forEach _categories;
