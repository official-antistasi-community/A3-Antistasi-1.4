#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_roundType", "_artilleryType", "_side"];

private _faction = Faction(_side);
private _shellType = "";

if (_artilleryType in (_faction get "staticMortars")) then {
	switch (_roundType) do {
		case "HE": {
			_shellType = _faction get "mortarMagazineHE";
			Info_1("HE: %1", _shellType);
		};

		case "SMOKE": {
			_shellType = _faction get "mortarMagazineSmoke";
			Info_1("SMOKE: %1", _shellType);
		};
		
		case "FLARE": {
			_shellType = _faction get "mortarMagazineFlare";
			Info_1("FLARE: %1", _shellType);
		};

		default {
			_shellType = _faction get "mortarMagazineHE";
			Info_1("DEFAULT: %1", _shellType);
		};
	};
};
Info_1("RETURN: %1", _shellType);
_shellType
