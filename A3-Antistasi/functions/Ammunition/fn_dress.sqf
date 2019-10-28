private _unit = _this select 0;
private _loadoutOverride = param [1];
private _team = side group _unit;
private _unitLoadoutNumber = if (!isNil "_loadoutOverride") then {_loadoutOverride} else {_unit getVariable ["pvpPlayerUnitNumber", 0]};

_loadout = switch _team do {
	case Occupants: {
		if (count NATOPlayerLoadouts > _unitLoadoutNumber) then {NATOPlayerLoadouts select _unitLoadoutNumber} else { [] };
	};
	
	case Invaders: {
		if (count CSATPlayerLoadouts > _unitLoadoutNumber) then {CSATPlayerLoadouts select _unitLoadoutNumber} else { [] };
	};
	
	case teamPlayer: {
		if (toLower worldName isEqualTo "enoch") then {
			[[],[],[],[(selectRandom allRebelUniforms), []],[],[],"H_Hat_Tinfoil_F","",[],["ItemMap","","","","",""]];
		} else {
			[[],[],[],[(selectRandom allRebelUniforms), []],[],[],(selectRandom allCivilianHeadgear),"",[],["ItemMap","","","","",""]];
		};
	};
	
	default {
		[];
	};
};

_unit setUnitLoadout _loadout;

_unit selectWeapon (primaryWeapon _unit);
