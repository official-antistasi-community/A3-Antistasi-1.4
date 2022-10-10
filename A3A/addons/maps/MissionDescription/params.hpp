
class Params
{
    class autoLoadLastGame
    {
        title = "Automatically load last valid save after delay";
        values[] = {-1, 60, 120, 180, 300, 600};
        texts[] = {"No automatic load","1min","2min","3min","5min","10min"};
        default = -1;
    };
    class LogLevel
    {
        title = "Logging Level during setup";
        values[] = {1,2,3,4};
        texts[] = {"Error", "Info", "Debug", "Verbose"};
        default = 3;
    };
    class A3A_logDebugConsole
    {
        title = "Log debug console use during setup";
        values[] = {-1,1,2};
        texts[] = {"None", "All non-dev", "All"};
        default = 1;
    };
};
