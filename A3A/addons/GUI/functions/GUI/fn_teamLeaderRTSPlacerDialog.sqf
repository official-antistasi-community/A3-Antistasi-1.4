private _display = findDisplay A3A_IDD_TEAMLEADERDIALOG;
private _buildControlsGroup = _display displayCtrl A3A_IDC_TEAMLEADERBUILDINGGROUP;

private _buildableObjects = ["Land_Bunker_01_tall_F", "Land_BagBunker_01_small_green_F", "Land_Tyres_F", "Land_SandbagBarricade_01_half_F", "Land_Barricade_01_4m_F", "Flag_AAF_F"];
private _debugArray = [];


{
	private _className = _x;
	private _configClass = configFile >> "CfgVehicles" >> _className;
	private _displayName = getText (_configClass >> "displayName");
	private _editorPreview = getText (_configClass >> "editorPreview");
	
	//prevent bad editor previews
	if (!fileExists _editorPreview) then {};
	
	
	private _itemXpos = 7 * GRID_W + ((7 * GRID_W + 44 * GRID_W) * (_forEachIndex));
	private _itemYpos = 0;

	private _itemControlsGroup = _display ctrlCreate ["A3A_ControlsGroupNoScrollbars", -1, _buildControlsGroup];
	_itemControlsGroup ctrlSetPosition[_itemXpos, _itemYpos, 44 * GRID_W, 26 * GRID_H];
	_itemControlsGroup ctrlSetFade 1;
	_itemControlsGroup ctrlCommit 0;

	private _previewPicture = _display ctrlCreate ["A3A_Picture", A3A_IDC_TEAMLEADERBUILDIMAGEPREVIEW, _itemControlsGroup];
	_previewPicture ctrlSetPosition [0, 0, 44 * GRID_W, 25 * GRID_H];
	_previewPicture ctrlSetText _editorPreview;
	_previewPicture ctrlCommit 0;
	
	
	_debugArray pushBack [_className, _itemXpos, _itemYpos, _itemControlsGroup, _previewPicture];	
	
	
} forEach _buildableObjects;

copyToClipboard str _debugArray;