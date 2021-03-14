class A3A {
    class NavGridPP {
        class NG_check_conExists {};
        class NG_check_oneWays {};
        class NG_convert_navGrid_navIslands {};
        class NG_convert_navGridDB_navIslands {};
        class NG_convert_navIslands_navGrid {};
        class NG_convert_navIslands_navGridDB {};
        class NG_convert_road_DBPosName {};
        class NG_convert_DBPosName_road {};
        class NG_convert_DBStruct_road {};
        class NG_draw_deleteAll {};
        class NG_draw_distanceBetweenTwoRoads {};
        class NG_draw_dotOnRoads {};
        class NG_draw_lineBetweenTwoRoads {};
        class NG_draw_linesBetweenRoads {};
        class NG_fix_deadEnds {};
        class NG_fix_oneWays {};
        class NG_format_navGridDB {};
        class NG_import {};
        class NG_main {};
        class NG_main_draw {};
        class NG_simplify_conDupe {};
        class NG_simplify_flat {};
        class NG_simplify_junc {};
    };
    class UI {
        class customHint {};
        class customHintDismiss {};
        class customHintInit {};
        class customHintRender {};
        class shader_ratioToHex {};
    };
    class Utility {
        class log {};
        class systemTime_format_G {};
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
        class ID_LArray_isEqualTo {};
        class ID_LArray {};
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
    class Collections_Serialisation_Primitives
    {
        file="Collections\Serialisation\Primitives";
        class serialise_namespace {};
    };
};