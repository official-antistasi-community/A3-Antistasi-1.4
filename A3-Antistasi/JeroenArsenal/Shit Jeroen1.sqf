#include "defines.inc"
/*
	Author: Jiri Wainar

	Description:
	Add a hold action. If the hold actions are not initialized yet, initialize the system first.

	Parameters:
	0: OBJECT - object action is attached to
	1: STRING - action title text shown in action menu
	2: STRING or CODE - idle icon shown on screen; if CODE is used the code needs to return the path to icon
	3: STRING or CODE - progress icon shown on screen; if CODE is used the code needs to return the path to icon
	4: STRING - condition for the action to be shown; special variables passed to the script code are _target (unit to which action is attached to) and _this (caller/executing unit)
	5: STRING - condition for action to progress; if false is returned action progress is halted; arguments passed into it are: _target, _caller, _id, _arguments
	6: CODE - code executed on start; arguments passed into it are [target, caller, ID, arguments]
		0: OBJECT - target (_this select 0) - the object which the action is assigned to
		1: OBJECT - caller (_this select 1) - the unit that activated the action
		2: NUMBER - ID (_this select 2) - ID of the activated action (same as ID returned by addAction)
		3: ARRAY - arguments (_this select 3) - arguments given to the script if you are using the extended syntax
	7: CODE - code executed on every progress tick; arguments [target, caller, ID, arguments, currentProgress]; max progress is always 24
	8: CODE - code executed on completion; arguments [target, caller, ID, arguments]
	9: CODE - code executed on interrupted; arguments [target, caller, ID, arguments]
	10: ARRAY - arguments passed to the scripts
	11: NUMBER - action duration; how much time it takes to complete the action
	12: NUMBER - priority; actions are arranged in descending order according to this value
	13: BOOL - remove on completion (default: true)
	14: BOOL - show in unconscious state (default: false)

	Example:
	[_target,_title,_iconIdle,_iconProgress,_condShow,_condProgress,_codeStart,_codeProgress,_codeCompleted,_codeInterrupted,_arguments,_duration,_priority,_removeCompleted,_showUnconscious] call bis_fnc_holdActionAdd;

	Returns:
	Action ID, can be used for removal or referencing from other functions.
*/

params
[
	["_target",objNull,[objNull]],
	["_title","MISSING TITLE",[""]],
	["_iconIdle","\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_revive_ca.paa",["",{}]],
	["_iconProgress","\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_revive_ca.paa",["",{}]],
	["_condShow","true",[""]],
	["_condProgress","true",[""]],
	["_codeStart",{},[{}]],
	["_codeProgress",{},[{}]],
	["_codeCompleted",{},[{}]],
	["_codeInterrupted",{},[{}]],
	["_arguments",[],[[]]],
	["_duration",10,[123]],
	["_priority",1000,[123]],
	["_removeCompleted",true,[true]],
	["_showUnconscious",false,[true]]
];


//convert to structured text
if (_iconIdle isEqualType "") then
{
	_iconIdle = TEXTURE_TEMPLATE_ICON_IDLE(_iconIdle);
};
if (_iconProgress isEqualType "") then
{
	_iconProgress = TEXTURE_TEMPLATE_ICON_PROGRESS(_iconProgress);
};

//prepare progress textures
if (isNil {TEXTURES_PROGRESS}) then
{
	TEXTURES_PROGRESS = [];
	for "_i" from 0 to FRAME_MAX_PROGRESS do
	{
		TEXTURES_PROGRESS pushBack TEXTURE_TEMPLATE_PROGRESS(_i);
	};
};

//prepare idle textures
if (isNil {TEXTURES_IDLE}) then
{
	TEXTURES_IDLE = [];

	private _alpha = 0;
	private _color = "";

	for "_i" from 0 to FRAME_MAX_IDLE do
	{
		_alpha = (sin((_i/FRAME_MAX_IDLE) * 360) * 0.25) + 0.75;
		_color = [1,1,1,_alpha] call bis_fnc_colorRGBAtoHTML;

		TEXTURES_IDLE pushBack TEXTURE_TEMPLATE_IDLE_PULSE(_i,_color);
	};
};

//prepare in textures
if (isNil {TEXTURES_IN}) then
{
	TEXTURES_IN = [];
	for "_i" from 0 to FRAME_MAX_IN do
	{
		TEXTURES_IN pushBack TEXTURE_TEMPLATE_IN(_i);
	};
};

//preprocess data
private _keyNameRaw = actionKeysNames ["Action",1,"Keyboard"];
private _keyName = _keyNameRaw select [1,count _keyNameRaw - 2];
//STR_A3_HoldKeyTo: Hold %1 to %2
private _keyNameColored = format["<t color='#ffae00'>%1</t>",_keyName];
private _hint = format[localize "STR_A3_HoldKeyTo",_keyNameColored,_title];
_hint = format["<t font='RobotoCondensedBold'>%1</t>",_hint];
_title = format["<t color='#FFFFFF' align='left'>%1</t>        <t color='#83ffffff' align='right'>%2     </t>",_title,_keyName];

if (isNil "bis_fnc_holdAction_running") then {bis_fnc_holdAction_running = false;};

if (isNil "bis_fnc_holdAction_animationIdleFrame3") then {bis_fnc_holdAction_animationIdleFrame3 = 0;};
if (isNil "bis_fnc_holdAction_animationIdleFrame6") then {bis_fnc_holdAction_animationIdleFrame6 = 0;};
if (isNil "bis_fnc_holdAction_animationIdleFrame12") then {bis_fnc_holdAction_animationIdleFrame12 = 0;};
if (isNil "bis_fnc_holdAction_animationIdleFrame24") then {bis_fnc_holdAction_animationIdleFrame24 = 0;};

//resize arguments array to max 10 items
_arguments resize 10;
_arguments = _arguments + [_target,_title,_iconIdle,_iconProgress,_condShow,_condProgress,_codeStart,_codeProgress,_codeCompleted,_codeInterrupted,_duration,_removeCompleted];

//[_target,_actionID,_title,_icon,_textures,_frame,_hint] call bis_fnc_holdAction_showIcon;
bis_fnc_holdAction_showIcon =
{
	params
	[
		["_target",objNull,[objNull]],
		["_actionID",0,[123]],
		["_title","",[""]],
		["_icon","",["",{}]],
		["_texSet",TEXTURES_PROGRESS,[[]]],
		["_frame",0,[123]],
		["_hint","",[""]]
	];

	if (_icon isEqualType {}) then
	{
		_icon = _target call _icon;
	};

	_target setUserActionText [_actionID,_title,_texSet select _frame,_icon + "<br/><br/>" + _hint];
};

bis_fnc_holdAction_animationTimerCode =
{
	if (time > (missionNamespace getVariable ["bis_fnc_holdAction_animationIdleTime",-1]) && {_eval}) then
	{
		bis_fnc_holdAction_animationIdleTime = time + 0.065;

		bis_fnc_holdAction_animationIdleFrame3 = (bis_fnc_holdAction_animationIdleFrame3 + 1) % 3;
		bis_fnc_holdAction_animationIdleFrame6 = (bis_fnc_holdAction_animationIdleFrame6 + 1) % 6;
		bis_fnc_holdAction_animationIdleFrame12 = (bis_fnc_holdAction_animationIdleFrame12 + 1) % 12;
		bis_fnc_holdAction_animationIdleFrame24 = (bis_fnc_holdAction_animationIdleFrame24 + 1) % 24;

		//play idle animation only when action is not in progress
		if (!bis_fnc_holdAction_running) then
		{
			params["_title","_iconIdle","_hint"];

			//idle animations always have 12 frames
			[_target,_actionID,_title,_iconIdle,TEXTURES_IDLE,bis_fnc_holdAction_animationIdleFrame12,_hint] call bis_fnc_holdAction_showIcon;
		};
	};
};

private _codeInit =
{
	bis_fnc_holdAction_running = true;

	/*
	//check if another hold action is running, if so terminate it
	if (!isNil "bis_fnc_holdAction_scriptHandle" && {!scriptDone bis_fnc_holdAction_scriptHandle}) exitWith
	{
		if (!isNil "bis_fnc_holdAction_params") then
		{
			//unwrap arguments supplied by addAction command
			bis_fnc_holdAction_params params
			[
				["_target",objNull,[objNull]],
				["_caller",objNull,[objNull]],
				["_actionID",10,[123]],
				["_arguments",[],[[]]]
			];

			//unwrap 'arguments' argument :)
			_arguments params["_a0","_a1","_a2","_a3","_a4","_a5","_a6","_a7","_a8","_a9","","_title","_iconIdle","_iconProgress","","","","","","_codeInterrupted"];

			[_target,_caller,_actionID,_arguments] call _codeInterrupted;
			[_target,_actionID,_title,_iconIdle,TEXTURES_PROGRESS,0] call bis_fnc_holdAction_showIcon;
		};

		terminate bis_fnc_holdAction_scriptHandle;
		waitUntil{scriptDone bis_fnc_holdAction_scriptHandle};

		bis_fnc_holdAction_running = false;
	};
	*/

	//check if another hold action is running, if so terminate the new hold action execution
	if (!isNil "bis_fnc_holdAction_scriptHandle" && {!scriptDone bis_fnc_holdAction_scriptHandle}) exitWith {};

	bis_fnc_holdAction_params = _this;
	bis_fnc_holdAction_scriptHandle = _this spawn
	{
		//unwrap arguments supplied by addAction command
		params
		[
			["_target",objNull,[objNull]],
			["_caller",objNull,[objNull]],
			["_actionID",10,[123]],
			["_arguments",[],[[]]]
		];

		private _this = _caller;	//needed for conditions, there _caller is refferenced as _this for some legacy reason ;(

		//disable player's action menu
		{inGameUISetEventHandler [_x, "true"]} forEach ["PrevAction", "NextAction"];

		//unwrap 'arguments' argument :)
		_arguments params["_a0","_a1","_a2","_a3","_a4","_a5","_a6","_a7","_a8","_a9","_target","_title","_iconIdle","_iconProgress","_condShow","_condProgress","_codeStart","_codeProgress","_codeCompleted","_codeInterrupted","_duration","_removeCompleted"];

		//retype conditions from string to code
		private _condProgressCode = compile _condProgress;

		//play transition-in animation
		for "_i" from 0 to FRAME_MAX_IN do
		{
			sleep 0.05;

			//update icon
			[_target,_actionID,_title,_iconIdle,TEXTURES_IN,_i] call bis_fnc_holdAction_showIcon;
		};

		//execute supplied 'on start' action code
		[_target,_caller,_actionID,_arguments] call _codeStart;

		//progress init
		private _frame = 0;
		private _timeStart = time;
		private _timeNextStep = time;
		private _stepDuration = _duration / FRAME_MAX_PROGRESS;

		//handle progress
		while {call _condProgressCode && {_frame < FRAME_MAX_PROGRESS}} do
		{
			_timeNextStep = _timeStart + (_frame * _stepDuration);

			waitUntil
			{
				time >= _timeNextStep || {(inputAction "Action" < 0.5 && {inputAction "ActionContext" < 0.5}) || {visibleMap || {!(call _condProgressCode)}}}
			};

			//exit if progression failed - key was released or condition was not fulfiled
			if (time < _timeNextStep) exitWith
			{
				/*
				["[x] inputAction 'Action' : %1",inputAction "Action"] call bis_fnc_logFormat;
				["[x] inputAction 'ActionContext' : %1",inputAction "ActionContext"] call bis_fnc_logFormat;
				["[x] !(call _condProgressCode) : %1",!(call _condProgressCode)] call bis_fnc_logFormat;
				["[x] visibleMap : %1",visibleMap] call bis_fnc_logFormat;
				*/
			};

			//increment progress
			_frame = _frame + 1;

			//update icon
			[_target,_actionID,_title,_iconProgress,TEXTURES_PROGRESS,_frame] call bis_fnc_holdAction_showIcon;

			//execute supplied 'on progress' action code
			[_target,_caller,_actionID,_arguments,_frame,FRAME_MAX_PROGRESS] call _codeProgress;
		};

		//execute supplied 'completed' action code
		if (_frame == FRAME_MAX_PROGRESS) then
		{
			sleep _stepDuration;

			//play transition-out animation

			[_target,_caller,_actionID,_arguments] call _codeCompleted;

			if (_removeCompleted) then
			{
				_target removeAction _actionID;
			};
		}
		else
		{
			[_target,_caller,_actionID,_arguments] call _codeInterrupted;
		};

		//reset the progress texture
		[_target,_actionID,_title,_iconIdle,TEXTURES_PROGRESS,0] call bis_fnc_holdAction_showIcon;

		//enable player's action menu
		{inGameUISetEventHandler [_x, ""]} forEach ["PrevAction", "NextAction"];

		//reset 'running' flag
		bis_fnc_holdAction_running = false;
	};
};

//inject custom code to _condStart to allow for the idle animation
if (_iconIdle isEqualType "") then
{
	_condShow = format["_eval = %1; [""%2"",""%3"",""%4""] call bis_fnc_holdAction_animationTimerCode; _eval",_condShow,_title,_iconIdle,_hint];
}
else
{
	_condShow = format["_eval = %1; [""%2"",%3,""%4""] call bis_fnc_holdAction_animationTimerCode; _eval",_condShow,_title,_iconIdle,_hint];
};

//add the action
private _actionID = _target addAction [_title, _codeInit, _arguments, _priority, ACTION_SHOW_WINDOW, ACTION_HIDE_ON_USE, ACTION_SHORTCUT, _condShow, ACTION_DISTANCE, _showUnconscious, ""];

//set the initial state to frame 0
[_target,_actionID,_title,_iconIdle,TEXTURES_IDLE,0] call bis_fnc_holdAction_showIcon;

_actionID