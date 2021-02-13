private ["_positionX","_size","_buildings","_groupX","_typeUnit","_sideX","_building","_typeB","_frontierX","_typeVehX","_veh","_vehiclesX","_soldiers","_pos","_ang","_markerX","_unit","_return"];
_markerX = _this select 0;
_positionX = getMarkerPos _markerX;
_size = _this select 1;
_buildings = nearestObjects [_positionX, listMilBld, _size * 1.2, true];

if (count _buildings == 0) exitWith {[grpNull,[],[]]};

_sideX = _this select 2;
_frontierX = _this select 3;

_vehiclesX = [];
_soldiers = [];

_groupX = createGroup _sideX;
_typeUnit = if (_sideX==Occupants) then {staticCrewOccupants} else {staticCrewInvaders};

//New system to place helis, does not care about heli types currently
private _helicopterTypes = [];
_helicopterTypes pushBack (if (_sideX == Occupants) then {vehNATOPatrolHeli} else {vehCSATPatrolHeli});
private _spawnParameter = [_markerX, "Heli"] call A3A_fnc_findSpawnPosition;
private _count = 1 + round (random 3); //Change these numbers as you want, first number is minimum, max is first plus second number
while {_spawnParameter isEqualType [] && {_count > 0}} do
{
    _typeVehX = selectRandom _helicopterTypes;
    _veh = createVehicle [_typeVehX, (_spawnParameter select 0), [],0, "CAN_COLLIDE"];
    _veh setDir (_spawnParameter select 1);
    _vehiclesX pushBack _veh;
    _spawnParameter = [_markerX, "Heli"] call A3A_fnc_findSpawnPosition;
    _count = _count - 1;
};


private _fnc_spawnStatic = {
    params ["_type", "_pos", "_dir"];
    private _veh = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
    if (!isNil "_dir") then { _veh setDir _dir };
    private _unit = [_groupX, _typeUnit, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
    [_unit,_markerX] call A3A_fnc_NATOinit;
    _unit moveInGunner _veh;
    _soldiers pushBack _unit;
    _vehiclesX pushBack _veh;
};

for "_i" from 0 to (count _buildings) - 1 do
{
    if (spawner getVariable _markerX == 2) exitWith {};
    private _building = _buildings select _i;
    private _typeB = typeOf _building;

    call {
        if (isObjectHidden _building) exitWith {};			// don't put statics on destroyed buildings
        if 	((_typeB == "Land_Cargo_Patrol_V1_F") or (_typeB == "Land_Cargo_Patrol_V2_F") or (_typeB == "Land_Cargo_Patrol_V3_F") or (_typeB == "Land_Cargo_Patrol_V4_F")) exitWith
        {
            private _type = if (_sideX == Occupants) then {NATOMG} else {CSATMG};
            private _dir = (getDir _building) - 180;
            private _zpos = AGLToASL (_building buildingPos 1);
            private _pos = _zpos getPos [1.5, _dir];			// zeroes Z value because BIS
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
		if 	((_typeB == "Land_Hlaska")) exitWith
        {
            private _type = if (_sideX == Occupants) then {NATOMG} else {CSATMG};
            private _dir = (getDir _building);
            private _zpos = AGLToASL (_building buildingPos 1);
            private _pos = _zpos getPos [0.5, _dir];
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        if 	((_typeB == "Land_fortified_nest_small_EP1") or (_typeB == "Land_BagBunker_Small_F") or (_typeB == "Land_BagBunker_01_small_green_F")
            or (_typeB == "Land_fortified_nest_small") or (_typeB == "Fort_Nest")) exitWith
        {
            private _type = if (_sideX == Occupants) then {NATOMG} else {CSATMG};
            private _dir = (getDir _building) - 180;
            private _zpos = AGLToASL (_building buildingPos 1);
            private _pos = _zpos getPos [-1, _dir];
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        if 	(_typeB in listbld) exitWith			// just the big towers?
        {
            private _type = if (_sideX == Occupants) then {NATOMG} else {CSATMG};
            _dir = getDir _building;
            _zOffset = [0, 0, -0.3]; //fix spawn hight
            _Tdir = _dir + 90; //relative rotation to building
            _zpos = AGLToASL (_building buildingPos 11); //relative East
            _pos = _zpos getPos [-1, _Tdir]; //offset
            _zpos = _zpos vectorAdd _zOffset;
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _Tdir] call _fnc_spawnStatic;
            sleep 0.5;			// why only here?
            _Tdir = _dir + 0;
            _zpos = AGLToASL (_building buildingPos 13); //relative North
            _pos = _zpos getPos [-0.8, _Tdir]; //offset
            _zpos = _zpos vectorAdd _zOffset;
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _Tdir] call _fnc_spawnStatic;
            sleep 0,5;
            _Tdir = _dir + 180;
            _zpos = AGLToASL (_building buildingPos 16); //relative South
            _pos = _zpos getPos [-0.2, _Tdir]; //offset
            _zpos = _zpos vectorAdd _zOffset;
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _Tdir] call _fnc_spawnStatic;
        };
		if 	((_typeB == "Land_Radar_01_HQ_F")) exitWith
        {
            private _type = if (_sideX == Occupants) then {staticAAOccupants} else {staticAAInvaders};
            private _dir = getDir _building;
            private _zpos = AGLToASL (_building buildingPos 30);
            private _pos = getPosASL _building;
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        if 	((_typeB == "Land_Cargo_HQ_V1_F") or (_typeB == "Land_Cargo_HQ_V2_F") or (_typeB == "Land_Cargo_HQ_V3_F")) exitWith
        {
            private _type = if (_sideX == Occupants) then {staticAAOccupants} else {staticAAInvaders};
            private _dir = getDir _building;
            private _zpos = AGLToASL (_building buildingPos 8);
            private _pos = getPosASL _building;
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
    };
};

[_groupX,_vehiclesX,_soldiers]
