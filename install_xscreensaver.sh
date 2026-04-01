#This is intended for Linux Mint, different distros might have different procedures
#As of April 1st 2026 this script is largely untested, I've just copied some command terminals from youtube + mint forums
#so I don't know if it will go trough completely or if this methods work with current version of mint



#Install Xscreensaver Packages:
sudo apt install xscreensaver xscreensaver-data-extra xscreensaver-gl-extra

#Disable Cinnamon Screensaver:
#I'm taking this part from internet forums as I usually do this trough the GUI so 
#some testing is needed before checking is working properly

#Stop Cinnamon Screensaver (if running)
killall cinnamon-screensaver

#Disable screen locking
gsettings set org.cinnamon.desktop.screensaver lock-enabled false

##Disable The Cinnamon Screensaver from starting##
#Disable screensaver idle activation (Option A)
gsettings set org.cinnamon.desktop.screensaver idle-activation-enabled false

#Set the idle delay to zero (Option B):
gsettings set org.gnome.desktop.session idle-delay 0

#Both options shouldn't interfere with eachother so setting both should not be an issue
#------------------------------------------------------------------------------------------#

#Create Startup file, and setting it up (I don't know if this works neither)

#Create The File
echo "[Desktop Entry]" > XScreensaver_temp_setup.desktop
echo "Type=Application" >> XScreensaver_temp_setup.desktop
echo "Exec=xscreensaver -no-splash" >> XScreensaver_temp_setup.desktop
echo "X-GNOME-Autostart-enabled=true" >> XScreensaver_temp_setup.desktop
echo "NoDisplay=false" >> XScreensaver_temp_setup.desktop
echo "Hidden=false" >> XScreensaver_temp_setup.desktop
echo "Name[es_CL]=XScreensaver" >> XScreensaver_temp_setup.desktop
echo "Comment[es_CL]=Xscreensaver launcher" >> XScreensaver_temp_setup.desktop
echo "X-GNOME-Autostart-Delay=35" >> XScreensaver_temp_setup.desktop
#"[es_CL]" could be a variable, need to check if that could be an issue

#Add as Startup
sudo cp XScreensaver_temp_setup.desktop /home/$USER/.config/autostart/XScreensaver.desktop
#User is a variable, hope I'm invoking correclty the directory !!!!!!!

#Remove temporal setup file
rm -f XScreensaver_temp_setup.desktop
#------------------------------------------------------------------------------------------#

#XScreensaver do the thing
xscreensaver -no-splash

#If no errors then we did fine :3 and Xscreensaver should be fully installed and operational, might need reboot to work properly
echo "Xscreensaver should be installed now!"


##Now to the fun part!!

#Install mpv for .mp4 videos as Screensavers
sudo apt install mpv
echo "Mpv should be installed now!"

##WIP COPY PASTE SCREENSAVER FILES







