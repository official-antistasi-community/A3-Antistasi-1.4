//Example From https://community.bistudio.com/wiki/remoteControl
//bob call A3A_fnc_getRemoteController;
params ["_obj"];
if (!isNull objectParent _obj) exitWith { UAVControl _obj select 0 };
private _res = [objNull];
isNil
{
	private _pos = getPosWorld _obj;
	private _dirUp = [vectorDirVisual _obj, vectorUpVisual _obj];
	private _anim = animationState _obj;
	private _dummy = "PaperCar" createVehicleLocal [0,0,0];
	_obj moveInAny _dummy;
	_res = uavControl _dummy;
	_obj setPosWorld _pos;
	_obj setVectorDirAndUp _dirUp;
	_obj switchMove _anim;
	deleteVehicle _dummy;
};
_res select 0