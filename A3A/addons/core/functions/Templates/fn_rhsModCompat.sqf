////////////////////////////////////
//RHS WEAPON ATTACHMENTS REDUCER ///
////////////////////////////////////
lootAttachment = lootAttachment select {getText (configfile >> "CfgWeapons" >> _x >> "author") == "Red Hammer Studios"};
allLightAttachments = allLightAttachments select {getText (configfile >> "CfgWeapons" >> _x >> "author") == "Red Hammer Studios"};
allLaserAttachments = allLaserAttachments select {getText (configfile >> "CfgWeapons" >> _x >> "author") == "Red Hammer Studios"};

// as of 21/09/22, removes:
// 4 loot attachments out of 214
// 1 light attachment out of 12
// no laser attachments
