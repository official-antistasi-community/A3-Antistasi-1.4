//blocks looting if nearby container is already looting
params ["_crate", ["_owner",2], ["_done", false]];
private _pos = getPos _crate;
if (isNil "LTClootingAreas") then {LTClootingAreas = []};
if (!_done) then {
	private _alreadyLootingPos = LTClootingAreas inAreaArray [_pos, 20, 20];

	if (_alreadyLootingPos isEqualTo []) then {
		LTClootingAreas pushBack _pos;
		[_crate] remoteExec ["A3A_fnc_lootToCrate", _owner];

		_pos spawn {
			sleep 20;
			if (_this in LTClootingAreas) then {
				LTClootingAreas deleteAt (LTClootingAreas find _this);
			};
		};
	} else {
		["Loot crate", "Cooldown still active"] remoteExec ["A3A_fnc_customHint", _owner];
	};

} else {
	_pos = LTClootingAreas inAreaArray [_pos, 1, 1]; //override in case of looting while crate was in motion, done by the carry action
	if !(_pos isEqualTo []) then {
		LTClootingAreas deleteAt (LTClootingAreas find (_pos#0));
	};
};
