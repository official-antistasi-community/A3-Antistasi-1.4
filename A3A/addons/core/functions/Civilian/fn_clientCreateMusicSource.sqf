params ["_building","_musicSource","_track"];

_musicSource attachTo [_building, [1,1,1]];
hideObjectGlobal _musicSource;
_musicSource say3d _track;