if (isDedicated) exitWith {};

_chance = 8;
if (debug) then {_chance = 100};
_lado = malos;
if (count _this == 1) then
	{
	_marcador = _this select 0;
	if (_marcador isEqualType "") then
		{
		if (_marcador in aeropuertos) then {_chance = 30} else {_chance = 15};
		if (lados getVariable [_marcador,sideUnknown] == muyMalos) then {_lado = muyMalos};
		}
	else
		{
		_lado = side (group (_this select 0));
		_chance = random 25;
		};
	};

_texto = format ["<t size='0.6' color='#C1C0BB'>Intel Found.<br/> <t size='0.5' color='#C1C0BB'><br/>"];

if (random 100 < _chance) then
	{
	if (_lado == malos) then
		{
		if ([vehNATOPlane] call A3A_fnc_vehAvailable) then {_texto = format ["%1 %2 Planes Available<br/>",_texto,nameMalos]} else {_texto = format ["%1 %2 Planes Unavailable<br/>",_texto,nameMalos]}
		}
	else
		{
		if ([vehCSATPlane] call A3A_fnc_vehAvailable) then {_texto = format ["%1 %2 Planes Available<br/>",_texto,nameMuyMalos]} else {_texto = format ["%1 %2 Planes Unavailable<br/>",_texto,nameMuyMalos]}
		};
	};
if (random 100 < _chance) then
	{
	if (_lado == malos) then
		{
		if ({[_x] call A3A_fnc_vehAvailable} count vehNATOAttackHelis > 0) then {_texto = format ["%1 %2 Attack Helis Available<br/>",_texto,nameMalos]} else {_texto = format ["%1 %2 Attack Helis Unavailable<br/>",_texto,nameMalos]}
		}
	else
		{
		if ({[_x] call A3A_fnc_vehAvailable} count vehCSATAttackHelis > 0) then {_texto = format ["%1 %2 Attack Helis Available<br/>",_texto,nameMuyMalos]} else {_texto = format ["%1 %2 Attack Helis Unavailable<br/>",_texto,nameMuyMalos]}
		};
	};
if (random 100 < _chance) then
	{
	if (_lado == malos) then
		{
		if ({[_x] call A3A_fnc_vehAvailable} count vehNATOAPC > 0) then {_texto = format ["%1 %2 APCs Available<br/>",_texto,nameMalos]} else {_texto = format ["%1 %2 APCs Unavailable<br/>",_texto,nameMalos]}
		}
	else
		{
		if ({[_x] call A3A_fnc_vehAvailable} count vehCSATAPC > 0) then {_texto = format ["%1 %2 APCs Available<br/>",_texto,nameMuyMalos]} else {_texto = format ["%1 %2 APCs Unavailable<br/>",_texto,nameMuyMalos]}
		};
	};
if (random 100 < _chance) then
	{
	if (_lado == malos) then
		{
		if ([vehNATOTank] call A3A_fnc_vehAvailable) then {_texto = format ["%1 %2 Tanks Available<br/>",_texto,nameMalos]} else {_texto = format ["%1 %2 Tanks Unavailable<br/>",_texto,nameMalos]}
		}
	else
		{
		if ([vehCSATTank] call A3A_fnc_vehAvailable) then {_texto = format ["%1 %2 Tanks Available<br/>",_texto,nameMuyMalos]} else {_texto = format ["%1 %2 Tanks Unavailable<br/>",_texto,nameMuyMalos]}
		};
	};
if (random 100 < _chance) then
	{
	if (_lado == malos) then
		{
		if ([vehNATOAA] call A3A_fnc_vehAvailable) then {_texto = format ["%1 %2 AA Tanks Available<br/>",_texto,nameMalos]} else {_texto = format ["%1 %2 AA Tanks Unavailable<br/>",_texto,nameMalos]}
		}
	else
		{
		if ([vehCSATAA] call A3A_fnc_vehAvailable) then {_texto = format ["%1 %2 AA Tanks Available<br/>",_texto,nameMuyMalos]} else {_texto = format ["%1 %2 AA Tanks Unavailable<br/>",_texto,nameMuyMalos]}
		};
	};

_minasAAF = allmines - (detectedMines buenos);
if (_lado == malos) then {_minasAAF = _minasAAF - (detectedMines muyMalos)} else {_minasAAF = _minasAAF - (detectedMines malos)};
_revelaMina = false;
if (count _minasAAF > 0) then
	{
	{if (random 100 < _chance) then {buenos revealMine _x; _revelaMina = true}} forEach _minasAAF;
	};
if (_revelaMina) then {_texto = format ["%1 New Mines marked on your map<br/>",_texto];};

if (_texto == "<t size='0.6' color='#C1C0BB'>Intel Found.<br/> <t size='0.5' color='#C1C0BB'><br/>") then {_texto = format ["<t size='0.6' color='#C1C0BB'>Intel Not Found.<br/> <t size='0.5' color='#C1C0BB'><br/>"];};

//[_texto,-0.9999,0,30,0,0,4] spawn bis_fnc_dynamicText;
[_texto, [safeZoneX, (0.2 * safeZoneW)], [0.25, 0.5], 30, 0, 0, 4] spawn bis_fnc_dynamicText;
