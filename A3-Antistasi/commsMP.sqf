if (!hasInterface) exitWith {};
if ((side player != buenos) and (side player != civilian)) exitWith {};
private ["_unit","_tipo","_texto","_display","_setText"];

_unit = _this select 0;
_tipo = _this select 1;
_texto = _this select 2;

if (_tipo == "sideChat") then
	{
	_unit sideChat format ["%1", _texto];
	};
if (_tipo == "hint") then {hint format ["%1",_texto]};
if (_tipo == "hintCS") then {hintC format ["%1",_texto]};
if (_tipo == "globalChat") then
	{
	_unit globalChat format ["%1", _texto];
	};

if (_tipo == "income") then
	{
	waitUntil {sleep 0.2; !incomeRep};
	incomeRep = true;
	//playSound3D ["a3\sounds_f\sfx\beep_target.wss", player];
	playSound "3DEN_notificationDefault";
	//[_texto,0.8,0.5,5,0,0,2] spawn bis_fnc_dynamicText;
	[_texto, [safeZoneX + (0.8 * safeZoneW), (0.2 * safeZoneW)], 0.5, 5, 0, 0, 2] spawn bis_fnc_dynamicText;
	incomeRep = false;
	[] spawn A3A_fnc_statistics;
	};

if (_tipo == "countdown") then
	{
	_texto = format ["Time Remaining: %1 secs",_texto];
	hint format ["%1",_texto];
	};

if (_tipo == "taxRep") then
	{
	incomeRep = true;
	playSound "3DEN_notificationDefault";
	//playSound3D ["a3\sounds_f\sfx\beep_target.wss", player];
	//[_texto,0.8,0.5,5,0,0,2] spawn bis_fnc_dynamicText;
	[_texto, [safeZoneX + (0.8 * safeZoneW), (0.2 * safeZoneW)], 0.5, 5, 0, 0, 2] spawn bis_fnc_dynamicText;
	sleep 10;
	incomeRep = false;
	[] spawn A3A_fnc_statistics;
	};
if (_tipo == "tier") then
	{
	waitUntil {sleep 0.2; !incomeRep};
	incomeRep = true;
	//playSound3D ["a3\sounds_f\sfx\beep_target.wss", player];
	playSound "3DEN_notificationDefault";
	//[_texto,0.8,0.5,5,0,0,2] spawn bis_fnc_dynamicText;
	_texto = format ["War Level Changed<br/><br/>Current Level: %1",tierWar];
	[_texto, [safeZoneX + (0.8 * safeZoneW), (0.2 * safeZoneW)], 0.5, 5, 0, 0, 2] spawn bis_fnc_dynamicText;
	incomeRep = false;
	[] spawn A3A_fnc_statistics;
	};
