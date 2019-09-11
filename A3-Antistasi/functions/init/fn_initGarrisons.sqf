diag_log format ["%1: [Antistasi] | INFO | InitGarrisons Started.",servertime];

_mrkNATO = [];
_mrkCSAT = [];
_controlsNATO = [];
_controlsCSAT = [];
if (debug) then {
    diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | Setting Control Marks for Worldname: %2  .",servertime,worldName];
};
if (gameMode == 1) then
	{
    _controlsNATO = controlsX;
	if (worldName == "Tanoa") then
	    {
	    _mrkCSAT = ["airport_1","seaport_5","outpost_10","control_20"];
	    _controlsNATO = _controlsNATO - ["control_20"];
	    _controlsCSAT = ["control_20"];
	    }
	else
	    {
	    if (worldName == "Altis") then
	        {
	        _mrkCSAT = ["airport_2","seaport_4","outpost_5","control_52","control_33"];
	        _controlsNATO = _controlsNATO - ["control_52","control_33"];
	    	_controlsCSAT = ["control_52","control_33"];
	        }
        else
            {
            if (worldName == "chernarus_summer") then
                {
                _mrkCSAT = ["outpost_21"];
                };
            };
	    };
	_mrkNATO = markersX - _mrkCSAT - ["Synd_HQ"];
    if (debug) then {
        diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | _mrkCSAT: %2.",servertime,_mrkCSAT];
        diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | _mrkNATO: %2.",servertime,_mrkNATO];
    };
	}
else
	{
	if (gameMode == 4) then
		{
		_mrkCSAT = markersX - ["Synd_HQ"];
		_controlsCSAT = controlsX;
		}
	else
		{
		_mrkNATO = markersX - ["Synd_HQ"];
		_controlsNATO = controlsX;
		};
	};
{sidesX setVariable [_x,Occupants,true]} forEach _controlsNATO;
{sidesX setVariable [_x,Invaders,true]} forEach _controlsCSAT;
if (debug) then {
    diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | Setting up Airbase stuff.",servertime];
};
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
server setVariable [_x,0,true];//dateX en fomrato dateToNumber en la que estarán idle
} forEach airportsX;
if (debug) then {
    diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | Setting up Resource stuff.",servertime];
};
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
if (_x in _mrkCSAT) then
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
if (debug) then {
    diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | Setting up Factory stuff.",servertime];
};
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
if (_x in _mrkCSAT) then
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
if (debug) then {
    diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | Setting up Outpost stuff.",servertime];
};
{
_pos = getMarkerPos _x;
_dmrk = createMarker [format ["Dum%1",_x], _pos];
_dmrk setMarkerShape "ICON";
_garrNum = [_x] call A3A_fnc_garrisonSize;
_garrNum = _garrNum / 8;
if (debug) then {
    diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | Outpost: %2 - Size: %3.",servertime,_x,_garrNum];
};
_garrison = [];
killZones setVariable [_x,[],true];
_dmrk setMarkerType "loc_bunker";
if !(_x in _mrkCSAT) then
    {
    _dmrk setMarkerColor colorOccupants;
    _dmrk setMarkerText format ["%1 Outpost",nameOccupants];
    for "_i" from 1 to _garrNum do
        {
        if (debug) then {
            diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | Not in CSAT | Creating FIASquad: %2 in outpost: %3",servertime,_i,_X];
        };
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
            if (debug) then {
                diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | CSAT & Gamemode 4 | Creating FIASquad: %2 in outpost: %3",servertime,_i,_X];
            };
	       _garrison append (selectRandom groupsFIASquad);
	       };
    	}
    else
    	{
	    for "_i" from 1 to _garrNum do
	        {
            if (debug) then {
                diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | CSAT & Not Gamemode 4 | Creating FIASquad: %2 in outpost: %3",servertime,_i,_X];
            };
	        _garrison append (selectRandom groupsCSATSquad);
	        };
	    };
    sidesX setVariable [_x,Invaders,true];
    };
garrison setVariable [_x,_garrison,true];
server setVariable [_x,0,true];
_nul = [_x] call A3A_fnc_createControls;
} forEach outposts;
if (debug) then {
    diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | Setting up Seaport stuff.",servertime];
};
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
