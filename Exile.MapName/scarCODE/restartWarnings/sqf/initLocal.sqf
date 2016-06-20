/*
   Author: IT07

   Description:
   starts the restartWarnings script
*/

if hasInterface then
   {
      _doStuff =
      {
         if (not isMultiplayer) then { addAction ["Do restart warning...",{(["RscDisplayRestartWarnings"] call BIS_fnc_rscLayer) cutRsc["RscDisplayRestartWarnings", "PLAIN", 0, true]},"",-1,false,true,"alive player"] };
         [] ExecVM "scarCODE\restartWarnings\sqf\timeLoop.sqf";
         systemChat "[scarCODE] Started restartWarnings...";
      };
      if isMultiplayer then
         {
            waitUntil { if (not(isNull(findDisplay 46)) AND (typeOf player isEqualTo "Exile_Unit_Player") AND (time > 0) AND not(isNil"missionStartServer")) then {true} else {uiSleep 0.5; false} };
            uiSleep 1;
            call _doStuff;
         } else
         {
            waitUntil { if (not(isNull(findDisplay 46)) AND (time > 0) AND not(isNil"missionStartServer")) then {true} else {uiSleep 0.5; false} };
            uiSleep 1;
            call _doStuff;
         };
   } else
   {
      waitUntil { if (serverTime > 0) then {true} else {uiSleep 1; false} };
      missionStartServer = missionStart;
      publicVariable "missionStartServer";
   };
