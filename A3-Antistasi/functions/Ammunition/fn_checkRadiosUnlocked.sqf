/*
	Check if radios are unlocked. Updates haveRadio if they are.

    Inputs:
		None

    Outputs
        True if Radios are unlocked in the arsenal, false otherwise.
*/
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

// ACRE doesn't use the standard radio slot. We need to bypass the check for this and just set haveRadio to true if ACRE is enabled -Hazey
if (hasAcre) then {
    haveRadio = true;
} else {
    //See if any of the radios available in the arsenal are unlocked.
    haveRadio = (((jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_RADIO) findIf {_x select 1 == -1}) > -1);
};
publicVariable "haveRadio";
haveRadio;