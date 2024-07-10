// This file allows you to add content to the mission without conflict issues after each update of the original classnames.sqf
// If you want more modifications to be supported by this file, let's discuss it on the forums.

// *** Intro Music, It will be played when you are being deployed ***

IntroMusic = selectrandom ["LeadTrack01_F_6th_Anniversary_Remix","LeadTrack01_F_EXP","LeadTrack01_F","LeadTrack01_F_Tank","LeadTrack01_F_Orange","LeadTrack01_F_Jets","LeadTrack01_F_Malden","MainTheme_F_Tank","LeadTrack01_F","LeadTrack01_F_Bootcamp","LeadTrack02_F_Tank","LeadTrack01_F_Heli"];

// *** SUPPORT STUFF ***

// Setting a value here will overwrite the original value found from the mission. Do that if you're doing a total conversion.
// Each of these should be unique, the same classnames for different purposes may cause various unpredictable issues with player actions. Or not. Just don't try.
FOB_typename = "Land_Bunker_01_big_F";						// Default "Land_Cargo_HQ_V1_F";
FOB_box_typename = "RHS_CH_47F_light";					// Default "B_Slingload_01_Cargo_F";
FOB_truck_typename = "rhsusf_M1078A1P2_B_D_CP_fmtv_usarmy";				// Default "B_Truck_01_box_F";
Arsenal_typename = "rhs_logo";					// Default "B_supplyCrate_F";
huron_typename = "SignAd_Sponsor_F";	// Default "B_Heli_Transport_03_unarmed_F";
ammobox_b_typename = "Box_NATO_Wps_F";	// Default "Box_NATO_AmmoVeh_F";
ammobox_o_typename = "Box_East_Wps_F";	// Default "O_T_Truck_03_ammo_ghex_F";
opfor_ammobox_transport = "rhs_kamaz5350_open_msv";			// Default "O_Truck_03_transport_F";    // Make sure this thing can transport ammo boxes (see box_transport_config down below) otherwise things will break
commander_classname = nil;				// Default "B_T_Officer_F";
crewman_classname = nil;				// Default "B_T_Soldier_F";
pilot_classname = nil;					// Default "B_T_Pilot_F";



// *** FRIENDLIES ***

// Each array below represents one page of the build menu
// Format : [ "classname", manpower, ammo, fuel ]
// Example : [ "B_APC_Tracked_01_AA_F", 0, 40, 15 ],

// If overwrite is set to true, then the extension list will entirely replace the original list defined in classnames.sqf. Otherwise it will be appended to it.
// Useful for total conversions to RHS and such, without having to alter the original file.
infantry_units_overwrite = true;
infantry_units_extension = [

/*	

//RHS
	["rhsusf_army_ocp_rifleman",0,0,0],
	["rhsusf_army_ocp_riflemanl",0,0,0],
	["rhsusf_army_ocp_aa",0,5,0],
	["rhsusf_army_ocp_javelin",0,5,0],
	["rhsusf_army_ocp_autorifleman",0,0,0],
	["rhsusf_army_ocp_machinegunner",0,0,0],
	["rhsusf_army_ocp_engineer",0,2,0],
	["rhsusf_army_ocp_medic",0,2,0],
	["rhsusf_airforce_pilot",0,0,0],
	["rhsusf_airforce_jetpilot",0,0,0],	
		
//Apex
	["B_CTRG_Soldier_M_tna_F",0,2,0],
	["B_CTRG_Soldier_Medic_tna_F",0,2,0],
	["B_CTRG_Soldier_JTAC_tna_F",0,2,0],
	["B_CTRG_Soldier_TL_tna_F",0,2,0],
	["B_CTRG_Soldier_Exp_tna_F",0,2,0],
	["B_CTRG_Soldier_LAT_tna_F",0,5,0]
*/
];

light_vehicles_overwrite = true;
light_vehicles_extension = [

	["B_Quadbike_01_F",1,0,0],
	["rhsusf_mrzr4_d",2,0,0],
	["LOP_UVF_Landrover",2,0,0],
	["LOP_UVF_Landrover_M2",2,95,0],
	["B_G_Offroad_01_F",3,0,0],
	["C_Offroad_01_covered_F",3,0,0],
	["C_Offroad_01_comms_F",3,0,0],
	["B_G_Offroad_01_armed_F",3,95,0],
	["B_G_Offroad_01_AT_F",3,135,0],
	["I_C_Offroad_02_unarmed_F",3,0,0],
	["I_C_Offroad_02_LMG_F",3,95,0],
	["I_C_Offroad_02_AT_F",3,135,0],
	["B_T_LSV_01_unarmed_F",3,0,0],
	["B_T_LSV_01_armed_F",3,95,0],
	["B_T_LSV_01_AT_F",3,135,0],
	["rhsusf_m998_d_2dr",3,0,0],
	["rhsusf_m998_d_2dr_halftop",3,0,0],
	["rhsusf_m998_d_2dr_fulltop",3,0,0],
	["rhsusf_m998_d_4dr",3,0,0],
	["rhsusf_m998_d_4dr_halftop",3,0,0],
	["rhsusf_m998_d_4dr_fulltop",3,0,0],
	["rhsusf_m966_d",3,95,0],
	["rhsusf_m1025_d",3,0,0],
	["rhsusf_m1025_d_m2",3,95,0],
	["rhsusf_m1025_d_Mk19",3,140,0],
	["rhsusf_m1151_usarmy_d",3,0,0],
	["rhsusf_m1151_m240_v1_usarmy_d",3,95,0],
	["rhsusf_m1151_m2_v1_usarmy_d",3,95,0],
	["rhsusf_m1151_m2_lras3_v1_usarmy_d",3,95,0],
	["rhsusf_m1151_mk19_v1_usarmy_d",3,135,0],
	["rhsusf_m1151_m240_v2_usarmy_d",4,95,0],
	["rhsusf_m1151_m2_v2_usarmy_d",4,95,0],
	["rhsusf_m1151_mk19_v2_usarmy_d",4,135,0],
	["rhsusf_m1151_m2_v3_usmc_d",4,95,0],
	["rhsusf_m1151_mk19_v3_usmc_d",4,95,0],
	["rhsusf_m1151_m2crows_usarmy_d",5,95,0],
	["rhsusf_m1151_mk19crows_usarmy_d",5,150,0],
	
	["B_MRAP_01_F",4,0,0],
	["B_MRAP_01_hmg_F",4,95,0],
	["B_MRAP_01_gmg_F",4,145,0],
	["Night_B_MRAP_03_F",7,0,0],
	["Night_B_MRAP_03_hmg_F",7,95,0],
	["Night_B_MRAP_03_gmg_F",7,145,0],
	
	["ulsan_retexture_strider_01",7,0,0],
	["ulsan_retexture_strider_02",7,0,0],
	
	["rhsusf_m1240a1_usarmy_d",5,0,0],
	["ulsan_retexture_m1240a",5,0,0],
	["rhsusf_m1240a1_m240_usarmy_d",5,95,0],
	["rhsusf_m1240a1_m2_usarmy_d",5,135,0],
	["rhsusf_m1240a1_mk19_usarmy_d",5,140,0],
	["rhsusf_m1245_m2crows_socom_d",5,95,0],
	["rhsusf_m1245_mk19crows_socom_d",5,150,0],
	["rhsusf_m1240a1_m240_uik_usarmy_d",6,95,0],
	["rhsusf_m1240a1_m2_uik_usarmy_d",6,95,0],
	["rhsusf_m1240a1_mk19_uik_usarmy_d",6,140,0],
	["rhsusf_m1240a1_m2crows_usarmy_d",7,95,0],
	["rhsusf_m1240a1_mk19crows_usarmy_d",7,150,0],
	["rhsusf_M1220_usarmy_d",4,0,0],
	["rhsusf_M1220_M2_usarmy_d",4,95,0],
	["rhsusf_M1230_M2_usarmy_d",4,95,0],
	["rhsusf_M1230_MK19_usarmy_d",4,150,0],
	["rhsusf_M1232_usarmy_d",5,0,0],
	["rhsusf_M1232_M2_usarmy_d",5,95,0],
	["rhsusf_M1232_MK19_usarmy_d",5,150,0],
	["rhsusf_M1237_M2_usarmy_d",5,95,0],
	["rhsusf_M1237_MK19_usarmy_d",5,150,0],
	
	["B_G_Van_02_transport_F",4,0,0],
	["B_Truck_01_transport_F",4,0,0],
	["B_Truck_01_covered_F",4,0,0],
	["rhsusf_M1078A1P2_D_fmtv_usarmy",4,0,0],
	["rhsusf_M1078A1P2_B_D_fmtv_usarmy",4,0,0],
	["rhsusf_M1078A1P2_B_M2_D_fmtv_usarmy",4,95,0],
	["rhsusf_M1083A1P2_D_fmtv_usarmy",4,0,0],
	["rhsusf_M1083A1P2_B_D_fmtv_usarmy",4,0,0],
	["rhsusf_M1083A1P2_B_M2_D_fmtv_usarmy",4,95,0],

	["rhsusf_m1165a1_gmv_m134d_m240_socom_d",7,110,0],
	["rhsusf_m1165a1_gmv_m2_m240_socom_d",7,95,0],
	["rhsusf_m1165a1_gmv_mk19_m240_socom_d",7,150,0],
	
	["C_Scooter_Transport_01_F",1,0,0],
	["B_Boat_Transport_01_F",2,50,0],
	["C_Boat_Civil_01_F",2,0,0],
	["B_SDV_01_F",3,0,0],
	["rhsgref_hidf_rhib",3,0,0],
	["B_Boat_Armed_01_minigun_F",4,240,0],
	["rhsusf_mkvsoc",6,300,0]
];

heavy_vehicles_overwrite = true;
heavy_vehicles_extension = [

	["rhsusf_m113d_usarmy_unarmed",40,0,0],
	["rhsusf_m113d_usarmy",40,100,0],
	["rhsusf_m113d_usarmy_MK19",40,140,0],
	["rhsusf_stryker_m1126_m2_d",50,105,0],
	["rhsusf_stryker_m1126_mk19_d",50,150,0],
	["rhsusf_stryker_m1127_m2_d",50,90,0],
	["rhsusf_stryker_m1132_m2_np_d",50,90,0],
	["rhsusf_stryker_m1132_m2_d",50,100,0],
	["B_APC_Wheeled_01_cannon_F",55,175,0],
	["B_AFV_Wheeled_01_cannon_F",55,275,0],
	["B_AFV_Wheeled_01_up_cannon_F",55,350,0],
	["B_APC_Tracked_01_AA_F",60,250,0],
	["RHS_M2A2",50,200,0],
	["RHS_M2A3",50,225,0],
	["RHS_M2A3_BUSKIII",50,270,0],
	["RHS_M6",55,205,0],
	["Steve_IFV_Warrior",50,200,0],
	["B_MBT_01_cannon_F",60,350,0],
	["B_MBT_01_TUSK_F",60,400,0],
	["Steve_MBT_Kuma",75,450,0],

	["rhsusf_m1a1fep_d",75,380,0],
	["rhsusf_m1a1aimd_usarmy",75,405,0],
	["rhsusf_m1a1aim_tuski_d",75,430,0],
	["rhsusf_m1a2sep1tuskiid_usarmy",75,450,0]
	
];

air_vehicles_overwrite = true;
air_vehicles_extension = [

	["B_Heli_Light_01_F",0,25,5],
	["B_Heli_Light_01_armed_F",0,150,20],
	["RHS_MELB_MH6M",0,25,5],
	["RHS_MELB_H6M",0,25,5],
	["RHS_MELB_AH6M",0,150,20],
	["rhs_uh1h_hidf_unarmed",0,25,6],
	["rhs_uh1h_hidf_gunship",0,250,6],
	["RHS_UH1Y_UNARMED_d",0,25,6],
	["B_Heli_Transport_01_F",0,250,7],
	
	["RHS_UH60M2_d",0,25,7],
	["ulsan_retexture_rhs_uh60m_01",0,25,7],
	["RHS_UH60M_d",0,250,7],
	
	["CH49_Mohawk_FG",0,25,7],
	["I_Heli_light_03_unarmed_F",0,25,7],
	["O_Heli_Transport_04_covered_black_F",0,25,10],
	["B_Heli_Transport_03_unarmed_F",0,25,20],
	["B_Heli_Transport_03_F",0,250,20],
	["O_Heli_Transport_04_black_F",0,25,12],
	["O_Heli_Transport_box_04_black_F",0,25,12],
	["rhsusf_CH53E_USMC_D",0,25,15],
	
	["RHS_CH_47F_10",0,350,15],
	["ulsan_retexture_UHS_CH47_01",0,350,15],
	
	["RHS_C130J",0,50,15],
	["B_T_VTOL_01_infantry_F",0,75,23],
	["B_T_VTOL_01_vehicle_F",0,75,23],
	["USAF_C17",0,200,80],
	["B_T_VTOL_01_armed_F",0,450,90],	
	["RHS_UH1Y_d",0,150,40],
	["I_Heli_light_03_dynamicLoadout_F",0,175,45],
	["RHS_UH60M_ESSS",0,300,55],
	["RHS_AH1Z",0,350,75],
	["B_Heli_Attack_01_dynamicLoadout_F",0,375,75],
	["O_Heli_Attack_02_dynamicLoadout_black_F",0,450,85],
	["RHS_AH64D",0,400,90],
	["FIR_A10A",0,1800,100],
	["FIR_A10C",0,1850,100],
	["B_Plane_CAS_01_dynamicLoadout_F",0,1350,80], //A-10D
	["FIR_AV8B",0,1400,90],
	["FIR_F14A",0,700,125],
	["FIR_F14D",0,750,125],
	["FIR_F15A",0,650,75],
	["FIR_F15C",0,700,75],
	["FIR_F15E",0,2000,175],
	["FIR_F15K",0,2000,175],
	["FIR_F15SE",0,2100,190],
	["FIR_F16C",0,1350,115],
	["FIR_F16D",0,1350,115],
//	["pook_EF2000_BLUFOR",0,1450,125],
	["B_Plane_Fighter_01_Stealth_F",0,850,105],
	["B_Plane_Fighter_01_F",0,900,105],
	["FIR_F18C",0,1500,125],
	["FIR_F18D",0,1500,125],
	["FIR_FA18E",0,1650,140],
	["FIR_FA18F",0,1650,140],
	["Tornado_AWS_blu",0,1600,145],
	["FIR_F35B_Standard",0,2050,185],
	["FIR_F22",0,1850,200],
	["FIR_F23A",0,2050,220]
];

static_vehicles_overwrite = true;
static_vehicles_extension = [

	["B_Mortar_01_F",15,225,0],
	["RHS_M119_D",25,350,0],
	["rhsusf_m109d_usarmy",50,600,0],
	["B_MBT_01_arty_F",50,650,0],
	["I_E_Truck_02_MRL_F",120,850,0],
	["B_MBT_01_mlrs_F",125,900,0],
	["B_UAV_02_dynamicLoadout_F",0,0,5],
	["B_T_UAV_03_dynamicLoadout_F",0,0,5],
	["B_UAV_05_F",0,0,10],
	["USAF_RQ4A",0,0,10],
	["FIR_MQ81U_DarkGrey",0,0,10]
/*	
	["RHS_M2StaticMG_D",0,60,0],
	["RHS_M2StaticMG_MiniTripod_D",0,60,0],
	["RHS_TOW_TriPod_D",0,90,0],
	["RHS_MK19_TriPod_D",0,125,0]
*/
];

buildings_overwrite = true;
buildings_extension = [
	
	["ACE_Wheel",0,0,0],
	["ACE_Track",0,0,0],
	["CargoNet_01_box_F",0,0,0],
	["ULSAN_ADDONS_Billboard_ACEmed",0,0,0],
	["ULSAN_ADDONS_Billboard_FOB_info",0,0,0],
	["ULSAN_ADDONS_Billboard_help",0,0,0],
	["ULSAN_ADDONS_Billboard_join_wating",0,0,0],
	["ULSAN_ADDONS_Billboard_ride_waiting",0,0,0],
	["ULSAN_ADDONS_Billboard_welcome",0,0,0],
	["Land_HBarrier_1_F",0,0,0],
	["Land_HBarrier_5_F",0,0,0],
	["Land_HBarrierWall6_F",0,0,0],
	["Land_HBarrierWall_corner_F",0,0,0],
	["Land_HBarrierTower_F",0,0,0],
	["Land_BagBunker_Large_F",0,0,0],
	["Land_BagBunker_Small_F",0,0,0],
	["Land_BagBunker_Tower_F",0,0,0],
	["Land_Cargo_House_V1_F",0,0,0],
	["Land_Medevac_house_V1_F",0,0,0],
	["Land_Cargo_Patrol_V1_F",0,0,0],
	["Land_HelipadSquare_F",0,0,0],
	["Land_ChairWood_F",0,0,0],
	["Land_BagFence_Round_F",0,0,0],
	["Land_BagFence_Long_F",0,0,0],
	["Land_BagFence_Short_F",0,0,0],
	["Land_Camping_Light_F",0,0,0],
	["Land_PortableLight_single_F",0,0,0],
	["Land_PortableLight_double_F",0,0,0],
	["Land_CzechHedgehog_01_new_F",0,0,0],
	["Land_LampAirport_F",0,0,0],
	["Target_F",0,0,0]
];

support_vehicles_overwrite = false; // If you're going to overwrite this, make sure you have at least Arsenal_typename, Respawn_truck_typename, FOB_box_typename and FOB_truck_typename in there
support_vehicles_extension = [
/*
	[Arsenal_typename,5,600,0],
	[FOB_box_typename,100,400,0],
	[FOB_truck_typename,100,400,0],

	//engineer
	["C_Offroad_01_repair_F",5,100,0],
	["rhsusf_m1152_rsv_usarmy_d",5,1200,0],
	["C_Van_02_service_F",5,100,0],
	["B_Truck_01_Repair_F",7,200,0],
	["B_Truck_01_fuel_F",10,200,0],
	["B_Truck_01_ammo_F",10,200,0],

	//medical
	["C_Van_02_medevac_F",5,100,0],
	["B_Truck_01_medical_F",7,100,0],
	["rhsusf_M1230a1_usarmy_d",7,100,0],
	["rhsusf_m113d_usarmy_medical",15,100,0],

	//etc
	["B_Slingload_01_Repair_F",5,150,0],
	["B_Slingload_01_Fuel_F",5,150,0],
	["B_Slingload_01_Ammo_F",5,150,0],
	["B_Slingload_01_Medevac_F",5,100,0],
	["Box_NATO_AmmoVeh_F",10,150,0]

*/
];

// All the UAVs must be declared here, otherwise there shall be UAV controlling issues. Namely: you won't be able to control them.
uavs = [
	"B_UGV_01_F",
	"B_UGV_01_rcws_F",
	"B_UAV_02_F",
	"B_UAV_02_CAS_F",
	"B_UAV_02_dynamicLoadout_F",
	"B_T_UAV_03_dynamicLoadout_F",
	"B_UAV_05_F",
	"B_UGV_02_Demining_F",
	"USAF_RQ4A",
	"FIR_MQ81U_DarkGrey"
];

// Pre-made squads for the commander build menu. These shouldn't exceed 10 members.
// Light infantry squad
blufor_squad_inf_light = ["rhsusf_army_ocp_teamleader","rhsusf_army_ocp_grenadier","rhsusf_army_ocp_rifleman","rhsusf_army_ocp_machinegunner"]; 


// Heavy infantry squad
blufor_squad_inf = ["rhsusf_army_ocp_squadleader","rhsusf_army_ocp_grenadier","rhsusf_army_ocp_machinegunner","rhsusf_army_ocp_javelin","rhsusf_army_ocp_aa","rhsusf_army_ocp_autorifleman","rhsusf_army_ocp_rifleman_m4"];


// AT specialists squad
blufor_squad_at = ["rhsusf_army_ocp_teamleader","rhsusf_army_ocp_javelin","rhsusf_army_ocp_javelin","rhsusf_army_ocp_javelin_assistant"];

// AA specialists squad
blufor_squad_aa = ["rhsusf_army_ocp_teamleader","rhsusf_army_ocp_AA","rhsusf_army_ocp_AA","rhsusf_army_ocp_riflemanl"];


// Force recon squad
blufor_squad_recon = ["rhsusf_socom_marsoc_teamleader","rhsusf_socom_marsoc_cso","rhsusf_socom_marsoc_sarc","rhsusf_socom_marsoc_sniper","rhsusf_socom_marsoc_grenadier","rhsusf_socom_marsoc_cso_eod"];


// Paratroopers squad
blufor_squad_para = ["B_T_Soldier_PG_F","B_T_Soldier_PG_F","B_T_Soldier_PG_F","B_T_Soldier_PG_F"];



// *** BADDIES ***

// All OPFOR infantry. Defining a value here will replace the default value from the original mission.

// Standard Settings
opfor_sentry = "rhs_vdv_recon_rifleman_l";
opfor_rifleman = "rhs_vdv_recon_efreitor";
opfor_grenadier = "rhs_vdv_recon_grenadier_scout";
opfor_squad_leader = "rhs_vdv_rifleman_lite";
opfor_team_leader = "rhs_vdv_sergeant";

opfor_marksman = "rhs_vdv_marksman_asval";
opfor_machinegunner = "rhs_vdv_arifleman";
opfor_heavygunner = "rhs_vdv_machinegunner";
opfor_medic = "rhs_vdv_medic";
opfor_rpg = "rhs_vdv_grenadier_rpg";

opfor_at = "rhs_vdv_at";
opfor_aa = "rhs_vdv_aa";
opfor_officer = "rhs_vdv_officer_armored";
opfor_sharpshooter = "rhs_vdv_recon_marksman";
opfor_sniper = "rhssaf_army_o_m10_para_sniper_m82a1";

opfor_engineer = "rhs_vdv_recon_rifleman_lat";
opfor_paratrooper = "O_soldier_PG_F";

// OPFOR Vehicles to be used in secondary objectives

opfor_mrap = "rhs_tigr_m_msv";
opfor_mrap_armed = "rhs_zsu234_aa";
opfor_transport_helo = "RHS_Mi24V_vvsc";
opfor_transport_truck = "rhs_zil131_vdv";
opfor_fuel_truck = "RHS_Ural_Fuel_VDV_01";

opfor_ammo_truck = "rhs_typhoon_vdv";
opfor_fuel_container = nil;
opfor_ammo_container = nil;
opfor_flag = "rhs_Flag_Russia_F";

// Militia infantry. Soldier classnames the game will pick from randomly
militia_squad_overwrite = true;
militia_squad_extension = [

	"rhssaf_army_o_m10_digital_exp",
	"rhssaf_army_o_m10_digital_rifleman_m21",
	"rhssaf_army_o_m10_digital_rifleman_m70",
	"rhssaf_army_o_m10_digital_rifleman_at",
	"rhssaf_army_o_m10_digital_officer",
	"rhssaf_army_o_m10_digital_spec_at",
	"rhssaf_army_o_m10_digital_spec_aa",
	"rhssaf_army_o_m10_digital_sniper_m76",
	"rhssaf_army_o_m10_digital_gl",
	"rhssaf_army_o_m10_digital_medic",
	"rhssaf_army_o_m10_digital_ft_lead",
	
	"I_Soldier_SL_F",
	"I_Soldier_F",
	"I_Soldier_AR_F",
	"I_Soldier_GL_F",
	"I_Soldier_M_F",
	"I_Soldier_AT_F",
	"I_Soldier_AAT_F",
	"I_Soldier_A_F",
	"I_Soldier_AA_F",
	"I_Soldier_AAA_F",
	"I_Soldier_mine_F",
	"I_Soldier_medic_F",
	"I_Sniper_F",
	"I_Spotter_F",
	
	"LOP_PMC_Infantry_AA",
	"LOP_PMC_Infantry_AT",
	"LOP_PMC_Infantry_EOD",
	"LOP_PMC_Infantry_Rifleman",
	"LOP_PMC_Infantry_Rifleman_2",
	"LOP_PMC_Infantry_GL",
	"LOP_PMC_Infantry_MG",
	"LOP_PMC_Infantry_Corpsman",
	"LOP_PMC_Infantry_SL"	

];

// Militia vehicles to choose from
militia_vehicles_overwrite = true;
militia_vehicles_extension = [

	"rhs_tigr_3camo_msv",
	"rhs_tigr_sts_3camo_msv",
	"rhs_tigr_m_3camo_msv",
	"rhssaf_army_o_m1025_olive_m2",
	"rhssaf_army_o_d30",
	"rhssaf_army_o_ural_open",
	"rhsgref_tla_offroad_at",
	"rhsgref_tla_offroad_armed",
	"rhsgref_tla_offroad",
	"rhsgref_tla_ZU23",
	"rhsgref_tla_btr60",
	"LOP_PMC_Offroad_M2",
	"LOP_PMC_SUV",
	"LOP_US_BTR70",
	"LOP_US_UAZ_DshKM",
	"LOP_US_BMP1",
	"LOP_US_T72BA"

];

// All the vehicles that can spawn as sector defenders and patrols
opfor_vehicles_overwrite = true;
opfor_vehicles_extension = [

	"rhsgref_BRDM2_ATGM_vdv",
	"rhsgref_BRDM2_HQ_vdv",
	"rhsgref_BRDM2_vdv",
	"rhs_2s1_tv",
	"rhs_btr80a_vdv",
	"rhs_bmd4m_vdv",
	"rhs_bmd4_vdv",
	"rhs_sprut_vdv",
	"rhs_bmp3m_msv",
	"rhs_bmp3_late_msv",
	"rhs_prp3_msv",
	"rhs_zsu234_aa",
	"rhs_t80u",
	"rhs_t72be_tv",
	"rhs_t90_tv",
	"rhs_t90sm_tv",
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Wheeled_02_rcws_v2_F",
	"O_MBT_02_cannon_F",
	"O_MBT_04_cannon_F",
	"O_MBT_04_command_F"	
	
];

// Same with lighter choices to be used  when the alert level is low
opfor_vehicles_low_intensity_overwrite = true;
opfor_vehicles_low_intensity_extension = [
    
	"rhs_btr80_vdv",
	"rhs_btr80a_vdv",
	"rhsgref_BRDM2_ATGM_vdv",
	"rhsgref_BRDM2_HQ_vdv",
	"rhsgref_BRDM2_vdv",
	"rhs_bmd2m",
	"rhs_bmd1r",
	"rhs_bmd1pk",
	"rhs_prp3_vdv",
	"rhs_bmp2k_vdv",
	"rhs_bmp2d_vdv",
	"rhs_sprut_vdv",
	"rhsgref_ins_uaz_spg9",
	"rhsgref_ins_uaz_open",
	"rhsgref_ins_uaz_dshkm",
	"rhsgref_ins_uaz_ags",
	"rhsgref_ins_uaz",
	"rhs_kamaz5350_vdv",
	"rhs_kamaz5350_open_vdv"

];

// All the vehicles that can spawn as battlegroup members
opfor_battlegroup_vehicles_overwrite = true;
opfor_battlegroup_vehicles_extension = [

	"rhs_bmd4ma_vdv",
	"rhs_bmp3mera_msv",
	"rhs_t90sab_tv",
	"rhs_t90_tv",
	"rhs_t90sm_tv",
	"rhs_t80uk",
	"O_T_APC_Tracked_02_AA_ghex_F",
	"O_T_MBT_02_cannon_ghex_F",
	"O_T_MBT_04_command_F",
	"O_T_MBT_02_arty_ghex_F",
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Wheeled_02_rcws_v2_F",
	"O_MBT_02_cannon_F",
	"O_MBT_04_cannon_F",
	"O_MBT_04_command_F",	
	"O_Radar_System_02_F",
	"O_SAM_System_04_F"

];

// Same with lighter choices to be used  when the alert level is low
opfor_battlegroup_vehicles_low_intensity_overwrite = true;
opfor_battlegroup_vehicles_low_intensity_extension = [

	"O_T_APC_Tracked_02_AA_ghex_F",
	"O_T_APC_Tracked_02_AA_ghex_F",
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Wheeled_02_rcws_v2_F",
	"rhs_bmd4ma_vdv",
	"rhs_bmp3mera_msv"
	
];

// All the vehicles that can spawn as battlegroup members (see above) and also hold 8 soldiers as passengers.
// If something in here can't hold all 8 soldiers then buggy behaviours may occur
opfor_troup_transports_overwrite = true;
opfor_troup_transports_extension = [

    "rhs_kamaz5350_open_vdv",
	"rhs_kamaz5350_vdv",
	"RHS_Ural_Open_VDV_01",
	"RHS_Ural_VDV_01"

];

// Battlegroup members that will need to spawn in flight. Should be only helos but, who knows
opfor_choppers_overwrite = true;
opfor_choppers_extension = [
    
	"O_T_VTOL_02_infantry_dynamicLoadout_F",
	"RHS_Mi24V_vvsc",
	"RHS_Mi8MTV3_vvsc",
	"RHS_Mi8MTV3_heavy_vvsc",
	"rhs_pchela1t_vvs"
	
];

// Opfor military aircrafts    
opfor_air_overwrite = true;
opfor_air_extension = [

	"O_Plane_Fighter_02_F",
	"O_Plane_Fighter_02_Stealth_F",
	"O_Plane_CAS_02_dynamicLoadout_F",
	"FIR_F14A_IRIAF",
	"FIR_F14D_ENEMY_TYPE_A",
	"O_T_VTOL_02_infantry_dynamicLoadout_F",
	"O_T_VTOL_02_vehicle_dynamicLoadout_F",
	"pook_JF17_OPFOR",
	"pook_EF2000_OPFOR",
	"FIR_Su25SM3",
	"rhssaf_airforce_o_l_18_101",
	"RHS_T50_vvs_generic_ext",
	"RHS_Su25SM_vvs",
	"rhs_mig29s_vvs",
	"rhs_l159_CDF",
	"rhs_l39_cdf",
	"RHS_Su25SM_vvs"

];

// Other stuff

// Civilians
civilians_overwrite = true;
civilians_extension = [

	"LOP_CHR_Civ_Random",
	"LOP_Tak_Civ_Random",
	"C_IDAP_Man_AidWorker_01_F",
	"C_man_1",
	"C_man_polo_2_F",
	"C_Man_ConstructionWorker_01_Red_F",
	"C_Man_ConstructionWorker_01_Black_F",
	"C_Man_Fisherman_01_F",
	"C_Driver_3_F",
	"C_Man_UtilityWorker_01_F",
	"C_man_polo_4_F_euro",
	"C_man_polo_5_F_afro",
	"C_man_p_fugitive_F_afro",
	"C_man_shorts_3_F_afro",
	"C_man_sport_2_F_asia",
	"C_man_polo_5_F_asia",
	"C_Man_casual_2_F_tanoan",
	"C_Man_casual_5_F_tanoan",
	"C_Man_sport_1_F_tanoan",
	"C_Journalist_01_War_F",
	"C_Man_Messenger_01_F",
	"C_man_w_worker_F",
	"C_man_Paramedic_01_F",
	"C_journalist_F"

];

// Civilian vehicles
civilian_vehicles_overwrite = true;
civilian_vehicles_extenswaion = [

	"C_IDAP_Offroad_02_unarmed_F",
	"LOP_TAK_Civ_Offroad",
	"LOP_TAK_Civ_Ural",
	"C_IDAP_Truck_02_water_F",
	"LOP_TAK_Civ_UAZ",
	"LOP_CHR_Civ_Hatchback",
	"LOP_TAK_Civ_Hatchback",
	"LOP_AFR_Civ_Ural",
	"LOP_CHR_Civ_Landrover",
	"C_IDAP_Truck_02_F",
	"LOP_TAK_Civ_Landrover",
	"C_Offroad_01_F",
	"LOP_AFR_Civ_UAZ",
	"LOP_CHR_Civ_Offroad",
	"C_Quadbike_01_F",
	"C_Truck_02_transport_F",
	"C_SUV_01_F",
	"LOP_CHR_Civ_Ural",
	"C_Offroad_02_unarmed_F",
	"LOP_AFR_Civ_Landrover",
	"C_IDAP_Van_02_vehicle_F",
	"LOP_CHR_Civ_UAZ",
	"C_Van_01_transport_F",
	"C_Hatchback_01_sport_F",
	"C_Van_01_fuel_F",
	"RHS_Ural_Civ_01",
	"RHS_Ural_Civ_02"

];

// Everything the AI troups should be able to resupply from
ai_resupply_sources_extension = [

];

// Everything that can resupply other vehicles
vehicle_repair_sources_extension = [ 

];
vehicle_rearm_sources_extension = [

];
vehicle_refuel_sources_extension = [

];

// Elite vehicles that should be unlocked through military base capture.
elite_vehicles_extension = [

	"RHS_MK19_TriPod_D",
	"B_APC_Tracked_01_AA_F",
	"B_MBT_01_arty_F",
	"B_MBT_01_mlrs_F",
	"Steve_MBT_Kuma",
	"RHS_M2A3_BUSKIII",
	"RHS_M6",
	"rhsusf_m1a2sep1tuskiid_usarmy",
	"rhsusf_m109d_usarmy",
	"I_E_Truck_02_MRL_F",
	
	"rhsgref_b_mi24g_FAB",
	"RHS_AH1Z",
	"RHS_AH64D",
	"Y32C_Xian_Infantry",
	"Y32C_Xian_Vehicle",
	
	"B_Plane_Fighter_01_Stealth_F",
	"B_Plane_Fighter_01_F",
	
	"FIR_A10A",
	"FIR_A10C",
	"FIR_F14A",
	"FIR_F14D",
	"FIR_AV8B",
	"FIR_F15A",
	"FIR_F15C",
	"FIR_F15E",
	"FIR_F15K",
	"FIR_F15SE",
	"FIR_F16C",
	"FIR_F16D",
	"FIR_F18C",
	"FIR_F18D",
	"FIR_FA18E",
	"FIR_FA18F",
	"FIR_F35B_Standard",
	"FIR_F22",
	"FIR_F23A",
	"B_UAV_05_F",
	"FIR_MQ81U_DarkGrey"
];

// Blacklisted arsenal items such as deployable weapons  that should be bought instead
// Useless if you're using a predefined arsenal in arsenal.sqf
blacklisted_from_arsenal_extension = [

	"B_Respawn_Sleeping_bag_blue_F",
	"B_Respawn_Sleeping_bag_brown_F",
	"B_Respawn_TentDome_F",
	"B_Respawn_Sleeping_bag_F",
	"B_Respawn_TentA_F",
	"I_GMG_01_A_weapon_F",
	"O_GMG_01_A_weapon_F",
	"B_GMG_01_A_weapon_F",
	"I_HMG_01_A_weapon_F",
	"B_HMG_01_A_weapon_F",
	"O_HMG_01_A_weapon_F",
	"O_HMG_01_weapon_F",
	"B_HMG_01_weapon_F",
	"I_HMG_01_weapon_F",
	"I_HMG_01_high_weapon_F",
	"O_HMG_01_high_weapon_F",
	"B_HMG_01_high_weapon_F",
	"O_GMG_01_weapon_F",
	"I_GMG_01_weapon_F",
	"B_GMG_01_weapon_F",
	"B_GMG_01_high_weapon_F",
	"I_GMG_01_high_weapon_F",
	"O_GMG_01_high_weapon_F",
	"I_Mortar_01_support_F",
	"B_Mortar_01_support_F",
	"O_Mortar_01_support_F",
	"B_Mortar_01_weapon_F",
	"O_Mortar_01_weapon_F",
	"I_Mortar_01_weapon_F",
	"B_HMG_01_support_F",
	"O_HMG_01_support_F",
	"I_HMG_01_support_F",
	"B_HMG_01_support_high_F",
	"O_HMG_01_support_high_F",
	"I_HMG_01_support_high_F",
	"B_AA_01_weapon_F",
	"O_AA_01_weapon_F",
	"I_AA_01_weapon_F",
	"B_AT_01_weapon_F",
	"O_AT_01_weapon_F",
	"I_AT_01_weapon_F",
	"I_UAV_01_backpack_F",
	"B_UAV_01_backpack_F",
	"O_UAV_01_backpack_F",

	"RHS_Podnos_Bipod_Bag",
	"RHS_Podnos_Gun_Bag",
	"RHS_Kornet_Gun_Bag",
	"RHS_Kornet_Tripod_Bag",
	"RHS_DShkM_Gun_Bag",
	"RHS_DShkM_TripodHigh_Bag",
	"RHS_DShkM_TripodLow_Bag",
	"RHS_Metis_Gun_Bag",
	"RHS_Metis_Tripod_Bag",
	"RHS_AGS30_Tripod_Bag",
	"RHS_AGS30_Gun_Bag",
	"RHS_Kord_Tripod_Bag",
	"RHS_Kord_Gun_Bag",
	"RHS_M2_Gun_Bag",
	"RHS_M2_Tripod_Bag",
	"RHS_M2_MiniTripod_Bag",
	"RHS_Mk19_Gun_Bag",
	"RHS_SPG9_Gun_Bag",
	"RHS_Tow_Gun_Bag",
	"rhs_M252_Gun_Bag",
	"rhs_M252_Bipod_Bag",
	"RHS_Mk19_Tripod_Bag",
	"RHS_NSV_Tripod_Bag",
	"RHS_NSV_Gun_Bag",
	"RHS_SPG9_Tripod_Bag",
	"rhs_Tow_Gun_Bag",
	"rhs_TOW_Tripod_Bag",
	
	"k6_mg_low_bag",
	"k6_mg_high_bag",
	
	"B_rhsusf_B_BACKPACK",
	
	"min_rf_torna_flora_Mortar_s",
	"min_rf_torna_flora_Mortar_w",
	"min_rf_torna_flora_HMG_s",
	"min_rf_torna_flora_HMG_w",
	"min_rf_torna_flora_GMG_w",
	"min_rf_torna_flora_AGS_30_w",
	"min_rf_torna_flora_Kord_w",
	"min_rf_torna_flora_Metis_w",
	"min_rf_torna_flora_AGS_30_s",
	"min_rf_torna_flora_Kord_s",
	"min_rf_torna_flora_Metis_s",
	"O_Static_Designator_02_weapon_F",
	"B_Talon_01_backpack_F",
	"B_AssaultPack_Kerry",
	"B_Patrol_Respawn_bag_F",

	"C_IDAP_UAV_01_backpack_F",
		
	"B_UAV_06_backpack_F",
	"O_UAV_06_backpack_F",
	"I_UAV_06_backpack_F",
	"C_UAV_06_backpack_F",
	"C_IDAP_UAV_06_antimine_backpack_F",
	"C_IDAP_UAV_06_backpack_F",
	
	"C_IDAP_UAV_06_medical_backpack_F",
	"I_UAV_06_medical_backpack_F",
	"O_UAV_06_medical_backpack_F",
	"B_UAV_06_medical_backpack_F",
	"C_UAV_06_medical_backpack_F",
	
	"I_HMG_02_high_weapon_F",
	"I_G_HMG_02_high_weapon_F",
	"I_E_HMG_02_high_weapon_F",
	"I_C_HMG_02_high_weapon_F",
	"I_HMG_02_weapon_F",
	"I_G_HMG_02_weapon_F",
	"I_E_HMG_02_weapon_F",
	"I_C_HMG_02_weapon_F",
	
	"I_HMG_02_support_high_F",
	"I_G_HMG_02_support_high_F",
	"I_E_HMG_02_support_high_F",
	"I_C_HMG_02_support_high_F",
	"I_HMG_02_support_F",
	"I_G_HMG_02_support_F",
	"I_E_HMG_02_support_F",
	"I_C_HMG_02_support_F",
	
	"TCGM_BikePack_nht",
	"TCGM_BikePack_hexa",
	"TCGM_BikePack_hex",
	"TCGM_BikePack_hexw",
	"TCGM_BikePack_oli",
	"TCGM_BikePack_snd",
	"TCGM_BikePack_win"
];

// Configuration for ammo boxes transport
// First entry: classname
// Second entry: how far behind the vehicle the boxes should be unloaded
// Following entries: attachTo position for each box, the number of boxes that can be loaded is derived from the number of entries
box_transport_config_extension = [
/*
[ "O_Heli_Transport_04_black_F", -5, [0,	1.7, -1.02], [0, 0.15, -1.02], [0, -1.42, -1.02] ],
[ "greuh_eh101_gr", -6.5, [0,	4.2,	-1.45], [0,	2.5,	-1.45], [0,	0.8, -1.45], [0,	-0.9, -1.45] ],
[ "rhs_kamaz5350_open_msv", -7, [0, 0.53, 0],  [0, -1.01, 0], [0, -2.54, 0] ],
[ "RHS_CH_47F", -11.3, [0, 0.65, -1.9], [0, 2.2, -1.9], [0, 3.8, -1.9], [0,-0.9,-1.9], [0,-2.5,-1.9] ],
[ "RHS_CH_47F_light", -11.3, [0, 0.65, -1.9], [0, 2.2, -1.9], [0, 3.8, -1.9], [0,-0.9,-1.9], [0,-2.5,-1.9] ]
*/
];
