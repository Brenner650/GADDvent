# GADDvent
GADDvent calendars for Christmas

## INSTRUCTIONS!

1. Open the folder called "Mission"
2. Copy my custom folder, merge if you have one already, to the main directory of your mission file (Exile.Mapname.pbo).
3. Merge the other 3 files with yours.
4. Go to the "Server" folder.
5. Copy the .pbo from there into your @ExileServer\addons folder.
6. Merge my Exile.ini into yours. Please either chose the 32 or 64 bit version.
7. Run the GADDvent.sql code on your database as a query.
8. Edit the file "ClaimGift.sqf" in the mission files to change the gifts given on Advent and Christmas day and also change the _serverName to your server.
9. Start the server.
10. Visit the office trader and claim your gifts.

### NOTE: If you have an issue with the addon not seeing the variable "ExileServerStartTime" (Users of some status bar scripts might not have this issue) please do the following:
If you use 64-Bit Exile, comment out your override in CfgExileCustomCode for ExileServer_system_database_connect and add our one...
#### ExileServer_system_database_connect = "custom\GADDvent\ExileServer_system_database_connect_extDB3.sqf";

If you do not use 64-Bit Exile, add this or replace yours with the following...
#### ExileServer_system_database_connect = "custom\GADDvent\ExileServer_system_database_connect.sqf";

### Any issues, please visit my discord and tell me about them. I will help. http://discord.gamingatdeathsdoor.com

License only applied to my work. The music included is NOT mine and all credit goes to their original authors and creators. All music content is supplied for free as they are found on YouTube. All royalties go to their respective label companies.
