private [ "_truck_spawn_point", "_delivery_point", "_truck_marker", "_delivery_point_marker", "_delivery_truck", "_fobpos" ];

// 스폰 포인트 및 배달 지점 설정
_fobpos = selectRandom GRLIB_all_fobs;

if ( (count blufor_sectors) > 5 ) then {
  _truck_spawn_point = [_fobpos, 5, 70, 5, 0] call BIS_fnc_findSafePos;
  _delivery_point = getMarkerPos(selectRandom blufor_sectors) getPos [random 30, random 360];
};

// 스폰 포인트가 없을 경우 종료
if ( (_truck_spawn_point distance _fobpos) < 5 ) exitWith { diag_log "Could not find enough place for secure truck mission"; };

// 부차임무 실행 상태로 변경
GRLIB_secondary_in_progress = 0; publicVariable "GRLIB_secondary_in_progress";
[ 4 ] remoteExec ["remote_call_intel" , -2];

// 트럭 스폰
_delivery_truck = [ _truck_spawn_point, "O_Truck_03_device_F", true, false, false ] call F_libSpawnVehicle;
{ _delivery_truck deleteVehicleCrew _x } forEach crew _delivery_truck;

// 트럭 및 도착지 마커 생성 (갱신은 이후)
_truck_marker = createMarker [ "korose_truckmark", getPos _delivery_truck ];
_truck_marker setMarkerText "Delivery Truck";
_truck_marker setMarkerType "b_installation";
_truck_marker setMarkerColor "ColorGreen";

_delivery_point_marker = createMarker [ "korose_pointmark", _delivery_point ];
_delivery_point_marker setMarkerText "Delivery Point";
_delivery_point_marker setMarkerType "u_installation";
_delivery_point_marker setMarkerColor "ColorGreen";

//  트럭 위치 갱신 및 도착 혹은 파괴되었을 경우 처리
while { alive _delivery_truck && !(count(crew _delivery_truck) == 0 && _delivery_truck distance _delivery_point < 100)} do {
    sleep 10;
    _truck_marker setMarkerPos _delivery_truck;
};

if ( !alive _delivery_truck ) then {
  [ 9 ] remoteExec ["remote_call_intel" , -2];
} else {
  [ 5 ] remoteExec ["remote_call_intel" , -2];
  combat_readiness = combat_readiness - 20;
  if (combat_readiness < 0) then { combat_readiness = 0; };
  resources_ammo = resources_ammo + 750;
 };

// 부차임무 횟수 증가 및 차량, 마커 삭제
stats_secondary_objectives = stats_secondary_objectives + 1;
sleep 3;

deleteVehicle _delivery_truck;
deleteMarker _truck_marker;
deleteMarker _delivery_point_marker;

// 부차임무 실행 가능 상태로 변경
GRLIB_secondary_in_progress = -1; publicVariable "GRLIB_secondary_in_progress";
sleep 3;
trigger_server_save = true;
