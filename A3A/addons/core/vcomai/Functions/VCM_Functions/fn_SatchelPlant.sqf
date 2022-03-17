
/*
	Author: Genesis

	Description:
		Script used to make AI attach explosives to buildings and bring them down if players garrison them.

	Parameter(s):
		0: OBJECT - Unit to plant satchel
		1: ARRAY - satchel array

	Returns:
		NOTHING
*/

params ["_unit","_satchelArray"];

private _satchelObj = _satchelArray select 0;
private _satchelMag = _satchelArray select 1;

//Let's see if we can place a scripted version of the item.
private _testName = _satchelObj + "_scripted";
private _testMine = _testName createVehiclelocal [0,0,0];
if !(isNull _testMine) then
{
	_satchelObj = _testName;
};



private _point = _unit call VCM_fnc_ClstEmy;
if (_point isEqualTo [] || {isNil "_point"}) exitWith {};

if ((_unit distance _point) < 200) then 
{

	private _vehicle = vehicle _point;
	
	if (_point isEqualTo _vehicle) then 
	{

		private _nBuilding = (nearestObjects [_point, ["House", "Building"], 50]) select 0;
		if (isNil "_nBuilding") exitWith {};
		if ((_nBuilding distance _point) > 40) exitWith {};	
		[_unit,_nBuilding,(group _unit),_satchelObj,_satchelMag] spawn 
		{
			params ["_unit","_nBuilding","_Group","_satchelObj","_satchelMag"];
			_unit disableAI "TARGET";
			_unit disableAI "AUTOTARGET";
			_unit disableAI "CHECKVISIBLE";
			_unit disableAI "COVER";
			_unit disableAI "AUTOCOMBAT";
			doStop _unit; _unit doMove (getPos _nBuilding);
			
			private _truth = true;
			while {_truth} do 
			{
				if ((_unit distance _nBuilding) <= 9) then {_truth = false;};
				sleep 0.25;
			};

			_unit removeMagazine _satchelMag;
			private _mine = _satchelObj createVehicle (getposATL _unit);
			_mine setDir ([_mine, _nBuilding] call BIS_fnc_dirTo);
			[_unit,"AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"] remoteExec ["Vcm_PMN",0];
			 _unit action ["SetTimer", _unit, _mine];
			
			private _plantPosition = getpos _mine;
			private _notSafe = true;
			private _unitSide = (side _unit);
			_unit doMove (getpos (leader _Group));
			_unit enableAI "TARGET";
			_unit enableAI "AUTOTARGET";
			_unit enableAI "CHECKVISIBLE";
			_unit enableAI "COVER";
			_unit enableAI "AUTOCOMBAT";			

			while {_notSafe} do
			{
				private _array1 = [];
				{
					_array1 pushback _x;
				} foreach (allUnits select {(side _x) isEqualTo _unitSide && (alive _x)});			
				_closestFriendly = [_array1,_plantPosition,true,"Satch1"] call VCM_fnc_ClstObj;
				if !(isNil "_closestFriendly") then
				{
					if (_closestFriendly distance2D _plantPosition > 10) then {_notSafe = false;};
				}
				else
				{
					_notSafe = false;
				};
				sleep 5;
			};
			_mine setdamage 1;
			sleep 3;
			_list = _plantPosition nearObjects ["#crater",5]; 
			if (_list isEqualTo []) then
			{
				deleteVehicle _mine;
				private _mine2 = "SatchelCharge_Remote_Ammo" createVehicle _plantPosition;
				_mine2 setdamage 1;
			};
			
		};
	};
};