_display = (_this select 0) select 0;

if (isLocalized "STR_chvd_title") then {
	(_display displayCtrl 1000) ctrlSetText (toUpper (localize "STR_chvd_title"));
};
if (isLocalized "STR_chvd_foot") then {
	(_display displayCtrl 1001) ctrlSetText (localize "STR_chvd_foot");
};
if (isLocalized "STR_chvd_car") then {
	(_display displayCtrl 1008) ctrlSetText (localize "STR_chvd_car");
};
if (isLocalized "STR_chvd_air") then {
	(_display displayCtrl 1015) ctrlSetText (localize "STR_chvd_air");
};
if (isLocalized "STR_chvd_view") then {
	(_display displayCtrl 1002) ctrlSetText (localize "STR_chvd_view");
	(_display displayCtrl 1010) ctrlSetText (localize "STR_chvd_view");
	(_display displayCtrl 1016) ctrlSetText (localize "STR_chvd_view");
};
if (isLocalized "STR_chvd_object") then {
	(_display displayCtrl 1003) ctrlSetText (localize "STR_chvd_object");
	(_display displayCtrl 1011) ctrlSetText (localize "STR_chvd_object");
	(_display displayCtrl 1021) ctrlSetText (localize "STR_chvd_object");
};
if (isLocalized "STR_chvd_terrain") then {
	(_display displayCtrl 1005) ctrlSetText (localize "STR_chvd_terrain");
	(_display displayCtrl 1012) ctrlSetText (localize "STR_chvd_terrain");
	(_display displayCtrl 1019) ctrlSetText (localize "STR_chvd_terrain");
};
if (isLocalized "STR_chvd_sync") then {
	(_display displayCtrl 1403) ctrlSetText (localize "STR_chvd_sync");
	(_display displayCtrl 1405) ctrlSetText (localize "STR_chvd_sync");
	(_display displayCtrl 1407) ctrlSetText (localize "STR_chvd_sync");
};
if (isLocalized "STR_chvd_close") then {
	(_display displayCtrl 1612) ctrlSetText (localize "STR_chvd_close");
};