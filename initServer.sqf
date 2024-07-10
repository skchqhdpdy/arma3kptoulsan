["Initialize", [false, 10]] call BIS_fnc_dynamicGroups;

hs_fnc_setGroupData =
{
	private ["_GroupName"];

	_GroupName = param [3,  [ "비전투", group player], []];

	["RegisterGroup" , [(_this select 0),(_this select 1) , [ (_this select 2), format ["[%1] %2 [LR%3/SR%4]",_GroupName select 0 , _GroupName select 1, _GroupName select 2, _GroupName select 3 ]] ]] call BIS_fnc_dynamicGroups
};

[aceVirtualArsenalBox, true, true] call ace_arsenal_fnc_initBox;
ace_arsenalBlacklist = call compile preprocessFileLineNumbers	"arsenal.sqf";
[aceVirtualArsenalBox, ace_arsenalBlacklist , true] call ace_arsenal_fnc_removeVirtualItems;

//서버 로깅

["HS_ACEX_diedByToServer" , {
  params ["_player", "_killer", "_killInfo"];

	diag_log format ["(HS_ACEX_diedByToServer) : %1 killed by (%2) ,  %3" , _player , _killer , str (parseText _killInfo)];
  //copyToClipboard format ["(HS_ACEX_killedByTracker) : %1 killed by (%2)  %3" , name player , _killer , str (parseText _killInfo)];

}] call CBA_fnc_addEventHandler;

//플레이어 점수 추가.

lhd setpos (getmarkerpos "base_chimera");
lhd hideObject true;
{ deleteVehicle _x } foreach ( ( getmarkerpos "lhd" ) nearObjects 500 );
deleteMarkerLocal "lhd";

//atlas_manager(lhd 관련) 기능 이식