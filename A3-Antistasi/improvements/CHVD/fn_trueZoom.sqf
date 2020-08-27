// Thanks to Killzone_Kid :*
// http://killzonekid.com/arma-scripting-tutorials-get-zoom/

round (
	(
		[0.5,0.5] 
		distance2D  
		worldToScreen 
		positionCameraToWorld 
		[0,3,4]
	) * (
		getResolution 
		select 5
	) / 2 * 30
) / 10