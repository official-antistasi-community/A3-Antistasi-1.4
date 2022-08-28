#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3A_Events", "A3A_Templates"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "CfgSounds.hpp"
class A3A {
#if __A3_DEBUG__
    #include "CfgFunctions.hpp"
#endif
};
#if __A3_DEBUG__
    class CfgFunctions {
        class A3A {
            class debug {
                file = QPATHTOFOLDER(functions\debug);
                class prepFunctions { preInit = 1; };
                class runPostInitFuncs { postInit = 1; };
            };
        };
    };
#else
    #include "CfgFunctions.hpp"
#endif

#ifndef UseDoomGUI
    #include "defines.hpp"
    #include "dialogs.hpp"
#endif

#include "keybinds.hpp"
