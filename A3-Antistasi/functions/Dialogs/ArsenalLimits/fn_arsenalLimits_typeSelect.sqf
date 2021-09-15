
#include "arsenalLimitsIDCs.hpp"

params ["_display", "_ctrlIDC"];
private _typeIndex = if (_ctrlIDC < 0) then { 0 } else { _ctrlIDC - IDC_typesBase };
private _listBox = _display displayCtrl IDC_listBox;
lnbClear _listBox;

//diag_log format ["typeSelect called with index %1", _ctrlIDC];

private _cfgCat = switch (_typeIndex) do {
    case 5: { configFile / "cfgVehicles" };
    case 22; case 23; case 26: { configFile / "cfgMagazines" };
    default { configFile / "cfgWeapons" };
};
private _defaultLimit = [minWeaps, minWeaps*3] select (_typeIndex == 26);

{
    _x params ["_class", "_count"];
    if (_count == -1) then { continue };
    private _itemName = getText (_cfgCat / _class / "displayName");
    private _limit = A3A_arsenalLimits getOrDefault [_class, _defaultLimit];
    if (_typeIndex == 26) then {
        private _capacity = 1 max getNumber (_cfgCat / _class / "count");
        _count = round (_count / _capacity);
    };
    private _rowIndex = _listBox lnbAddRow [_itemName, str _count, str _limit];
    _listBox lnbSetData [[_rowIndex, 0], _class];             // store original classname for updating
} forEach (jna_datalist#_typeIndex);

// color-invert the selected button, restore the others 
{
    private _ctrl = _display displayctrl (IDC_typesBase + _x);
    _ctrl ctrlEnable ([true, false] select (_x == _typeIndex));
} forEach [0,1,2,3,4,5,6,8,9,11,12,18,19,20,22,23,24,25,26];
