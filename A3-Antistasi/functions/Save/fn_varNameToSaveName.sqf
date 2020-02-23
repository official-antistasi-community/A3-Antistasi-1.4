params ["_varName", ""];

//Return the name of the save slot for the variable.
if (worldName == "Tanoa") then {
	_varName + serverID + campaignID + "WotP";
} else {
	if (side group petros == independent) then {
		_varName + serverID + campaignID + "Antistasi" + worldName;
	} else {
		_varName + serverID + campaignID + "AntistasiB" + worldName;
	};
};