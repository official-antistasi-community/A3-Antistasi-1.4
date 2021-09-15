#include "arsenalLimitsIDCs.hpp"

params ["_display", "_mod"];

private _listBox = _display displayCtrl IDC_listBox;
private _stepButton = _display displayCtrl IDC_stepButton;
private _stepCount = [1, 5] select ("5" in ctrlText _stepButton);

private _curRow = lnbCurSelRow _listBox;
private _curVal = parseNumber (_listBox lnbText [_curRow, 2]);
_curVal = 0 max (_curVal + _stepCount*_mod);
_listBox lnbSetText [[_curRow, 2], str _curVal];

A3A_arsenalLimits set [_listBox lnbData [_curRow, 0], _curVal];
