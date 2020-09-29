
#include "\A3\ui_f\hpp\defineDIKCodes.inc"
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

private _array = [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]];

if(typeName (_this select 0) isEqualTo "SCALAR")then{//[_index, _item] and [_index, _item, _amount];
	params["_index","_item",["_amount",1]];
	if(_index < 0)exitWith{
		diag_log format ["%1: [Antistasi] | ERROR | fn_arsenal_additem.sqf | Failed to addItem:%2.",servertime,_this];
		};
	_array set [_index,[[_item,_amount]]];
}else{
	_array = _this;
};

{
	private _index = _forEachIndex;
	{
		private _item = _x select 0;
		private _amount = _x select 1;
		if (_item isEqualType "") then
			{
			if !(_item isEqualTo "")then{

				if(_index == -1)exitWith{["Antistasi: ERROR in additemarsenal: %1", _this] call BIS_fnc_error};
				if(_index == IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG)then{_index = IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL};

				//TFAR fix
				private _radioName = getText(configfile >> "CfgWeapons" >> _item >> "tf_parent");
				if!(_radioName isEqualTo "")then{_item = _radioName};

				//update
				private _playersInArsenal = +(server getVariable ["jna_playersInArsenal",[]]);
				if!(0 in _playersInArsenal)then{_playersInArsenal pushBackUnique 2;};
				["UpdateItemAdd",[_index, _item, _amount,true]] remoteExecCall ["jn_fnc_arsenal",_playersInArsenal];
			};
		};
	} forEach _x;
}foreach _array;
