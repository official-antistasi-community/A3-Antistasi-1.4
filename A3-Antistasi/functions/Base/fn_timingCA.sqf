_timeX = _this select 0;
if (isNil "_timeX") exitWith {};
if !(_timeX isEqualType 0) exitWith {};
_mayor = if (_timeX >= 3600) then {true} else {false};
_timeX = _timeX - (((tierWar + difficultyCoef)-1)*400);

if (_timeX < 0) then {_timeX = 0};

countCA = countCA + round (random _timeX);

if (_mayor and (countCA < 1200)) then {countCA = 1200};
publicVariable "countCA";




