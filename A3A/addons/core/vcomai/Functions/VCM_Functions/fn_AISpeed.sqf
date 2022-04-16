//This function simply checks for the distance to the nearest known enemy and then slows the AI down based of the distance.
params ["_SquadLead"];

private _NEnemies = _SquadLead call VCM_fnc_ClstKnwnEnmy;
private _NEnemyA = [];
if (count _NEnemies > 0) then
{
	{
		if (_x#0 < 50) then
		{
			_NEnemyA pushback (_x#1);
		};
	
	} foreach _NEnemies;
};	

if (count _NEnemyA > 0) then
{
	private _clste = [_NEnemyA,_SquadLead,true,"AISpeed"] call VCM_fnc_ClstObj;
	if (_clste distance2D _SquadLead < 50) then
	{
		{
			if (isNull objectParent _x) then
			{
				_x forcespeed 1;
			};
		} foreach (units (group _SquadLead));
	}
	else
	{
		{
			if (isNull objectParent _x) then
			{
				_x forcespeed -1;
			};
		} foreach (units (group _SquadLead));	
	};
}
else
{
	{
		if (isNull objectParent _x) then
		{
			_x forcespeed 1;
		};
	} foreach (units (group _SquadLead));
};