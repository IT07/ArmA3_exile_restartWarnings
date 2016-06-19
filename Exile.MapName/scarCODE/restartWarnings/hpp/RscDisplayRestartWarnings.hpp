class RscDisplayRestartWarnings
{
   duration = 999999;
   idd = 7771;
   onLoad = "if isNull (uiNamespace getVariable ['RscDisplayRestartWarnings', displayNull]) then { uiNamespace setVariable ['RscDisplayRestartWarnings', _this select 0]; ExecVM 'scarCODE\restartWarnings\sqf\onLoad.sqf' }";
   #define GUI_GRID_X	(0)
   #define GUI_GRID_Y	(0)
   #define GUI_GRID_W	(0.025)
   #define GUI_GRID_H	(0.04)
   #define GUI_GRID_WAbs	(1)
   #define GUI_GRID_HAbs	(1)
   class RscBackground
   {
      access = 0;
      colorBackground[] = {0,0,0,0.85};
      colorShadow[] = {0,0,0,0.5};
      colorText[] = {0.1,0.1,0.1,1};
      deletable = 0;
      fade = 0;
      fixedWidth = 0;
      font = "PuristaLight";
      idc = -1;
      linespacing = 1;
      shadow = 0;
      sizeEx = 1;
      style = 512;
      text = "";
      tooltipColorBox[] = {1,1,1,1};
      tooltipColorShade[] = {0,0,0,0.65};
      tooltipColorText[] = {1,1,1,1};
      type = 0;

      x = 0;
      y = 0;
      w = 0;
      h = 0;
   };
   class RscText
   {
      access = 0;
      colorBackground[] = {0,0,0,0};
      colorShadow[] = {0,0,0,0.5};
      colorText[] = {1,1,1,1};
      deletable = 0;
      fade = 0;
      fixedWidth = 0;
      font = "RobotoCondensed";
      idc = -1;
      linespacing = 1;
      shadow = 0;
      sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
      style = 0;
      text = "";
      tooltipColorBox[] = {1,1,1,0.1};
      tooltipColorShade[] = {0,0,0,0.65};
      tooltipColorText[] = {1,1,1,0.9};
      type = 0;

      x = 0;
      y = 0;
      w = 0;
      h = 0;
   };

   class controls
   {
      class txtCaution:RscText
      {
         x = 0.2925 * safezoneW + safezoneX;
			y = 0.2025 * safezoneH + safezoneY;
			//w = 0.075 * safezoneW;
			h = 0.0225 * safezoneH;

         colorBackground[] = {1,0.749,0.239,0.75};
         colorText[] = {0,0,0,0.9};
         fade = 1;
         font = "PuristaMedium";
         text = "CAUTION";
      };
      class txtMinutes:RscText
      {
         x = 0.2925 * safezoneW + safezoneX;
			y = 0.2265 * safezoneH + safezoneY;
			//w = 0.025 * safezoneW;
			h = 0.0315 * safezoneH;

         colorBackground[] = {0,0,0,0.75};
         colorText[] = {1,1,1,0.9};
         //fade = 1;
         font = "PuristaBold";
         text = "99";
         sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
      };
      class txtWarning:RscText
      {
         x = 0.3185 * safezoneW + safezoneX;
			y = 0.2265 * safezoneH + safezoneY;
			//w = 0.25 * safezoneW;
			h = 0.0315 * safezoneH;

         colorBackground[] = {0,0,0,0.75};
         colorText[] = {1,1,1,0.9};
         fade = 1;
         font = "PuristaLight";
         text = "minutes until restart...";
         sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
      };
   };
};
