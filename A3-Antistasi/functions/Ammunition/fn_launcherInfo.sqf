/**
	Gets the targets (ground/air) a launcher can lock on to, as well as which magazines can lock which targets.
	
	Params:
		launcherClassName: Class name of the launcher to test. DO NOT USE ON NON-LAUNCHERS.
		disposable: Is the launcher disposable? This is for the recursive call.
		
	Returns:
		[canLockGroundTargets, canLockAirTargets, unguidedMagazines, groundLockMagazines, airLockMagazines] - magazine arrays may overlap. No magazines are returned for disposables.

**/

params ["_launcherClassName", ["_disposable", false]];

private _rawMagazines = getArray (configFile >> "CfgWeapons" >> _launcherClassName >> "magazines");
private _magazineWells = getArray (configFile >> "CfgWeapons" >> _launcherClassName >> "magazineWell");
{
	{
		_rawMagazines pushBackUnique _x;
	} forEach getArray (configFile >> "CfgMagazineWells" >> _x >> "BI_Magazines");
} forEach _magazineWells;

//Ace has since moved to the CBA system - leaving these in for legacy reasons, but they can be deleted in the future. (2020/01/02)
private _isACEDisposable = getText (configFile >> "CfgWeapons" >> _launcherClassName >> "ACE_UsedTube") !=	"";
private _isACEUsedLauncher = getNumber (configFile >> "CfgWeapons" >> _launcherClassName >> "ACE_isUsedLauncher") == 1;
private _fakeLauncher =	"CBA_FakeLauncherMagazine" in _rawMagazines;

//If it's an ACE disposable, we only want to check the PreloadedMissileDummy.
if (_isACEDisposable) then {
	_disposable = true;
	_rawMagazines = ["ACE_PreloadedMissileDummy"];
};

if (_isACEUsedLauncher) exitWith {
	[false, false, [], [], []]
};

//If we have a fake CBA launcher, don't process further.
if (_fakeLauncher) exitWith {
	//If disposable launchers is loaded, check if we're holding a disposable launcher, and find the actual class if so.
	if (!isNil "cba_disposable_LoadedLaunchers") exitWith {
		private _fireableLauncherName = cba_disposable_LoadedLaunchers getVariable [_launcherClassName, ""];
		if (_fireableLauncherName != "") exitWith {
			[_fireableLauncherName, true] call A3A_fnc_launcherInfo;
		};
	};
	[false, false, [], [], []];
};

private _magazineAmmo = [];
{
	//Ignore fake magazines - unless we're an ACE disposable launcher
	if (getNumber (configFile >> "CfgMagazines" >> _x >> "count") > 0 || _isACEDisposable) then {
		_magazineAmmo pushBack [_x, getText (configFile >> "CfgMagazines" >> _x >> "ammo")];
	};
} forEach _rawMagazines;

private _targetAir = false;
private _targetGround = false;

private _unguidedMagazines = [];
private _groundMagazines = [];
private _airMagazines = [];

//Look at the individual ammo types, to figure out what we can lock onto.
{
	_x params ["_mag", "_ammoType"];
	if (_ammoType isKindOf "MissileCore") then {
		private _ammoConfig = configFile >> "CfgAmmo" >> _ammoType;
		//If have ACE and ACE Guidance is enabled, then it can target whatever it damn well likes. ACE isn't picky.
		if(hasACE && {isClass (_ammoConfig >> "ace_missileguidance") && {getNumber (_ammoConfig >> "ace_missileguidance" >> "enabled") == 1}}) exitWith {
			_targetGround = true;
			_targetAir = true;
			_groundMagazines pushBackUnique _mag;
			_airMagazines pushBackUnique _mag;
		};
	
		private _airLock = getNumber (_ammoConfig >> "airLock");
		switch (_airLock) do {
			case 0: {
				_targetGround = true;
				_groundMagazines pushBackUnique _mag;
			};
			case 1: {
				_targetGround = true;
				_targetAir = true;
				_groundMagazines pushBackUnique _mag;
				_airMagazines pushBackUnique _mag;
			};
			case 2: {
				_targetAir = true;
				_airMagazines pushBackUnique _mag;
			};
		};
	} else {
		_unguidedMagazines pushBackUnique _mag;
	};
} forEach _magazineAmmo;

//If we're a disposable, we don't want to spawn ammo. Claim none of it exists. 
if (_disposable) then {
	_unguidedMagazines = [];
	_groundMagazines = [];
	_airMagazines = [];
};

[_targetGround, _targetAir, _unguidedMagazines, _groundMagazines, _airMagazines];
