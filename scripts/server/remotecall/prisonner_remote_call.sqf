params [ "_unit" ];
private [ "_intel_yield", "_combat_readiness_yield", "_resistance_prisonner_intel_yield", "_csat_prisonner_intel_yield","_resistance_combat_readiness_yield","_csat_combat_readiness_yield"];

_resistance_prisonner_intel_yield = 5;
_csat_prisonner_intel_yield = 10;
_resistance_combat_readiness_yield = 2;
_csat_combat_readiness_yield = 3;

if ( isServer ) then {
	_intel_yield = _csat_prisonner_intel_yield;
	if ( ( typeof _unit ) in all_resistance_troops ) then {
		_intel_yield = _resistance_prisonner_intel_yield;
	};
	resources_intel = resources_intel + ( _intel_yield + (round (random _intel_yield)));
	
	_combat_readiness_yield = _csat_combat_readiness_yield;
	if ( ( typeof _unit ) in all_resistance_troops ) then {
		_combat_readiness_yield = _resistance_combat_readiness_yield;
	};
	combat_readiness = combat_readiness - ( _resistance_combat_readiness_yield );
	stats_prisonners_captured = stats_prisonners_captured + 1;

	[ 0 ] remoteExec ["remote_call_intel" , -2];
};
