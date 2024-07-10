GRLIB_save_key = "240706";	// change this value if you want different savegames on different map

GRLIB_side_friendly = WEST;
GRLIB_side_enemy = EAST;
GRLIB_side_resistance = RESISTANCE;
GRLIB_side_civilian = CIVILIAN;
GRLIB_respawn_marker = "respawn_west";
GRLIB_color_friendly = "ColorBLUFOR";
GRLIB_color_enemy = "ColorOPFOR";
GRLIB_color_enemy_bright = "ColorRED";

GRLIB_sector_size = 1000;
GRLIB_capture_size = 200;
GRLIB_radiotower_size = 2000;
GRLIB_recycling_percentage = 0.80;
GRLIB_endgame = 0;
GRLIB_vulnerability_timer = 600;
GRLIB_defended_buildingpos_part = 0.4;
GRLIB_sector_military_value = 3;
GRLIB_secondary_objective_impact = 0.8; // useless by now, directly controlled by their scripts.
GRLIB_blufor_cap = 10								* GRLIB_unitcap;
GRLIB_sector_cap = 200								* GRLIB_unitcap;
GRLIB_battlegroup_cap = 48							* GRLIB_unitcap;
GRLIB_patrol_cap = 48								* GRLIB_unitcap;
GRLIB_battlegroup_size = 6							* (sqrt GRLIB_unitcap) * (sqrt GRLIB_csat_aggressivity);
GRLIB_civilians_amount = 1							* GRLIB_civilian_activity;
GRLIB_fob_range = 100;
GRLIB_cleanup_delay = 600;
GRLIB_surrender_chance = 61;
GRLIB_secondary_missions_costs = [ 30, 75, 30 ];
GRLIB_civ_killing_penalty = 500;

if ( GRLIB_blufor_cap > 10 ) then { GRLIB_blufor_cap = 10 }; // Don't forget that the human commander manages those, not the server

GRLIB_offload_diag = false;
