
private ["_textX","_dataX","_numCiv","_prestigeOPFOR","_rebelCitySupport","_power","_busy","_siteX","_positionTel","_garrison"];
positionTel = [];

_popRebels = 0;
_popGovt = 0;
_popKilled = 0;
_pop = 0;
{
_dataX = server getVariable _x;
_numCiv = _dataX select 0;
_prestigeOPFOR = _dataX select 2;
_rebelCitySupport = _dataX select 3;
_popRebels = _popRebels + (_numCiv * (_rebelCitySupport / 100));
_popGovt = _popGovt + (_numCiv * (_prestigeOPFOR / 100));
_pop = _pop + _numCiv;
if (_x in destroyedCities) then {_popKilled = _popKilled + _numCIV};
} forEach citiesX;
_popRebels = round _popRebels;
_popGovt = round _popGovt;
hint format ["%7\n\nTotal pop: %1\n%6 Support: %2\n%5 Support: %3 \n\nMurdered Pop: %4\n\nClick on the zone",_pop, _popRebels, _popGovt, _popKilled,nameOccupants,rebelFactionName,worldName];

if (!visibleMap) then {openMap true};

onMapSingleClick "positionTel = _pos;";


//waitUntil {sleep 1; (count positionTel > 0) or (not visiblemap)};
while {visibleMap} do
	{
	sleep 1;
	if (count positionTel > 0) then
		{
		_positionTel = positionTel;
		_siteX = [markersX, _positionTel] call BIS_Fnc_nearestPosition;
		_textX = "Click on the zone";
		_nameFaction = if (sidesX getVariable [_siteX,sideUnknown] == rebelSide) then {rebelFactionName} else {if (sidesX getVariable [_siteX,sideUnknown] == Occupants) then {nameOccupants} else {nameInvaders}};
		if (_siteX == "Synd_HQ") then
			{
			_textX = format ["%2 HQ%1",[_siteX] call A3A_fnc_garrisonInfo,rebelFactionName];
			};
		if (_siteX in citiesX) then
			{
			_dataX = server getVariable _siteX;

			_numCiv = _dataX select 0;
			_prestigeOPFOR = _dataX select 2;
			_rebelCitySupport = _dataX select 3;
			_power = [_siteX] call A3A_fnc_powerCheck;
			_textX = format ["%1\n\nPop %2\n%6 Support: %3 %5\n%7 Support: %4 %5",[_siteX,false] call A3A_fnc_fn_location,_numCiv,_prestigeOPFOR,_rebelCitySupport,"%",nameOccupants,rebelFactionName];
			_positionX = getMarkerPos _siteX;
			_result = "NONE";
			switch (_power) do
				{
				case rebelSide: {_result = format ["%1",rebelFactionName]};
				case Occupants: {_result = format ["%1",nameOccupants]};
				case Invaders: {_result = format ["%1",nameInvaders]};
				};
			/*_ant1 = [antennas,_positionX] call BIS_fnc_nearestPosition;
			_ant2 = [antennasDead, _positionX] call BIS_fnc_nearestPosition;
			if (_ant1 distance _positionX > _ant2 distance _positionX) then
				{
				_result = "NONE";
				}
			else
				{
				_outpost = [markersX,_ant1] call BIS_fnc_NearestPosition;
				if (sidesX getVariable [_siteX,sideUnknown] == rebelSide) then
					{
					if (sidesX getVariable [_outpost,sideUnknown] == rebelSide) then {_result = format ["%1",rebelFactionName]} else {if (sidesX getVariable [_outpost,sideUnknown] == Invaders) then {_result = "NONE"}};
					}
				else
					{
					if (sidesX getVariable [_outpost,sideUnknown] == rebelSide) then {_result = format ["%1",rebelFactionName]} else {if (sidesX getVariable [_outpost,sideUnknown] == Invaders) then {_result = "NONE"}};
					};
				};
			*/
			_textX = format ["%1\nInfluence: %2",_textX,_result];
			if (_siteX in destroyedCities) then {_textX = format ["%1\nDESTROYED",_textX]};
			if (sidesX getVariable [_siteX,sideUnknown] == rebelSide) then {_textX = format ["%1\n%2",_textX,[_siteX] call A3A_fnc_garrisonInfo]};
			};
		if (_siteX in airportsX) then
			{
			if (not(sidesX getVariable [_siteX,sideUnknown] == rebelSide)) then
				{
				_textX = format ["%1 Airport",_nameFaction];
				_busy = [_siteX,true] call A3A_fnc_airportCanAttack;
				if (_busy) then {_textX = format ["%1\nStatus: Idle",_textX]} else {_textX = format ["%1\nStatus: Busy",_textX]};
				_garrison = count (garrison getVariable _siteX);
				if (_garrison >= 40) then {_textX = format ["%1\nGarrison: Good",_textX]} else {if (_garrison >= 20) then {_textX = format ["%1\nGarrison: Weakened",_textX]} else {_textX = format ["%1\nGarrison: Decimated",_textX]}};
				}
			else
				{
				_textX = format ["%2 Airport%1",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
				};
			};
		if (_siteX in resourcesX) then
			{
			if (not(sidesX getVariable [_siteX,sideUnknown] == rebelSide)) then
				{
				_textX = format ["%1 Resources",_nameFaction];
				_garrison = count (garrison getVariable _siteX);
				if (_garrison >= 30) then {_textX = format ["%1\nGarrison: Good",_textX]} else {if (_garrison >= 10) then {_textX = format ["%1\nGarrison: Weakened",_textX]} else {_textX = format ["%1\nGarrison: Decimated",_textX]}};
				}
			else
				{
				_textX = format ["%2 Resources%1",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
				};
			if (_siteX in destroyedCities) then {_textX = format ["%1\nDESTROYED",_textX]};
			};
		if (_siteX in factories) then
			{
			if (not(sidesX getVariable [_siteX,sideUnknown] == rebelSide)) then
				{
				_textX = format ["%1 Factory",_nameFaction];
				_garrison = count (garrison getVariable _siteX);
				if (_garrison >= 16) then {_textX = format ["%1\nGarrison: Good",_textX]} else {if (_garrison >= 8) then {_textX = format ["%1\nGarrison: Weakened",_textX]} else {_textX = format ["%1\nGarrison: Decimated",_textX]}};
				}
			else
				{
				_textX = format ["%2 Factory%1",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
				};
			if (_siteX in destroyedCities) then {_textX = format ["%1\nDESTROYED",_textX]};
			};
		if (_siteX in outposts) then
			{
			if (not(sidesX getVariable [_siteX,sideUnknown] == rebelSide)) then
				{
				_textX = format ["%1 Grand Outpost",_nameFaction];
				_busy = [_siteX,true] call A3A_fnc_airportCanAttack;
				if (_busy) then {_textX = format ["%1\nStatus: Idle",_textX]} else {_textX = format ["%1\nStatus: Busy",_textX]};
				_garrison = count (garrison getVariable _siteX);
				if (_garrison >= 16) then {_textX = format ["%1\nGarrison: Good",_textX]} else {if (_garrison >= 8) then {_textX = format ["%1\nGarrison: Weakened",_textX]} else {_textX = format ["%1\nGarrison: Decimated",_textX]}};
				}
			else
				{
				_textX = format ["%2 Grand Outpost%1",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
				};
			};
		if (_siteX in seaports) then
			{
			if (not(sidesX getVariable [_siteX,sideUnknown] == rebelSide)) then
				{
				_textX = format ["%1 Seaport",_nameFaction];
				_garrison = count (garrison getVariable _siteX);
				if (_garrison >= 20) then {_textX = format ["%1\nGarrison: Good",_textX]} else {if (_garrison >= 8) then {_textX = format ["%1\nGarrison: Weakened",_textX]} else {_textX = format ["%1\nGarrison: Decimated",_textX]}};
				}
			else
				{
				_textX = format ["%2 Seaport%1",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
				};
			};
		if (_siteX in rebelWatchpostsAndRoadblocks) then
			{
			if (isOnRoad (getMarkerPos _siteX)) then
				{
				_textX = format ["%2 Roadblock%1",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
				}
			else
				{
				_textX = format ["%1 Watchpost",_nameFaction];
				};
			};
		hint format ["%1",_textX];
		};
	positionTel = [];
	};
onMapSingleClick "";








