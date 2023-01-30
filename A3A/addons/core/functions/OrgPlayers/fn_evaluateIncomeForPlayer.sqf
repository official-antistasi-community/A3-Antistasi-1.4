//AGN change
_playersIncome = _this select 0;
_playersCurrentMoney = player getVariable "moneyX";

_tresholds = [[500, 0], [400, 0.1], [200, 0.15], [0, 0.2]];		// [currentPlayersMoney, percentOfIncome], preserve descending order of playersMoney
_maxPlayersIncome = 250;

for [{_i = 0}, {_i < count _tresholds}, {_i = _i + 1}] do 
{	
	_treshold = _tresholds select _i;
	_limit = _treshold select 0;

	if(_playersCurrentMoney > _limit) exitWith			// check if players amount of money is higher than possible income, if yes apply formula
	{
		_playersIncome = round (_playersIncome * (_treshold select 1));
		if(_playersIncome > _maxPlayersIncome) then			// income can't be higher than treshold, its function is small and convenient support than main source of income
		{
			_playersIncome = _maxPlayersIncome;
		};
	};
};

[_playersIncome] call A3A_fnc_resourcesPlayer;

_textX = format ["<t size='0.7' color='#C1C0BB'>Personal income:<br/> <t size='1' color='#C1C0BB'>+%1 €", _playersIncome];
[petros, "income", _textX] remoteExec ["A3A_fnc_commsMP", player];
