private ["_status"];
_status = 0;

switch (UAVControl (getConnectedUAV player) select 1) do {
	case (""): {
		_status = 0;
	};
	default {
		_status = 1;
	};
};

_status