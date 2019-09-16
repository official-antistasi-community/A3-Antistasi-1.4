params ["_firstName", "_secondName"];

_firstData = missionNamespace getVariable [_firstName, objNull];
_secondData = missionNamespace getVariable [_secondName, objNull];

if(!(_firstData isEqualType []) || !(_secondData isEqualType [])) exitWith {};

_firstCon = _firstData select 2;
_secondCon = _secondData select 2;

//Unique, just to be sure
_firstCon pushBackUnique _secondName;
_secondCon pushBackUnique _firstName;

_firstData set [2, _firstCon];
_secondData set [2, _secondCon];

missionNamespace setVariable [_firstName, _firstData];
missionNamespace setVariable [_secondName, _secondData];
