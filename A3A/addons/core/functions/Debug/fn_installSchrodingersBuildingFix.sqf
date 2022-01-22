/* 
 * This is a fix for Schrodinger's building.
 * Schrodinger's building is a mysterious bug where buildings simultaneously appear to be standing and destroyed.
 * This may differ between players. Some players will see destroyed buildings, some will see intact ones.
 * This fix attempts to force the building to be destroyed, by making sure whenever one blows up on any client,
 * the damage value is synchronised with every other client.
 *
 * To replicate this bug, simply do 'myTarget allowDamage 0' on the server, then blow it up on a client.
 * The server will see the building as undamaged, while the client sees it as destroyed.
 */

addMissionEventHandler ["EntityKilled", {
	params ["_entity"]; 
	
	if(_entity isKindOf "Building") then {
		_entity setDamage 1;
	}
}];