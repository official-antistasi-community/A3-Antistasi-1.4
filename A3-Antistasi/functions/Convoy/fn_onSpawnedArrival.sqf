params ["_convoyID", "_unitObjects", "_convoyPos", "_target", "_markerArray", "_convoyType", "_convoySide"];

server setVariable [format ["Con%1", _convoyID], nil, true];
switch (_convoyType) do
{
  case ("reinforce"):
  {
    {
      _vehicle = _x select 0;
      _vehicleGroup = _vehicle getVariable "vehGroup";
      _cargoGroup = _vehicle getVariable ["cargoGroup", grpNull];
      if(_vehicle isKindOf "Air") then
      {
        if (_vehicle isKindOf "Helicopter") then
        {
          _landPos = [_target, 0, 300, 10, 0, 0.20, 0,[],[[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos;
          _landPos set [2, 0];
          _pad = createVehicle ["Land_HelipadEmpty_F", _landpos, [], 0, "NONE"];
          _vehicleGroup setVariable ["myPad",_pad];
          _wp0 = _vehicleGroup addWaypoint [_landpos, 0];
          _wp0 setWaypointType "TR UNLOAD";
          _wp0 setWaypointStatements ["true", "(vehicle this) land 'GET OUT';deleteVehicle ((group this) getVariable [""myPad"",objNull])"];
          _wp0 setWaypointBehaviour "CARELESS";
          _wp3 = _cargoGroup addWaypoint [_landpos, 0];
          _wp3 setWaypointType "GETOUT";
          _wp3 setWaypointStatements ["true", "(group this) spawn A3A_fnc_attackDrillAI"];
          _wp0 synchronizeWaypoint [_wp3];
          _wp4 = _cargoGroup addWaypoint [_target, 1];
          _wp4 setWaypointType "MOVE";
          _wp4 setWaypointStatements ["true", "[group this] spawn A3A_fnc_groupDespawner;"];
          _wp2 = _vehicleGroup addWaypoint [getMarkerPos (_markerArray select 0), 1];
          _wp2 setWaypointType "MOVE";
          _wp2 setWaypointStatements ["true", "deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];
          [_vehicleGroup,1] setWaypointBehaviour "AWARE";
        }
        else
        {
          if ((typeOf _vehicle) in vehFastRope) then
          {
            [_vehicle, _cargoGroup, _target, getMarkerPos (_markerArray select 0), _vehicleGroup, true] spawn A3A_fnc_fastrope;
          }
          else
          {
            [_vehicle, _cargoGroup, _target, (_markerArray select 0), true] spawn A3A_fnc_airdrop;
          };
        };
      }
      else
      {
        //Create marker for the cargo
        if(_cargoGroup != grpNull) then
        {
          _wp0 = _vehicleGroup addWaypoint [_target, count (wayPoints _vehicleGroup)];
          _wp0 setWaypointType "TR UNLOAD";
          _wp0 setWaypointStatements ["true","[group this] spawn A3A_fnc_groupDespawner;"];
          _wp3 = _cargoGroup addWaypoint [_target, 0];
					_wp3 setWaypointType "GETOUT";
					_wp3 setWaypointStatements ["true", "(group this) spawn A3A_fnc_attackDrillAI; [group this] spawn A3A_fnc_groupDespawner"];
					_wp0 synchronizeWaypoint [_wp3];
        }
        else
        {
          _wp0 = _vehicleGroup addWaypoint [_target, count (wayPoints _vehicleGroup)];
        	_wp0 setWaypointType "GETOUT";
        	_wp0 setWaypointStatements ["true","[group this] spawn A3A_fnc_groupDespawner; (group this) spawn A3A_fnc_attackDrillAI;"];
        };
      };
    } forEach _unitObjects;
  };
};
