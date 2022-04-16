class Extended_PreInit_EventHandlers 
{
    class VCom_init_event 
	{
		preinit = 1;
        init = "call compile preprocessFileLineNumbers QPATHTOFOLDER(vcomai\Functions\VCM_Functions\fn_CBASettings.sqf);";
    };
};