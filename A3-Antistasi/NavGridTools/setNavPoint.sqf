params ["_navPointName" , "_pos", "_connections", "_roadType"];

missionNamespace setVariable [format["%1_c", _navPointName], _navPointName];
missionNamespace setVariable [_navPointName, [_pos, _roadType, _connections]];
