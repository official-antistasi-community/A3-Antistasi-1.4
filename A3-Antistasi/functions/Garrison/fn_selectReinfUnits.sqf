params ["_base", "_target", ["_isAir", false], ["_bypass", false]];

/*  Selects the units to send, given on the targets reinf needs (and what the base has (not yet))
*   Params:
*     _base : STRING : The name of the origin base
*     _target : STRING : The name of the destination
*     _isAir : BOOLEAN : UNUSED
*
*   Returns:
*     _unitsSend : ARRAY : The units in the correct format
*/

private ["_maxUnitSend", "_unitsSend", "_reinf", "_side", "_currentSelected", "_seatCount", "_vehicle", "_allSeats", "_crewSeats", "_neededSpace", "_crewMember", "_crew", "_cargo", "_openSpace", "_abort", "_data", "_dataCrew", "_dataCargo", "_vehicleIsNeeded"];
private _fileName = "fn_selectReinfUnits";

_maxUnitSend = garrison getVariable [format ["%1_recruit", _base], 0];
if(_maxUnitSend < 3 && {!_bypass}) exitWith
{
    diag_log "Can't select units with less than 3 slots, would be an vehicle only with crew!";
    [];
};

_unitsSend = [];

//Hard copy, need to work on this
_reinf = +([_target] call A3A_fnc_getRequested);
_side = sidesX getVariable [_base, sideUnknown];

private _maxRequested = [_reinf, false] call A3A_fnc_countGarrison;
private _maxCrewSpaceNeeded = _maxRequested select 1;
private _maxCargoSpaceNeeded = _maxRequested select 2;

[
    3,
    format ["Gathered data for unit selection, available are %1, %2 crew units needed, %3 cargo units needed", _maxUnitSend, _maxCrewSpaceNeeded, _maxCargoSpaceNeeded],
    _fileName
] call A3A_fnc_log;
[_reinf, "Reinforcement"] call A3A_fnc_logArray;

private _currentUnitCount = 0;
private _numberCargoUnitsSent = 0;
private _numberCrewUnitsSent = 0;

private _finishedSelection = false;

while {_currentUnitCount < (_maxUnitSend - 2) && {[_reinf, true] call A3A_fnc_countGarrison != 0}} do
{
    private _remainingUnitsAvailable = _maxUnitSend - _currentUnitCount;
    //Find vehicle to send
    _currentSelected = "";
    _seatCount = 0;
    _vehicleIsNeeded = false;

    private _crewSeats = 0;

    {
        _vehicle = (_x select 0);
        if(_vehicle != "") then
        {
            _allSeats = [_vehicle, true] call BIS_fnc_crewCount;
            _crewSeats = [_vehicle, false] call BIS_fnc_crewCount;

            //TODO available check on the base, currently it is bypassing the economy
            //Check we don't overflow the max units we can send, if we get this vehicle and crew it.
            if
            (
                (((_currentUnitCount + _crewSeats) + 1) <= _maxUnitSend) &&     //Already send units + crew + 1 for vehicle <= available units
                {_allSeats > _seatCount &&                                      //Can send more then the last select vehicle
                {!_isAir ||	{_vehicle isKindOf "Air"}}}                         //Ensure air vehicle for air convoys
            ) then
            {
                _currentSelected = _vehicle;
                _seatCount = _allSeats;
                _vehicleIsNeeded = true;
            };
        };
    } forEach _reinf;

    //Delete vehicle if we selected one
    if(_currentSelected != "") then
    {
        _index = _reinf findIf {(_x select 0) == _currentSelected};
        if(_index != -1) then
        {
            (_reinf select _index) set [0, ""];
        }
        else
        {
            [1, format ["Tried to delete reinf vehicle, but couldn't find it after selection, vehicle was %1!", _currentSelected], _fileName] call A3A_fnc_log;
        };
    };

    //No suitable vehicle found, usign different vehicle to reinforce
    if(_currentSelected == "") then
    {
        //Calculate the amount of units that we still need to send against the amount of units we still have available after substracting driver and vehicle
        //Save whatever number is smaller
        private _neededCargoSpace = ((_maxCargoSpaceNeeded - _numberCargoUnitsSent) + (_maxCrewSpaceNeeded - _numberCrewUnitsSent)) min (_remainingUnitsAvailable - 2);

        if(_neededCargoSpace == 0) then
        {
            [1, "_neededCargoSpace is 0, something went really wrong!", _fileName] call A3A_fnc_log;
        }
        else
        {
            [3, format ["No reinf vehicle found, selecting not needed transport vehicle, needs space for %1 passengers", _neededCargoSpace], _fileName] call A3A_fnc_log;
            if (_isAir) then
            {
                if (_neededCargoSpace <= 4) then
                {
                    _currentSelected = if (_side ==	Occupants) then {vehNATOPatrolHeli} else {vehCSATPatrolHeli};
                }
                else
                {
                    _currentSelected = if (_side ==	Occupants) then {selectRandom vehNATOTransportHelis} else {selectRandom vehCSATTransportHelis};
                };
                [3, format ["Selected %1 as an air transport vehicle", _currentSelected], _fileName] call A3A_fnc_log;
            }
            else
            {
                if(_neededCargoSpace == 1) then
                {
                    //Vehicle, crew and one person, selecting quad
                    _currentSelected = if(_side == Occupants) then {vehNATOBike} else {vehCSATBike};
                }
                else
                {
                    if(_neededCargoSpace <= 5) then
                    {
                        //Select light unarmed vehicle (as the armed uses three crew)
                        _currentSelected = if(_side == Occupants) then {selectRandom vehNATOLightUnarmed} else {selectRandom vehCSATLightUnarmed};
                    }
                    else
                    {
                        //Select random truck or helicopter
                        _currentSelected = if(_side == Occupants) then {selectRandom (vehNATOTrucks + vehNATOTransportHelis)} else {selectRandom (vehCSATTrucks + vehCSATTransportHelis)};
                    };
                };
                [3, format ["Selected %1 as an ground or air transport vehicle", _currentSelected], _fileName] call A3A_fnc_log;
            };
            _seatCount = [_currentSelected, true] call BIS_fnc_crewCount;
            _crewSeats = [_currentSelected, false] call BIS_fnc_crewCount;
        };
    };

    if(_currentSelected != "") then
    {
        //Assigning crew
        _crewMember = if(_side == Occupants) then {NATOCrew} else {CSATCrew};
        _crew = [_currentSelected, _crewMember] call A3A_fnc_getVehicleCrew;
        _currentUnitCount = _currentUnitCount + 1 + _crewSeats;

        //Assining cargo
        _cargo = [];
        _openSpace = _seatCount - _crewSeats;
        _abort = false;

        for "_i" from 0 to ((count _reinf) - 1) do
        {
            _data = _reinf select _i;
            _dataCrew = _data select 1;
            _dataCargo = _data select 2;

            //Sending armed troups first
            while {count _dataCargo > 0} do
            {
                //If space is available and units are available, add them
                if((_currentUnitCount < _maxUnitSend) && {_openSpace > 0}) then
                {
                    _cargo pushBack (_dataCargo deleteAt 0);
                    _currentUnitCount = _currentUnitCount + 1;
                    _numberCargoUnitsSent = _numberCargoUnitsSent + 1;
                    _openSpace = _openSpace - 1;
                }
                else
                {
                    //No space or units available, abort
                    _abort = true;
                };
                if(_abort) exitWith {};
            };

            //Sending crew units with it
            while {!_abort && {count _dataCrew > 0}} do
            {
                //If space is available and units are available, add them
                if((_currentUnitCount < _maxUnitSend) && {_openSpace > 0}) then
                {
                    _cargo pushBack (_dataCrew deleteAt 0);
                    _currentUnitCount = _currentUnitCount + 1;
                    _numberCrewUnitsSent = _numberCrewUnitsSent + 1;
                    _openSpace = _openSpace - 1;
                }
                else
                {
                    //No space or units available, abort
                    _abort = true;
                };
                if(_abort) exitWith {};
            };

            //No more space, exit
            if(_abort) exitWith {};
        };
        _unitsSend pushBack [_currentSelected, _crew, _cargo];
        [3, format ["Units selected, crew is %1, cargo is %2", _crew, _cargo], _fileName] call A3A_fnc_log;
    }
    else
    {
        //No units need to be send, and vehicle is not available, abort loop
        _finishedSelection = true;
    };

    if(_finishedSelection) exitWith {};
};

garrison setVariable [format ["%1_recruit", _base], (_maxUnitSend - _currentUnitCount), true];

_unitsSend;
