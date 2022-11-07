
#include "..\dialog\ids.inc"
#include "..\script_component.hpp"

// get current tab
private _display = findDisplay A3A_IDD_ANTISTASI_ARSENAL_DIALOG;
private _selectedTabIDC = A3A_selectedTab;
private _selectedTabCtrl = _display displayCtrl _selectedTabIDC;
_selectedTabCtrl ctrlShow true;