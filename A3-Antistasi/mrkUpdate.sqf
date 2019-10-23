private ["_marcador","_mrkD"];

_marcador = _this select 0;

_mrkD = format ["Dum%1",_marcador];
if (lados getVariable [_marcador,sideUnknown] == buenos) then
	{
	_texto = if (count (garrison getVariable [_marcador,[]]) > 0) then {format [": %1", count (garrison getVariable [_marcador,[]])]} else {""};
	if (markerColor _mrkD != colorBuenos) then {_mrkD setMarkerColor colorBuenos};
	if (_marcador in aeropuertos) then
		{
		_texto = format ["%2 Airbase%1",_texto,nameBuenos];
		[_mrkD,format ["%1 Airbase",nameBuenos]] remoteExec ["setMarkerTextLocal",[malos,muyMalos],true];
		//_mrkD setMarkerText format ["SDK Airbase%1",_texto];
		if (markerType _mrkD != "flag_Syndicat") then {_mrkD setMarkerType "flag_Syndicat"};
		}
	else
		{
		if (_marcador in puestos) then
			{
			_texto = format ["%2 Outpost%1",_texto,nameBuenos];
			[_mrkD,format ["%1 Outpost",nameBuenos]] remoteExec ["setMarkerTextLocal",[malos,muyMalos],true];
			}
		else
			{
			 if (_marcador in recursos) then
			 	{
			 	_texto = format ["Resouces%1",_texto];
			 	}
			 else
			 	{
			 	if (_marcador in fabricas) then
            		{
            		_texto = format ["Factory%1",_texto];
            		}
            	else
            		{
            		if (_marcador in puertos) then {_texto = format ["Sea Port%1",_texto]};
            		};
			 	};
			};
		};
	[_mrkD,_texto] remoteExec ["setMarkerTextLocal",[buenos,civilian],true];
	}
else
	{
	if (lados getVariable [_marcador,sideUnknown] == malos) then
		{
		if (_marcador in aeropuertos) then
			{_mrkD setMarkerText format ["%1 Airbase",nameMalos];
			_mrkD setMarkerType flagNATOmrk
			}
		else
			{
			if (_marcador in puestos) then
				{
				_mrkD setMarkerText format ["%1 Outpost",nameMalos]
				};
			};
		_mrkD setMarkerColor colorMalos;
		}
	else
		{
		if (_marcador in aeropuertos) then {_mrkD setMarkerText format ["%1 Airbase",nameMuyMalos];_mrkD setMarkerType flagCSATmrk} else {
		if (_marcador in puestos) then {_mrkD setMarkerText format ["%1 Outpost",nameMuyMalos]}};
		_mrkD setMarkerColor colorMuyMalos;
		};
	if (_marcador in recursos) then
	 	{
	 	if (markerText _mrkD != "Resources") then {_mrkD setMarkerText "Resouces"};
	 	}
	 else
	 	{
	 	if (_marcador in fabricas) then
    		{
    		if (markerText _mrkD != "Factory") then {_mrkD setMarkerText "Factory"};
    		}
    	else
    		{
    		if (_marcador in puertos) then
    			{
    			if (markerText _mrkD != "Sea Port") then {_mrkD setMarkerText "Sea Port"};
    			};
    		};
	 	};
	};

