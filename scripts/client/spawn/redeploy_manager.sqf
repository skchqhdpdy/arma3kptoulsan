choiceslist = [];
fullmap = 0;
_old_fullmap = 0;
_standard_map_pos = [];
_frame_pos = [];

GRLIB_force_redeploy = false;

waitUntil { !isNil "GRLIB_all_fobs" };
waitUntil { !isNil "blufor_sectors" };
waitUntil { !isNil "save_is_loaded" };

_spawn_str = "";

waitUntil { !isNil "introDone" };
waitUntil { introDone };
waitUntil { !isNil "cinematic_camera_stop" };
waitUntil { cinematic_camera_stop };

_basenamestr = "BASE CHIMERA";

while { true } do {
	waitUntil {
		sleep 0.1;
		( GRLIB_force_redeploy || (player distance (getmarkerpos GRLIB_respawn_marker) < 50) ) && vehicle player == player && alive player && !dialog && howtoplay == 0
	};

	fullmap = 0;
	_old_fullmap = 0;

	GRLIB_force_redeploy = false;

	if ( !GRLIB_fatigue ) then {
		player enableStamina false;
	};
	player setCustomAimCoef 0.35;
	player setUnitRecoilCoefficient 0.6;

	_dialog = createDialog "liberation_deploy";
	deploy = 0;
	_oldsel = -999;

	showCinemaBorder false;
	camUseNVG false;
	respawn_camera = "camera" camCreate (getposASLW lhd);
	respawn_object = "Sign_Arrow_Blue_F" createVehicleLocal (getposASLW lhd);
	respawn_object hideObject true;
	respawn_camera camSetTarget respawn_object;
	respawn_camera cameraEffect ["internal","back"];
	respawn_camera camcommit 0;

	waitUntil { dialog };

	((findDisplay 5201) displayCtrl 201) ctrlAddEventHandler [ "mouseButtonDblClick" , { deploy = 1; } ];

	_standard_map_pos = ctrlPosition ((findDisplay 5201) displayCtrl 251);
	_frame_pos = ctrlPosition ((findDisplay 5201) displayCtrl 198);

	_saved_loadouts = profileNamespace getVariable "bis_fnc_saveInventory_data";
	_loadouts_data = [];
	_counter = 0;
	if ( !isNil "_saved_loadouts" ) then {
		{
			if ( _counter % 2 == 0 ) then {
				_loadouts_data pushback _x;
			};
			_counter = _counter + 1;
		} foreach _saved_loadouts;
	};

	lbAdd [ 203, "--"] ;
	{ lbAdd [ 203, _x ]; } foreach _loadouts_data;
	lbSetCurSel [ 203, 0 ];

	while { dialog && alive player && deploy == 0} do {
		choiceslist = [ [ _basenamestr, getpos lhd ] ];
		{
			choiceslist pushBack [format [ "FOB %1 - %2", (military_alphabet select _forEachIndex), mapGridPosition _x ], _x];
		} forEach GRLIB_all_fobs;

		_mobile_hqs = call F_getMobileRespawns;

		{
			choiceslist pushBack [format [ "%1 - %2", localize "STR_MOBILE_HQ",mapGridPosition (getpos _x) ], getpos _x, _x];
		} forEach _mobile_hqs;

		lbClear 201;
		{
			lbAdd [201, (_x select 0)];
		} foreach choiceslist;

		if ( lbCurSel 201 == -1 ) then {
			lbSetCurSel [201,0];
		};

		if ( lbCurSel 201 != _oldsel ) then {
			_oldsel = lbCurSel 201;
			_objectpos = [0,0,0];
			if ( dialog ) then {
				_objectpos = ((choiceslist select _oldsel) select 1);
			};
			if ( surfaceIsWater _objectpos) then {
				respawn_object setposasl [_objectpos select 0, _objectpos select 1, 15];
			} else {
				respawn_object setpos ((choiceslist select _oldsel) select 1);
			};
			_startdist = 120;
			_enddist = 120;
			_alti = 35;
			if ( dialog ) then {
				if (((choiceslist select (lbCurSel 201)) select 0) == "BLUFOR LHD") then {
					_startdist = 200;
					_enddist = 300;
					_alti = 30;
				};
			};

			"spawn_marker" setMarkerPosLocal (getpos respawn_object);
			ctrlMapAnimClear ((findDisplay 5201) displayCtrl 251);
			private _transition_map_pos = getpos respawn_object;
			private _fullscreen_map_offset = 4000;
			if(fullmap % 2 == 1) then {
				_transition_map_pos = [(_transition_map_pos select 0) - _fullscreen_map_offset,  (_transition_map_pos select 1) + (_fullscreen_map_offset * 0.75), 0];
			};
			((findDisplay 5201) displayCtrl 251) ctrlMapAnimAdd [0, 0.3,_transition_map_pos];
			ctrlMapAnimCommit ((findDisplay 5201) displayCtrl 251);

			respawn_camera camSetPos [(getpos respawn_object select 0) - 70, (getpos respawn_object select 1) + _startdist, (getpos respawn_object select 2) + _alti];
			respawn_camera camcommit 0;
			respawn_camera camSetPos [(getpos respawn_object select 0) - 70, (getpos respawn_object select 1) - _enddist, (getpos respawn_object select 2) + _alti];
			respawn_camera camcommit 90;
		};

		if ( _old_fullmap != fullmap ) then {
			_old_fullmap = fullmap;
			if ( fullmap % 2 == 1 ) then {
				((findDisplay 5201) displayCtrl 251) ctrlSetPosition [ (_frame_pos select 0) + (_frame_pos select 2), (_frame_pos select 1), (0.6 * safezoneW), (_frame_pos select 3)];
			} else {
				((findDisplay 5201) displayCtrl 251) ctrlSetPosition _standard_map_pos;
			};
			((findDisplay 5201) displayCtrl 251) ctrlCommit 0.2;
			_oldsel = -1;
		};

		uiSleep 0.1;
	};

	if (dialog && deploy == 1) then {
		_idxchoice = lbCurSel 201;
		_spawn_str = (choiceslist select _idxchoice) select 0;

		if (((choiceslist select _idxchoice) select 0) == _basenamestr) then {
			player setpos ((getpos lhd) getPos [ random 6, random 360 ]);
		} else {
			if (count (choiceslist select _idxchoice) == 3) then {
				_truck = (choiceslist select _idxchoice) select 2;
				player setpos (_truck getPos ([ 5 + (random 3), random 360]));
			} else {
				_destpos = ((choiceslist select _idxchoice) select 1);
				player setpos [((_destpos select 0) + 5) - (random 10),((_destpos select 1) + 5) - (random 10),0];
			};
		};

		if ( (lbCurSel 203) > 0 ) then {
			[ player, [ profileNamespace, _loadouts_data select ((lbCurSel 203) - 1) ] ] call bis_fnc_loadInventory;
		};
	};

	respawn_camera cameraEffect ["Terminate","back"];
	camDestroy respawn_camera;
	deleteVehicle respawn_object;
	camUseNVG false;
	"spawn_marker" setMarkerPosLocal markers_reset;

	if (dialog) then {
		closeDialog 0;
	};

	if (alive player && deploy == 1) then {
		[_spawn_str] spawn spawn_camera;
	};
};
