if ( isDedicated ) exitWith {};

params [ "_requestPlayer", "_requestclass" ];

private _get = _requestPlayer getVariable["VoteBuild",nil];

waitUntil { isNil{(uiNamespace getVariable 'GUI_VOTE')} || isNil {_get} };
if(isNil "_get") exitWith {};
"GUI_VOTE" cutRsc ["askbuild","PLAIN"];
((uiNamespace getVariable 'GUI_VOTE') displayCtrl (1006)) ctrlSetText format["%1 : %2 건설 요청",name _requestPlayer,_requestclass];

GRLIB_VOTED = 0;
GRLIB_voting_timer = 23;

playSound "beep_target";

sleep 0.1;
private _keyeh = (findDisplay 46) displayAddEventHandler ["KeyDown", {
	if(_this select 1 == 0xC7) then {//HOME
		GRLIB_VOTED = 1;
	};
	if(_this select 1 == 0xCF) then {//END
		GRLIB_VOTED = -1;
	};
}];

if (player == _requestplayer) then {
	1 cutRsc ["BUILDREASON","PLAIN",0];
};

private _timer = [] spawn {
	while { GRLIB_voting_timer > 0 } do {
		GRLIB_voting_timer = GRLIB_voting_timer - 1;
		((uiNamespace getVariable 'GUI_VOTE') displayCtrl (1007)) ctrlSetText format["%1 초",GRLIB_voting_timer];
		sleep 1;
	};
};
while { !isNil{ _requestPlayer getVariable["VoteBuild",nil]; } && GRLIB_VOTED == 0 && GRLIB_voting_timer > 0} do {
	_get = _requestPlayer getVariable["VoteBuild",nil];
	((uiNamespace getVariable 'GUI_VOTE') displayCtrl (1000)) ctrlSetText format["찬성 %1/%2",_get select 1,_get select 0];
	((uiNamespace getVariable 'GUI_VOTE') displayCtrl (1001)) ctrlSetText format["반대 %1/%2",_get select 2,_get select 0];
	sleep 0.25;
};
if(!isNil{ _requestPlayer getVariable["VoteBuild",nil]; }) then {
	if(GRLIB_VOTED == 1) then {
		_get = _requestPlayer getVariable["VoteBuild",nil];
		_requestPlayer setVariable["VoteBuild",[_get select 0,(_get select 1)+1,_get select 2],true];
		[[GRLIB_side_friendly,"Base"],format["%1님이 찬성하였습니다.",name player]] remoteExec ["sideChat",_requestPlayer];
	};
	if(GRLIB_VOTED == -1) then {
		_get = _requestPlayer getVariable["VoteBuild",nil];
		if(group _requestPlayer == group player) then {
			_requestPlayer setVariable["VoteBuild",[_get select 0,_get select 1,_get select 0,true]];
		}
		else{
			_requestPlayer setVariable["VoteBuild",[_get select 0,_get select 1,(_get select 2)+1],true];
			[[CGRLIB_side_friendly,"Base"],format["%1님이 반대하였습니다.",name player]] remoteExec ["sideChat",_requestPlayer];
		};
		
	};
};

GRLIB_VOTED = nil;
GRLIB_voting_timer = 0;
terminate _timer;
(findDisplay 46) displayRemoveEventHandler ['KeyDown',_keyeh];
"GUI_VOTE" cutFadeOut 0;
uiNamespace setVariable ['GUI_VOTE', nil];