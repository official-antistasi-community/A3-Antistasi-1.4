if !(isNil "gameMenu") then {(findDisplay 46) displayRemoveEventHandler ["KeyDown", gameMenu]};
gameMenu = (findDisplay 46) displayAddEventHandler ["KeyDown",A3A_fnc_keys];

if (player != theBoss) exitWith {};

if (count _this == 0) then {["Server Information", "Reinitialised:<br/><br/>Special Keys<br/><br/>Statistics Report"] call A3A_fnc_customHint;};

