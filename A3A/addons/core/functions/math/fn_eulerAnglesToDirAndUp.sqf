// convert angles to a dir and up vector


params["_rotation"];

_rotation params ["_rotX", "_rotY", "_rotZ"];

_vectorDirAndUp = [
	[
		(cos _rotY) * (sin _rotZ),
		(cos _rotX) * (cos _rotZ) + (sin _rotX) * (sin _rotY) * (sin _rotZ),
		-(sin _rotX) * (cos _rotZ) + (cos _rotX) * (sin _rotY) * (sin _rotZ)
	],
	[
		-sin _rotY, 
		(sin _rotX) * (cos _rotY), 
		(cos _rotX) * (cos _rotY)
	]];
_vectorDirAndUp