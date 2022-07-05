#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

private _worldName = toLower worldName;

private _fnc_requirementMeet = { getArray (_this/"requiredAddons") findIf { !(isClass (configFile/"CfgPatches"/_x)) } == -1 };

//dependecies: _worldName, A3A_climate
private _fnc_gatherTemplates = {
    params ["_type", ["_pool", []]]; //_pool and _nodes are modified
    if (isClass (_x/_type)) then {
        private _fileNameComposition = [_modset, _type];
        private _countClasses = count ("true" configClasses (_x/_type));
        if (_countClasses > 0) then {

            { //example: Vanilla_AI_CSAT.sqf
                private _faction = configName _x;
                private _fileNameComposition = +_fileNameComposition;
                if (toLower _faction isEqualTo "camo") then {
                    if (_countClasses > 1) then { continue };

                    private _camo = if (getText (_x/A3A_climate) isNotEqualTo "") then { getText (_x/A3A_climate) } else { getText (_x/"Default") };
                    _fileNameComposition pushBack _camo;
                } else {
                    _fileNameComposition pushBack _faction;
                };

                if (isClass (_x/"camo")) then { //example: Vanilla_AI_CSAT_Arid.sqf
                    private _camo = if (getText (_x/"camo"/A3A_climate) isNotEqualTo "") then { getText (_x/"camo"/A3A_climate) } else { getText (_x/"camo"/"Default") };
                    _fileNameComposition pushBack _camo;
                };

                if (isText (_x/"file")) then { //file overwrite (absolute path)
                    _pool pushBackUnique ((getText (_x/"file")) + ".sqf");
                } else {
                    _pool pushBackUnique (_rootPath + (_fileNameComposition joinString "_") + ".sqf");
                };
            } forEach ("true" configClasses (_x/_type));

        } else { //example: Vanilla_Civ.sqf
            if (isClass (_x/"file")) then { //file overwrite (absolute path)
                _pool pushBackUnique ((_fileNameComposition joinString "_") + ".sqf");
            } else {
                _pool pushBackUnique (_rootPath + (_fileNameComposition joinString "_") + ".sqf");
            };
        };
    };
    _pool;
};

//list of templates available
private _AI = [];
private _Reb = [];
private _Civ = [];
private _nodes = [];

private _prioritisations = [[0,"",""],[0,"",""],[0,"",""],[0,"",""]];
private _updatePreferedFaction = {
    private _entryName = ["priorityOcc","priorityInv","priorityReb","priorityCiv"] # _this;
    private _side = ["Occ","Inv","Reb","Civ"] # _this;
    if (getNumber (_x/_entryName) > (_prioritisations#_this#0)) then {
        private _defaultFaction = if (getText (_x/"worldDefaults"/_worldName/_side) isNotEqualTo "") then { getText (_x/"worldDefaults"/_worldName/_side) } else { getText (_x/"worldDefaults"/"Default"/_side) };
        if (_defaultFaction isEqualTo "") exitWith {
            private _pool = ["AI","AI","Reb","Civ"] # _this;
            if (isClass (_x/_pool) && {
                (count ("true" configClasses (_x/_pool)) == 0)
                || (
                    (count ("true" configClasses (_x/_pool)) == 1)
                    && (toLower configName (_x/_pool)) isEqualTo "camo"
                )//no factions defined
            }) then { // single civ template defined for modset, but no faction defined
                Debug_2("No worldDefault for side %1 on modset: %2", _side, _modset);
                _prioritisations set [_this, [getNumber (_x/_entryName), "", _modset]]; //_modset hacked from parent scope
            };
        };

        _prioritisations set [_this, [getNumber (_x/_entryName), _defaultFaction, _modset]]; //_modset hacked from parent scope
    };
};

private _templates = configFile/"A3A"/"Templates";
{
    //check required addons are loaded
    if !(_x call _fnc_requirementMeet) then { continue };

    private _variantOf = getText (_x/"variantOf"); // sub faction of a faction
    private _modset = if (_variantOf isNotEqualTo "") then {_variantOf} else {configName _x};
    private _rootPath = getText (_x/"path") + "\";

    ["AI", _AI] call _fnc_gatherTemplates;
    ["Reb", _Reb] call _fnc_gatherTemplates;
    ["Civ", _Civ] call _fnc_gatherTemplates;

    //template default selection
    for "_i" from 0 to 3 do { _i call _updatePreferedFaction };

    _nodes append (getArray (_x/"Nodes") apply {_rootPath + _X});

} forEach ("true" configClasses _templates);

private _addons = [];
private _addonVics = configFile/"A3A"/"AddonVics";
{
    if !(_x call _fnc_requirementMeet) then { continue };
    private _root = getText (_x/"path") + "\";
    _nodes append (getArray (_x/"Nodes") apply {_root + _x});
    _addons append (getArray (_x/"files") apply {
        private _side = switch (toLower (_x#0)) do {
            case "occ": {west};
            case "inv": {east};
            case "reb": {resistance};
            case "civ": {civilian};
            default {sideUnknown};
        };

        [_side, _root + (_x#1)]
    });
} forEach ("true" configClasses _addonVics);

//------------------------------------------------------------------------------------------------------------
// template data retrived and proccesed, now to pick templates for the sides, load addons, and logistics nodes
//------------------------------------------------------------------------------------------------------------

Debug_1("Nodes: %1", _nodes);
Debug_3("Templates detected | AI: %1 | Reb: %2 | Civ: %3", _AI, _Reb, _Civ);
Debug_1("Addons detected: %1", _addons);

//temp solution as current structure depends on vanilla nodes to define arrays
private _vanillaNodes = _nodes findIf {"Vanilla" in _x};
call compile preprocessFileLineNumbers (_nodes deleteAt _vanillaNodes);
{
    call compile preprocessFileLineNumbers _x;
    Info_1("Loading logistic nodes: %1", _x);
} forEach _nodes;

{
    _x params ["", "_faction", "_modset"];
    private _type = ["AI", "AI", "Reb", "Civ"] # _forEachIndex;
    private _templatePool = [_AI, _AI, _Reb, _Civ] # _forEachIndex;
    private _side = [west, east, resistance, civilian] # _forEachIndex;
    private _templateName = ([_modset, _type, _faction] select {_x isNotEqualTo ""}) joinString "_";
    private _index = _templatePool findIf {_templateName in _x};
    Debug_2("Available templates for faction %1: %2", _type, _templatePool);
    Debug_1("Looking for template with name: %1", _templateName);
    [_templatePool # _index, _side] call A3A_fnc_compatibilityLoadFaction;

    Info_2("Loading template: %1 for side: %2", _templatePool#_index, _side);
} forEach _prioritisations;

//temp for modset name globals
{
    private _type = ["Occ", "Inv", "Reb", "Civ"] # _forEachIndex;
    missionNamespace setVariable ["A3A_"+_type+"_template", _x#2];
} forEach _prioritisations;

{
    _x call A3A_fnc_loadAddon;
    Info_2("Loading addon: %1 for side: %2",_x#1,_x#0);
} forEach _addons;

call A3A_fnc_compileMissionAssets;
