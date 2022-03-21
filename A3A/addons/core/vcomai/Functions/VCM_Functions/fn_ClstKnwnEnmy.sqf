/*
	Author: Genesis

	Description:
		Function returns nearest "known" enemy for a group - sorted by known accuracy of units position.

	Parameter(s):
		0: GROUP

	Returns:
		nil
*/

private _NearTargets = (leader _this) neartargets 2000; 

private _unitSide = side _this;
private _a1 = [];
{

	if ([_unitSide, (_x # 2)] call BIS_fnc_sideIsEnemy && {!((_x # 1) isKindOf "Air")}) then
	{
		_a1 pushback [(_x # 5),(_x # 4)];
	};
} foreach _NearTargets;


if (count _a1 > 0) then
{
	_a1 sort true;
};


_a1