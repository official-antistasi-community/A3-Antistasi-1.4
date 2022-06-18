
// make air a bit more likely with war tier? or not?
// air QRFs are typically *less* effective at higher tiers, right?

// what else?
// general area scan for threat levels?
// or absolutely specific for AA vehicles?
// later maybe. Only consider target for the moment.

params ["_target", "_side"];

if (_target in (A3A_faction_all get "vehiclesFixedWing")) exitWith { 0 };     // Arguable but whatever

// Otherwise fine?

1;