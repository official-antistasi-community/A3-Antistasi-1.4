class A3A_FactionSelectorDialog: A3A_DefaultDialog {
	idd = A3A_IDD_FACTIONSELECTORDIALOG;
	onLoad = "[""onLoad""] spawn A3A_fnc_factionSelectorDialog";

	class Controls {
		class TitlebarText: A3A_TitlebarText {
			idc = -1;
			text = "Faction Selector";
			x = DIALOG_X;
			y = DIALOG_Y - 5 * GRID_H;
			w = DIALOG_W * GRID_W;
			h = 5 * GRID_H;
		};

		class CloseButton: A3A_CloseButton {
    		idc = -1;
    		x = DIALOG_X + DIALOG_W * GRID_W - 5 * GRID_W;
    		y = DIALOG_Y - 5 * GRID_H;
    	};


		class MainContent: A3A_DefaultControlsGroup {
			idc = A3A_IDC_FACTIONSELECTORMAIN;

			class Controls {
				
				class RebelsLabel: A3A_SectionLabelRight {
					idc = -1;
					text = "Rebels";
					x = 4 * GRID_W;
					y = 4 * GRID_H;
					w = 35 * GRID_W;
					h = 4 * GRID_H;
				};

        		class RebelsListBox: A3A_Listbox {
					idc = A3A_IDC_REBELSLISTBOX;
					rowHeight = GUI_TEXT_SIZE_SMALL;
					sizeEx = GUI_TEXT_SIZE_SMALL;
                    x = 4 * GRID_W;
                    y = 8 * GRID_H;
                    w = 35 * GRID_W;
                    h = 35 * GRID_H;
				};

				class OccupantsLabel: A3A_SectionLabelRight {
					idc = -1;
					text = "Occupants";
					x = 43 * GRID_W;
					y = 4 * GRID_H;
					w = 35 * GRID_W;
					h = 4 * GRID_H;
				};

				class OccupantsListBox: A3A_Listbox {
					idc = A3A_IDC_OCCUPANTSLISTBOX;
					rowHeight = GUI_TEXT_SIZE_SMALL;
					sizeEx = GUI_TEXT_SIZE_SMALL;
                    x = 43 * GRID_W;
                    y = 8 * GRID_H;
                    w = 35 * GRID_W;
                    h = 35 * GRID_H;
				};

				class InvadersLabel: A3A_SectionLabelRight {
					idc = -1;
					text = "Invaders";
					x = 82 * GRID_W;
					y = 4 * GRID_H;
					w = 35 * GRID_W;
					h = 4 * GRID_H;
				};

				class InvadersListBox: A3A_Listbox {
					idc = A3A_IDC_INVADERSLISTBOX;
					rowHeight = GUI_TEXT_SIZE_SMALL;
					sizeEx = GUI_TEXT_SIZE_SMALL;
                    x = 82 * GRID_W;
                    y = 8 * GRID_H;
                    w = 35 * GRID_W;
                    h = 35 * GRID_H;
				};

				class CiviliansLabel: A3A_SectionLabelRight {
					idc = -1;
					text = "Civilians";
					x = 121 * GRID_W;
					y = 4 * GRID_H;
					w = 35 * GRID_W;
					h = 4 * GRID_H;
				};

				class CiviliansListBox: A3A_Listbox {
					idc = A3A_IDC_CIVILIANSLISTBOX;
					rowHeight = GUI_TEXT_SIZE_SMALL;
					sizeEx = GUI_TEXT_SIZE_SMALL;
                    x = 121 * GRID_W;
                    y = 8 * GRID_H;
                    w = 35 * GRID_W;
                    h = 35 * GRID_H;
				};

				class AddonPacksLabel: A3A_SectionLabelRight {
					idc = -1;
					text = "Addon Packs";
					x = 4 * GRID_W;
					y = 51 * GRID_H;
					w = 74 * GRID_W;
					h = 4 * GRID_H;
				};

				class AddonPacksText: A3A_StructuredText {
					idc = A3A_IDC_ADDONPACKSTEXT;
					colorBackground[] = A3A_COLOR_BACKGROUND;
					x = 4 * GRID_W;
					y = 55 * GRID_H;
					w = 74 * GRID_W;
					h = 41 * GRID_H;
				};

				class InfoLabel: A3A_SectionLabelRight {
					idc = -1;
					x = 82 * GRID_W;
					y = 51 * GRID_H;
					w = 35 * GRID_W;
					h = 4 * GRID_H;
				};

				class InfoText: A3A_StructuredText {
					idc = A3A_IDC_INFOTEXT;
					colorBackground[] = A3A_COLOR_BACKGROUND;
					text = "Info";
					x = 82 * GRID_W;
					y = 55 * GRID_H;
					w = 35 * GRID_W;
					h = 41 * GRID_H;
				};

				class SelectFactionsButton: A3A_Button{
                    idc = A3A_IDC_SELECTFACTIONSBUTTON;
                    text = "Select Factions";
                    onButtonClick = "";
                    x = 121 * GRID_W;
                    y = 55 * GRID_H;
                    w = 35 * GRID_W;
                    h = 10 * GRID_H;
                };
      		};
		};
	};

};