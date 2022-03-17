class Extended_PreInit_EventHandlers 
{
    class VCom_init_event 
	{
		preinit = 1;
        init = "call compile preprocessFileLineNumbers 'Vcom\Functions\VCM_Functions\fn_CBASettings.sqf';";
    };
};