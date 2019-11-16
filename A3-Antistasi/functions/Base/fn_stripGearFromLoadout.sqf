private _originalLoadout = _this;

private _uniform = _originalLoadout select 3;
private _uniform = if (count _uniform > 0) then {[_uniform select 0,[]]} else {[]};
private _newLoadout = [
	/* Primary weapon */  [],
	/* Secondary weapon */[],
	/* Handgun */         [],
	/* Uniform */         _uniform,
	/* Vest */            [],
	/* Backpack */        [],
	/* Helmet */          "",
	/* Facewear */        "",
	/* Binoculars */      [],
	/* Special items */   ["", "", "", "", "", ""]
];

private _oldSpecialItems = _originalLoadout select 9;
private _newSpecialItems = _newLoadout select 9;

//If Map/GPS/Compass/Watch is unlocked, keep it.
{
	if ((_oldSpecialItems select _x) in unlockedItems) then {
		_newSpecialItems set [_x, (_oldSpecialItems select _x)];
	};
} forEach [0,1,2,3,4];

//Keep our radio, if we have TFAR or ACRE.
if (hasTFAR || hasACRE) then {
	_newSpecialItems set [2, _oldSpecialItems select 2];
};

_newLoadout;
