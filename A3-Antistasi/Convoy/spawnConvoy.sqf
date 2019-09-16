//params ["_pos", "_nextPos", "_units", "_target", "_side", "_type"];

//This is currently not called anywhere

[] spawn
{
  _pos = getMarkerPos "spawn";
  _nextPos = getMarkerPos "dir";
  _units = [["B_T_LSV_01_armed_F", ["B_T_Soldier_F","B_T_Soldier_F"]],["B_T_LSV_01_armed_F", ["B_T_Soldier_F","B_T_Soldier_F"]],["B_T_LSV_01_armed_F", ["B_T_Soldier_F","B_T_Soldier_F"]],["B_T_LSV_01_armed_F", ["B_T_Soldier_F","B_T_Soldier_F"]]];
  _target = getMarkerPos "target";
  _side = West;

  //Find near road segments
  _road = roadAt _pos;
  _dir = _pos getDir _nextPos;

  for "_i" from 0 to ((count _units) - 1) do
  {
    _data = _units select _i;
    _vehicle = [_pos, _dir, _data select 0, _side] call bis_fnc_spawnvehicle;

    sleep 0.25;
    hint "Spawned!";
    _group = _vehicle select 2;
    _crew = _vehicle select 1;
    _vehicle = _vehicle select 0;
    _vehicle setPos _pos;
    //{[_x] call A3A_fnc_NATOinit} forEach _crew;
    //[_vehicle] call A3A_fnc_AIVEHinit;
    _vehicle engineOn true;

    //Just debug currently
    _group move _target;

    [_group, _data select 1, _vehicle] spawn
    {
      params ["_group", "_units", "_vehicle"];
      {
        sleep 0.25;
        _unit = _group createUnit [_x, _group, [], 0, "CARGO"];
        _unit moveInCargo _vehicle;
        [_unit] spawn
        {
          private _unit = _this select 0;
          sleep 5;
          if(vehicle _unit == _unit) then
          {
            deleteVehicle _unit;
          };
        };
      } forEach _units;
    };

    waitUntil {sleep 0.5; ((_vehicle distance2D _pos) > 8)};
  };

};
