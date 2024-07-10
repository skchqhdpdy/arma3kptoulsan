enableSaving [ false, false ];

[] call compileFinal preprocessFileLineNUmbers "scripts\shared\liberation_functions.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\init_sectors.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\fetch_params.sqf";
[] call compileFinal preprocessFileLineNUmbers "gameplay_constants.sqf";
[] call compileFinal preprocessFileLineNUmbers "classnames_extension.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\classnames.sqf";
[] call compileFinal preprocessfilelinenumbers "scripts\shared\init_shared.sqf";

if (isServer) then {
	[] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";
};

if (!isDedicated && !hasInterface && isMultiplayer) then {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\hc_manager.sqf";
};

if (!isDedicated && hasInterface) then {
	waitUntil { alive player };
	[] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
} else {
	setViewDistance 1600;
};

// EXTENTION ADDONS
[] execVM "scripts\addon\cratercleaner.sqf";
[] execVM "scripts\addon\Loopmsg.sqf";

AWS_AMS_LoadingTime = 40;

["HS_addPlayerScore" , {
  params ["_killer", "_score"];

  _killer addplayerscores [_score,0,0,0,0];
	//diag_log "HS_addPlayerScore 점수 추가됨."

}] call CBA_fnc_addEventHandler;

[] call compileFinal preprocessFileLineNumbers "scripts\server\HS\addPlayerScore.sqf";

ace_medical_selections = ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];
// 좀비 에드온 데미지 기능 추가

Player enableWeaponDisassembly false;