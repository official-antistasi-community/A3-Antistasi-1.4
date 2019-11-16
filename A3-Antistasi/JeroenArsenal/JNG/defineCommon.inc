#include "\A3\ui_f\hpp\defineDIKCodes.inc"
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

#define FADE_DELAY	0.15

#define IDC_JNG_TAB_CAR IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON
#define IDC_JNG_TAB_ARMOR IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON
#define IDC_JNG_TAB_HELI IDC_RSCDISPLAYARSENAL_TAB_HANDGUN
#define IDC_JNG_TAB_PLANE IDC_RSCDISPLAYARSENAL_TAB_UNIFORM
#define IDC_JNG_TAB_NAVAL IDC_RSCDISPLAYARSENAL_TAB_VEST
#define IDC_JNG_TAB_STATIC IDC_RSCDISPLAYARSENAL_TAB_BACKPACK

#define IDC_JNG_TAB_REARM IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG
#define IDC_JNG_TAB_REPAIR IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL
#define IDC_JNG_TAB_REFUEL IDC_RSCDISPLAYARSENAL_TAB_ITEMACC
#define IDC_JNG_TAB_TEXTURE IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE
#define IDC_JNG_TAB_COMPONENT IDC_RSCDISPLAYARSENAL_TAB_ITEMBIPOD
#define IDC_JNG_TAB_PYLON IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT
#define IDC_JNG_TAB_HARDPOINT IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC //uses the same tab id as IDC_JNG_TAB_PYLON

#define IDC_JNG_TAB_REARM_SORT IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC


#define IDCS_LEFT\
	IDC_JNG_TAB_CAR,\
	IDC_JNG_TAB_ARMOR,\
	IDC_JNG_TAB_HELI,\
	IDC_JNG_TAB_PLANE,\
	IDC_JNG_TAB_NAVAL,\
	IDC_JNG_TAB_STATIC

#define IDCS_RIGHT\
	IDC_JNG_TAB_REARM,\
	IDC_JNG_TAB_REPAIR,\
	IDC_JNG_TAB_REFUEL,\
	IDC_JNG_TAB_TEXTURE,\
	IDC_JNG_TAB_COMPONENT,\
	IDC_JNG_TAB_PYLON,\
	IDC_JNG_TAB_HARDPOINT

#define IDCS	[IDCS_LEFT,IDCS_RIGHT]

#define DECOMPILE_DATA\
	private _data = call compile _dataStr;
#define SPLIT_SAVE\
	private _name = _data select 0;\
	private _beingChanged = _data select 1;\
	private _locked = _data select 2;\
	private _lockedName = _data select 3;\
	private _type = _data select 4;\
	private _texture = _data select 5;\
	private _animations = _data select 6;\
	private _ammoClassic = _data select 7;\
	private _ammoPylon = _data select 8;\
	private _damage = _data select 9;\
	private _attachItem = _data select 10;
#define COMPILE_SAVE\
	if(isnil "_name" || isnil "_beingChanged" || isnil "_locked" || isnil "_lockedName"  || isnil "_type" || isnil "_texture" || isnil "_animations" || isnil "_ammoClassic"|| isnil "_ammoPylon"|| isnil "_ammoClassic" || isnil "_damage")then{\
		["Error: ERROR COMPILE_SAVE"] call BIS_fnc_error;\
		_error_compile_save = "ERROR COMPILE_SAVE fn_garage.sqf (JGA)";\
	};\
	private _data = [_name, _beingChanged, _locked, _lockedName, _type, _texture, _animations, _ammoClassic, _ammoPylon, _damage, _attachItem];\
	private _datastr = str _data;
#define SPLIT_REARM\
	private _magazine = _data select 0;\
	private _currentAmount = _data select 1;\
	private _maxAmount = _data select 2;\
	private _displayName = _data select 3;
#define COMPILE_REARM\
	private _data = [_magazine, _currentAmount, _maxAmount, _displayName];\
	private _datastr = str _data;


#define AMOUTTOTEXT\
{\
	private _amount = _this;\
	if(_amount == -1)exitWith{"   ∞    ";};\
	private _suffix = "";\
	private _prefix = "";\
	if(_amount > 9999)then{\
		_amount = round(_amount/1000);_suffix="k";\
		_prefix = switch true do{\
			case(_amount>=1000):{_amount = 9999; "";};\
			case(_amount>=100):{"0";};\
			case(_amount>=10):{"00";};\
			case(_amount>=0):{"000";};\
		};\
	}else{\
		_prefix = switch true do{\
			case(_amount>=1000):{"";};\
			case(_amount>=100):{"0";};\
			case(_amount>=10):{"00";};\
			case(_amount>=0):{"000";};\
		};\
	};\
	(_prefix + (str _amount) + _suffix);\
};
