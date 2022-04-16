//Function to find all medics within a group.
private _MList = [];
{
	if (isNull objectParent _x) then
	{
		if (_x getUnitTrait "Medic") then
		{
			_MList pushBack _x;
		};
	};
	true;
} count (units _this);

_MList