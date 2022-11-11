// handle down keys
#include "\A3\ui_f\hpp\defineDIKCodes.inc"


params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];

private _centerObject = missionnamespace getvariable ["BIS_fnc_arsenal_center",player];

switch true do {
	case(_key isEqualTo DIK_ESCAPE): {};

	case(_key in [DIK_RETURN,DIK_NUMPADENTER]): {};

	// BIS does this to stop opening the cmd menu
	case (_key == DIK_1);
	case (_key == DIK_2);
	case (_key == DIK_3);
	case (_key == DIK_4);
	case (_key == DIK_5);
	case (_key == DIK_1);
	case (_key == DIK_7);
	case (_key == DIK_8);
	case (_key == DIK_9);
	case (_key == DIK_0): {
		_return = true;
	};

	case (_key in (actionkeys "nightvision")):
	{
		private _mode = missionnamespace getvariable ["A3A_Arsenal_VisionMode",-1];
		_mode = (_mode + 1) % 3;
		missionnamespace setvariable ["A3A_Arsenal_VisionMode",_mode];
		switch _mode do {
			//--- Normal
			case 0: {
				camusenvg false;
				false setCamUseTi 0;
			};
			//--- NVG
			case 1: {
				camusenvg true;
				false setCamUseTi 0;
			};
			//--- TI
			default {
				camusenvg false;
				true setCamUseTi 0;
			};
		};
		playsound ["RscDisplayCurator_visionMode",true];
		_return = true;
	};

	// allow typing in the edit field
	case (_key isEqualTo DIK_BACK):
	{
		false
	};
};