private _fn_checkDistance = {
	scopeName "a";
	params ["_limitDistance","_units","_obj" , ["_bool", true]];
	private _units = _units select {((_x distance _obj) < _limitDistance) && isPlayer _x};
	if(count(_units) > 0) exitWith { false };
	if(count(GRLIB_all_fobs) > 0 || (_x distance lhd < GRLIB_fob_range)) then {
		private _nearfobdist = _obj distance ([_obj] call F_getNearestFob);
		if((_bool && (_nearfobdist < GRLIB_fob_range)) || (!_bool && (_nearfobdist > GRLIB_fob_range)) || (_x distance lhd < GRLIB_fob_range)) exitWith { true breakOut "a" };
	};
	false
};

ULSAN_FOG = true;

private _playerUnit = 0;
private _WeaponHolder = [];
private _StaticWeapon = [];
private _Ruins = [];
private _veh = 0;

while{ true } do {
	_playerUnit = allPlayers;
	
	sleep 600;
	
	if(ULSAN_FOG) then {
		5 setFog [0, 0, 0];
	};

	{
		_veh = _x;
		{_veh deleteVehicleCrew _x} forEach crew _veh;
		deleteVehicle _x;
		sleep 0.5;
	} forEach (allDead-allDeadMen);

	{
		deleteVehicle _x;
		sleep 0.5;
	} forEach allDeadMen;

	{
		if(!(isPlayer _x) && (surfaceIsWater position _x) && ((getPosASL _x) select 2) < 1) then {
			deleteVehicle _x;
			sleep 0.5;
		};
	} forEach allUnits;

	{
		if([1500,_playerUnit,_x,false] call _fn_checkDistance && count ( crew _x ) == 0 && ( _x distance lhd > GRLIB_fob_range )) then {
			_x setVariable [ "GRLIB_empty_vehicle_ticker", ( _x getVariable [ "GRLIB_empty_vehicle_ticker", 0 ] ) + 1 ];
		}
		else{
			_x setVariable  [ "GRLIB_empty_vehicle_ticker", 0 ];
		};
		if((_x getVariable [ "GRLIB_empty_vehicle_ticker", 0 ]) > 8) then {
			deleteVehicle _x;
		};
		sleep 0.5;
	} forEach vehicles;

	{
    	if([200,_playerUnit,_x] call _fn_checkDistance) then {
			deleteVehicle _x;
		};
	} forEach ((allMissionObjects "") select { typeOf _x in ["ACE_envelope_big","ACE_envelope_small"]});

	_WeaponHolder = allMissionObjects "WeaponHolder";
	diag_log format["WeaponHolder : %1", _WeaponHolder];
	{
		if([200,_playerUnit,_x] call _fn_checkDistance) then {
			deleteVehicle _x;
			sleep 0.5;
		};
	} forEach _WeaponHolder;

	{
		if([600,_playerUnit,_x] call _fn_checkDistance) then {
			deleteVehicle _x;
		};
	} forEach allMines;
	
	_StaticWeapon = allMissionObjects "StaticWeapon";
	diag_log format["StaticWeapon : %1", _StaticWeapon];
	{
		if(!(alive _x)) then {
			deleteVehicle _x;
			sleep 0.5;
		};
	} forEach _StaticWeapon;
	
	_Ruins = allMissionObjects "Ruins";
	diag_log format["Ruins : %1", _Ruins];
	{
		if([1000,_playerUnit,_x] call _fn_checkDistance) then {
			deleteVehicle _x;
			sleep 0.5;
		};
	} forEach _Ruins;
	
	{
		if ((_x distance [0,0,0]) < 1) then {
			deleteVehicle _x;
		};
	} forEach (allMissionObjects "EmptyDetector");
	
	{
		if (count(units _x) == 0) then { 
        	deleteGroup _x;
		};
	} forEach allGroups;
	
	diag_log "Cleaner Done.";
};
