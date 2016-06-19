class CfgRestartWarnings
{
   class dynamic
   {
      interval = 1; // after how many hours of uptime the server will restart | ignore if using scheduled restarts
   };
   class scheduled
   {
      schedule[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24}; // hours at which the server will restart | ignore if using non-scheduled restarts
   };
   forceLeave = 1; // (in minutes) | kicks players to lobby if still in-game at this amount of minutes before restart | use 0 to disable
   giveWarningsAt[] = {60,50,40,30,20,10,5,2,1}; // higher numbers before lower
   mode = 2; // 1 = non-scheduled | 2 = scheduled
};

// DYNAMIC means: server will always restart after it has been up for a specified amount of hours
// SCHEDULED means: server will always restart at fixed/specified times
