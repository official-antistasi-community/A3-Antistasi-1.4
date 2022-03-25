/*
    Author: [Hazey]
    Description:
		Plays say3D sound in a multiplayer fashion.

    Arguments:
    	<Object> Building you want to attach it to.
		<Object> Object that will be the sound source
		<string> Track that will be played.

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    License: MIT License
*/

params ["_building","_musicSource","_track"];

_musicSource attachTo [_building, [1,1,1]];
hideObjectGlobal _musicSource;
_musicSource say3d _track;