class Events {
	class AIVehInit {
		/*
			This Event registry shows that the event expects two arguments, the first should be an object, the second should be a side
			both arguments are required in this case
		*/
		class params {
			// naming scheme of elements: _{Index}
			class _0 {
				types[] = {"OBJECT"}; //valid types, if optional then nil is also valid, Note: "ANY" allow all data types
				optional = 0; //if this param is not required
			};
			class _1 {
				types[] = {"SIDE"}; //valid types, if optional then nil is also valid
				optional = 0; //if this param is not required
			};
		};
	};
};
