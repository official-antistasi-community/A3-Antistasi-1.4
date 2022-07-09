class Events {
    class AIVehInit {
        /*
            This Event registry shows that the event expects two arguments, the first should be an object, the second should be a side
            both arguments are required in this case
        */
        isLocal = 1; //flag to show that this function is only triggered on local machine (for end user)
        class params {
            // naming scheme of elements: _{Index}
            class _0 {
                description = "Vehicle being initialized";
                types[] = {"OBJECT"}; //valid types, if optional then nil is also valid, Note: "ANY" allow all data types
                optional = 0; //if this param is not required
            };
            class _1 {
                description = "Side the vehicle belongs to";
                types[] = {"SIDE"}; //valid types, if optional then nil is also valid
                optional = 0; //if this param is not required
            };
        };
    };
    class HQPlaced {
        isLocal = 1;
        class params {
            class _0 {
                description = "Position of new HQ";
                types[] = {"ARRAY"};
                optional = 0;
            };
        };
    };
    class RebelControlCreated {
        isLocal = 1;
        class params {
            class _0 {
                description = "Marker";
                types[] = {"STRING"};
                optional = 0;
            };
            class _1 {
                description = "Is roadblock";
                types[] = {"BOOL"};
                optional = 0;
            };
        };
    };
    class markerChange {
        isLocal = 1;
        class params {
            class _0 {
                description = "Marker";
                types[] = {"String"};
                optional = 0;
            };
            class _1 {
                description = "Side of winner";
                types[] = {"SIDE"};
                optional = 0;
            };
        };
    };
    class vehicleBoxHeal {
        isLocal = 1;
        class params {
            class _0 {
                description = "Position of effect center";
                types[] = {"ARRAY"};
                optional = 0;
            };
        };
    };
    class civInit {
        isLocal = 1;
        class params {
            class _0 {
                description = "Unit being initialized";
                types[] = {"OBJECT"};
                optional = 0;
            };
        };
    };
    class civVehInit {
        isLocal = 1;
        class params {
            class _0 {
                description = "civ vehicle being initialized";
                types[] = {"OBJECT"};
                optional = 0;
            };
        };
    };
    class locationSpawned {
        isLocal = 1;
        class params {
            class _0 {
                description = "Marker";
                types[] = {"STRING"};
                optional = 0;
            };
            class _1 {
                description = "Location type";
                types[] = {"STRING"};
                optional = 0;
            };
            class _2 {
                description = "Is spawning";
                types[] = {"BOOL"};
                optional = 0;
            };
        };
    };
    class AIInit {
        isLocal = 1;
        class params {
            class _0 {
                description = "Unit being initialized";
                types[] = {"OBJECT"};
                optional = 0;
            };
            class _1 {
                description = "Side of the unit";
                types[] = {"SIDE"};
                optional = 0;
            };
            class _2 {
                description = "Marker the unit belongs to";
                types[] = {"STRING"};
                optional = 1;
            };
            class _3 {
                description = "If the unit is a spawner";
                types[] = {"BOOL"};
                optional = 0;
            };
        };
    };
    class Undercover {
        isLocal = 1;
        class params {
            class _0 {
                description = "Reason for undercover break (empty on init)";
                types[] = {"STRING"};
                optional = 1;
            };
        };
    };
/*
    class Example {
        isLocal = 1;
        class params {
            class _0 {
                description = "";
                types[] = {""};
                optional = 0;
            };
        };
    };
*/
};
