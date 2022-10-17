/*
Maintainer: Caleb Serafin
    Loads a file and returns a status with documentObjectModel that contains navGridDB and metadata.
    For metadata V1 compatibility (legacy navgrid), loadFile should be used instead of preprocessFileLineNumbers.
    If preprocessFileLineNumbers is used, then additional data contained inside the comment will be ignored.

Argument:
    <string> String to parse and load data from. Ether loaded from a file, or from a text box that was pasted into.

Return Value:
    <string> Status, if empty, everything went okay and you can use the DOM. If non-empty, report value in error message.
    <hashMap> documentObjectModel containing the navGridDB in "navGridDB" and other useful metadata.

Scope: Any
Environment: Scheduled
Public: Yes

Example:
    [loadFile "xxx"] call A3A_fnc_NGSA_importV2;
*/
params [
    ["_fileContents", "", [""]]
];

private _documentObjectModel = createHashMap;
scopeName "return";

if (_fileContents isEqualTo "") then {
    ["Passed string was empty.", _documentObjectModel] breakOut "return";
};

/// --- Parsing --- ///
private _fnc_findLastOf = {
    params [
        ["_string", "", [ "" ]],
        ["_sequence", "", [ "" ]],
        ["_preCounted", -1, [ 0 ]]
    ];
    private _count = if (_preCounted != -1) then { _preCounted } else { count _string };
    private _reversedString = reverse _string;
    private _endReverseIndex = _reversedString find _sequence;
    if (_endReverseIndex == -1) exitWith { -1 };
    private _endIndex = (_count - 1) - _endReverseIndex;
    _endIndex;
};

private _fnc_cropToBrackets = {
    private _startIndex = _this find "[";
    private _endIndex = [_this, "]"] call _fnc_findLastOf;
    private _count = _endIndex - _startIndex + 1;
    _this select [_startIndex, _count];
    /*
        Yes, this approach is faster than a biased radix search or a hybrid of former with _fnc_findLastOf.
        "Wa abot rEGex" No, using regex is 2x slower.
        THe biggest cost is copying strings, and apparently using count.
    */
};

switch (true) do {
    case ('"schema_SQF_hashMap_joinedKeyValue"' in _fileContents): {
        private _trimmedFileContents = _fileContents call _fnc_cropToBrackets;
        private _map = parseSimpleArray _trimmedFileContents;
        if (isNil '_map' || { _map isEqualTo [] }) then {
            ["Failed to parse string as schema_SQF_hashMap_joinedKeyValue.", _documentObjectModel] breakOut "return";
        };

        private _metaHM = createHashMapFromArray _map;
        if (isNil '_metaHM' || { !(_metaHM isEqualType _documentObjectModel) }) then {
            ["Failed to create HashMap from string as schema_SQF_hashMap_joinedKeyValue.", _documentObjectModel] breakOut "return";
        };

        _metaHM deleteAt "schema_SQF_serialisation_layout";  // Must be readded when serialised.
        _documentObjectModel merge _metaHM;
    };

    case ('"schema_SQF_hashMap_parallelKeyValue"' in _fileContents): {
        private _trimmedFileContents = _fileContents call _fnc_cropToBrackets;
        private _parallelMap = parseSimpleArray _trimmedFileContents;
        if (isNil '_parallelMap' || { _parallelMap isEqualTo [] }) then {
            ["Failed to parse string as schema_SQF_hashMap_parallelKeyValue.", _documentObjectModel] breakOut "return";
        };

        private _metaHM = (_parallelMap #0) createHashMapFromArray (_parallelMap #1);
        if (isNil '_metaHM' || { !(_metaHM isEqualType _documentObjectModel) }) then {
            ["Failed to create HashMap from string as schema_SQF_hashMap_parallelKeyValue.", _documentObjectModel] breakOut "return";
        };

        _metaHM deleteAt "schema_SQF_serialisation_layout";  // Must be readded when serialised.
        _documentObjectModel merge _metaHM;
    };

    case ("navGrid = [" in _fileContents): {
        private _trimmedFileContents = _fileContents call _fnc_cropToBrackets;
        private _navGridDBLegacy = parseSimpleArray _trimmedFileContents;
        if (isNil '_navGridDBLegacy' || { _navGridDBLegacy isEqualTo [] }) then {
            ["Failed to parse string as navGrid v1.", _documentObjectModel] breakOut "return";
        };

        _documentObjectModel set ["schema_arma3_streetArtist_metadata_version", "schema_arma3_streetArtist_metadata_v1"];
        _documentObjectModel set ["navGridDB", _navGridDBLegacy];

        if ("""StreetArtist_Config"":{""" in _fileContents) then {

            private _fnc_parseJSONToKV = {  // Uber sketch
                private _matches = _this regexFind ["(""\w*""\s*):\s*([^,{}\[\]]*?)\s*(?=[,}\]])/go"];
                private _keyPairs = [];
                {
                    private _groups = _x;
                    _groups params ["_wholeMatch","_nameMatch","_valueMatch"];  // More groups would result in more items here.

                    private _name = _nameMatch #0;  // #1 is offset
                    private _value = _valueMatch #0;

                    _keyPairs pushBack parseSimpleArray ('['+_name+','+_value+']');
                } forEach _matches;
                _keyPairs;
            };
            private _metaString = _fileContents select [0, (_fileContents find "}*/") + 3];
            private _metaKeyPairs = _metaString call _fnc_parseJSONToKV;
            private _metaHM = createHashMapFromArray _metaKeyPairs;
            _documentObjectModel merge [_metaHM, false];  // Skip duplicate keys.
        };
    };

    default {
        ["Unable to identify schema.", _documentObjectModel] breakOut "return";
    };
};

/// --- Version Checking --- ///

private _currentVersion = "schema_arma3_streetArtist_metadata_v2";
private _loadedVersion = _documentObjectModel getOrDefault ["schema_arma3_streetArtist_metadata_version", ""];
if (_loadedVersion isEqualTo "") then {
    ["schema_arma3_streetArtist_metadata_version is undefined. Therefore, unknown schema.", _documentObjectModel] breakOut "return";
};

/// --- Forward Updater --- ///
if (_loadedVersion isNotEqualTo _currentVersion) then {
    private _forwardUpdaterHM = createHashMapFromArray [
        ["schema_arma3_streetArtist_metadata_v1", {createHashMapFromArray [
            ["schema_arma3_streetArtist_metadata_version", "schema_arma3_streetArtist_metadata_v2"],
            ["originalVersion",     _this getOrDefault ["originalVersion", _this getOrDefault["schema_arma3_streetArtist_metadata_version","undefined"]] ],

            ["navGridDB",           _this getOrDefault ["navGridDB", []]],
            ["integrity",           hashValue (_this getOrDefault ["navGridDB", "Make integrity error"])],

            ["worldName",           _this getOrDefault ["worldName", ""]],
            ["flatMaxDrift",        _this getOrDefault ["_flatMaxDrift", -1]],
            ["juncMergeDistance",   _this getOrDefault ["_juncMergeDistance", -1]],

            ["dateTimeCreated",     [1984,1,22,12,00,0,0] ], // Low priority Todo, parse time.
            ["dateTimeModified",    _this getOrDefault ["systemTimeUTC", systemTimeUTC]],
            ["createdBy",           "Unknown Author"],
            ["modifiedBy",          ""]
        ]}]
    ];
    if !(_loadedVersion in _forwardUpdaterHM) then {
        ["Unrecognised schema ("+str _loadedVersion+"), maybe from the future?.", _documentObjectModel] breakOut "return";
    };
    private _originalVersion = _loadedVersion;
    while {_loadedVersion isNotEqualTo _currentVersion} do {
        if !(_loadedVersion in _forwardUpdaterHM || _loadedVersion isEqualTo _currentVersion) exitWith {};
        _documentObjectModel = _documentObjectModel call (_forwardUpdaterHM get _loadedVersion);
        _loadedVersion = _documentObjectModel getOrDefault ["schema_arma3_streetArtist_metadata_version", "undefined"];
    };
    if (_loadedVersion isNotEqualTo _currentVersion) then {
        ["Error, Updating navGridDB stuck on ("+_loadedVersion+") in from ("+_originalVersion+") to ("+_currentVersion+").", _documentObjectModel] breakOut "return";
    };
};

/// --- Verify Integrity --- ///

private _navGridDB = _documentObjectModel getOrDefault ["navGridDB", []];
if ( isNil '_navGridDB' || { _navGridDB isEqualTo [] }) then {
    ["navGridDB nil or empty.", _documentObjectModel] breakOut "return";
};

private _generatedHash = hashValue _navGridDB;
private _loadedHash = _documentObjectModel getOrDefault ["integrity", ""];
if (_generatedHash isNotEqualTo _loadedHash) then {
    ["navGridDB integrity check failed, likely due to incomplete copy and paste.", _documentObjectModel] breakOut "return";
};

/// --- Validate and Correct Schema --- ///
// Current: schema_arma3_streetArtist_metadata_v2

{
    _x params ["_key", "_value"];
    if (_key in _documentObjectModel && {_documentObjectModel get _key isEqualType _value}) then { continue };
    _documentObjectModel set [_key, _value];
} forEach [
    ["schema_arma3_streetArtist_metadata_version", "schema_arma3_streetArtist_metadata_v2"],
    ["originalVersion",     "undefined"],

    ["navGridDB",           [] ],
    ["integrity",           ""],

    ["worldName",           ""],
    ["flatMaxDrift",        -1],
    ["juncMergeDistance",   -1],

    ["dateTimeCreated",     [1984,1,22,12,00,0,0] ],
    ["dateTimeModified",    [1984,1,22,12,00,0,0] ],
    ["createdBy",           "Unknown Author"],
    ["modifiedBy",          ""]
];

/// --- Successful Return --- ///

["", _documentObjectModel];
