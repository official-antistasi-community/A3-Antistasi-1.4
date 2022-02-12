#define ACTIONINTERNAL(type) "["##type##", _this] call A3A_fnc_keyActions"
#define ACTION(type) ACTIONINTERNAL(QGVAR(type))
class CfgUserActions {
    class GVAR(battleMenu) {
        displayName = "Battle menu";
        tooltip = "Open Antistasis battle menu";
        onActivate = ACTION(battleMenu);
    };

    class GVAR(artyMenu) {
        displayName = "Artillery menu";
        tooltip = "Open Antistasis artillery support menu (commander only)";
        onActivate = ACTION(artyMenu);
    };

    class GVAR(infoBar) {
        displayName = "Toggle info bar";
        tooltip = "Toggle visability of Antistasis information bar at the top of the screen";
        onActivate = ACTION(infoBar);
    };

    class GVAR(earPluggs) {
        displayName = "Toggle ear pluggs";
        tooltip = "Toggle use of ear pluggs (no effect when using ace)";
        onActivate = ACTION(earPluggs);
    };
};
#undef ACTION
