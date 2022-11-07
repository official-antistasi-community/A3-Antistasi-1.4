#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3A_GUI"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

class A3A {

#if __A3_DEBUG__
    #include "CfgFunctions.hpp"
#endif
};
#if __A3_DEBUG__
#else
    #include "CfgFunctions.hpp"
#endif

#include "..\GUI\dialogues\defines.hpp"
#include "..\GUI\dialogues\textures.inc"
#include "..\GUI\dialogues\controls.hpp"
#include "dialog\arsenalDialog.hpp"