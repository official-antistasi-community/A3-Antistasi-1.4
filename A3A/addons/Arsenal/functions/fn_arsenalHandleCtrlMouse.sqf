

params["_event", "_params"];

switch (_event) do {
    case "mouse": {
        _params params ["_control", "_xPos", "_yPos", "_mouseOver"];
        A3A_Arsenal_Mouse = [_xPos, _yPos];
        private _cam = missionNamespace getVariable ["A3A_Arsenal_Cam", objNull];
        private _centerObject = missionNamespace getVariable ["A3A_arsenalCenterObject", player];
        private _target = missionNamespace getVariable ["A3A_Arsenal_target", player];

        A3A_ArsenalCamPos params ["_dis", "_dirH", "_dirV", "_targetPos"];
        A3A_Arsenal_Buttons params ["_LMB", "_RMB"];

        if (isnull _control) then { _LMB = [0,0] }; //--- Init
        
        if (count _LMB > 0) then 
        {
            _LMB params ["_cX", "_cY"];
            A3A_Arsenal_Buttons set [0, [_xPos, _yPos]];

            boundingboxreal _centerObject params ["_minBox", "_maxBox"];
            private _centerSizeBottom = _minBox select 2;
            private _centerSizeUp = _maxBox select 2;
            private _centerSize = sqrt ([_minBox select 0, _minBox select 1] distance2D [_maxBox select 0, _maxBox select 1]);
        
            private _z = _targetPos select 2;
            _targetPos = _targetPos getPos [(_cX - _xPos) * _centerSize, _dirH - 90];
            _z = (_z - (_cY - _yPos) * _centerSize) max _centerSizeBottom min _centerSizeUp;
            _targetPos = [0,0,0] getPos [([0,0,0] distance2D _targetPos) min _centerSize, [0,0,0] getDir _targetPos];
            _targetPos set [2, _z max ((_minBox select 2) + 0.2)];			
            
            A3A_ArsenalCamPos set [3, _targetPos];
        };

        if (count _RMB > 0) then 
        {
            _RMB params ["_cX", "_cY"];

            private _dX = (_cX - _xPos) * 0.75;
            private _dY = (_cY - _yPos) * 0.75;
            private _z = _targetPos select 2;
        
            _targetPos = [0,0,0] getPos [[0,0,0] distance2D _targetPos, ([0,0,0] getDir _targetPos) - _dX * 180];
            _targetPos set [2, _z];
        
            A3A_ArsenalCamPos set [1, (_dirH - _dX * 180) % 360];
            A3A_ArsenalCamPos set [2, (_dirV - _dY * 100) max -89 min 89];
            A3A_ArsenalCamPos set [3, _targetPos];
            A3A_Arsenal_Buttons set [1, [_xPos,_yPos]];
        };

        if (isnull _control) then { A3A_Arsenal_Buttons = [[],[]] };

        //--- Terminate when unit is dead
        if (!alive _centerObject || isnull _centerObject) then 
        {
            (ctrlparent (_this select 0)) closedisplay 2;
        };

    };
    case "mousezchanged": {
        _params params ["_displayOrControl", "_scroll"];

        private _cam = missionNamespace getVariable ["A3A_Arsenal_Cam", objNull];
        private _centerObject = missionNamespace getVariable ["A3A_arsenalCenterObject", player];
        private _target = missionNamespace getVariable ["A3A_Arsenal_target", player];

        private _disMax = ((boundingboxreal _centerObject select 0) vectordistance (boundingboxreal _centerObject select 1)) * 3;
        private _dis = A3A_ArsenalCamPos select 0;
        _dis = _dis - (_scroll * 0.1);
        _dis = _dis max (_disMax * 0.15) min _disMax;
        A3A_ArsenalCamPos set [0, _dis];
    };
    default { };
};

