/*
    Author: [Håkon,Killerswin2]
    [Description]
        Handles request to refuel the cargo of a tanker

    Arguments:
    0. <Object> tanker to refuel at
    1. <Int>    Client ID
	2. <Object> vehicle that the player is in
    3. <Bool>   refuel done ( optional -Default: false)
    Return Value:
    <nil>

    Scope: Server
    Environment: Any
    Public: [No]
    Dependencies: ACE

    Example:
        [cursorObject, clientOwner] remoteExecCall ["A3A_fnc_canLoot", 2];
        [_container, clientOwner, true] remoteExecCall ["A3A_fnc_canLoot", 2];

    License: MIT License
*/
//blocks refueling if nearby container is already looting
params ["_tanker", ["_owner",2], "_vehicle",["_done", false]];
if(isNil "UtilityItemsRefuelCargo")then{UtilityItemsRefuelCargo = []};
if(!done)then{
	//if the fuel tanker is not in UtilityItemsRefuelCargo
    // push to the array of cargos that are being used to refuel.
    //then have the server call lootfromcontainer
	if !(_tanker in UtilityItemsRefuelCargo)then{
		UtilityItemsRefuelCargo pushBack _tanker;
		[_vehicle,_tanker] remoteExec ["A3A_fnc_addFuelToRefuelTank", _owner];

		_tanker spawn{
			sleep 20;
			if (_this in UtilityItemsRefuelCargo)then{
				UtilityItemsRefuelCargo deleteAt (UtilityItemsRefuelCargo find _this);
			};
		};

	}else {
		["Cargo Refueling", "Tanker Currently Refueling a fuel tank"] remoteExec ["A3A_fnc_customHint",_owner];
	};

} else {
	if(_tanker in UtilityItemsRefuelCargo) then{
		UtilityItemsRefuelCargo deleteAt (UtilityItemsRefuelCargo find _tanker);
	};
}