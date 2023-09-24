["attributesVehicles", [
    ["I_C_Offroad_02_LMG_F", ["rebCost", 500]],
    ["I_C_Offroad_02_unarmed_F", ["rebCost", 150]], //Slow, 4 seats only
	

]] call _fnc_saveToTemplate;

if ("ws" in A3A_enabledDLC) then {
(["attributesVehicles"] call _fnc_getFromTemplate) append [
    ["O_Tura_Offroad_armor_lxWS", ["rebCost", 300]],
    ["O_Tura_Offroad_armor_armed_lxWS", ["rebCost", 800]],
    ["O_Tura_Offroad_armor_AT_lxWS", ["rebCost", 800]]
];
};