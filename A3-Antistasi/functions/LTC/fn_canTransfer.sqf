//blocks transfer if container is already transfering
params ["_crate", ["_owner",2], ["_done", false]];
private _transferingCrates = missionNamespace getVariable ["LTCTransferingCrates", []];
if (!_done) then {

	if !(_crate in _transferingCrates) then {
		_transferingCrates pushBack _crate;
		missionNamespace setVariable ["LTCTransferingCrates", _transferingCrates];
		[_crate] remoteExec ["A3A_fnc_lootFromContainer", _owner];
	} else {
		["Loot crate", "Already transfering"] remoteExec ["A3A_fnc_customHint", _owner];
	};

	_crate spawn {
		sleep 20;
		_transferingCrates = missionNamespace getVariable ["LTCTransferingCrates", []];
		if (_this in _transferingCrates) then {
			_transferingCrates deleteAt (_transferingCrates find _this);
			missionNamespace setVariable ["LTCTransferingCrates", _transferingCrates];
		};
	};
} else {
	if (_crate in _transferingCrates) then {
		_transferingCrates deleteAt (_transferingCrates find _crate);
		missionNamespace setVariable ["LTCTransferingCrates", _transferingCrates];
	};
};