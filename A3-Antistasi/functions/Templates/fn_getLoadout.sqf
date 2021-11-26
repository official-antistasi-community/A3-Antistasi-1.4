params ["_loadoutName"];

private _basicMedicalSupplies =
	if (A3A_hasACE) then {
		[
			["ACE_tourniquet",3],
			["ACE_salineIV_500",1],
			["ACE_morphine",2],
			["ACE_epinephrine",2],
			["ACE_adenosine",2],
			["ACE_packingBandage",10],
			["ACE_elasticBandage",10],
			["ACE_quikclot",10],
			["ACE_splint", 2]
		]
	} else {
		[
			["FirstAidKit",3]
		];
	};

private _basicMiscItems =
	if (A3A_hasACE) then {
		[
			["ACE_Earplugs",1],
			["ACE_Cabletie",3]
		];
	} else {
		[

		];
	};

private _medicSupplies =
	if (A3A_hasACE) then {
		[
			["ACE_surgicalKit",1],

			["ACE_packingBandage",5],
			["ACE_elasticBandage",20],
			["ACE_quikclot",10],

			["ACE_morphine",5],
			["ACE_epinephrine",5],
			["ACE_adenosine",5],

			["ACE_plasmaIV_250",5],
			["ACE_salineIV_500",3],
			["ACE_bloodIV",1],

			["ACE_tourniquet",3],
			["ACE_Splint",4]
		]
	} else {
		[
			["Medikit", 1]
		];
	};

private _fnc_modItem = {
	params ["_hasMod", "_modItem", "_replacementItem"];

	if (_hasMod) then {
		[_modItem];
	} else {
		if (isNil "_replacementItem") then {
			[];
		} else {
			[_replacementItem];
		};
	};
};

private _fnc_modItemNoArray = {
	(_this call _fnc_modItem) select 0;
};

private _fnc_tfarRadio = {
	params ["_radio"];
	[A3A_hasTFAR, _radio, "ItemRadio"] call _fnc_modItemNoArray;
};

private _tfarMicroDAGRNoArray = [A3A_hasTFAR, "TF_MicroDagr", "ItemWatch"] call _fnc_modItemNoArray;

private _aceFlashlight = [A3A_hasACE, ["ACE_Flashlight_XL50", 1]] call _fnc_modItem;
private _aceM84 = [A3A_hasACE, ["ACE_M84",2,1]] call _fnc_modItem;
private _aceDefusalKit = [A3A_hasACE, ["ACE_DefusalKit", 1]] call _fnc_modItem;
private _aceClacker = [A3A_hasACE, ["ACE_Clacker", 1]] call _fnc_modItem;
private _aceRangecard = [A3A_hasACE, ["ACE_Rangecard", 1]] call _fnc_modItem;
private _aceKestrel = [A3A_hasACE, ["ACE_Kestrel14500", 1]] call _fnc_modItem;

private _loadoutArray = missionNamespace getVariable [_loadoutName, []];

if (_loadoutArray isEqualTo []) then {
	_loadoutArray = call compile preprocessFileLineNumbers format ["%1.sqf", _loadoutName];
	missionNamespace setVariable [_loadoutName, _loadoutArray];
};

_loadoutArray;
