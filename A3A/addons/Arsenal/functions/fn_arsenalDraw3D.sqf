private _display = A3A_Arsenal_Display;

private _cam = missionNamespace getVariable ["A3A_Arsenal_Cam", objNull];
private _centerObject = missionNamespace getVariable ["A3A_arsenalCenterObject", player];
private _target = missionNamespace getVariable ["A3A_Arsenal_target", player];

A3A_ArsenalCamPos params ["_dis", "_dirH", "_dirV", "_targetPos"];

[_target, [_dirH + 180, -_dirV, 0]] call bis_fnc_setobjectrotation;
_target attachto [_centerObject, _targetPos, ""]; //--- Reattach for smooth movement

_cam attachto [_target,[0, -_dis, 0],""];
_cam setdir 0;

//--- Make sure the camera is not underground
if ((getPosASLVisual _cam select 2) < (getPosASLVisual _centerObject select 2)) then 
{
	//_cam setPosASL (_target modeltoworldvisualworld [0, -_dis * (((getPosASLVisual _target select 2) - (getPosASLVisual _center select 2)) / ((getPosASLVisual _target select 2) - (getPosASLVisual _cam select 2) + 0.001)), 0]);
	_cam attachto [_target,[0, -_dis * (((getPosASLVisual _target select 2) - (getPosASLVisual _centerObject select 2)) / ((getPosASLVisual _target select 2) - (getPosASLVisual _cam select 2) + 0.001)), 0],""];
	_cam setdir 0;
};