{
_sideX = _x;
_accelerator = if (_sideX == Occupants) then {if (tierWar == 1) then {0} else {1+((tierWar + difficultyCoef)/20)}} else {1.2+((tierWar + difficultyCoef)/20)};
_airbases = {sidesX getVariable [_x,sideUnknown] == _sideX} count airportsX;
_outposts =  {sidesX getVariable [_x,sideUnknown] == _sideX} count outposts;
_seaports = {sidesX getVariable [_x,sideUnknown] == _sideX} count seaports;
//at
_maxItems = (_outposts * 0.2) + (_airbases * 0.5);
_typeX = if (_sideX == Occupants) then {staticATOccupants} else {staticATInvaders};
_currentItems = timer getVariable [_typeX,0];
if (_currentItems < _maxItems) then
	{
	timer setVariable [_typeX,_currentItems + (0.2 * _accelerator),true];
	};
//aa
_maxItems = (_airbases * 2);
_typeX = if (_sideX == Occupants) then {staticAAOccupants} else {staticAAInvaders};
_currentItems = timer getVariable [_typeX,0];
if (_currentItems < _maxItems) then
	{
	timer setVariable [_typeX,_currentItems + (0.1 * _accelerator),true];
	};
//apcs
_maxItems = (_outposts * 0.3) + (_airbases * 2);
_typeX = if (_sideX == Occupants) then {vehNATOAPC} else {vehCSATAPC};
if !(_typeX isEqualTo []) then
	{
	_currentItems = 0;
	{_currentItems = _currentItems + (timer getVariable [_x,0])} forEach _typeX;
	if (_currentItems < _maxItems) then
		{
		timer setVariable [selectRandom _typeX,_currentItems + (0.2 * _accelerator),true];
		};
	};
//tanks
_maxItems = (_outposts * 0.5) + (_airbases * 2);
_typeX = if (_sideX == Occupants) then {vehNATOTank} else {vehCSATTank};
_currentItems = timer getVariable [_typeX,0];
if (_currentItems < _maxItems) then
	{
	timer setVariable [_typeX,_currentItems + (0.1 * _accelerator),true];
	};
//aaTANKS
_maxItems = _airbases;
_typeX = if (_sideX == Occupants) then {vehNATOAA} else {vehCSATAA};
_currentItems = timer getVariable [_typeX,0];
if (_currentItems < _maxItems) then
	{
	timer setVariable [_typeX,_currentItems + (0.1 * _accelerator),true];
	};
//ATTACK BOATS
_maxItems = _seaports;
_typeX = if (_sideX == Occupants) then {vehNATOBoat} else {vehCSATBoat};
_currentItems = timer getVariable [_typeX,0];
if (_currentItems < _maxItems) then
	{
	timer setVariable [_typeX,_currentItems + (0.3 * _accelerator),true];
	};
//CAS PLANE
_maxItems = _airbases * 4;
_typeX = if (_sideX == Occupants) then {vehNATOPlane} else {vehCSATPlane};
_currentItems = timer getVariable [_typeX,0];
if (_currentItems < _maxItems) then
	{
	timer setVariable [_typeX,_currentItems + (0.2 * _accelerator),true];
	};
//AA PLANE
_maxItems = _airbases * 4;
_typeX = if (_sideX == Occupants) then {vehNATOPlaneAA} else {vehCSATPlaneAA};
_currentItems = timer getVariable [_typeX,0];
if (_currentItems < _maxItems) then
	{
	timer setVariable [_typeX,_currentItems + (0.2 * _accelerator),true];
	};
//AIR TRANSPORTS
_maxItems = _airbases * 4;
_typeX = if (_sideX == Occupants) then {vehNATOTransportHelis - [vehNATOPatrolHeli]} else {vehCSATTransportHelis - [vehCSATPatrolHeli]};
if !(_typeX isEqualTo []) then
	{
	_currentItems = 0;
	{_currentItems = _currentItems + (timer getVariable [_x,0])} forEach _typeX;
	if (_currentItems < _maxItems) then
		{
		timer setVariable [selectRandom _typeX,_currentItems + (0.2 * _accelerator),true];
		};
	};
//ATTACK HELIS
_maxItems = _airbases * 4;
_typeX = if (_sideX == Occupants) then {vehNATOAttackHelis} else {vehCSATAttackHelis};
if !(_typeX isEqualTo []) then
	{
	_currentItems = 0;
	{_currentItems = _currentItems + (timer getVariable [_x,0])} forEach _typeX;
	if (_currentItems < _maxItems) then
		{
		timer setVariable [selectRandom _typeX,_currentItems + (0.2 * _accelerator),true];
		};
	};
//ARTY
_maxItems = _airbases + (_outposts * 0.2);
_typeX = if (_sideX == Occupants) then {vehNATOMRLS} else {vehCSATMRLS};
_currentItems = timer getVariable [_typeX,0];
if (_currentItems < _maxItems) then
	{
	timer setVariable [_typeX,_currentItems + (0.2 * _accelerator),true];
	};
} forEach [Occupants,Invaders];