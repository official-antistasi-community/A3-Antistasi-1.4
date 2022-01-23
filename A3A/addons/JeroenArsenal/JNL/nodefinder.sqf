_base = cursorObject;
_basePos = getPosWorld _base;
_array2 =[getText (configfile >> "CfgVehicles" >> typeOf _base >> "model")];
_array1 = [];
_locBase = getPosWorld  _base;
{
 _offset = (getPosWorld  _x) vectorDiff _basePos;
 _dir = vectorDir _x;
 _up = vectorUp _x;
 _tex = getObjectTextures _x;
 _array1 pushBack [1, _offset, []];
}foreach (attachedObjects _base);
_array2 pushBack _array1;
copyToClipboard str _array2;