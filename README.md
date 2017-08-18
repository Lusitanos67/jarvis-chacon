## Description
Control DIO Wireless wall switches (ON/OFF) with <a target="_blank" href="http://domotiquefacile.fr/jarvis/">Jarvis assistant</a>.
This plugin uses mochad to control your X10 devices.
It will allow you to simply turn on and off your devices.
For now needs wiring and g++ pre-installed (this will be automated in the plugin installation).
See https://arno0x0x.wordpress.com/2015/04/02/rf433-outlet/

<img src="https://raw.githubusercontent.com/Lusitanos67/jarvis-chacon/master/presentation_chacon.jpg" width="600">


## Usage
  ```
   Vous: allume la cuisine
   Jarvis: J'allume la cuisine...
   # > ...
   Jarvis: C'est fait...
   ```


## How to install

you can see this page to help you: https://arno0x0x.wordpress.com/2015/04/02/rf433-outlet/

1) Connect a 433MHz RF sender module to the Raspberry Pi by following this schema:

<img src="https://raw.githubusercontent.com/Lusitanos67/jarvis-chacon/master/rpi_433MHzSender.jpg" width="300">

2) Add this plugin to your <a target="_blank" href="http://domotiquefacile.fr/jarvis/">Jarvis assistant</a> (<a target="_blank" href="http://domotiquefacile.fr/jarvis/content/plugins">more info here</a>): ```./jarvis.sh -p https://github.com/Lusitanos67/jarvis-chacon```

3) Configure the config.sh, to match your requirements (use any chacon number if you don't have remote controler).

-Indicate the controler code uses (default:12325261):
   ```
   pg_chacon_num=12325261
   ```  
-List your device names & corresponding addresses in `json` format
   ```
   pg_chacon_config='{ "devices":[
    { "name": "SALON", "address": "1"},
    { "name": "SALLE A MANGER", "address": "2"},
    { "name": "CUISINE", "address": "3"}
    ]}'
   ```

4) Pair the wireless wall switches with your Raspberry Pi (to do with all your switches): Connect your wireless wall switch and in the 5 seconds, send a "ON" then "OFF" command to the switch (use the terminal to send the command since the right folder like this: '''sudo ./chacon_send 0 12325261 1 on''' then '''sudo ./chacon_send 0 12325261 1 off''')

5) Enjoy


## Author
[Lusitanos67](https://github.com/Lusitanos67/jarvis-chacon)


## License

This project is under MIT license. This means you can use it as you want (just don't delete the plugin header).


## Contribute

If you want to add more examples or improve the plugin, just create a pull request with proper commit message and right wrapping.
