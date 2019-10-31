_cost = 2500;
_resourcesFIA = server getVariable "resourcesFIA";
if (_resourcesFIA < _cost) exitWith {hint format ["You do not have enough money! %1 € required",_cost]};
[0,(-1* _cost)] spawn A3A_fnc_resourcesFIA;
_crate = "I_supplyCrate_F" createVehicle position player;
clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
_crate call jn_fnc_logistics_addAction;

if !(hasRHS) then {
    _crate addItemCargoGlobal ["V_PlateCarrierGL_rgr", (random 10)];
	_crate addItemCargoGlobal ["V_PlateCarrier1_rgr", (random 10)];
	_crate addItemCargoGlobal ["V_PlateCarrier2_rgr", (random 10)];
	_crate addItemCargoGlobal ["H_HelmetB", (random 10)];
	_crate addItemCargoGlobal ["H_HelmetSpecB", (random 10)];
	_crate addItemCargoGlobal ["H_HelmetB_light", (random 10)];
	}
else
   {
	_crate addItemCargoGlobal ["rhs_6b5_khaki", (random 10)];
	_crate addItemCargoGlobal ["rhsgref_6b23_khaki", (random 10)];
	_crate addItemCargoGlobal ["rhs_6b23_digi_6sh92", (random 10)];
	_crate addItemCargoGlobal ["rhsgref_helmet_pasgt_erdl", (random 10)];
	_crate addItemCargoGlobal ["rhs_6b27m_digi", (random 10)];
	};