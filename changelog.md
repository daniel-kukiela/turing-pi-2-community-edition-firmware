# TODO
- Add login/password protection to the webpanel
- Add an ability to set the MAC address read from the SD card
- Add an ability to set the IP address read from the SD card
- Synhcronize the hardware clock when the system clock is being set
- Fix possible buffer-overflow errors found in the firmware
- Add timezone settings for the time to be set correctly

<br>

# Changelog

## v0.1.0
- Added `ntp` and `ntpd` (automatic time synchronization from the internet)
- Enabled SSH root logins
- Set static MAC address (`12:34:56:78:9A:BC`) (one of the next releases will allow for setting it from the txt file placed on the SD card)
- Updated the welcome screen ASCII art Turing Pi 2 logo
- Added information about the community edition of the firmware as well as the firmware version
- Update firmware filenames to contain firmware information and version
- Created and updated some of the helper scripts
- Performed some cleanup
