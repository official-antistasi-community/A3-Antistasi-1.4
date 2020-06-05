params ["_data", "_side", "_pos", "_dir"];

private _vehicleType = _data select 0;
private _crewData = _data select 1;
private _cargoData = _data select 2;

private _slowConvoy = false;

private _vehicleGroup = createGroup _side;
private _vehicleObj = objNull;

if(_vehicleType != "") then
{
  //Spawns in the vehicle as it should
  if(!(_vehicleType isKindOf "Air")) then
  {
    _vehicleObj = createVehicle [_vehicleType, _pos, [], 0 , "CAN_COLLIDE"];
    // Hopefully doesn't make vehicles drive backwards unless they'd explode otherwise
//    _vehicleObj = [_vehicleType, _pos, 10, 3, true] call A3A_fnc_safeVehicleSpawn;
  }
  else
  {
    _vehicleObj = createVehicle [_vehicleType, _pos, [], 0 , "FLY"];
  };
  _vehicleObj setDir _dir;

  //Activates the engine if the vehicle is not a static weapon
  if(!(_vehicleType isKindOf "StaticWeapons")) then
  {
    _vehicleObj engineOn true;
  };

  //Assigns a vehicle to the group, the makes it a target, even if its empty
  _vehicleGroup addVehicle _vehicleObj;

  //Init vehicle
  [_vehicleObj, _side] call A3A_fnc_AIVEHinit;
};

//Sleep to decrease spawn lag
sleep 0.25;

private _turrets = allTurrets [_vehicleObj, true];
private _turretCount = count _turrets;
private _nextTurretIndex = 0;
//Spawning in crew
private _crewObjs = [];
{
    private _unit = [_vehicleGroup, _x, _pos, [], 0, "NONE"] call A3A_fnc_createUnit;
	diag_log format ["Convoy: Moving %1 into %2 of type %3 with %4 crew turrets", _unit, _vehicleObj, _vehicleType, _turretCount];
    if(!isNull _vehicleObj) then
    {
	  if (isNull driver _vehicleObj) then {
		_unit assignAsDriver _vehicleObj;
		_unit moveInDriver _vehicleObj;
		//Take away the AI driver's will. They shall do as they're commanded.

	  } else {
		if (_nextTurretIndex < _turretCount) then {
			private _turretData = [_vehicleObj, _turrets select _nextTurretIndex];
			_unit assignAsTurret _turretData;
			_unit moveInTurret _turretData;
			_nextTurretIndex = _nextTurretIndex + 1;
		};
	  };
    };
	if (vehicle _unit == _unit) then {
      _slowConvoy = true;
	};
    [_unit] call A3A_fnc_NATOinit;
    _crewObjs pushBack _unit;
    sleep 0.2;
} forEach _crewData;

sleep 0.5;

// Removed same-group case because split/join is broken for it
private _cargoGroup = createGroup _side;
private _cargoObjs = [];

/*
//Put cargo into a seperate group if they are cargo of a plane or large
if(_vehicleObj isKindOf "Air" || {count _cargoData >= 6}) then
{
  _cargoGroup = createGroup _side;
}
else
{
  _cargoGroup = _vehicleGroup;
};
*/

private _unit = objNull;
//Spawning in cargo
{
    _unit = [_cargoGroup, _x, _pos, [], 0, "NONE"] call A3A_fnc_createUnit;
    if (!isNull _vehicleObj) then
    {
      _unit assignAsCargo _vehicleObj;
      _unit moveInCargo _vehicleObj;
    };

	if (vehicle _unit == _unit) then
    {
      //Units are moving by foot, slow down convoy
      _slowConvoy = true;
    };

    [_unit] call A3A_fnc_NATOinit;
    _cargoObjs pushBack _unit;
    sleep 0.2;
} forEach _cargoData;

//Return result array
[[_vehicleObj, _crewObjs, _cargoObjs], _vehicleGroup, _cargoGroup, _slowConvoy];
