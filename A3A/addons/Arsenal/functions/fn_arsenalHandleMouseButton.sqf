
params["_event", "_params"];
_params params ["_displayOrControl", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
switch(_event) do {
    case("down"):
    {
        A3A_Arsenal_Buttons set [_button, [_xPos, _yPos]];
    };

    case("up"):
    {
        A3A_Arsenal_Buttons set [_button, []];
    };
};
