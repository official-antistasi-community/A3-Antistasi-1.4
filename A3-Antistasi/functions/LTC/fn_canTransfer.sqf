//blocks transfer if container is already transfering
params ["_crate", ["_owner",2], ["_done", false]];
if (isNil "LTCTransferringCrates") then {LTCTransferringCrates = []};
if (!_done) then {

	if !(_crate in LTCTransferringCrates) then {
		LTCTransferringCrates pushBack _crate;
		[_crate] remoteExec ["A3A_fnc_lootFromContainer", _owner];

		_crate spawn {
			sleep 20;
			if (_this in LTCTransferringCrates) then {
				LTCTransferringCrates deleteAt (LTCTransferringCrates find _this);
			};
		};
	} else {
		["Loot crate", "Already transfering"] remoteExec ["A3A_fnc_customHint", _owner];
	};


} else {
	if (_crate in LTCTransferringCrates) then {
		LTCTransferringCrates deleteAt (LTCTransferringCrates find _crate);
	};
};
