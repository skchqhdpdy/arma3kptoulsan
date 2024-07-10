////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by HS, v1.063, #Migiby)
////////////////////////////////////////////////////////
class hs_dialog
{
	idd = 15000;
	movingenable = true;
	onLoad =  "if (!isNull (findDisplay 15000)) exitwith { closeDialog 0}; ";


	class Controls
	{
		class HS_BackGround : HS_IGUIBack
		{
			idc = 2200;

			text = "BackGround"; //--- ToDo: Localize;
			x = 0.0625;
			y = 0.16;
			w = 0.875;
			h = 0.78;
		};
		class HS_MenuBackground : HS_IGUIBack
		{
			idc = 2201;
			x = 0.0625;
			y = 0.1;
			w = 0.875;
			h = 0.04;
		};
		class HS_CreateSquadLabel: HS_RscText
		{
			idc = 1000;

			text = "분대 만들기"; //--- ToDo: Localize;
			x = 0.0625;
			y = 0.08;
			w = 0.1625;
			h = 0.08;
		};
		class HS_SquadTypeComboBox: HS_RscCombo
		{
			idc = 2100;
			onLoad = "{(_this select 0) lbAdd _x} foreach ['예비' , '보병' , '의사' , '정비' , '포병' , '기갑' , '기계화' , '수송' , '고정익' , '회전익' , 'HQ', '뉴비도우미'];	(_this select 0) lbSetCurSel 0 ";
			onLBSelChanged = "uiNamespace setVariable ['hs_dynamicGroupSquadType' , (_this select 0) lbText (lbCurSel (_this select 0))  ]; ";
			x = 0.1125;
			y = 0.26;
			w = 0.2;
			h = 0.05;
		};
		class HS_SquadTypeLabel: HS_RscText
		{
			idc = 1001;

			text = "분대 태그"; //--- ToDo: Localize;
			x = 0.1125;
			y = 0.18;
			w = 0.1625;
			h = 0.08;
		};
		class HS_SquadLR : HS_RscText
		{
			idc = 1002;

			text = "LR"; //--- ToDo: Localize;
			x = 0.1125;
			y = 0.31;
			w = 0.1625;
			h = 0.05;
		};
		class HS_SquadLRBox : HS_RscEdit
		{
			idc = 1402;
			onKillFocus = "ctrlSetText [1402, str parseNumber (ctrlText 1402)]";

			x = 0.1125;
			y = 0.36;
			w = 0.08;
			h = 0.05;

			maxChars = 4;

		};
		class HS_SquadSR : HS_RscText
		{
			idc = 1003;

			text = "SR"; //--- ToDo: Localize;
			x = 0.225;
			y = 0.31;
			w = 0.1625;
			h = 0.05;
		};
		class HS_SquadSRBox : HS_RscEdit
		{
			idc = 1403;
			onKillFocus = "ctrlSetText [1403, str parseNumber (ctrlText 1403)];";

			x = 0.225;
			y = 0.36;
			w = 0.08;
			h = 0.05;

			maxChars = 5;
		};
		class hs_ButtonOK: HS_RscButton
		{
			action = "closeDialog 0";

			onButtonClick = "call hs_fnc_sendGroupDataServer; [ctrlText 1401] spawn hs_spawn_var";
			idc = 2400;

			text = "OK"; //--- ToDo: Localize;
			x = 0.5125;
			y = 0.82;
			w = 0.1;
			h = 0.1;
		};
		class hs_ButtonCancel: HS_RscButton
		{
			action = "closeDialog 0";
			idc = 2401;

			text = "Cancel"; //--- ToDo: Localize;
			x = 0.775;
			y = 0.82;
			w = 0.1;
			h = 0.1;
		};
		class HS_SquadNameBOX: HS_RscEdit
		{
			idc = 1400;

			x = 0.475;
			y = 0.26;
			w = 0.4;
			h = 0.1;

			maxChars = 20;

		};
		class HS_SquadNameLabel: HS_RscText
		{
			idc = 1004;

			text = "분대명"; //--- ToDo: Localize;
			x = 0.4625;
			y = 0.18;
			w = 0.15;
			h = 0.1;
		};
		class HS_Squad_MarkBox: HS_RscListBox
		{
			idc = 1500;
			x = 0.1125;
			y = 0.48;
			w = 0.3;
			h = 0.32;

			onLoad = "(_this select 0) call hs_fnc_fillSquadMarkBox";
			onLBSelChanged = "uiNamespace setVariable ['hs_squadMark', (_this select 0) lbData (lbCurSel (_this select 0))]";

		};
		class HS_Squad_DescriptionBox: HS_RscEdit
		{
			style = 16;
			lineSpacing = 1;

			idc = 1401;
			x = 0.5;
			y = 0.48;
			w = 0.375;
			h = 0.3;

			maxChars = 100;

			text = "분대 설명이 없습니다.";

		};
		class HS_Squad_MarkLabel: HS_RscText
		{
			idc = 1000;

			text = "부대 마크"; //--- ToDo: Localize;
			x = 0.1125;
			y = 0.4;
			w = 0.1625;
			h = 0.08;
		};
		class HS_Squad_DescriptionLabel: HS_RscText
		{
			idc = 1000;

			text = "분대 설명란"; //--- ToDo: Localize;
			x = 0.5;
			y = 0.4;
			w = 0.1625;
			h = 0.08;
		};
	}
};

