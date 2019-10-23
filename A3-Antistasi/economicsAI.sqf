{
_lado = _x;
_acelerador = if (_lado == malos) then {if (tierWar == 1) then {0} else {1+((tierWar + difficultyCoef)/20)}} else {1.2+((tierWar + difficultyCoef)/20)};
_airbases = {lados getVariable [_x,sideUnknown] == _lado} count aeropuertos;
_puestos =  {lados getVariable [_x,sideUnknown] == _lado} count puestos;
_puertos = {lados getVariable [_x,sideUnknown] == _lado} count puertos;
//at
_maxItems = (_puestos * 0.2) + (_airbases * 0.5);
_tipo = if (_lado == malos) then {staticATmalos} else {staticATmuyMalos};
_currentItems = timer getVariable [_tipo,0];
if (_currentItems < _maxItems) then
	{
	timer setVariable [_tipo,_currentItems + (0.2 * _acelerador),true];
	};
//aa
_maxItems = (_airbases * 2);
_tipo = if (_lado == malos) then {staticAAmalos} else {staticAAmuyMalos};
_currentItems = timer getVariable [_tipo,0];
if (_currentItems < _maxItems) then
	{
	timer setVariable [_tipo,_currentItems + (0.1 * _acelerador),true];
	};
//apcs
_maxItems = (_puestos * 0.3) + (_airbases * 2);
_tipo = if (_lado == malos) then {vehNATOAPC} else {vehCSATAPC};
if !(_tipo isEqualTo []) then
	{
	_currentItems = 0;
	{_currentItems = _currentItems + (timer getVariable [_x,0])} forEach _tipo;
	if (_currentItems < _maxItems) then
		{
		timer setVariable [selectRandom _tipo,_currentItems + (0.2 * _acelerador),true];
		};
	};
//tanks
_maxItems = (_puestos * 0.5) + (_airbases * 2);
_tipo = if (_lado == malos) then {vehNATOTank} else {vehCSATTank};
_currentItems = timer getVariable [_tipo,0];
if (_currentItems < _maxItems) then
	{
	timer setVariable [_tipo,_currentItems + (0.1 * _acelerador),true];
	};
//aaTANKS
_maxItems = _airbases;
_tipo = if (_lado == malos) then {vehNATOAA} else {vehCSATAA};
_currentItems = timer getVariable [_tipo,0];
if (_currentItems < _maxItems) then
	{
	timer setVariable [_tipo,_currentItems + (0.1 * _acelerador),true];
	};
//ATTACK BOATS
_maxItems = _puertos;
_tipo = if (_lado == malos) then {vehNATOBoat} else {vehCSATBoat};
_currentItems = timer getVariable [_tipo,0];
if (_currentItems < _maxItems) then
	{
	timer setVariable [_tipo,_currentItems + (0.3 * _acelerador),true];
	};
//CAS PLANE
_maxItems = _airbases * 4;
_tipo = if (_lado == malos) then {vehNATOPlane} else {vehCSATPlane};
_currentItems = timer getVariable [_tipo,0];
if (_currentItems < _maxItems) then
	{
	timer setVariable [_tipo,_currentItems + (0.2 * _acelerador),true];
	};
//AA PLANE
_maxItems = _airbases * 4;
_tipo = if (_lado == malos) then {vehNATOPlaneAA} else {vehCSATPlaneAA};
_currentItems = timer getVariable [_tipo,0];
if (_currentItems < _maxItems) then
	{
	timer setVariable [_tipo,_currentItems + (0.2 * _acelerador),true];
	};
//AIR TRANSPORTS
_maxItems = _airbases * 4;
_tipo = if (_lado == malos) then {vehNATOTransportHelis - [vehNATOPatrolHeli]} else {vehCSATTransportHelis - [vehCSATPatrolHeli]};
if !(_tipo isEqualTo []) then
	{
	_currentItems = 0;
	{_currentItems = _currentItems + (timer getVariable [_x,0])} forEach _tipo;
	if (_currentItems < _maxItems) then
		{
		timer setVariable [selectRandom _tipo,_currentItems + (0.2 * _acelerador),true];
		};
	};
//ATTACK HELIS
_maxItems = _airbases * 4;
_tipo = if (_lado == malos) then {vehNATOAttackHelis} else {vehCSATAttackHelis};
if !(_tipo isEqualTo []) then
	{
	_currentItems = 0;
	{_currentItems = _currentItems + (timer getVariable [_x,0])} forEach _tipo;
	if (_currentItems < _maxItems) then
		{
		timer setVariable [selectRandom _tipo,_currentItems + (0.2 * _acelerador),true];
		};
	};
//ARTY
_maxItems = _airbases + (_puestos * 0.2);
_tipo = if (_lado == malos) then {vehNATOMRLS} else {vehCSATMRLS};
_currentItems = timer getVariable [_tipo,0];
if (_currentItems < _maxItems) then
	{
	timer setVariable [_tipo,_currentItems + (0.2 * _acelerador),true];
	};
} forEach [malos,muyMalos];