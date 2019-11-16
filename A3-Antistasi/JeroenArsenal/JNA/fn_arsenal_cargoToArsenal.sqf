if(!isserver)exitwith{};

params [["_object",objNull,[objNull]],"_array"];
if(isNull _object)exitWith{["Error: wrong input given '%1'",_object] call BIS_fnc_error;};

//update datalist on server and client
_array call jn_fnc_arsenal_addItem;

//updated unlocked weapons
/*[] spawn {
	sleep 3;
	[unlockedWeapons,true] call AS_fnc_weaponsCheck;
};
