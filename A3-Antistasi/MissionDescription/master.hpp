// In map template description.ext use:
// #include "MissionDescription\master.hpp"
// Whether order should be maintained is unknown.
#include "..\GUI\defines.hpp"
#include "..\GUI\textures.inc"
#include "..\GUI\controls.hpp"
#include "..\GUI\dialogs.hpp"
#include "..\GUI\statusBar.hpp"
#include "..\Garage\Dialogs.hpp"

author = $STR_antistasi_credits_generic_author_text;
loadScreen = "Pictures\Mission\pic.jpg"; // NB, this will resolve from root
overviewPicture = "Pictures\Mission\pic.jpg"; // NB, this will resolve from root
Keys[] = {"A3-Antistasi-is-not-available-in-single-player"};
KeysLimit = 2;  // Even if player tampers with his unlocked keys, this will never become true.

#include "debug.hpp"
#include "gameSettings.hpp"
#include "params.hpp"
#include "CfgIdentities.hpp"
#include "CfgRemoteExec.hpp"
