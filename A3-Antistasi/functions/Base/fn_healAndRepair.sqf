private _posHQ = getMarkerPos respawnTeamPlayer;
private _time = if (isMultiplayer) then {serverTime} else {time};


if ((_time - (boxX getVariable ["lastUsed", -30])) < 30) exitWith {
	if (hasInterface) then {
		[localize "STR_antistasi_customHint_heal_repair", format [localize "STR_antistasi_customHint_heal_repair_wait",30]] call A3A_fnc_customHint;
	};
};

boxX setVariable ["lastUsed", _time, true];

{
	if ((side group _x == teamPlayer) and (_x distance _posHQ < 50)) then
	{
		if (!isNil "ace_advanced_fatigue_fnc_handlePlayerChanged") then {
			// abuse the init/respawn function to reset ACE stamina
			[_x, objNull] remoteExec ["ace_advanced_fatigue_fnc_handlePlayerChanged", _x];
		}
		else {
			[_x, 0] remoteExec ["setFatigue", _x];
		};
		if (A3A_hasACEMedical) then
		{
			[_x, _x] call ace_medical_treatment_fnc_fullHeal;
		};
		_x setDamage 0;
		_x setVariable ["incapacitated",false,true];
		_x setVariable ["compromised", 0, true];
	};
} forEach allUnits;

{
	if ((_x distance _posHQ < 150) and (alive _x) and (isNull(attachedTo _x))) then
	{
		private _vehSide = side group _x;
		if (_vehSide == sideUnknown || _vehSide == teamPlayer) then {
			_x setDamage 0;
			if (_x getVariable ["incapacitated",false]) then {_x setVariable ["incapacitated",false,true]};
			[_x,1] remoteExec ["setVehicleAmmo",_x];
			if (_x in reportedVehs) then {reportedVehs = reportedVehs - [_x]; publicVariable "reportedVehs"};
		};
	};
} forEach vehicles;

[localize "STR_antistasi_customHint_heal_repair",localize "STR_antistasi_customHint_heal_repair_text"] call A3A_fnc_customHint;
