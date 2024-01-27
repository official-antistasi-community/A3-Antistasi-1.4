//Vanilla - armor.hpp

class I_MRAP_03_F;
class I_MRAP_03_gmg_F;
class I_MRAP_03_hmg_F;
class O_MBT_04_cannon_F;
class O_MBT_04_command_F;

//Grey
class a3a_MRAP_03_grey_F : I_MRAP_03_F
{ 
    hiddenSelectionsTextures[] = {"a3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa","a3\data_f\vehicles\turret_co.paa"};
};
class a3a_MRAP_03_gmg_grey_F : I_MRAP_03_gmg_F
{ 
    hiddenSelectionsTextures[] = {"a3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa","a3\data_f\vehicles\turret_co.paa"};
};
class a3a_MRAP_03_hmg_grey_F : I_MRAP_03_hmg_F
{ 
    hiddenSelectionsTextures[] = {"a3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa","a3\data_f\vehicles\turret_co.paa"};
};

//Black
class a3a_MBT_04_cannon_black_F : O_MBT_04_cannon_F
{
    textureList[] = {};
    hiddenSelectionsTextures[] = {"a3\armor_f_tank\mbt_04\data\mbt_04_exterior_1_co.paa","a3\armor_f_tank\mbt_04\data\mbt_04_exterior_2_co.paa","a3\armor_f\data\camonet_csat_stripe_desert_co.paa"};
};
class a3a_MBT_04_command_black_F : O_MBT_04_command_F
{
    textureList[] = {};
    hiddenSelectionsTextures[] = {"a3\armor_f_tank\mbt_04\data\mbt_04_exterior_1_co.paa","a3\armor_f_tank\mbt_04\data\mbt_04_exterior_2_co.paa","a3\armor_f\data\camonet_csat_stripe_desert_co.paa"};
};
