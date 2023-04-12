systemChat "called createObject?";

params [["_markerKey", ""]];
if(_markerKey isEqualTo "") exitWith {};

private _objMap = sidesX getVariable ["OBJ_DATA", nil];
if (isNil "_objMap") exitWith {};
private _hashmap = _objMap getOrDefault [_markerKey, nil];
if (isNil "_hashmap") exitWith {};


//check that we aren't double building!
if (
	(_hashmap getOrDefault ["Building", []]) isNotEqualTo [] ||
	(_hashmap getOrDefault ["StaticWeapon", []]) isNotEqualTo [] ) exitwith { systemChat "Not empty";};

private _buildingArray = [];
private _staticArray = [];
{
    private _key = _x;
    {
        //[typeOf _veh, getPosWorld _veh, vectorUp _veh, vectorDir _veh];
        _x params ["_typeVehX", "_posVeh", "_xVectorUp", "_xVectorDir"];
        private _veh = createVehicle [_typeVehX,[0,0,1000],[], 0,"CAN_COLLIDE"];
        _veh setPosWorld _posVeh;
        _veh setVectorDirAndUp [_xVectorDir,_xVectorUp];
        [_veh, teamPlayer] call A3A_fnc_AIVEHinit;
        if (_key isEqualTo "Building") then {
            _buildingArray pushBackUnique _veh;
        } else {
            _staticArray pushBackUnique _veh;
        };
    } forEach _y; // arrays of data
    
} forEach _hashmap;

_hashmap set ["Building", _buildingArray];
_hashmap set ["StaticWeapon", _staticArray];
_objMap set [_markerKey, _hashmap];
sidesX setVariable ["OBJ_DATA", _objMap, true];