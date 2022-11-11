
removemissioneventhandler ["draw3D", A3A_Arsenal_Draw3D_EH];
private _cam = missionNamespace getVariable ["A3A_Arsenal_Cam", objNull];
_cam cameraEffect ["terminate", "back"];
camDestroy _cam;

player switchCamera A3A_arsenal_cameraview;
showHud true;

A3A_Arsenal_Mouse = nil;
A3A_Arsenal_Buttons = nil;
A3A_Arsenal_Display = nil;
A3A_ArsenalCamPos = nil;
A3A_arsenal_cameraview = nil;
A3A_Arsenal_Draw3D_EH = nil;
A3A_Arsenal_Cam = nil;

if (!isNil { missionnamespace getvariable "A3A_Arsenal_target" }) then
{
	// there might be a edge case, where the target is the player. 
	private _target = missionnamespace getvariable "A3A_Arsenal_target";
	if (_target isNotEqualTo player) then {deleteVehicle _target};
};

missionnamespace setvariable ["A3A_Arsenal_target", nil];
missionnamespace setvariable ["A3A_ArsenalCamPos_Init", nil];
missionnamespace setvariable ["A3A_arsenalCenterObject", nil];
