

_mrkNATO = [];
_mrkCSAT = [];
_controlesNATO = [];
_controlesCSAT = [];

if (gameMode == 1) then
	{
    _controlesNATO = controles;
	if (worldName == "Tanoa") then
	    {
	    _mrkCSAT = ["airport_1","puerto_5","puesto_10","control_20"];
	    _controlesNATO = _controlesNATO - ["control_20"];
	    _controlesCSAT = ["control_20"];
	    }
	else
	    {
	    if (worldName == "Altis") then
	        {
	        _mrkCSAT = ["airport_2","puerto_4","puesto_5","control_52","control_33"];
	        _controlesNATO = _controlesNATO - ["control_52","control_33"];
	    	_controlesCSAT = ["control_52","control_33"];
	        }
        else
            {
            if (worldName == "chernarus_summer") then
                {
                _mrkCSAT = ["puesto_21"];
                };
            };
	    };
	_mrkNATO = marcadores - _mrkCSAT - ["Synd_HQ"];
	}
else
	{
	if (gameMode == 4) then
		{
		_mrkCSAT = marcadores - ["Synd_HQ"];
		_controlesCSAT = controles;
		}
	else
		{
		_mrkNATO = marcadores - ["Synd_HQ"];
		_controlesNATO = controles;
		};
	};
{lados setVariable [_x,malos,true]} forEach _controlesNATO;
{lados setVariable [_x,muyMalos,true]} forEach _controlesCSAT;
{
_pos = getMarkerPos _x;
_dmrk = createMarker [format ["Dum%1",_x], _pos];
_dmrk setMarkerShape "ICON";
_garrNum = [_x] call A3A_fnc_garrisonSize;
_garrNum = _garrNum / 8;
_garrison = [];
killZones setVariable [_x,[],true];
if (_x in _mrkCSAT) then
    {
    _dmrk setMarkerType flagCSATmrk;
    _dmrk setMarkerText format ["%1 Airbase",nameMuyMalos];
    _dmrk setMarkerColor colorMuyMalos;
    for "_i" from 1 to _garrNum do
        {
        _garrison append (selectRandom gruposCSATSquad);
        };
    garrison setVariable [_x,_garrison,true];
    lados setVariable [_x,muyMalos,true];
    }
else
    {
    _dmrk setMarkerType flagNATOmrk;
    _dmrk setMarkerText format ["%1 Airbase",nameMalos];
    _dmrk setMarkerColor colorMalos;
    for "_i" from 1 to _garrNum do
        {
        _garrison append (selectRandom gruposNATOSquad);
        };
    garrison setVariable [_x,_garrison,true];
    lados setVariable [_x,malos,true];
    };
_nul = [_x] call A3A_fnc_crearControles;
server setVariable [_x,0,true];//fecha en fomrato dateToNumber en la que estarán idle
} forEach aeropuertos;

{
_pos = getMarkerPos _x;
_dmrk = createMarker [format ["Dum%1",_x], _pos];
_dmrk setMarkerShape "ICON";
_garrNum = [_x] call A3A_fnc_garrisonSize;
_garrNum = _garrNum / 8;
_garrison = [];
_dmrk setMarkerType "loc_rock";
_dmrk setMarkerText "Resources";
for "_i" from 1 to _garrNum do
   {
   _garrison append (selectRandom gruposFIASquad);
   };
if (_x in _mrkCSAT) then
	{
	_dmrk setMarkerColor colorMuyMalos;
	lados setVariable [_x,muyMalos,true];
	}
else
	{
	_dmrk setMarkerColor colorMalos;
	lados setVariable [_x,malos,true];
	};
garrison setVariable [_x,_garrison,true];
_nul = [_x] call A3A_fnc_crearControles;
} forEach recursos;

{
_pos = getMarkerPos _x;
_dmrk = createMarker [format ["Dum%1",_x], _pos];
_dmrk setMarkerShape "ICON";
_garrNum = [_x] call A3A_fnc_garrisonSize;
_garrNum = _garrNum / 8;
_garrison = [];
_dmrk setMarkerType "u_installation";
_dmrk setMarkerText "Factory";
for "_i" from 1 to _garrNum do
   {
   _garrison append (selectRandom gruposFIASquad);
   };
if (_x in _mrkCSAT) then
	{
	_dmrk setMarkerColor colorMuyMalos;
    lados setVariable [_x,muyMalos,true];
	}
else
	{
	_dmrk setMarkerColor colorMalos;
    lados setVariable [_x,malos,true];
    };
garrison setVariable [_x,_garrison,true];
_nul = [_x] call A3A_fnc_crearControles;
} forEach fabricas;

{
_pos = getMarkerPos _x;
_dmrk = createMarker [format ["Dum%1",_x], _pos];
_dmrk setMarkerShape "ICON";
_garrNum = [_x] call A3A_fnc_garrisonSize;
_garrNum = _garrNum / 8;
_garrison = [];
killZones setVariable [_x,[],true];
_dmrk setMarkerType "loc_bunker";
if !(_x in _mrkCSAT) then
    {
    _dmrk setMarkerColor colorMalos;
    _dmrk setMarkerText format ["%1 Outpost",nameMalos];
    for "_i" from 1 to _garrNum do
        {
        _garrison append (selectRandom gruposFIASquad);
        };
    lados setVariable [_x,malos,true];
    }
else
    {
    _dmrk setMarkerText format ["%1 Outpost",nameMuyMalos];
    _dmrk setMarkerColor colorMuyMalos;
    if (gameMode == 4) then
    	{
    	for "_i" from 1 to _garrNum do
	       {
	       _garrison append (selectRandom gruposFIASquad);
	       };
    	}
    else
    	{
	    for "_i" from 1 to _garrNum do
	        {
	        _garrison append (selectRandom gruposCSATSquad);
	        };
	    };
    lados setVariable [_x,muyMalos,true];
    };
garrison setVariable [_x,_garrison,true];
server setVariable [_x,0,true];
_nul = [_x] call A3A_fnc_crearControles;
} forEach puestos;

{
_pos = getMarkerPos _x;
_dmrk = createMarker [format ["Dum%1",_x], _pos];
_dmrk setMarkerShape "ICON";
_garrNum = [_x] call A3A_fnc_garrisonSize;
_garrNum = _garrNum / 8;
_garrison = [];
_dmrk setMarkerType "b_naval";
_dmrk setMarkerText "Sea Port";
if (_x in _mrkCSAT) then
    {
    _dmrk setMarkerColor colorMuyMalos;
	for "_i" from 1 to _garrNum do
	   {
	   _garrison append (selectRandom gruposCSATSquad);
	   };
    lados setVariable [_x,muyMalos,true];
    }
else
    {
    _dmrk setMarkerColor colorMalos;
    for "_i" from 1 to _garrNum do
        {
        _garrison append (selectRandom gruposNATOSquad);
        };
    lados setVariable [_x,malos,true];
    };
garrison setVariable [_x,_garrison,true];
_nul = [_x] call A3A_fnc_crearControles;
} forEach puertos;

lados setVariable ["NATO_carrier",malos,true];
lados setVariable ["CSAT_carrier",muyMalos,true];