#include "arsenalLimitsIDCs.hpp"

params ["_display"];

private _listBox = _display displayCtrl IDC_listBox;
private _rowCount = lnbSize _listBox select 0;

// Should probably just keep some globals...
private _isMag = !ctrlEnabled displayCtrl (IDC_typesBase + 26);
private _defaultLimit = [A3A_guestItemLimit, 3*A3A_guestItemLimit] select (_isMag);

for "_row" from 0 to (_rowCount-1) do {
    _listBox lnbSetText [[_row, 2], str _defaultLimit];
    A3A_arsenalLimits deleteAt (_listBox lnbData [_row, 0]);
};
