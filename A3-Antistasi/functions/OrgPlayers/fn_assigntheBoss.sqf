params [["_suggestedLeader",objNull]];
private ["_puntMax","_textX","_multiplier","_newRank","_selectable","_disconnected","_owner","_pointsX","_dataX"];
_puntMax = 0;
_textX = "";
_multiplier = 1;
//_newRank = "CORPORAL";
_disconnected = false;

_playersX = [];
_membersX = [];
_eligibles = [];

_LeaderX = objNull;

{
	_playersX pushBack (_x getVariable ["owner",_x]);
	if (_x == _x getVariable ["owner", _x] && isPlayer _x) then {
		if ([_x] call A3A_fnc_isMember) then
		{
			_membersX pushBack _x;
			if (_x getVariable ["eligible",true]) then
			{
				_eligibles pushBack _x;
				if (_x == theBoss) then
				{
					_LeaderX = _x;
					_dataX = [_LeaderX] call A3A_fnc_numericRank;
					_puntMax = _dataX select 0;
				};
			};
		};
	};
} forEach (playableUnits select {(side (group _x) == teamPlayer)});

if (isNull _LeaderX) then
{
	_puntMax = 0;
	_disconnected = true;
};
_textX = "Promoted Players:\n\n";
_promoted = false;
{
	_pointsX = _x getVariable ["score",0];
	_dataX = [_x] call A3A_fnc_numericRank;
	_multiplier = _dataX select 0;
	_newRank = _dataX select 1;
	_rank = _x getVariable ["rankX","PRIVATE"];
	if (_rank != "COLONEL") then
	{
		if (_pointsX >= 50*_multiplier) then
		{
			_promoted = true;
			[_x,_newRank] remoteExec ["A3A_fnc_ranksMP"];
			_x setVariable ["rankX",_newRank,true];
			_textX = format ["%3%1: %2.\n",name _x,_newRank,_textX];
			[-1*(50*_multiplier),_x] call A3A_fnc_playerScoreAdd;
			_multiplier = _multiplier + 1;
			sleep 5;
		};
	};
} forEach _playersX;

if (_promoted) then
{
	_textX = format ["%1\n\nCONGRATULATIONS!!",_textX];
	[petros,"hint",_textX] remoteExec ["A3A_fnc_commsMP"];
};

_proceed = false;

if ((isNull _LeaderX) or switchCom) then
{
	if (count _membersX > 0) then
	{
		_proceed = true;
		if (count _eligibles == 0) then {_eligibles = _membersX};
	};
};

if (!_proceed) exitWith {};

_selectable = objNull;
if (!isNull _suggestedLeader && {_suggestedLeader in _eligibles}) then 
{
	if (_suggestedLeader != _LeaderX) then
	{
		_dataX = [_suggestedLeader] call A3A_fnc_numericRank;
		_selectable = _suggestedLeader;
		_puntMax = _dataX select 0;
	};
}
else
{
	{
		_dataX = [_x] call A3A_fnc_numericRank;
		_multiplier = _dataX select 0;
		if ((_multiplier > _puntMax) and (_x!=_LeaderX)) then
		{
			_selectable = _x;
			_puntMax = _multiplier;
		};
	} forEach _eligibles;
};

if (!isNull _selectable) then
{
	if (_disconnected) then {_textX = format ["Player Commander disconnected or renounced. %1 is our new leader. Greet him!", name _selectable]} else {_textX = format ["%1 is no longer leader of the our Forces.\n\n %2 is our new leader. Greet him!", name theBoss, name _selectable]};
	[_selectable] call A3A_fnc_theBossInit;
	sleep 5;
	[[petros,"hint",_textX],"A3A_fnc_commsMP"] call BIS_fnc_MP;
};
