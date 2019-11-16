_dog = _this select 0;
_groupX = group _dog;

_spotted = objNull;

_dog setVariable ["BIS_fnc_animalBehaviour_disable", true];
_dog disableAI "FSM";
_dog setBehaviour "CARELESS";
_dog setRank "PRIVATE";
_dog setVariable ["isAnimal", true, true];

while {alive _dog} do
	{
	if ((_dog == leader _groupX) and (!captive _dog)) then {[_dog,true] remoteExec ["setCaptive",0,_dog]; _dog setCaptive true};
	if (isNull _spotted) then
		{
		sleep 10;
		_dog moveTo getPosATL leader _groupX;
		{
		_spotted = _x;
		if ((captive _spotted) and (vehicle _spotted == _spotted)) then
			{
			[_spotted,false] remoteExec ["setCaptive",0,_spotted]; _spotted setCaptive false;
			};
		} forEach ([20,0,position _dog,teamPlayer] call A3A_fnc_distanceUnits);

		if ((random 10 < 1) and (isNull _spotted)) then
			{
			playSound3D [missionPath + (selectRandom ladridos),_dog, false, getPosASL _dog, 1, 1, 100];
			};
		if (_dog distance (leader _groupX) > 50) then {_dog setPos position (leader _groupX)};
		}
	else
		{
		_dog doWatch _spotted;
		(leader _groupX) reveal [_spotted,4];
		playSound3D [missionPath + (ladridos select (floor random 5)),_dog, false, getPosASL _dog, 1, 1, 100];
		_dog moveTo getPosATL _spotted;
		if (_spotted distance _dog > 100) then {_spotted = objNull};
		sleep 3;
		};
	};