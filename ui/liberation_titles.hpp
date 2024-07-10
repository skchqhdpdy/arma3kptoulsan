class RscTitles
{
   class intro1
   {
      name = "intro1";
      duration = 4;
      idd = -1;
      movingEnable = false;
      controls[]=
      {
         GenericLabelShadow, GenericLabel2
      };
	  class GenericLabel2 {
		idc = -1;
		type =  CT_STATIC ;
		style = ST_CENTER;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.035 * safezoneH;
		x = 0.3 * safezoneW + safezoneX;
		w = 0.4 * safezoneW;
		y = 0.65 * safezoneH + safezoneY;
		h = 0.1 * safezoneH;
		text = "BJC and USF presents";
		shadow = 1;
	  };
	  class GenericLabelShadow : GenericLabel2{
		shadow = 2;
	  };
   };

   class intro2
   {
      name = "intro2";
      duration = 7;
      idd = -1;
      movingEnable = false;
      controls[]=
      {
         VersionLabelShadow, Splash, VersionLabel
      };
	  	class Splash {
		idc = -1;
		type =  CT_STATIC ;
		style = ST_PICTURE;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.1 * safezoneH;
		x = 0.325 * safezoneW + safezoneX;
		w = 0.35 * safezoneW;
		y = 0.2 * safezoneH + safezoneY;
		h = 0.6 * safezoneH;
		text = "res\splash_libe2.paa";
	  };
	  class VersionLabel {
		idc = -1;
		type =  CT_STATIC ;
		style = ST_CENTER;
		shadow = 1;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.035 * safezoneH;
		x = 0.45 * safezoneW + safezoneX;
		w = 0.3 * safezoneW;
		y = 0.65 * safezoneH + safezoneY;
		h = 0.1 * safezoneH;
		text = $STR_MISSION_VERSION;
	  };
	  class VersionLabelShadow : VersionLabel {
		shadow = 2;
		font = FontM;
	  };
   };

   class blank
   {
      name = "blank";
      duration = 999999;
      idd = 6666;
      movingEnable = true;
	  onLoad = "";
      controls[]={};
   };

   class buildreason
	{
		name = "buildreason";
		duration = 10;
		idd = 5321;
		movingEnable = false;
		controlsBackground[] = {};

		objects[] = {};

		class controls
		{
			class Background : RscPicture
			{
				idc = 1200;
				text = "#(argb,8,8,3)color(0,0,1,1)";
				x = 0.314375 * safezoneW + safezoneX;
				y = 0.192 * safezoneH + safezoneY;
				w = 0.37125 * safezoneW;
				h = 0.055 * safezoneH;
			};
			class Text : RscText
			{
				idc = 1000;
				text = "$STR_BUILDREASON";

				font = FontM;
				style = ST_CENTER;
				sizeEx = 0.05;

				x = 0.314375 * safezoneW + safezoneX;
				y = 0.192 * safezoneH + safezoneY;
				w = 0.37125 * safezoneW;
				h = 0.055 * safezoneH;
			};
		};
	};
   
   class askbuild
	{
		name = "askbuild";
		duration = 30;
		idd = 5677;
		onLoad = "uiNamespace setVariable ['GUI_VOTE', _this select 0];";
		movingEnable = false;
		controlsBackground[] = {};

		objects[] = {};

		class controls
		{
			class Background: RscPicture
			{
				idc = 1200;
				text = "#(argb,8,8,3)color(0.15,0.15,0.15,0.8)";
				x = 0.824844 * safezoneW + safezoneX;
				y = 0.17 * safezoneH + safezoneY;
				w = 0.165 * safezoneW;
				h = 0.088 * safezoneH;
			};
			class TitleBackground: RscPicture
			{
				idc = 1201;
				text = "#(argb,8,8,3)color(0.3,0.3,0.3,0.9)";
				x = 0.824843 * safezoneW + safezoneX;
				y = 0.137 * safezoneH + safezoneY;
				w = 0.134062 * safezoneW;
				h = 0.033 * safezoneH;
			};
			class TimerBackground: RscPicture
			{
				idc = 1202;
				text = "#(argb,8,8,3)color(0.1,0.1,0.1,0.9)";
				x = 0.958906 * safezoneW + safezoneX;
				y = 0.137 * safezoneH + safezoneY;
				w = 0.0309375 * safezoneW;
				h = 0.033 * safezoneH;
			};
			class label_agreecount: RscText
			{
				idc = 1000;
				text = "찬성: 1%/2%"; //--- ToDo: Localize;

				font = FontM;

				x = 0.835156 * safezoneW + safezoneX;
				y = 0.17 * safezoneH + safezoneY;
				w = 0.0670312 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class label_disagreecount: RscText
			{
				idc = 1001;
				text = "반대: 1%/2%"; //--- ToDo: Localize;

				font = FontM;

				x = 0.9125 * safezoneW + safezoneX;
				y = 0.17 * safezoneH + safezoneY;
				w = 0.0670312 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Key_OK: RscPicture
			{
				idc = 1203;
				text = "#(argb,8,8,3)color(0.9,0.9,0.9,1)";
				x = 0.860937 * safezoneW + safezoneX;
				y = 0.225 * safezoneH + safezoneY;
				w = 0.0154688 * safezoneW;
				h = 0.022 * safezoneH;
			};
			class Key_NO: RscPicture
			{
				idc = 1204;
				text = "#(argb,8,8,3)color(0.9,0.9,0.9,1)";
				x = 0.917656 * safezoneW + safezoneX;
				y = 0.225 * safezoneH + safezoneY;
				w = 0.0154688 * safezoneW;
				h = 0.022 * safezoneH;
			};
			class label_Agree: RscText
			{
				idc = 1002;
				text = "동의"; //--- ToDo: Localize;

				font = FontM;

				x = 0.881562 * safezoneW + safezoneX;
				y = 0.225 * safezoneH + safezoneY;
				w = 0.0309375 * safezoneW;
				h = 0.022 * safezoneH;
			};
			class label_Disagree: RscText
			{
				idc = 1003;
				text = "거부"; //--- ToDo: Localize;

				font = FontM;

				x = 0.938281 * safezoneW + safezoneX;
				y = 0.225 * safezoneH + safezoneY;
				w = 0.0309375 * safezoneW;
				h = 0.022 * safezoneH;
			};
			class label_key_OK: RscText
			{
				idc = 1004;
				text = "HOME"; //--- ToDo: Localize;

				font = FontM;
				sizeEx = 0.025;
				style = ST_CENTER;
				colorText[] = { 0,0,0,1 };

				x = 0.860937 * safezoneW + safezoneX;
				y = 0.225 * safezoneH + safezoneY;
				w = 0.0154688 * safezoneW;
				h = 0.022 * safezoneH;
			};
			class label_key_NO: RscText
			{
				idc = 1005;
				text = "END";

				font = FontM;
				sizeEx = 0.026;
				style = ST_CENTER;
				colorText[] = { 0,0,0,1 };

				x = 0.917656 * safezoneW + safezoneX;
				y = 0.225 * safezoneH + safezoneY;
				w = 0.0154688 * safezoneW;
				h = 0.022 * safezoneH;
			};
			class title: RscText
			{
				idc = 1006;
				text = "%1에서 %2 건설 요청";

				font = FontM;

				x = 0.824844 * safezoneW + safezoneX;
				y = 0.137 * safezoneH + safezoneY;
				w = 0.134062 * safezoneW;
				h = 0.033 * safezoneH;
			};
			class timer: RscText
			{
				idc = 1007;
				text = "%1 초";

				font = FontM;

				x = 0.958906 * safezoneW + safezoneX;
				y = 0.137 * safezoneH + safezoneY;
				w = 0.0309375 * safezoneW;
				h = 0.033 * safezoneH;
			};
		};
	};
	
   class statusoverlay
   {
      name = "statusoverlay";
      duration = 999999;
      idd = 6666;
      movingEnable = true;
	  onLoad = "uiNamespace setVariable ['GUI_OVERLAY', _this select 0];";
      controls[]= { BGPicture,LabelManpower,LabelAmmo,LabelFuel,LabelCap,PictureManpowerShadow,PictureAmmoShadow, BGPictureActiveSectors,
	  PictureFuelShadow,PictureCapShadow,PictureManpower,PictureAmmo,PictureFuel,PictureCap,PictureCombatReadinessShadow,PictureCombatReadiness,
	  PictureIntelShadow, PictureIntel, LabelIntel,
	  BGPictureSector,CaptureFrame_OPFOR, CaptureFrame_BLUFOR, CaptureFrame, LabelPoint, LabelCombatReadiness, CentralShadow, CentralLabel, ActiveSectors,
	  AlertBGPicture, AlertLabel, AlertTimer };
	  class BGPicture {
	  	idc = -1;
		type =  CT_STATIC;
		style = ST_PICTURE;
		colorText[] = {0.8,0.8,0.8,0.9};
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.5;
		x = 0.95 * safezoneW + safezoneX;
		w = 0.075 * safezoneW;
		y = 0.395 * safezoneH + safezoneY;
		h = 0.153 * safezoneH;
		text = "res\gradient.paa";
	  };
	  class BGPictureSector : BGPicture {
	  	idc = 201;
		x = 0.9 * safezoneW + safezoneX;
		w = 0.15 * safezoneW;
		y = 0.33 * safezoneH + safezoneY;
		h = 0.05 * safezoneH;
	  };
	  class GenericLabel69 {
		idc = -1;
		type =  CT_STATIC;
		style = ST_RIGHT;
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.022 * safezoneH;
		x = 0.905 * safezoneW + safezoneX;
		w = 0.08 * safezoneW;
		y = 0.5225 * safezoneH + safezoneY;
		h = 0.04 * safezoneH;
		text = "";
		shadow = 2;
	  };
	  class CentralLabel : GenericLabel69 {
		idc = 266;
		type = CT_STATIC;
		style = ST_CENTER;
		colorText[] = {1,1,0,1};
		sizeEx = 0.03 * safezoneH;
		x = 0 * safezoneW + safezoneX;
		w = 1 * safezoneW;
		y = 0.2 * safezoneH + safezoneY;
		h = 0.05 * safezoneH;
		text = "";
	  };
	  class CentralShadow : CentralLabel {
		idc = 267;
		shadow = 1;
	  };
	  class GenericPicture69 {
	  	idc = -1;
		type =  CT_STATIC;
		style = ST_PICTURE;
		colorText[] = {0.9,0.9,0.9,1};
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.5;
		x = 0.985 * safezoneW + safezoneX;
		w = 0.012 * safezoneW;
		h = 0.0213333333 * safezoneH;
	  };
	 class PictureManpower : GenericPicture69 {
		y = (0.4 + ( ICONE_SPACY * 0 ) ) * safezoneH + safezoneY;
		text = "res\ui_manpo.paa";
	  };
	  class PictureAmmo : GenericPicture69 {
		y = (0.4 + ( ICONE_SPACY * 1 ) ) * safezoneH + safezoneY;
		text = "res\ui_ammo.paa";
	  };
	  class PictureFuel : GenericPicture69 {
		y = (0.4 + ( ICONE_SPACY * 2 ) ) * safezoneH + safezoneY;
		text = "res\ui_fuel.paa";
	  };
	  class PictureCap : GenericPicture69 {
		y = (0.4 + ( ICONE_SPACY * 3 ) ) * safezoneH + safezoneY;
		text = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa";
	  };
	  class PictureCombatReadiness : GenericPicture69 {
		idc = 135;
		y = (0.4 + ( ICONE_SPACY * 4 ) ) * safezoneH + safezoneY;
		text = "\A3\ui_f\data\map\markers\handdrawn\warning_CA.paa";
	  };
	  class PictureIntel : GenericPicture69 {
	  	colorText[] = {0,0.45,0.95,1};
		y = (0.4 + ( ICONE_SPACY * 5 ) - 0.0025) * safezoneH + safezoneY;
		text = "\A3\Ui_f\data\GUI\Cfg\Ranks\general_gs.paa";
	  };
	  class PictureManpowerShadow : PictureManpower {
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 0 ) ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };
	  class PictureAmmoShadow : PictureAmmo {
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 1 ) ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };
	  class PictureFuelShadow : PictureFuel {
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 2 ) ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };
	  class PictureCapShadow : PictureCap {
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 3 ) ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };
	  class PictureCombatReadinessShadow : PictureCombatReadiness {
	  	idc = -1;
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 4 ) ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };
	  class PictureIntelShadow : PictureIntel {
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 5 ) - 0.0025 ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };
	  class LabelManpower : GenericLabel69 {
	  	idc = 101;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 0 ) ) * safezoneH + safezoneY;
		colorText[] = {0, 0.75, 0, 1};
	  };
	 class LabelAmmo : GenericLabel69 {
	  	idc = 102;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 1 ) ) * safezoneH + safezoneY;
		colorText[] = {0.75, 0, 0, 1};
	  };
	  class LabelFuel : GenericLabel69 {
	  	idc = 103;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 2 ) ) * safezoneH + safezoneY;
		colorText[] = {0.75, 0.75, 0, 1};
	  };
	  	class LabelCap : GenericLabel69 {
	  	idc = 104;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 3 ) ) * safezoneH + safezoneY;
		colorText[] = {0.8, 0.8, 0.8, 1};
	  };
	  class LabelCombatReadiness : GenericLabel69 {
	  	idc = 105;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 4 ) ) * safezoneH + safezoneY;
		colorText[] = {0.8, 0.8, 0.8, 1};
	  };
	  class LabelIntel : GenericLabel69 {
	  	idc = 106;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 5 ) - 0.0015 ) * safezoneH + safezoneY;
		colorText[] = {0, 0.45, 0.95, 1};
	  };
	  class CaptureFrameStandard {
		type =  CT_STATIC;
		font = FontM;
		sizeEx = 0.023;
		text = "";
	};
	  class CaptureFrame : CaptureFrameStandard {
		idc = 202;
		style = ST_FRAME;
		colorText[] = COLOR_BLACK;
		colorBackground[] = COLOR_OPFOR_NOALPHA;
		x = 0.9125 * safezoneW + safezoneX;
		w = 0.085 * safezoneW;
		y = 0.358 * safezoneH + safezoneY;
		h = 0.012 * safezoneH;
	};
	class CaptureFrame_OPFOR : CaptureFrameStandard{
		idc = 203;
		style = ST_STATIC;
		colorText[] = {0.6, 0, 0, 1};
		colorBackground[] = {0.6, 0, 0, 1};
		x = 0.9125 * safezoneW + safezoneX;
		w = 0.084 * safezoneW;
		y = 0.358 * safezoneH + safezoneY;
		h = 0.011 * safezoneH;

	};
	class CaptureFrame_BLUFOR : CaptureFrameStandard{
		idc = 244;
		style = ST_STATIC;
		colorText[] = {0, 0.2, 0.6, 1};
		colorBackground[] = {0, 0.2, 0.6, 1};
		x = 0.9125 * safezoneW + safezoneX;
		w = 0.084 * safezoneW;
		y = 0.358 * safezoneH + safezoneY;
		h = 0.011 * safezoneH;
	};
	class LabelPoint : GenericLabel69 {
	  	idc = 205;
		text = "";
		style = ST_RIGHT;
		sizeEx = 0.024 * safezoneH;
		x = 0.8 * safezoneW + safezoneX;
		w = 0.2 * safezoneW;
		y = 0.33 * safezoneH + safezoneY;
		h = 0.03 * safezoneH;
		colorText[] = {0.7, 0, 0, 1};
	  };
	  class ActiveSectors
 		{
 			idc = 516;
 			type = CT_STRUCTURED_TEXT;
 			colorBackground[] = COLOR_NOALPHA;
 			style = ST_RIGHT;
			x = 0.7 * safezoneW + safezoneX;
			w = 0.295 * safezoneW;
			y = 0.8 * safezoneH + safezoneY;
			h = 0.2 * safezoneH;
 			text= "";
 			size = 0.02 * safezoneH;
 			sizeEx = 0.02 * safezoneH;
 			shadow = 2;
				font = FontM;
				color = "#e0e000";
				align = "right";
				valign = "top";
 		};
 	class BGPictureActiveSectors : BGPicture {
	  	idc = 517;
		x = 0.93 * safezoneW + safezoneX;
		w = 0.1 * safezoneW;
		y = 0.8 * safezoneH + safezoneY;
		h = 0.2 * safezoneH;
	  };


	  class AlertBGPicture : BGPicture {
	  	idc = 401;
		x = 0.9 * safezoneW + safezoneX;
		w = 0.15 * safezoneW;
		y = 0.27 * safezoneH + safezoneY;
		h = 0.05 * safezoneH;
	  };

	  class AlertLabel : GenericLabel69 {
	  	idc = 402;
		text = "";
		style = ST_CENTER;
		sizeEx = 0.022 * safezoneH;
		x = 0.9 * safezoneW + safezoneX;
		w = 0.1 * safezoneW;
		y = 0.2675 * safezoneH + safezoneY;
		h = 0.03 * safezoneH;
		colorText[] = {0.85, 0, 0, 1};
	  };
	  class AlertTimer : GenericLabel69 {
	  	idc = 403;
		text = "";
		style = ST_CENTER;
		sizeEx = 0.026 * safezoneH;
		x = 0.9 * safezoneW + safezoneX;
		w = 0.1 * safezoneW;
		y = 0.29 * safezoneH + safezoneY;
		h = 0.03 * safezoneH;
		colorText[] = {0.85, 0, 0, 1};
	  };
	};

};
