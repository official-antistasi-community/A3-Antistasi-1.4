
["CUBEGO", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
["BOBGO", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
Cube setPosASL (Water_FinalArray#0);
t1 = time;
t2 = time + 250;
TIA_CurBSphere = (Water_FinalArray#1);
TIA_CurBSphreI = 1;
["CUBEGO", "onEachFrame", 
{
	



	private _BPos = getposASL Cube;
	private _BPos2 = TIA_CurBSphere;
	private _LinearConversion = linearConversion [t1,t2,time,0,1];
	Cube setVelocityTransformation 
	[
		[(_BPos#0),(_BPos#1),(_BPos#2)],
		[(_BPos2#0),(_BPos2#1),(_BPos2#2)],
		(velocity Cube),
		(velocity Cube),
		[0,0,0],
		[0,0,0],
		[0,0,0],
		[0,0,0],
		_LinearConversion
	];
	if (Cube distance2D TIA_CurBSphere < 10) then {TIA_CurBSphreI = TIA_CurBSphreI + 1;TIA_CurBSphere=Water_FinalArray#TIA_CurBSphreI;t1=time;t2=time+250;};

	
	
}] call BIS_fnc_addStackedEventHandler;


sleep 1;




Bob setpos (Water_FinalArray#0);
Var = 0;
TIA_CurBSphere = (Water_FinalArray#1);
TIA_CurBSphreI = 1;
["BOBGO", "onEachFrame", 
{
	



	private _BPos = getposASL Bob;
	private _BPos2 = getposASL Cube;
	private _LinearConversion = linearConversion [25,100,(Bob distance2D Cube),0,1,true];
	Bob setVelocityTransformation 
	[
		[(_BPos#0),(_BPos#1),((_BPos#2)-0.005)],
		[(_BPos2#0),(_BPos2#1),((_BPos2#2)-0.005)],
		(velocity Bob),
		(velocity Bob),
		[0,0,0],
		[0,0,0],
		[0,0,0],
		[0,0,0],
		0.01
	];
	private _BobDir = getdir Bob;
	private _GoDir = Bob getDir Cube;	
	if (_BobDir < _GoDir) then {Bob setdir (_BobDir + 0.35);};
	if (_BobDir > _GoDir) then {Bob setdir (_BobDir - 0.35);};
	Bob sendSimpleCommand "FAST";	
	
	
}] call BIS_fnc_addStackedEventHandler;


