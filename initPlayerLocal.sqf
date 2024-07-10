["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;


// 그룹 정보를 서버로 보내는 함수.
hs_fnc_sendGroupDataServer = {
	[
		group player ,
	 	player ,
	 	uiNamespace getVariable "hs_squadMark" ,
	  	[(uiNamespace getVariable "hs_dynamicGroupSquadType"), ctrlText 1400, (parseNumber ctrlText 1402), parseNumber (ctrlText 1403) ]

	] remoteExecCall ['hs_fnc_setGroupData' , 2];

};


// 스쿼드 마크 박스 채우는 함수
// [control] call hs_fnc_set_UIData
hs_fnc_fillSquadMarkBox = {
	{
		_this lbAdd (gettext (_x >> 'displayname')),
		_this lbSetPicture [_foreachindex , getText (_x >> 'texture')],
		_this lbSetPictureColor [_foreachindex, [1,1,1,1]],
		_this lbSetData [_foreachindex , configName _x]
	} forEach ( 'isClass _x' configClasses (configFile >> 'CfgUnitInsignia'  ))
};


// 유니크 그룹 아이디 가져오는 함수.
// [_object] call hs_fnc_getUniqueID
hs_fnc_getUniqueID = {
	private _object = param [0, objNull, [objNull]];
	(group _object) getVariable "BIS_dg_var";
};



// [ctrltext 1401] spawn hs_spawn_var
hs_spawn_var = {

	if (isNil "hs_var_spawn") then {
		hs_var_spawn = [];
	};

	waitUntil {!(isnil {(group player) getVariable "BIS_dg_var"})};

	// 있는 그룹만 나오도록 갱신.
	hs_var_spawn = hs_var_spawn select {
		["IsGroupRegistered" ,  [(["GetGroupByUniqueId" , [_x select 0 , west]] call BIS_fnc_dynamicGroups)] ] call BIS_fnc_dynamicGroups
	};

	hs_var_spawn pushBack [(group player) getVariable "BIS_dg_var" , _this select 0];
	// hs_var_spawn call hs_fnc_removeNoneGroup;
	publicVariable "hs_var_spawn";
};


// [(group player) getVariable "BIS_dg_var"] call hs_fnc_removeGroup
hs_fnc_removeGroup = {
	_removeGroup = ["GetGroupByUniqueId" , [_this select 0 , west]] call BIS_fnc_dynamicGroups;
	["UnregisterGroup" ,[_removeGroup] ] call BIS_fnc_dynamicGroups;


};


// HS 분대만들기 스크립트 실행부분.
// 반복을 막기위해 어쩔 수 없이 spawn 사용.
addMissionEventHandler ["eachFrame" , {
	if (!isnil {uiNamespace getVariable "BIS_dynamicGroups_display"}) then {

		if (isNil "hs_dynamicGroupSqudButtonScript") then {

			hs_dynamicGroupSqudButtonScript = [] spawn {

				disableSerialization;

				private ["_cntrlCreate", "_temp"];

				//Create Button 눌렀을때  분대 만들기(hs_dialog)로 덮어씌우기
				_cntrlCreate = (uiNamespace getVariable "BIS_dynamicGroups_display") displayCtrl 9978;

				if ((ctrlText _cntrlCreate) in ["CREATE", "생성"]) then {
					_cntrlCreate ctrlSetEventHandler ["ButtonClick" , "(uiNamespace getVariable 'BIS_dynamicGroups_display') closeDisplay 2; createDialog 'HS_DIALOG' "];
					_temp = (ctrlText _cntrlCreate);
				}

				else {

					_cntrlCreate ctrlSetEventHandler ["ButtonClick","with uiNamespace do {
						['OnCreateLeaveKickButtonClick', _this] call { _this call (uiNamespace getVariable ['RscDisplayDynamicGroups_script', {}]); };
					}; "];
					_temp = (ctrlText _cntrlCreate);

				};

				waitUntil{ uisleep (1/diag_fps); ((ctrlText _cntrlCreate != _temp) || (isnil {uiNamespace getVariable "BIS_dynamicGroups_display"})) };

				hs_dynamicGroupSqudButtonScript = nil;
				terminate _thisScript;

			};

		};



		if (isNil "hs_dynamicGroupSqudScript") then {

			//systemChat str diag_tickTime;

			hs_dynamicGroupSqudScript = [] spawn {

				disableSerialization;

				private ["_display" , "_cntrlGroupEdit" , "_cntrlsquadDescription" , "_cntrlGroupList"];

				_display =  (uiNamespace getVariable "BIS_dynamicGroups_display");

				//그룹 에디트 버튼 덮어씌우기.
				_cntrlGroupEdit = _display displayCtrl 9777;

				{_cntrlGroupEdit ctrlRemoveAllEventHandlers _x} forEach ["KeyDown" , "SetFocus" ,"KillFocus" ];
				_cntrlGroupEdit ctrlSetEventHandler ["MouseButtonClick" ," (uiNamespace getVariable 'BIS_dynamicGroups_display') closeDisplay 2; [((group player) getVariable 'BIS_dg_var')] call hs_fnc_removeGroup ; createDialog 'HS_DIALOG'; "];
				//createDialog 'HS_DIALOG'

				//분대설명 박스 추가하기.
                _cntrlsquadDescription = _display ctrlCreate ["cw_noteblock_edit",1300];
                //분대설명 박스 설정.
                _cntrlsquadDescription ctrlSetPosition [1.087,0.02,0.3375,0.79];
                _cntrlsquadDescription ctrlSetBackgroundColor [0,0,0,1];
                _cntrlsquadDescription ctrlSetTextColor [1, 1, 1, 1];
                _cntrlsquadDescription ctrlSetFont "RobotoCondensed";
                _cntrlsquadDescription ctrlCommit 0;


                //그룹박스 변수 만들기.
                _cntrlGroupList = _display displayCtrl 9877;
                //그룹박스에서 그룹만 감지해서 분대설명 컨트롤에 출력하기.
                _cntrlGroupList ctrlAddEventHandler ["treeSelChanged", {

                    //그룹명으로 얻는 그룹이 없으면 출력 안함.
                    if (isnull (["GetGroupByName" , [ ((_this select 0) tvData (_this select 1))  , west]] call BIS_fnc_dynamicGroups) ) exitWith
                    {


                         ((uiNamespace getVariable "BIS_dynamicGroups_display") displayCtrl 1300) ctrlSetText "";
                    };

                    //선택한 그룹명과 유니크id로 가져온 분대만들기 정보가 같은 리스트를 가져옴.
                    _squadList = hs_var_spawn select
                    {


                        (["GetGroupByName" , [((_this select 0) tvData (_this select 1))  , west]] call BIS_fnc_dynamicGroups) isEqualTo
                        (["GetGroupByUniqueId",[ (_x select 0) , west]] call BIS_fnc_dynamicGroups)
                    } select 0;


                    //분대설명 창에 출력하기.
                    ((uiNamespace getVariable "BIS_dynamicGroups_display") displayCtrl 1300) ctrlSetText (_squadList select 1);



                }];


                waitUntil {uisleep (1/diag_fps); isnil {uiNamespace getVariable "BIS_dynamicGroups_display"}   };
                hs_dynamicGroupSqudScript = nil;
                terminate _thisScript;

            }

        };
    };
}];

[aceVirtualArsenalBox, true, false] call ace_arsenal_fnc_initBox;
ace_arsenalBlacklist = call compile preprocessFileLineNumbers	"arsenal.sqf";
[aceVirtualArsenalBox, ace_arsenalBlacklist , false] call ace_arsenal_fnc_removeVirtualItems;

["acex_killTracker_death" , {
  params ["_killer", "_killInfo"];

  ["HS_ACEX_diedByToServer", [name player , _killer, _killInfo]] call CBA_fnc_serverEvent;

}] call CBA_fnc_addEventHandler;

if (isdedicated) exitWith {};
