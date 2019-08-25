diag_log format ["%1: [Antistasi] | INFO | InitGarrisons Started.",servertime];

_mrkDEFENDER = [];
_mrkINVADER = [];
_roadblockDEFENDER = [];
_roadblockINVADER = [];

if (gameMode == 1) then
	{
    _roadblockDEFENDER = controlsX;
	if (worldName == "Tanoa") then
	    {
	    _mrkINVADER = ["airport_1","seaport_5","outpost_10","control_20"];
	    _roadblockDEFENDER = _roadblockDEFENDER - ["control_20"];
	    _roadblockINVADER = ["control_20"];
	    }
	else
	    {
	    if (worldName == "Altis") then
	        {
	        _mrkINVADER = ["airport_2","seaport_4","outpost_5","control_52","control_33"];
	        _roadblockDEFENDER = _roadblockDEFENDER - ["control_52","control_33"];
	    	_roadblockINVADER = ["control_52","control_33"];
	        }
        else
            {
            if (worldName == "chernarus_summer") then
                {
                _mrkINVADER = ["outpost_21"];
                };
            };
	    };
	_mrkDEFENDER = markersX - _mrkINVADER - ["Synd_HQ"];
	}
else
	{
	if (gameMode == 4) then
		{
		_mrkINVADER = markersX - ["Synd_HQ"];
		_roadblockINVADER = controlsX;
		}
	else
		{
		_mrkDEFENDER = markersX - ["Synd_HQ"];
		_roadblockDEFENDER = controlsX;
		};
	};
{sidesX setVariable [_x,Occupants,true]} forEach _roadblockDEFENDER;
{sidesX setVariable [_x,Invaders,true]} forEach _roadblockINVADER;
{
_pos = getMarkerPos _x;
_dmrk = createMarker [format ["Dum%1",_x], _pos];
_dmrk setMarkerShape "ICON";
_garrNum = [_x] call A3A_fnc_garrisonSize;
_garrNum = _garrNum / 8;
_garrison = [];
killZones setVariable [_x,[],true];
if (_x in _mrkINVADER) then
    {
    _dmrk setMarkerType flagCSATmrk;
    _dmrk setMarkerText format ["%1 Airbase",nameInvaders];
    _dmrk setMarkerColor colorInvaders;
    for "_i" from 1 to _garrNum do
        {
        _garrison append (selectRandom groupsCSATSquad);
        };
    garrison setVariable [_x,_garrison,true];
    sidesX setVariable [_x,Invaders,true];
    }
else
    {
    _dmrk setMarkerType flagNATOmrk;
    _dmrk setMarkerText format ["%1 Airbase",nameOccupants];
    _dmrk setMarkerColor colorOccupants;
    for "_i" from 1 to _garrNum do
        {
        _garrison append (selectRandom groupsNATOSquad);
        };
    garrison setVariable [_x,_garrison,true];
    sidesX setVariable [_x,Occupants,true];
    };
_nul = [_x] call A3A_fnc_createControls;
server setVariable [_x,0,true];
} forEach airportsX;

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
   _garrison append (selectRandom groupsFIASquad);
   };
if (_x in _mrkINVADER) then
	{
	_dmrk setMarkerColor colorInvaders;
	sidesX setVariable [_x,Invaders,true];
	}
else
	{
	_dmrk setMarkerColor colorOccupants;
	sidesX setVariable [_x,Occupants,true];
	};
garrison setVariable [_x,_garrison,true];
_nul = [_x] call A3A_fnc_createControls;
} forEach resourcesX;

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
   _garrison append (selectRandom groupsFIASquad);
   };
if (_x in _mrkINVADER) then
	{
	_dmrk setMarkerColor colorInvaders;
    sidesX setVariable [_x,Invaders,true];
	}
else
	{
	_dmrk setMarkerColor colorOccupants;
    sidesX setVariable [_x,Occupants,true];
    };
garrison setVariable [_x,_garrison,true];
_nul = [_x] call A3A_fnc_createControls;
} forEach factories;

{
_pos = getMarkerPos _x;
_dmrk = createMarker [format ["Dum%1",_x], _pos];
_dmrk setMarkerShape "ICON";
_garrNum = [_x] call A3A_fnc_garrisonSize;
_garrNum = _garrNum / 8;
_garrison = [];
killZones setVariable [_x,[],true];
_dmrk setMarkerType "loc_bunker";
if !(_x in _mrkINVADER) then
    {
    _dmrk setMarkerColor colorOccupants;
    _dmrk setMarkerText format ["%1 Outpost",nameOccupants];
    for "_i" from 1 to _garrNum do
        {
        _garrison append (selectRandom groupsFIASquad);
        };
    sidesX setVariable [_x,Occupants,true];
    }
else
    {
    _dmrk setMarkerText format ["%1 Outpost",nameInvaders];
    _dmrk setMarkerColor colorInvaders;
    if (gameMode == 4) then
    	{
    	for "_i" from 1 to _garrNum do
	       {
	       _garrison append (selectRandom groupsFIASquad);
	       };
    	}
    else
    	{
	    for "_i" from 1 to _garrNum do
	        {
	        _garrison append (selectRandom groupsCSATSquad);
	        };
	    };
    sidesX setVariable [_x,Invaders,true];
    };
garrison setVariable [_x,_garrison,true];
server setVariable [_x,0,true];
_nul = [_x] call A3A_fnc_createControls;
} forEach outposts;

{
_pos = getMarkerPos _x;
_dmrk = createMarker [format ["Dum%1",_x], _pos];
_dmrk setMarkerShape "ICON";
_garrNum = [_x] call A3A_fnc_garrisonSize;
_garrNum = _garrNum / 8;
_garrison = [];
_dmrk setMarkerType "b_naval";
_dmrk setMarkerText "Sea Port";
if (_x in _mrkINVADER) then
    {
    _dmrk setMarkerColor colorInvaders;
	for "_i" from 1 to _garrNum do
	   {
	   _garrison append (selectRandom groupsCSATSquad);
	   };
    sidesX setVariable [_x,Invaders,true];
    }
else
    {
    _dmrk setMarkerColor colorOccupants;
    for "_i" from 1 to _garrNum do
        {
        _garrison append (selectRandom groupsNATOSquad);
        };
    sidesX setVariable [_x,Occupants,true];
    };
garrison setVariable [_x,_garrison,true];
_nul = [_x] call A3A_fnc_createControls;
} forEach seaports;

sidesX setVariable ["NATO_carrier",Occupants,true];
sidesX setVariable ["CSAT_carrier",Invaders,true];
diag_log format ["%1: [Antistasi] | INFO | InitGarrison Completed.",servertime];
