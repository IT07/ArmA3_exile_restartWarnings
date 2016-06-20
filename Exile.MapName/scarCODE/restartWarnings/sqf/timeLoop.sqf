_forceLeave = getNumber (missionConfigFile >> "CfgRestartWarnings" >> "forceLeave");
if (_forceLeave < 0) then { _forceLeave = 0 }; // just to be sure. You never know when a retard tries to configure this
_giveWarningsAt = getArray (missionConfigFile >> "CfgRestartWarnings" >> "giveWarningsAt");
_mode = getNumber (missionConfigFile >> "CfgRestartWarnings" >> "mode");
if (_mode isEqualTo 1) then // if dynamic
   {
      //systemChat "restartWarnings: mode is 1";
      _interval = getNumber (missionConfigFile >> "CfgRestartWarnings" >> "dynamic" >> "interval");
      _maxUptimeSeconds = _interval * 3600;
      _warnsToSkip = [];

      for "_i" from 0 to ((count _giveWarningsAt) -1) do // strip-out all the warnings for minutes that have already passed
         {
            if (((_giveWarningsAt select _i) * 60) >= (_maxUptimeSeconds - (if isMultiplayer then {serverTime} else {time}))) then
               {
                  _warnsToSkip pushBack (_giveWarningsAt select _i);
               };
         };
      {
         _giveWarningsAt deleteAt (_giveWarningsAt find _x);
      } forEach _warnsToSkip;

      //systemChat format["_giveWarningsAt: %1", _giveWarningsAt];

      while { ((_maxUptimeSeconds - (if isMultiplayer then {serverTime} else {time})) > (_forceLeave * 60)) } do
         {
            _warningTime = _giveWarningsAt select 0;
            waitUntil { if ((_maxUptimeSeconds - (if isMultiplayer then {serverTime} else {time})) <= (_warningTime * 60)) then {true} else {uiSleep 1; false} };
            uiNamespace setVariable ["restartWarningsTimeLeft", _warningTime];
            (["RscDisplayRestartWarnings"] call BIS_fnc_rscLayer) cutRsc["RscDisplayRestartWarnings", "PLAIN", 0, true];
            _giveWarningsAt deleteAt 0;
         };

      if (_forceLeave > 0) then
         {
            systemChat "YOU WILL BE KICKED IN 30 SECONDS!";
            uiSleep 30;
            (findDisplay 49) closeDisplay 1;
            (findDisplay 46) closeDisplay 1;
         };
   };
if (_mode isEqualTo 2) then // if scheduled
   {
      //systemChat "restartWarnings: mode is 2";

      _schedule = getArray (missionConfigFile >> "CfgRestartWarnings" >> "scheduled" >> "schedule");
      private ["_arr"];
      if isMultiplayer then
         {
            _arr = missionStartServer;
         } else
         {
            _arr = [2016,6,18,14,5,20];
         };
      _startHour = _arr select 3;
      _startMinute = _arr select 4;
      _startSeconds = _arr select 5;

      _delFromSchedule = [];
      for "_i" from 0 to ((count _schedule) -1) do
         {
            if ((_schedule select _i) <= (_startHour + (_startMinute / 60) + (_startSeconds / 3600))) then
               {
                  _delFromSchedule pushBack (_schedule select _i);
               };
         };
      {
         _schedule deleteAt (_schedule find _x);
      } forEach _delFromSchedule;

      _secondsFromStartToRestart = ((_schedule select 0) * 3600) - ((_startHour * 3600) + (_startMinute * 60) + _startSeconds);

      _warnsToSkip = [];
      for "_i" from 0 to ((count _giveWarningsAt) -1) do // strip-out all the warnings for minutes that have already passed
         {
            if (((_giveWarningsAt select _i) * 60) >= (_secondsFromStartToRestart - (if isMultiplayer then {serverTime} else {time}))) then
               {
                  _warnsToSkip pushBack (_giveWarningsAt select _i);
               };
         };
      {
         _giveWarningsAt deleteAt (_giveWarningsAt find _x);
      } forEach _warnsToSkip;

      //systemChat format["Restart schedule: %1", _schedule];
      //systemChat format["Seconds from start to restart: %1", _secondsFromStartToRestart];
      //systemChat format["Warnings left: %1", _giveWarningsAt];

      while { ((_secondsFromStartToRestart - (if isMultiplayer then {serverTime} else {time})) > (_forceLeave * 60)) } do
         {
            _warningTime = _giveWarningsAt select 0;
            waitUntil { if ((_secondsFromStartToRestart - (if isMultiplayer then {serverTime} else {time})) <= (_warningTime * 60)) then {true} else {uiSleep 1; false} };
            uiNamespace setVariable ["restartWarningsTimeLeft", _warningTime];
            (["RscDisplayRestartWarnings"] call BIS_fnc_rscLayer) cutRsc["RscDisplayRestartWarnings", "PLAIN", 0, true];
            _giveWarningsAt deleteAt 0;
         };
      if (_forceLeave > 0) then
         {
            systemChat "YOU WILL BE KICKED IN 30 SECONDS!";
            uiSleep 30;
            (findDisplay 49) closeDisplay 1;
            (findDisplay 46) closeDisplay 1;
         };
   };
