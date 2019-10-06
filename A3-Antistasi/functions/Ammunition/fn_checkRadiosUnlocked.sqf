/*
	Check if radios are unlocked. Updates haveRadio if they are.

    Inputs:
		None

    Outputs
        True if Radios are unlocked in the arsenal, false otherwise.
*/
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

//See if any of the radios available in the arsenal are unlocked.
haveRadio = (((jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_RADIO) findIf {_x select 1 == -1}) > -1);
publicVariable "haveRadio";
haveRadio;