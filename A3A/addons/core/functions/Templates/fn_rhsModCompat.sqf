////////////////////////////////////
//RHS WEAPON ATTACHMENTS REDUCER ///
////////////////////////////////////
lootAttachment = lootAttachment select {getText (configfile >> "CfgWeapons" >> _x >> "author") == "Red Hammer Studios"};
allLightAttachments = allLightAttachments select {getText (configfile >> "CfgWeapons" >> _x >> "author") == "Red Hammer Studios"};
allLaserAttachments = allLaserAttachments select {getText (configfile >> "CfgWeapons" >> _x >> "author") == "Red Hammer Studios"};
