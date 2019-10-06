params ["_road"];

_roadNameFull = str _road;
_stringArray = _roadNameFull splitString ":";

 private _result = _stringArray select 0;
_result;
