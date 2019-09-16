params [["_message", ""]];

private _countGroups = 0; 
private _countRebels = 0;
private _countInvaders = 0;
private _countOccupants = 0;
private _countCiv = 0; 

{
	_countGroups = _countGroups + 1;
	switch(side _x) do {
		case teamPlayer: 
			{
				_countRebels = _countRebels + 1;
			};
		case Occupants: 
			{
				_countOccupants = _countOccupants +	1;
			};
		case Invaders:
			{
				_countInvaders =	_countInvaders + 1;
			};
		case civilian:
			{
				_countCiv = _countCiv + 1;
			};
	};
} forEach allGroups;

diag_log format ["[Antistasi] Performance Log. %10 ServerFPS: %1, Players: %11, DeadUnits: %2, AllUnits:%3, AllObjects: %4, Groups: Rebels-%5, Invaders-%6, Occupants-%7, Civ-%8, Total-%9",diag_fps,(count alldead),count allunits,count allMissionObjects "all",_countRebels,_countInvaders,_countOccupants,_countCiv,_countGroups, _message, count (allPlayers)];
