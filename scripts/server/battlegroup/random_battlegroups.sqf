private [ "_sleeptime", "_countplayers" ];

sleep ( 1800 / GRLIB_csat_aggressivity );

while { GRLIB_csat_aggressivity > 0.9 && GRLIB_endgame == 0 } do {

	_sleeptime =  (3600 + (random 1800)) / (([] call  F_adaptiveOpforFactor) * GRLIB_csat_aggressivity);

	if ( combat_readiness >= 50 ) then { _sleeptime = _sleeptime * 0.8 };
	if ( combat_readiness >= 75 ) then { _sleeptime = _sleeptime * 0.8 };
	if ( combat_readiness >= 100 ) then { _sleeptime = _sleeptime * 0.8 };
	if ( combat_readiness >= 125 ) then { _sleeptime = _sleeptime * 0.8 };

	sleep _sleeptime;

	if ( !isNil "GRLIB_last_battlegroup_time" ) then {
		waitUntil { sleep 5; time > ( GRLIB_last_battlegroup_time + ( 1800 / GRLIB_csat_aggressivity ) ) };
	};

	if ( (count allPlayers >= (15 / GRLIB_csat_aggressivity) ) && ([] call F_opforCap < GRLIB_battlegroup_cap) && (combat_readiness >= 70) && (diag_fps > 20.0))  then {
		[] spawn spawn_battlegroup;
	};
};