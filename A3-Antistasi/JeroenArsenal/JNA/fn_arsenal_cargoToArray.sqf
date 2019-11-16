/*
	Author: Jeroen Notenbomer

	Description:
	Return a array of all items that are in a inventory of a vehicle/crate in the form of the jna_datalist

	Parameter(s):
	VEHICLE with a inventory

	Returns:
	ARRAY of arrays of arrays of items and amounts
*/


#include "\A3\ui_f\hpp\defineDIKCodes.inc"
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"


private["_container","_array","_addToArray","_unloadContainer"];
_container = _this;
_array = [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]];


_addToArray = {
	private ["_array","_index","_item","_amount"];
	_array = _this select 0;
	_index = _this select 1;
	_item = _this select 2;
	_amount = _this select 3;

	if!(_index == -1 || _item isEqualTo ""|| _amount == 0)then{
		_array set [_index,[_array select _index,[_item,_amount]] call jn_fnc_arsenal_addToArray];
	};
};

//recursion function to check all sub containers
_unloadContainer = {
	_container_sub = _this;

	//magazines(exl. loaded ones)
	_mags = magazinesAmmoCargo _container_sub;
	{
		_item = _x select 0;
		_amount = _x select 1;
		_index = _item call jn_fnc_arsenal_itemType;
		[_array,_index,_item,_amount]call _addToArray;
	} forEach _mags;

	//items
	_items = itemCargo _container_sub;
	{
		_item = _x;
		_index = _item call jn_fnc_arsenal_itemType;
		[_array,_index,_item,1]call _addToArray;
	} forEach _items;

	//backpacks
	_backpacks = backpackCargo _container_sub;
	{
		_item = _x call A3A_fnc_basicBackpack;
		_index = IDC_RSCDISPLAYARSENAL_TAB_BACKPACK;
		[_array,_index,_item,1]call _addToArray;
	} forEach _backpacks;

	//weapons and attachmetns
	_attItems = weaponsItemsCargo _container_sub;
	// [["arifle_TRG21_GL_F","","","optic_DMS",["ammo"],""]]
	{
		{
			private["_index","_item","_amount"];
			if(typename _x  isEqualTo "ARRAY")then{
				if(count _x > 0)then{
					_item = _x select 0;
					_amount = _x select 1;
					_index = IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL;
					[_array,_index,_item,_amount]call _addToArray;
				};
			}else{
				if!(_x isEqualTo "")then{
					_item = _x;
					_amount = 1;
					_index = _item call jn_fnc_arsenal_itemType;

					if(_index in [IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON, IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON, IDC_RSCDISPLAYARSENAL_TAB_HANDGUN])then{
						_item = _x call bis_fnc_baseWeapon;
					};


					if(_index != -1)then{
						[_array,_index,_item,_amount]call _addToArray;
					};
				};
			};
		}foreach _x;
	}foreach _attItems;



	//sub containers;
	{
		_x select 1 call _unloadContainer;
	}foreach (everyContainer _container_sub);
};

//startloop
_container call _unloadContainer;

//return array of items
_array;