private _type = _this select 0;
_cost = [_type] call A3A_fnc_vehiclePrice;
_resourcesFIA = server getVariable "resourcesFIA";
if (_resourcesFIA < _cost) exitWith {hint format ["You do not have enough money! %1 € required",_cost]};
if ([player,300] call A3A_fnc_enemyNearCheck) exitWith {Hint "You cannot buy supplies with enemies nearby"};
[0,(-1* _cost)] spawn A3A_fnc_resourcesFIA;
_crate = "I_supplyCrate_F" createVehicle position player;
clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
_crate call jn_fnc_logistics_addAction;

if !(hasRHS) then {
    if (_type == import_e_ammo) then {
	   _crate addItemCargoGlobal ["30Rnd_762x39_Mag_F", (random 20)];
	   _crate addItemCargoGlobal ["30Rnd_65x39_caseless_green", (random 10)];
	   _crate addItemCargoGlobal ["10Rnd_762x54_Mag", (random 10)];
	   _crate addItemCargoGlobal ["150Rnd_762x54_Box_Tracer", (random 5)];
	   _crate addItemCargoGlobal ["1rnd_HE_Grenade_shell", (random 20)];
	   _crate addItemCargoGlobal ["APERSMine_Range_Mag", (random 10)];
    }
    else {
        if (_type == import_w_ammo) then {
            _crate addItemCargoGlobal ["30rnd_556x45_Stanag", (random 20)];
            _crate addItemCargoGlobal ["30rnd_65x39_caseless_mag", (random 10)];
            _crate addItemCargoGlobal ["200rnd_65x39_cased_box_Tracer", (random 5)];
            _crate addItemCargoGlobal ["20rnd_762x51_Mag", (random 10)];
            _crate addItemCargoGlobal ["1rnd_HE_Grenade_shell", (random 10)];
            _crate addItemCargoGlobal ["ATMine_Range_Mag", (random 10)];
        }
        else {
            if (_type == import_e_weaps) then {
                _crate addItemCargoGlobal ["LMG_Zafir_F", (random 5)];
                _crate addItemCargoGlobal ["srifle_DMR_01_F", (random 5)];
                _crate addItemCargoGlobal ["arifle_Katiba_C_F", (random 5)];
                _crate addItemCargoGlobal ["arifle_AK12_F", (random 10)];
                _crate addItemCargoGlobal ["optic_DMS", (random 3)];
                _crate addItemCargoGlobal ["optic_Aco", (random 5)];
                _crate addItemCargoGlobal ["bipod_02_F_blk", (random 5)];
            }
            else {
                if (_type == import_w_weaps) then {
                      _crate addItemCargoGlobal ["srifle_EBR_F", (random 5)];
                      _crate addItemCargoGlobal ["arifle_SPAR_01_blk_F", (random 10)];
                      _crate addItemCargoGlobal ["LMG_MK200_F", (random 5)];
                      _crate addItemCargoGlobal ["arifle_MXC_ACO_F", (random 5)];
                      _crate addItemCargoGlobal ["optic_Hamr", (random 5)];
                      _crate addItemCargoGlobal ["optic_LRPS", (random 3)];
                      _crate addItemCargoGlobal ["bipod_01_F_blk", (random 5)];
                }
                else {
                    if (_type == import_e_spec) then {
                        _crate addItemCargoGlobal ["MMG_01_hex_ARCO_LP_F", (random 3)];
                        _crate addItemCargoGlobal ["srifle_DMR_05_KHS_LP_F", (random 3)];
                        _crate addItemCargoGlobal ["srifle_GM6_camo_LRPS_F", (random 3)];
                        _crate addItemCargoGlobal ["150rnd_93x64_Mag", (random 5)];
                        _crate addItemCargoGlobal ["10rnd_93x64_DMR_05_Mag", (random 10)];
                        _crate addItemCargoGlobal ["5rnd_127x108_APDS_Mag", (random 10)];
                        _crate addItemCargoGlobal ["optic_DMS", (random 5)];
                        _crate addItemCargoGlobal ["optic_Nightstalker", (random 3)];
                        _crate addItemCargoGlobal ["muzzle_snds_B", (random 5)];
                        _crate addItemCargoGlobal ["Rangefinder", (random 6)];
                        _crate addItemCargoGlobal ["NVGoggles_OPFOR", (random 3)];
                    }
                    else {
                        if (_type == import_w_spec) then {
                            _crate addItemCargoGlobal ["MMG_02_black_RCO_BI_F", (random 3)];
                            _crate addItemCargoGlobal ["srifle_DMR_02_sniper_AMS_LP_S_F", (random 3)];
                            _crate addItemCargoGlobal ["srifle_LRR_camo_LRPS_F", (random 3)];
                            _crate addItemCargoGlobal ["130rnd_338_Mag", (random 5)];
                            _crate addItemCargoGlobal ["10rnd_338_Mag", (random 10)];
                            _crate addItemCargoGlobal ["5rnd_127x108_APDS_Mag", (random 10)];
                            _crate addItemCargoGlobal ["optic_DMS", (random 5)];
                            _crate addItemCargoGlobal ["optic_tws", (random 3)];
                            _crate addItemCargoGlobal ["muzzle_snds_H", (random 5)];
                            _crate addItemCargoGlobal ["Rangefinder", (random 6)];
                            _crate addItemCargoGlobal ["NVGoggles", (random 3)];
                        }
                        else {
                            if (_type == import_launchers) then {
                                _crate addItemCargoGlobal ["launch_Titan_F", 2];
                                _crate addItemCargoGlobal ["launch_Titan_short_F", 2];
                                _crate addItemCargoGlobal ["Titan_AA", 10];
                                _crate addItemCargoGlobal ["Titan_AT", 7];
                                _crate addItemCargoGlobal ["Titan_AP", 5];
                                _crate addItemCargoGlobal ["B_Kitbag_rgr", 10];
                            };
                        };
                    };
                };
            };
        };
    };
}
//rhs stuff
else {
    if (_type == import_e_ammo) then {
	   _crate addItemCargoGlobal ["rhs_B_762x39_Ball?", (random 20)];
	   _crate addItemCargoGlobal ["545x39", (random 10)];
	   _crate addItemCargoGlobal ["10Rnd_762x54_Mag_svd", (random 10)];
	   _crate addItemCargoGlobal ["150Rnd_762x54_Box_Tracer_pkm", (random 5)];
	   _crate addItemCargoGlobal ["1rnd_HE_Grenade_shell", (random 20)];
	   _crate addItemCargoGlobal ["APERSMine_Range_Mag_apersmine", (random 10)];
    }
    else {
        if (_type == import_w_ammo) then {
            _crate addItemCargoGlobal ["30rnd_556x45_Stanag_ar", (random 20)];
            _crate addItemCargoGlobal ["762 stanag", (random 10)];
            _crate addItemCargoGlobal ["100rnd_556_saw_or_762_m240", (random 5)];
            _crate addItemCargoGlobal ["20rnd_762x51_Mag_m14?_or_ar10", (random 10)];
            _crate addItemCargoGlobal ["1rnd_HE_Grenade_shell", (random 10)];
            _crate addItemCargoGlobal ["ATMine_Range_Mag", (random 10)];
        }
        else {
            if (_type == import_e_weaps) then {
                _crate addItemCargoGlobal ["pkm", (random 5)];
                _crate addItemCargoGlobal ["svd", (random 5)];
                _crate addItemCargoGlobal ["ak74", (random 5)];
                _crate addItemCargoGlobal ["ak103", (random 10)];
                _crate addItemCargoGlobal ["optic_pso", (random 3)];
                _crate addItemCargoGlobal ["optic_kobra", (random 5)];
                _crate addItemCargoGlobal ["bipod_02_F_blk", (random 5)];
            }
            else {
                if (_type == import_w_weaps) then {
                      _crate addItemCargoGlobal ["m14", (random 5)];
                      _crate addItemCargoGlobal ["m16", (random 10)];
                      _crate addItemCargoGlobal ["saw", (random 5)];
                      _crate addItemCargoGlobal ["m4a1", (random 5)];
                      _crate addItemCargoGlobal ["optic_acog", (random 5)];
                      _crate addItemCargoGlobal ["optic_holo", (random 3)];
                      _crate addItemCargoGlobal ["bipod_01_F_blk", (random 5)];
                }
                else {
                    if (_type == import_e_spec) then {
                        _crate addItemCargoGlobal ["MMG_01_hex_ARCO_LP_F", (random 3)];
                        _crate addItemCargoGlobal ["srifle_DMR_05_KHS_LP_F", (random 3)];
                        _crate addItemCargoGlobal ["srifle_GM6_camo_LRPS_F", (random 3)];
                        _crate addItemCargoGlobal ["150rnd_93x64_Mag", (random 5)];
                        _crate addItemCargoGlobal ["10rnd_93x64_DMR_05_Mag", (random 10)];
                        _crate addItemCargoGlobal ["5rnd_127x108_APDS_Mag", (random 10)];
                        _crate addItemCargoGlobal ["optic_DMS", (random 5)];
                        _crate addItemCargoGlobal ["optic_Nightstalker", (random 3)];
                        _crate addItemCargoGlobal ["muzzle_snds_B", (random 5)];
                        _crate addItemCargoGlobal ["Rangefinder", (random 6)];
                        _crate addItemCargoGlobal ["NVGoggles_OPFOR", (random 3)];
                    }
                    else {
                        if (_type == import_w_spec) then {
                            _crate addItemCargoGlobal ["M240", (random 3)];
                            _crate addItemCargoGlobal ["m4sopmod", (random 3)];
                            _crate addItemCargoGlobal ["m107", (random 3)];
                            _crate addItemCargoGlobal ["m240box", (random 5)];
                            _crate addItemCargoGlobal ["10rnd_338_Mag", (random 10)];
                            _crate addItemCargoGlobal ["5rnd_127x108_APDS_Mag", (random 10)];
                            _crate addItemCargoGlobal ["optic_DMS", (random 5)];
                            _crate addItemCargoGlobal ["optic_tws", (random 3)];
                            _crate addItemCargoGlobal ["muzzle_snds_H", (random 5)];
                            _crate addItemCargoGlobal ["Rangefinder", (random 6)];
                            _crate addItemCargoGlobal ["NVGoggles", (random 3)];
                        }
                        else {
                            if (_type == import_launchers) then {
                                _crate addItemCargoGlobal ["stinger", (random 2)];
                                _crate addItemCargoGlobal ["javelin", (random 2)];
                                _crate addItemCargoGlobal ["stingermissile", (random 10)];
                                _crate addItemCargoGlobal ["javelin missile", (random 7)];
                                _crate addItemCargoGlobal ["B_Kitbag_rgr", (random 10)];
                            };
                        };
                    };
                };
            };
        };
    };
};