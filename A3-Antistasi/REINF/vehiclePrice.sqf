private ["_tipo","_coste"];

_tipo = _this select 0;

_coste = server getVariable _tipo;

if (isNil "_coste") then
	{
	diag_log format ["Antistasi Error en vehicleprice: %!",_tipo];
	_coste = 0;
	}
else
	{
	_coste = round (_coste - (_coste * (0.1 * ({lados getVariable [_x,sideUnknown] == buenos} count puertos))));
	};

_coste