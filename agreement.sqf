/*
	Agreement script by HS (Steam64ID:76561198015127451)
	이 스크립트는 울산 서버에 단독 제공된 스크립트로,
	가공을 포함한 재배포/수정 행위는 제작자에게 문의 바랍니다.

  	실행 구문은  \ui\liberation_deploy.hpp의 94번째 줄 " null = [] execVm 'agreement.sqf' " 입니다.
   	원래 코드는 "deploy = 1;" 입니다.
*/

if (notagain == 0 && notagain != 1) then {
player enableSimulation false;

_Mytext = composeText [
lineBreak, "울산 서버에 오신 것을 환영합니다.",
lineBreak, "접속 전 숙지해주세요!",
lineBreak, "- 서버에서 제공하는 규칙을 꼭 확인해주세요!",
lineBreak, parseText "- 이 서버는 TFAR을 사용하므로 팀스피크3 설치가 필수이며, 미설치로 인한 불이익은 본인의 책임입니다.",
lineBreak, parseText "- 게임 관련 팁 및 팀스피크 설치요령은 <a href='https://cafe.naver.com/ulsanserver/book5090537'>여기</a>를 클릭하시면 확인할 수 있습니다.",
linebreak, parseText "- <a href='https://discord.gg/GAMSf4bTGv'>울산 디스코드</a>로 이동하여 울산 서버 매뉴얼 확인 및 접속자들과 채팅을 하실 수 있습니다.",
lineBreak, "이 약관을 동의함으로 디스코드에 위치한 규칙을 읽고 숙지하여 준수할 것이라는 암묵적 동의도 함께 합니다.",
linebreak, "확인했나요?"];

//  퀴즈 예문

_HS_Q1 = ["치료, 교육 이외의 목적으로 ACE 의료 기능을 사용해도 된다." , false];
_HS_Q2 = ["소속이 없이 작전에 투입해도 된다." , false];
_HS_Q3 = ["게임 내 소통을 위해 팀스피크를 사용하여야 한다." , true];
_HS_Q4 = ["작전 중인 타 분대의 작전 지역을 허가 없이 지나가도 된다." , false];
_HS_Q5 = ["각 분대 분대장은 이유가 있어야만 가입 요청할 수 있다." , true];
_HS_Q6 = ["접속을 종료할 때 꼭 사용했던 장비를 재활용해야 한다." , true];
_HS_Q7 = ["수송 분대 가입자는 자력 구제를 위해 무장할 수 있다." , true];
_HS_Q8 = ["작전 구역을 표기할 때 거점 수 제한 없이 표기할 수 있다." , false];
_HS_Q9 = ["활주로에는 회전익을 주차해선 안된다." , true];
_HS_Q10 =["의사는 보병 분대의 동의 없이 거점에 입장할 수 있다." , false];



_HS_Q = selectRandom [_HS_Q1 , _HS_Q2  ,_HS_Q3 , _HS_Q4 , _HS_Q5, _HS_Q6 , _HS_Q7 , _HS_Q8 , _HS_Q9 , _HS_Q10 ];


// lineBreak 는 줄 띄움을 의미합니다. 문장 추가시 " , lineBreak, "할 말" "로 추가하시면 됩니다.
_result =  [ _Mytext, "서버 약관", "예", "아니요"] call BIS_fnc_guiMessage; //약관 
 if(_result) then [{}, {endMission "loser"}];

_result =  [ _HS_Q select 0, "문제", "예", "아니요"] call BIS_fnc_guiMessage; //퀴즈
if(_result isEqualTo (_HS_Q select 1) ) then [
	{notagain = 1 ,player enableSimulation true;}, 
	{endMission "loser"}];
};



