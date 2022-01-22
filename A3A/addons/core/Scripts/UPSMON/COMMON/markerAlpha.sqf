/* =============================================
	!R
	Hide area markers.
	
	create Game Logic Object
	put in initialization field:
	
		nul = call compile preprocessFile "scripts\UPSMON\!R\markerAlpha.sqf";

	all markers area must be named area0, area1...area13
		
================================================= */

{ _x setmarkeralpha 0; } foreach ["area0", "area1", "area2","area3","area4","area5","area6","area7","area8","area9","area10","area11","area12","area13"]; 