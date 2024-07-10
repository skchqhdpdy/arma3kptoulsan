private [ "_minfobdist", "_minsectordist", "_distfob", "_clearedtobuildfob", "_distsector", "_clearedtobuildsector", "_nearbluforfob", "_nearenemysector" ];

if ( count GRLIB_all_fobs >= GRLIB_maximum_fobs ) exitWith {
	hint format [ localize "STR_HINT_FOBS_EXCEEDED", GRLIB_maximum_fobs ];
};
_minfobdist = 1000;
_distfob = 1;
_clearedtobuildfob = true;
_distsector = 1;
_clearedtobuildsector = true;

_nearbluforfob = GRLIB_all_fobs select { player distance markerpos _x < _minfobdist };
if(count _nearbluforfob > 0) then {
        _clearedtobuildfob = false;
        _distfob = player distance (_nearbluforfob select 0);
};

if(_clearedtobuildfob) then {
    _minsectordist = GRLIB_capture_size + GRLIB_fob_range;
    _nearenemysector = (sectors_allSectors - blufor_sectors) select { player distance markerpos _x < _minsectordist };
    if(count _nearenemysector != 0) exitWith {
        _clearedtobuildsector = false;
        _distsector = player distance (getmarkerpos (_nearenemysector select 0));
    };
};

if (!_clearedtobuildfob) then {
	hint format [localize "STR_FOB_BUILDING_IMPOSSIBLE",floor _minfobdist,floor _distfob];
} else {
	if ( !_clearedtobuildsector ) then {
		hint format [localize "STR_FOB_BUILDING_IMPOSSIBLE_SECTOR",floor _minsectordist,floor _distsector];
	} else {
		buildtype = 99;
		dobuild = 1;
	};
};
