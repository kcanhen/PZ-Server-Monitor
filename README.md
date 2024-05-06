# PZ-Server-Monitor

## Used with:

* RCON: https://github.com/gorcon/rcon-cli/releases/tag/v0.10.1
* Udderly Up To Date: https://steamcommunity.com/sharedfiles/filedetails/?id=2844315442

I developed a tool and combined it with other developers' plugins to achieve 24-hour automatic mod detection and updating, eliminating the need for manual server restarts.

**Setup Process**

1. First, install the `Udderly Up To Date` mod.

2. Edit `StartServer64.bat` and add the following line of code at the beginning: `start PzMonitor.bat`.
![image](https://github.com/kcanhen/PZ-Server-Monitor/assets/128405714/6619f253-f9c3-47ee-b9ca-6f11a5b5d5fa)



3. Download `PzMonitor.bat`, extract `rcon-0.10.1-win64.zip`, and place them all in the same directory as `StartServer64.bat`.



4. Edit `PzMonitor.bat` and fill in the following details at the designated location (refer to the diagram below):

   - **Timer**: Enable automatic server restart `true/false`.

   - **RconPassword**: Rcon password (found in `%USERPROFILE%\Zomboid\Server\servertest.ini` under `RCONPassword=`).

   - **Message**: Text reminder before restarting the server `(please write your own)`.

   - **Hour**: Specify the hour for the restart `0~23`.

   - **Minute**: Specify the minute for the restart `0~59`.

   - **Broadcast**: Set how many minutes before the server shutdown to broadcast a reminder to players.
![image](https://github.com/kcanhen/PZ-Server-Monitor/assets/128405714/125c9449-f65c-4235-8a20-325116599694)




5. Once all settings are configured, you can start using it!

   After opening `PzMonitor.bat`, two windows will appear: one is the monitor, and the other is the server itself.

Monitor: "Check if the server is running"; if it is not, it will automatically restart the server.
![image](https://github.com/kcanhen/PZ-Server-Monitor/assets/128405714/b61bf7b0-aede-41b1-8c86-d586cbf73c77)




If the Timer is set to `true`, the server will automatically shut down and restart at the specified time. (This feature can be disabled.)

![image](https://github.com/kcanhen/PZ-Server-Monitor/assets/128405714/41c2ed92-4e3a-4d8b-be96-7141139d3935)

