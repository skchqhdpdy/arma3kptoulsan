if (isServer) then {

	params [ "_liberated_sector" ];

	_combat_readiness_increase = 0;


	if ( _liberated_sector in sectors_bigtown ) then {
		_combat_readiness_increase = (10 + floor (random 15)) * GRLIB_difficulty_modifier;
	};

	if ( _liberated_sector in sectors_capture ) then {
		_combat_readiness_increase = (1 + floor (random 4)) * GRLIB_difficulty_modifier;
	};

	if ( _liberated_sector in sectors_military ) then {
		_combat_readiness_increase = (2 + (floor (random 5))) * GRLIB_difficulty_modifier;
	};

	if ( _liberated_sector in sectors_factory ) then {
		_combat_readiness_increase = (1 + (floor (random 4))) * GRLIB_difficulty_modifier;
	};

	if ( _liberated_sector in sectors_tower ) then {
		_combat_readiness_increase = (floor (random 3)) * GRLIB_difficulty_modifier;
	};

	if ( GRLIB_passive_income ) then {
		resources_ammo = resources_ammo + (floor (75 + (random 50)));
	};

	[_combat_readiness_increase] call F_addCombatReadiness;

	stats_readiness_earned = stats_readiness_earned + _combat_readiness_increase;
	[ _liberated_sector, 0, 0 ] remoteExec ["remote_call_sector", -2];
	reset_battlegroups_ai = true; publicVariable "reset_battlegroups_ai";

	blufor_sectors pushback _liberated_sector; publicVariable "blufor_sectors";
	stats_sectors_liberated = stats_sectors_liberated + 1;

	[] call recalculate_caps;
	[] spawn check_victory_conditions;

	sleep 1;

	trigger_server_save = true;

	sleep 45;

	if ( GRLIB_endgame == 0 ) then {
		if ( (!( _liberated_sector in sectors_tower )) && (((random (200.0 / (GRLIB_difficulty_modifier * GRLIB_csat_aggressivity) )) < (combat_readiness - 20)) || ( _liberated_sector in sectors_bigtown )) && ([] call F_opforCap < GRLIB_battlegroup_cap) ) then {
			[ _liberated_sector ] spawn spawn_battlegroup;
		};
	};
};
