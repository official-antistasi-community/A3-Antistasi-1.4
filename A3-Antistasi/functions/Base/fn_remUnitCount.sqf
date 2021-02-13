/*
Params:
	<SIDE> : Side of units to check.

Returns:
	Remaining units for that side on this machine.
*/

params ["_side"];

private _unitCount = {(local _x) and (alive _x)} count allUnits;
private _remUnitCount = maxUnits - _unitCount;
if (gameMode < 3) then
{
    private _sideCount = {(local _x) and (alive _x) and (side group _x == _side)} count allUnits;
    _remUnitCount = _remUnitCount min (maxUnits * 0.7 - _sideCount);
};
_remUnitCount;
