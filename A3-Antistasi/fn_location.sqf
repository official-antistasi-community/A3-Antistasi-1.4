params[ "_name", "_getClass", "_return" ];

_return = "";
"
_value = switch ( _getClass ) do
    {
    case true :
        {
        if ( getText( _x >> 'name') == _name ) then
            {
            _return = configName _x;
            };
        };
    case false :
        {
        if ( configName _x == _name ) then
            {
            _return = getText( _x >> 'name' );
            };
        };
    };
"configClasses ( configFile >> "CfgWorlds" >> worldName >> "Names" );

_return
