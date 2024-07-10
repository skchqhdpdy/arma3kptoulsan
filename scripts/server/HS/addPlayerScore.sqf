["CAManBase", "killed", {
  //diag_log "EH Start";
  private _unit = _this # 0;
  private _killer = _unit getVariable ["ace_medical_lastDamageSource" , objNull];

  //플레이어 그 자신이 죽었다면 종료.
  if (isPlayer _unit) exitWith {
    //diag_log "플레이어 자신이 죽음"
  };

  // 의문사 또는 자살했다면 종료.
  if(_killer isEqualTo objNull) exitWith {
    //diag_log "자살 또는 의문사"
  };

  // 플레이어가 죽인게 아니라면 종료.
  if ( !isPlayer _killer ) exitWith {
    //diag_log "플레이어가 죽인게 아님."
  };

  private _fnc_getSideFromConfig = {
      params ["_object"];
      switch (getNumber (configFile >> "CfgVehicles" >> (typeOf _object) >> "side")) do {
          case (0): {east};
          case (1): {west};
          case (2): {resistance};
          default {civilian};
      };
  };
  private _unitSide = [_unit] call _fnc_getSideFromConfig;

  private _score = call {

    // 아군 사살시 -10
    if(_unitSide isEqualTo side _killer ) exitWith {-10};

    // CIV 세력 사살시
    if(_unitSide isEqualTo civilian) exitWith {
      //엔딩 크레딧에 저장하는 수치
      stats_civilians_killed_by_players = stats_civilians_killed_by_players + 1;

      //리버레이션 CIV 세력 오사 패널티.
      if (GRLIB_civ_penalties) then {
        resources_ammo = resources_ammo - GRLIB_civ_killing_penalty;
        [10 + (floor (random 20))] call F_addCombatReadiness;
        
        //변수값 일치
        publicVariable "resources_ammo";
        publicVariable "combat_readiness";

        [ name _unit, GRLIB_civ_killing_penalty, _killer ] remoteExec ["remote_call_civ_penalty",-2];
      };

      //바닐라 스코어
      -5
    };

    //그 외의 경우
    1
  };

/*
  systemChat format ["스코어 %1" , _score ];
  diag_log format ["스코어 %1" , _score ];
*/
  // 서버라면 바로 명령실행
  if(isServer) exitWith {
	_killer addplayerscores [_score,0,0,0,0];};

  // 서버가 아니라면 (HC? , 기타) 서버로 EH실행하도록 해서 명령실행.
 ["HS_addPlayerScore", [_killer , _score]] call CBA_fnc_serverEvent;

}] call CBA_fnc_addClassEventHandler;
