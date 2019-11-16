if (!hasInterface) exitWith {};
if (isNil "initVar") exitWith {};
if ((side player != teamPlayer) and (side player != civilian)) exitWith {};
private ["_unit","_typeX","_textX","_display","_setText"];

_unit = _this select 0;
_typeX = _this select 1;
_textX = _this select 2;

if (_typeX == "sideChat") then
	{
	_unit sideChat format ["%1", _textX];
	};
if (_typeX == "hint") then {hint format ["%1",_textX]};
if (_typeX == "hintCS") then {hintC format ["%1",_textX]};
if (_typeX == "globalChat") then
	{
	_unit globalChat format ["%1", _textX];
	};

if (_typeX == "income") then
	{
	waitUntil {sleep 0.2; !incomeRep};
	incomeRep = true;
	//playSound3D ["a3\sounds_f\sfx\beep_target.wss", player];
	playSound "3DEN_notificationDefault";
	//[_textX,0.8,0.5,5,0,0,2] spawn bis_fnc_dynamicText;
	[_textX, [safeZoneX + (0.8 * safeZoneW), (0.2 * safeZoneW)], 0.5, 5, 0, 0, 2] spawn bis_fnc_dynamicText;
	incomeRep = false;
	[] spawn A3A_fnc_statistics;
	};

if (_typeX == "countdown") then
	{
	_textX = format ["Time Remaining: %1 secs",_textX];
	hint format ["%1",_textX];
	};

if (_typeX == "taxRep") then
	{
	incomeRep = true;
	playSound "3DEN_notificationDefault";
	//playSound3D ["a3\sounds_f\sfx\beep_target.wss", player];
	//[_textX,0.8,0.5,5,0,0,2] spawn bis_fnc_dynamicText;
	[_textX, [safeZoneX + (0.8 * safeZoneW), (0.2 * safeZoneW)], 0.5, 5, 0, 0, 2] spawn bis_fnc_dynamicText;
	sleep 10;
	incomeRep = false;
	[] spawn A3A_fnc_statistics;
	};
if (_typeX == "tier") then
	{
	waitUntil {sleep 0.2; !incomeRep};
	incomeRep = true;
	//playSound3D ["a3\sounds_f\sfx\beep_target.wss", player];
	playSound "3DEN_notificationDefault";
	//[_textX,0.8,0.5,5,0,0,2] spawn bis_fnc_dynamicText;
	_textX = format ["War Level Changed<br/><br/>Current Level: %1",tierWar];
	[_textX, [safeZoneX + (0.8 * safeZoneW), (0.2 * safeZoneW)], 0.5, 5, 0, 0, 2] spawn bis_fnc_dynamicText;
	incomeRep = false;
	[] spawn A3A_fnc_statistics;
	};
