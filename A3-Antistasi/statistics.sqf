if (!hasInterface) exitWith {};
private ["_texto","_display","_setText"];
//sleep 3;
disableSerialization;
//waitUntil {!isNull (uiNameSpace getVariable "H8erHUD")};
if (isNull (uiNameSpace getVariable "H8erHUD")) exitWith {};
_display = uiNameSpace getVariable "H8erHUD";
if (isNil "_display") exitWith {};
waitUntil {sleep 0.5;!(isNil "theBoss")};
_setText = _display displayCtrl 1001;
_setText ctrlSetBackgroundColor [0,0,0,0];
_nombreC = "None";
if (!isMultiplayer) then
	{
	_texto = format ["<t size='0.60'>" + "HR: %1 | %9 Money: %2 € | Airstrikes: %5 | %7 Aggr: %3 | %8 Aggr: %4 | War Level: %6 | Undercover Mode: %10", server getVariable "hr", server getVariable "resourcesFIA",floor prestigeNATO,floor prestigeCSAT,floor bombRuns,tierWar,nameMalos,nameMuyMalos,nameBuenos,["Off", "<t color='#1DA81D'>On</t>"] select ((captive player) and !(player getVariable ["INCAPACITATED",false]))];
	}
else
	{
	if (player != theBoss) then
		{
		if (isPlayer theBoss) then {_nombreC = name theBoss} else {_nombreC = "None"};
		_texto = format ["<t size='0.560'>" + "Commander: %3 | Rank: %2 | HR: %1 | Your Money: %4 € | %8 Aggr: %5 | %9 Aggr: %6 | War Level: %7 | Undercover Mode: %10", server getVariable "hr", rank player, _nombreC, player getVariable "dinero",floor prestigeNATO, floor prestigeCSAT,tierWar,nameMalos,nameMuyMalos,["Off", "<t color='#1DA81D'>On</t>"] select ((captive player) and !(player getVariable ["INCAPACITATED",false]))];
		}
	else
		{
		if ([(player getVariable ["owner",player])] call A3A_fnc_isMember) then
			{
			_texto = format ["<t size='0.60'>" + "Rank: %5 | HR: %1 | Your Money: %6 € | %11 Money: %2 € | Airstrikes: %7 | %9 Aggr: %3 | %10 Aggr: %4 | War Level: %8 | Undercover Mode: %12", server getVariable "hr", server getVariable "resourcesFIA", floor prestigeNATO, floor prestigeCSAT,rank player, player getVariable "dinero",floor bombRuns,tierWar,nameMalos,nameMuyMalos,nameBuenos,["Off", "<t color='#1DA81D'>On</t>"] select ((captive player) and !(player getVariable ["INCAPACITATED",false]))];
			}
		else
			{
			_texto = format ["<t size='0.60'>" + "Rank: %1 | Your Money: %2 € | %3 Money: %4 € | %5 Aggr: %6 | %7 Aggr: %8 | War Level: %9 | Undercover Mode: %10",rank player,player getVariable "dinero",nameBuenos,server getVariable "resourcesFIA", nameMalos, floor prestigeNATO, nameMuyMalos,floor prestigeCSAT,tierWar,["Off", "<t color='#1DA81D'>On</t>"] select ((captive player) and !(player getVariable ["INCAPACITATED",false]))];
			};
		};
	};

//if (captive player) then {_texto = format ["%1 ON",_texto]} else {_texto = format ["%1 OFF",_texto]};
_setText ctrlSetStructuredText (parseText format ["%1", _texto]);
_setText ctrlCommit 0;