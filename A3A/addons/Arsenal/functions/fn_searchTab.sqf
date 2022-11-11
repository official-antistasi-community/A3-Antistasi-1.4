
#include "..\dialog\ids.inc"
#include "..\script_component.hpp"
#include "\x\A3A\addons\GUI\dialogues\defines.hpp"

// get current tab
private _display = findDisplay A3A_IDD_ANTISTASI_ARSENAL_DIALOG;
private _selectedTab = A3A_selectedTab;

// get the search text
private _text = toLower(ctrlText A3A_IDC_ARSENAL_SEARCH_FIELD);

private _controls = (_display getVariable ((_selectedTab#1) + "Ctrls"));
systemChat str _text;

// show all the items again if searching was an empty string
if (_text isEqualTo "") ExitWith {
	{
		{
			_x ctrlShow true;
		} forEach allControls _x;
		
	} forEach _controls;
	{
		_x ctrlSetPositionY _forEachIndex * (40 * GRID_H);
		_x ctrlCommit .5;
	} forEach _controls;
};

// go through the controls and find ones that are close to the text
private _foundControls = []; 
{
	private _controlDisplay =  _x getVariable ["displayName", ""];
	private _controlClass = _x getVariable ["className", ""];
	if ((_controlDisplay isEqualTo "") || {(((toLower _controlDisplay) find _text) isEqualTo -1) && {(((toLower _controlClass) find _text) isEqualTo -1)}}) then 
	{
		{
			_x ctrlShow false;
		} forEach allControls _x;
	} 
	else 
	{
		// the control is saved so that we can place it at the top
		_foundControls pushBack _x;
	};
	
} forEach _controls;



if (_foundControls isEqualTo []) exitWith {};

// move the items we found up to the top
{
	_x ctrlSetPositionY _forEachIndex * (40 * GRID_H);
	_x ctrlCommit .5;
} forEach _foundControls;