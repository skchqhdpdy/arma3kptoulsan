waitUntil { time > 1 };
waitUntil { !isNil "GRLIB_all_fobs" };
waitUntil { !isNil "save_is_loaded" };

private [ "_fobbox" ];

if ( count GRLIB_all_fobs == 0 ) then {

	if ( GRLIB_build_first_fob ) then {
		_potentialplaces = [];
		{
			_nextsector = _x;
			_acceptsector = true;
			{
				if ( ( ( markerPos _nextsector ) distance ( markerPos _x ) ) < 1600 ) then {
					_acceptsector = false;
				};
			} foreach sectors_allSectors;

			if ( _acceptsector ) then {
				_potentialplaces pushBack _nextsector;
			};
		} foreach sectors_opfor;

		_spawnplace = selectRandom _potentialplaces;
		[ markerPos _spawnplace, true ] remoteExec ["build_fob_remote_call", 2];
 
	} else {
		while { count GRLIB_all_fobs == 0 } do {

			_fobbox = FOB_box_typename createVehicle (getpos base_boxspawn);
			_fobbox setpos (getpos base_boxspawn);
			_fobbox setdir 215;

			[_fobbox, 3000 ] remoteExec ["F_setMass"];

			sleep 10;

			waitUntil {
				sleep 1;
				!(alive _fobbox) || count GRLIB_all_fobs > 0
			};

			sleep 15;

		};

		deleteVehicle _fobbox;
	};
};
