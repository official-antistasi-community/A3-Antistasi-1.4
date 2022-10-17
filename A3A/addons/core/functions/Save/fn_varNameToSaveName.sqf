params ["_varName", ""];

//Return the name of the save slot for the variable.
if (worldName == "Tanoa") then {
	format["%1%2%3%4",_varName,serverID,campaignID,"WotP"];
} else {
	if (teamPlayer isEqualTo independent) then {
		format["%1%2%3%4%5",_varName,serverID,campaignID,"Antistasi",worldName];
	} else {
		format["%1%2%3%4%5",_varName,serverID,campaignID,"AntistasiB",worldName];
	};
};
