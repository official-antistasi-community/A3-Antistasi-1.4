/*
	Creates a namespace to store data in.
	This will NOT delete itself - make sure to tidy it up when you're done with it.
	Local namespaces (non-global) can't be read or written from other machines without remoteExec'ing code
*/

params [["_globalNamespace", false]];

if (!_globalNamespace) exitWith 
{
	createLocation ["Invisible", [-10, -10, 0], 0, 0]
};

createSimpleObject ["a3\weapons_f\empty.p3d", [-10, -10, 0], true]