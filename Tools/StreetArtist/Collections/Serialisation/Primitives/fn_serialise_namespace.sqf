/*
Function:
    Col_fnc_serialiseNamespace

Description:
    Converts Namespace into enum scalar.

Environment:
    <SCHEDULED> Recommended, not required. Recurses over entire sub-tree. Serialisation process is resource heavy.

Parameters:
    <LOCATION> Serialisation builder.
    <NAMESPACE> A namespace.

Returns:
    <ARRAY<STRING>> Serialisation of Code;

Examples:
    [locationNull,missionNamespace] call Col_fnc_serialise_namespace;  // ["NAMESPACE",0]

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params [
    ["_serialise_builder",locationNull,[locationNull]],
    ["_namespace",missionNamespace,[missionNamespace]]
];
[
    "NAMESPACE",
    [
        missionNamespace,
        parsingNamespace,
        uiNamespace,
        profileNamespace,
        localNamespace
    ] find _namespace
];
