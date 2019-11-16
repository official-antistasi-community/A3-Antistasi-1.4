//Attempt to figure out our current ace medical target;
if (hasACE) then {
currentAceTarget = objNull;
	["ace_interactMenuOpened", {
		//player setVariable ["lastMenuOpened", "INTERACT"];
		currentAceTarget = ace_interact_menu_selectedTarget;
	}] call CBA_fnc_addEventHandler;

	["ace_medicalMenuOpened", {
		//player setVariable ["lastMenuOpened", "MEDICAL"];
		currentAceTarget = param [1];
	}] call CBA_fnc_addEventHandler;
};