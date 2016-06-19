disableSerialization;
_dsp = uiNamespace getVariable ["RscDisplayRestartWarnings", displayNull];
if not(isNull _dsp) then
   {
      playSound ["taskFailed", true];
      {
         _x ctrlSetFade 0;
         if (_forEachIndex isEqualTo 0) then
            {
               _ctrlPos = ctrlPosition _x;
               _x ctrlSetPosition [_ctrlPos select 0, _ctrlPos select 1, 0.075 * safezoneW, _ctrlPos select 3];
               _x ctrlCommit 0.15;
               uiSleep 0.15;
            };
         if (_forEachIndex isEqualTo 1) then
            {
               _ctrlPos = ctrlPosition _x;
               _x ctrlSetText format["%1", uiNamespace getVariable ["restartWarningsTimeLeft", 99]];
               _x ctrlSetPosition [_ctrlPos select 0, _ctrlPos select 1, 0.025 * safezoneW, _ctrlPos select 3];
               _x ctrlCommit 0.05;
               uiSleep 0.05;
            };
         if (_forEachIndex isEqualTo 2) then
            {
               _ctrlPos = ctrlPosition _x;
               _x ctrlSetText (if ((uiNamespace getVariable ["restartWarningsTimeLeft", 99]) > 1) then {"minutes until restart"} else {"minute until restart"});
               _x ctrlSetPosition [_ctrlPos select 0, _ctrlPos select 1, 0.25 * safezoneW, _ctrlPos select 3];
               _x ctrlCommit 0.3;
               uiSleep 0.3;
            };
      } forEach (allControls _dsp);
      uiSleep 7.5;
      (["RscDisplayRestartWarnings"] call BIS_fnc_rscLayer) cutFadeOut 0.5;
      uiNamespace setVariable ["RscDisplayRestartWarnings", displayNull];
   };
