/*
    Author: [Håkon]
    [Description]
        Updates the camera position

    Arguments:
    0. <Control>    Unused (passed from EH)
    1. <Int>        Change in X position
    2. <Int>        Change in Y position

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [nil,0,0] call HR_GRG_fnc_updateCamPos;

    License: APL-ND
*/
params ["", "_xPos","_yPos"];
if (isNull HR_GRG_previewVeh) exitWith {};

//find new directions
HR_GRG_camDirX = (HR_GRG_camDirX - _xPos * 0.5) % 360;
HR_GRG_camDirY = 85 min (HR_GRG_camDirY + _yPos * 0.5) max -85; //cap rotation up and down from just under 85 to -85

//calculate new cam pos
private _BB = 0 boundingBoxReal HR_GRG_previewVeh;
private _pos = [[(_BB#2) * HR_GRG_camDist, 0, 0], HR_GRG_camDirY, 1] call BIS_fnc_rotateVector3D;
_pos = [_pos, HR_GRG_camDirX] call BIS_fnc_rotateVector2D;
_pos = HR_GRG_previewVeh modelToWorldWorld _pos;

//update cam position
HR_GRG_previewCam setPosWorld _pos;
HR_GRG_previewCam camSetTarget getPos HR_GRG_previewVeh;
HR_GRG_previewCam camCommit 0;
