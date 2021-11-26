private _owner = param [4];

if (_owner in hcArray) then
{
	if ({owner _x == _owner} count allUnits > 0) then
	{
		[] spawn {
			while {true} do
			{
				[petros,"hint","A Headless Client has been disconnected. This will cause malfunctions. Head back to HQ for saving ASAP and ask and Admin for a restart", "Headless Client"] remoteExec ["A3A_fnc_commsMP"];
				sleep 30;
			};
		};
	}
	else
	{
		hcArray = hcArray - [_owner];
	};
};