//blocks looting if nearby container is already looting
params ["_crate", ["_owner",2], ["_done", false]];
private _pos = getPos _crate;
private _lootingPos = missionNamespace getVariable ["LTClootingAreas", []];
if (!_done) then {
	private _alreadyLootingPos = _lootingPos findIf {_pos inArea [_x, 20, 20, 0, false, 20]};

	if (_alreadyLootingPos isEqualTo -1) then {
		_lootingPos pushBack _pos;
		missionNamespace setVariable ["LTClootingAreas", _lootingPos];
		[_crate] remoteExec ["A3A_fnc_lootToCrate", _owner];
	} else {
		["Loot crate", "Cooldown still active"] remoteExec ["A3A_fnc_customHint", _owner];
	};

	_pos spawn {
		sleep 20;
		_lootingPos = missionNamespace getVariable ["LTClootingAreas", []];
		if (_this in _lootingPos) then {
			_lootingPos deleteAt (_lootingPos find _this);
			missionNamespace setVariable ["LTClootingAreas", _lootingPos];
		};
	};
} else {
	if (_pos in _lootingPos) then {
		_lootingPos deleteAt (_lootingPos find _pos);
		missionNamespace setVariable ["LTClootingAreas", _lootingPos];
	};
};