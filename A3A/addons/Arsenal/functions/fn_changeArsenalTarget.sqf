params ["_display", "_params"];
_params params["_newCenterObject"];

private _newPosOfCenter = getPosASLVisual _newCenterObject;

private _camPos = [10,-45,15,[0,0,-1]];

if (isNil { missionnamespace getvariable "A3A_ArsenalCamPos_Init" }) then
{
	missionnamespace setvariable ["A3A_ArsenalCamPos_Init", _camPos];
};

if (!isNil { missionnamespace getvariable "A3A_Arsenal_target" }) then
{
	private _target = missionnamespace getvariable "A3A_Arsenal_target";
	if (_target isNotEqualTo player) then {deleteVehicle _target};
};

A3A_ArsenalCamPos = +(missionnamespace getvariable "A3A_ArsenalCamPos_Init");

private _target = createAgent ["Logic", _newPosOfCenter, [], 0, "none"];
_target attachTo [_newCenterObject, A3A_ArsenalCamPos select 3, ""];
missionNamespace setVariable ["A3A_Arsenal_target", _target];
missionNamespace setVariable ["A3A_arsenalCenterObject", _newCenterObject];