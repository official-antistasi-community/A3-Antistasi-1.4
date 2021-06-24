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
			[[],[],[],[selectRandom ((A3A_faction_civ getVariable "uniforms") + (A3A_faction_reb getVariable "uniforms")), []],[],[],"H_Hat_Tinfoil_F","",[],
			[(selectRandom unlockedmaps),"","",(selectRandom unlockedCompasses),(selectRandom unlockedwatches),""]];
		} else {
			[[],[],[],[selectRandom ((A3A_faction_civ getVariable "uniforms") + (A3A_faction_reb getVariable "uniforms")), []],[],[],selectRandom (A3A_faction_civ getVariable "headgear"),"",[],
			[(selectRandom unlockedmaps),"","",(selectRandom unlockedCompasses),(selectRandom unlockedwatches),""]];
		};
	};

	default {
		[];
	};
};

_unit setUnitLoadout _loadout;

_unit selectWeapon (primaryWeapon _unit);
