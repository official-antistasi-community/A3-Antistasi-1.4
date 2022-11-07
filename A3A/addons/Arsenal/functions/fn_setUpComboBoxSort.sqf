// setup the combo box stuff
#include "..\dialog\ids.inc"
#include "..\script_component.hpp"

private _display = findDisplay A3A_IDD_ANTISTASI_ARSENAL_DIALOG;
private _comboBox = _display displayCtrl A3A_IDC_ARSENAL_SORT_COMBO;

_comboBox lbAdd "Amount";
_comboBox lbAdd "Alphabetically";
_comboBox lbAdd "Mod";
_comboBox lbAdd "Weight";
_comboBox lbAdd "Accuracy";
_comboBox lbAdd "Rate of fire";

Debug("Finished Setting Up Combo");