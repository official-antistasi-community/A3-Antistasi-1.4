/* Main display IDD & IDC's */
#define MENU_IDD 2900
#define INFANTRY_SLIDER 2901
#define INFANTRY_EDIT 2902
#define GROUND_SLIDER 2911
#define GROUND_EDIT 2912
#define AIR_SLIDER 2921
#define AIR_EDIT 2922
#define OBJECT_SLIDER 2941
#define OBJECT_EDIT 2942
#define DRONE_SLIDER 2951
#define DRONE_EDIT 2952
#define TERRAIN_NONE 2950
#define GUI_GRID_CENTER_WAbs        ((safezoneW / safezoneH) min 1.2)
#define GUI_GRID_CENTER_HAbs        (GUI_GRID_CENTER_WAbs / 1.2)
#define GUI_GRID_CENTER_W        (GUI_GRID_CENTER_WAbs / 40)
#define GUI_GRID_CENTER_H        (GUI_GRID_CENTER_HAbs / 25)
#define GUI_GRID_CENTER_X        (safezoneX + (safezoneW - GUI_GRID_CENTER_WAbs)/2)
#define GUI_GRID_CENTER_Y        (safezoneY + (safezoneH - GUI_GRID_CENTER_HAbs)/2)
#define ST_LEFT           0x00
#define ST_MULTI          0x10
#define SEL(ARRAY,INDEX) (ARRAY select INDEX)

/* Save / Load Manager */
#define MANAGER_GROUP 2999
#define SAVELOAD_GROUP 3000
#define SAVES_LIST 3001
#define SLOT_NAME 3002

/* Namespace Macros */
#define SVAR_MNS missionNamespace setVariable
#define SVAR_UINS uiNamespace setVariable
#define SVAR_PNS profileNamespace setVariable
#define GVAR_MNS missionNamespace getVariable
#define GVAR_UINS uiNamespace getVariable
#define GVAR_PNS profileNamespace getVariable

/* Condition Macros */
#define EQUAL(condition1,condition2) condition1 isEqualTo condition2

/* Display Macros */
#define CONTROL(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define CONTROL_DATA(ctrl) (lbData[ctrl,lbCurSel ctrl])
#define CONTROL_DATAI(ctrl,index) ctrl lbData index