private _posHQ = getMarkerPos respawnTeamPlayer;
private _time = if (isMultiplayer) then {serverTime} else {time};


if ((_time - (boxX getVariable ["lastUsed", -30])) < 30) exitWith {
	if (hasInterface) then {
		hint "The repair box has been used in the last 30 seconds! Please wait for a bit.";
	};
};

boxX setVariable ["lastUsed", _time, true];

{if ((side group _x == teamPlayer) and (_x distance _posHQ < 50)) then
	{
	if (hasACEMedical) then
		{
		[_x, _x] call ace_medical_treatment_fnc_fullHeal;
		}
	else
		{
		if (_x getVariable ["INCAPACITATED",false]) then {_x setVariable ["INCAPACITATED",false,true]};
		_x setDamage 0;
		};
	_x setVariable ["compromised", 0, true];
	}} forEach allUnits;
{
if ((_x distance _posHQ < 150) and (alive _x) and (isNull(attachedTo _x))) then
	{
	_x setDamage 0;
	if (_x getVariable ["INCAPACITATED",false]) then {_x setVariable ["INCAPACITATED",false,true]};
	[_x,1] remoteExec ["setVehicleAmmo",_x];
	if (_x in reportedVehs) then {reportedVehs = reportedVehs - [_x]; publicVariable "reportedVehs"};
	};
} forEach vehicles;

hint "Nearby units have been healed and can go undercover. Nearby vehicles have been repaired, rearmed and are no longer reported."
