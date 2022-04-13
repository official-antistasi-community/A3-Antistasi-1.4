
/*
	Author: Genesis

	Description:
		This function will handle assigning proper variables to units, while returning appropriate arrays.

	Parameter(s):
		0: GROUP - Group to check

	Returns:
		ARRAY - Format [_medicArray, _itemList]
*/

//First let's find who the medics are in the team and return that list.
private _medicArray = _this call VCM_fnc_RMedics; //Returns _mList

private _itemList = _this call VCM_fnc_RStatics; //Returns [_staticList,_satchelList,_mineList];

private _rtrnList  = [_medicArray, _itemList];

_rtrnList
