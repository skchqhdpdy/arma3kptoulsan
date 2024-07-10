params["_caculate"];
combat_readiness = combat_readiness + ( _caculate );
if(combat_readiness > 100 && GRLIB_difficulty_modifier < 2) exitWith { combat_readiness = 100; };
if(combat_readiness > 150 && GRLIB_difficulty_modifier < 10) exitWith { combat_readiness = 150; };
if(combat_readiness < 0) exitWith { combat_readiness = 0; };
