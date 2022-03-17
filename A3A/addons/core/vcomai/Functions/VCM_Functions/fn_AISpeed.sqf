//This function simply checks for the distance to the nearest known enemy and then slows the AI down based of the distance.
params ["_SquadLead"];

private _NEnemies = _SquadLead call VCM_fnc_ClstKnwnEnmy;
private _NEnemyA = [];
private _SquadGroup = group _SquadLead;


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

	//Now let's see if we can get out of combat mode
	private _EP = eyePos _SquadLead;
	_EP set [2,((_EP#2)+5)];
	private _CST = false;
	{
		private _EEP = eyePos _x;
		_EEP set [2,((_EEP#2)+5)];
		private _cs = [_SquadLead, "VIEW"] checkVisibility [_EP,_EEP];	
		if (_cs > 0) exitWith
		{
			_CST = true;
		};
	} foreach _NEnemyA;

	if !(_CST) then
	{
		if (behaviour _SquadLead isEqualTo "COMBAT" && {((_SquadGroup getVariable ["VCM_STM",-60]) +  5) < diag_tickTime}) then
		{
			_SquadGroup setBehaviourStrong "AWARE";
		};
	}
	else
	{
		_SquadGroup setBehaviourStrong "COMBAT";
	};

}
else
{
	{
		if (isNull objectParent _x) then
		{
			_x forcespeed -1;
		};
	} foreach (units (group _SquadLead));
	if ((_SquadGroup getVariable ["VCM_STM",-60]) +  5 < diag_tickTime) then
	{
		_SquadGroup setBehaviourStrong "AWARE";
	};
};


