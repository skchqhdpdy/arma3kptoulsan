waitUntil { !isNil "blufor_sectors" };
waitUntil { !isNil "combat_readiness" };
waitUntil { !isNil "sectors_bigtown" };
waitUntil { !isNil "active_sectors" };

while { true } do {
	if ( (count blufor_sectors) >= ((count sectors_allSectors) * 0.9)) then {
		if ( combat_readiness > 0 ) then {
			[-0.25] call F_addCombatReadiness;
		};
	} else {
		if ( (combat_readiness < ((count blufor_sectors) * 2) && combat_readiness < 25 ) ||
			(combat_readiness < ((count blufor_sectors) * 1.25) && combat_readiness < 50 )) then {
			[0.2] call F_addCombatReadiness;
			stats_readiness_earned = stats_readiness_earned + 0.2;
		};
	};

	if ( combat_readiness > 100.0 && GRLIB_difficulty_modifier < 2 ) then { combat_readiness = 100.0 };
	if ( combat_readiness > 150.0 && GRLIB_difficulty_modifier < 10 ) then { combat_readiness = 150.0 };

	sleep (480 + random (120));
};