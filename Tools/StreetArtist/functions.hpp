class A3A {
    class Model {
        class NG_navRoad_assert {};
        class NG_navRoad_connect {};
        class NG_navRoad_disconnect {};
        class NG_navRoad_getPeers {};
        class NG_navRoad_isConnected {};
        class NG_navRoadHM_assert {};
        class NG_navRoadHM_remove {};
    }
    class NavGridDraw {
        class NG_draw_connection {};
        class NG_draw_deleteAll {};
        class NG_draw_dot {};
        class NG_draw_dotOnRoads {};
        class NG_draw_islands {};
        class NG_draw_line {};
        class NG_draw_linesBetweenRoads {};
        class NG_draw_main {};
        class NG_draw_text {};
    };
    class NavGridGen {
        class NG_convert_navGridDB_navGridHM {};
        class NG_convert_navGridHM_navGridDB {};
        class NG_convert_navRoadHM_navGridHM {};
        class NG_fix_deadEnds {};
        class NG_fix_oneWays {};
        class NG_format_navGridDB {};
        class NG_init { preInit = 1; };
        class NG_main {};
        class NG_simplify_conDupe {};
        class NG_simplify_flat {};
        class NG_simplify_junc {};
    };
    class StreetArtist {
        class NGSA_action_autoRefresh {};
        class NGSA_action_changeColours {};
        class NGSA_action_changeTool {};
        class NGSA_action_refresh {};
        class NGSA_action_save {};
        class NGSA_canAddPos {};
        class NGSA_click_modeBrush {};
        class NGSA_click_modeConnect {};
        class NGSA_correctPositions {};
        class NGSA_EH_add {};
        class NGSA_getSurfaceATL {};
        class NGSA_hover_modeBrush {};
        class NGSA_hover_modeConnect {};
        class NGSA_import {};
        class NGSA_insertMiddleNode {};
        class NGSA_main {};
        class NGSA_mainDialog {};
        class NGSA_navGridHM_refresh_islandID {};
        class NGSA_node_disconnect {};
        class NGSA_onKeyDown {};
        class NGSA_onMouseClick {};
        class NGSA_onUIUpdate {};
        class NGSA_pos_add {};
        class NGSA_pos_rem {};
        class NGSA_posRegionHM_allAdjacent {};
        class NGSA_posRegionHM_generate {};
        class NGSA_posRegionHM_pixelRadius {};
        class NGSA_refreshMarkerOrder {};
        class NGSA_shouldAddMiddleNode {};
        class NGSA_toggleConnection {};
    };
    class UI {
        class customHint {};
        class customHintDrop {};
        class customHintInit { preInit = 1; };
        class customHintRender {};
        class shader_ratioToHex {};
    };
    class Utility {
        class log {};
        class systemTime_format_G {};
        class init { preInit = 1; };
    };
};

class Collections
{
    tag = "Col";
    class Collections_Array
    {
        file="Collections\Array";
        class array_deleteAts {};
        class array_displace {};
        class array_remIndices {};
        class array_toChunks {};
    };
    class Collections_ID
    {
        file="Collections\ID";
        class ID_init { preInit = 1; };
    };
    class Collections_Location
    {
        file="Collections\Location";
        class location_init { preInit = 1; };
        class location_new {};
        class location_serialiseAddress {};
    };
    class Collections_NestLoc
    {
        file="Collections\NestLoc";
        class nestLoc_get {};
        class nestLoc_rem {};
        class nestLoc_set {};
    };
};