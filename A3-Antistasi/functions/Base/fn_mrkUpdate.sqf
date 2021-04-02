private ["_markerX","_mrkD"];

_markerX = _this select 0;

_mrkD = format ["Dum%1",_markerX];
if (sidesX getVariable [_markerX,sideUnknown] == teamPlayer) then
	{
	_textX = if (count (garrison getVariable [_markerX,[]]) > 0) then {format [": %1", count (garrison getVariable [_markerX,[]])]} else {""};
	_mrkD setMarkerColor colorTeamPlayer;
	if (_markerX in airportsX) then
		{
		_textX = format [localize "STR_antistasi_markers_Airbase_teamPlayer",_textX,nameTeamPlayer];
		[_mrkD,format [localize "STR_antistasi_markers_Airbase",nameTeamPlayer]] remoteExec ["setMarkerTextLocal",[Occupants,Invaders],true];
		//_mrkD setMarkerText format ["SDK Airbase%1",_textX];
		if (markerType _mrkD != "flag_FIA") then {_mrkD setMarkerType "flag_FIA"};
		_mrkD setMarkerColor "Default";
		}
	else
		{
		if (_markerX in outposts) then
			{
			_textX = format [localize "STR_antistasi_markers_Outpos_teamPlayer",_textX,nameTeamPlayer];
			[_mrkD,format [localize "STR_antistasi_markers_Outpost",nameTeamPlayer]] remoteExec ["setMarkerTextLocal",[Occupants,Invaders],true];
			}
		else
			{
			 if (_markerX in resourcesX) then
			 	{
			 	_textX = format [localize "STR_antistasi_customHint_stat_resources3",_textX];
			 	}
			 else
			 	{
			 	if (_markerX in factories) then
            		{
            		_textX = format [localize "STR_antistasi_customHint_stat_factory3",_textX];
            		}
            	else
            		{
            		if (_markerX in seaports) then {_textX = format ["Sea Port%1",_textX]};
            		};
			 	};
			};
		};
	[_mrkD,_textX] remoteExec ["setMarkerTextLocal",[teamPlayer,civilian],true];
	}
else
	{
	if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then
		{
		if (_markerX in airportsX) then
			{
			_mrkD setMarkerText format [localize "STR_antistasi_markers_Airbase",nameOccupants];
			_mrkD setMarkerType flagNATOmrk;
			_mrkD setMarkerColor "Default";
			}
		else
			{
			if (_markerX in outposts) then
				{
				_mrkD setMarkerText format [localize "STR_antistasi_markers_Outpost",nameOccupants]
				};
			_mrkD setMarkerColor colorOccupants;
			};
		}
	else
		{
		if (_markerX in airportsX) then
			{
			_mrkD setMarkerText format [localize "STR_antistasi_markers_Airbase",nameInvaders];
			_mrkD setMarkerType flagCSATmrk;
			_mrkD setMarkerColor "Default";
			}
		else
			{
			if (_markerX in outposts) then
				{
				_mrkD setMarkerText format [localize "STR_antistasi_markers_Outpost",nameInvaders];
				};
			_mrkD setMarkerColor colorInvaders;
			};
		};
	if (_markerX in resourcesX) then
	 	{
			_mrkD setMarkerText localize "STR_antistasi_journal_entry_header_tutorial_5";
	 	}
	 else
	 	{
	 	if (_markerX in factories) then
    		{
					_mrkD setMarkerText localize "STR_a3_cfgvehicles_land_factory_main_f0";
    		}
    	else
    		{
    		if (_markerX in seaports) then
    			{
    			_mrkD setMarkerText localize "STR_antistasi_markers_Seaport";
    			};
    		};
	 	};
	};
