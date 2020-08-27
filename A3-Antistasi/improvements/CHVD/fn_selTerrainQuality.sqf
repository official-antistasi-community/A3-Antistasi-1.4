private ["_output"];
_terrainGrid = _this select 0;
_output = switch (true) do {
	case (_terrainGrid >= 49): {0};
	case (_terrainGrid >= 48.99): {1};
	case (_terrainGrid >= 25): {2};
	case (_terrainGrid >= 12.5): {3};
	case (_terrainGrid >= 3.125): {4};
	default {1};
};
_output