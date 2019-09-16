if (hasInterface) then {
  [] spawn A3A_fnc_loadPlayer;
};

if (!isMultiplayer) then {
  [] spawn A3A_fnc_loadServer;
};
