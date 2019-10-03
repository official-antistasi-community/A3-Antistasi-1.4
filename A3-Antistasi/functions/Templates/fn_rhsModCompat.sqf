////////////////////////////////////
//RHS WEAPON ATTACHMENTS REDUCER ///
////////////////////////////////////
lootOptic = lootOptic select {getText (configfile >> "CfgWeapons" >> _x >> "author") == "Red Hammer Studios"};
attachmentLight = attachmentLight select {getText (configfile >> "CfgWeapons" >> _x >> "author") == "Red Hammer Studios"};
attachmentLaser = attachmentLaser select {getText (configfile >> "CfgWeapons" >> _x >> "author") == "Red Hammer Studios"};
