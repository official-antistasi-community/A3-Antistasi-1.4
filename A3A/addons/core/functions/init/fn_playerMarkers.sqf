
while {true} do
{
    waitUntil {sleep 0.5; (visibleMap or visibleGPS) and ([player] call A3A_fnc_hasRadio)};
    private _markedIDs = [];

    while {visibleMap or visibleGPS} do
    {
        // Delete markers for inactive IDs
        private _activePlayers = call A3A_fnc_playableUnits;        // Note: does not include dead players
        private _activeIDs = _activePlayers apply { getPlayerID _x };
        {
            deleteMarkerLocal format ["A3A_playerMrk_%1", _x];
        } forEach (_markedIDs - _activeIDs);

        // Create/update active players
        {
            private _ID = getPlayerID _x;
            private _realUnit = _x getVariable ["owner", _x];
            private _name = name _x;
            private _mrk = format ["A3A_playerMrk_%1", _ID];

            if !(_ID in _markedIDs) then
            {
                createMarkerLocal [_mrk, getPosATL _realUnit];
                _mrk setMarkerTypeLocal "mil_triangle";
                _mrk setMarkerColorLocal "ColorWhite";
                _mrk setMarkerTextLocal format ["%1", _name];
            };

            if (vehicle _realUnit == _realUnit) then
            {
                _mrk setMarkerAlphaLocal 1;
                _mrk setMarkerPosLocal getPosATL _realUnit;
                _mrk setMarkerDirLocal getDir _realUnit;
                if (_realUnit getVariable ["incapacitated",false]) then
                {
                    _mrk setMarkerTextLocal format ["%1 Injured", _name];
                    _mrk setMarkerColorLocal "ColorRed";
                }
                else
                {
                    _mrk setMarkerTextLocal format ["%1", _name];
                    _mrk setMarkerColorLocal "ColorWhite";
                };
            }
            else
            {
                private _veh = vehicle _realUnit;
                // This isn't perfect due to inability to check some units for remote controlling, but close enough
                private _crew = crew _veh select { _realUnit == _x or ((theBoss == _x or isPlayer _x) and alive _x) };
                if (count _crew == 0 or {_crew#0 != _realUnit}) exitWith { _mrk setMarkerAlphaLocal 0 };

                _mrk setMarkerAlphaLocal 1;
                _mrk setMarkerPosLocal getPosATL _veh;
                _mrk setMarkerDirLocal getDir _veh;
                private _textX = format ["%1 (%2)", _name, getText (configFile >> "CfgVehicles" >> typeOf _veh >> "DisplayName")];
                if (count _crew > 1) then { _textX = format ["%1/%2", _textX, name (_crew#1)] };
                if (count _crew > 2) then { _textX = format ["%1+%2", _textX, count _crew - 2] };
                _mrk setMarkerTextLocal _textX;
            };

        } forEach _activePlayers;
        _markedIDs = _activeIDs;			// should now match the marker list

        sleep 1;
    };

    { deleteMarkerLocal format ["A3A_playerMrk_%1", _x] } forEach _markedIDs;
};
