#This is intended for Cinnammon Linux Mint, different distros might have different procedures
#As of April 2nd 2026 this script is functional but requires more testing
#so I don't know if it will go trough completely or if this methods work with current version of mint



#Install Xscreensaver Packages:
sudo apt install xscreensaver xscreensaver-data-extra xscreensaver-gl-extra

#Disable Cinnamon Screensaver:
#I'm taking this part from internet forums as I usually do this trough the GUI so 
#some testing is needed before checking is working properly

#Stop Cinnamon Screensaver (if running)
#killall cinnamon-screensaver  #Possible hang at this command

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
echo "Name=XScreensaver" >> XScreensaver_temp_setup.desktop
echo "Comment=Xscreensaver launcher" >> XScreensaver_temp_setup.desktop
echo "X-GNOME-Autostart-Delay=35" >> XScreensaver_temp_setup.desktop

#Copy as Startup
cp XScreensaver_temp_setup.desktop /home/$USER/.config/autostart/XScreensaver.desktop
#sudo cp XScreensaver_temp_setup.desktop /home/$USER/.config/autostart/XScreensaver.desktop

#Is sudo neccesary here?
#More testing if that's an issue

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

mkdir /home/$USER/Screensavers_Custom
#Copy and Add Windows 98 "Travel" Screensaver
cp Travel.mp4 /home/$USER/Screensavers_Custom/Travel.mp4
sudo sed -i "s,programs:,&\n  "'"Win98_Travel"'" mpv --start=00:00:00 \\\\ \n --no-stop-screensaver --fs \\\\ \n--wid=$""XSCREENSAVER_WINDOW \\\\ \n /home/$USER/Screensavers_Custom/Travel.mp4 \\\\n\\\\ ,g"  ~/.xscreensaver    

#Add Windows 95 "Mistery" Screensaver
#Add Windows 95 "Jungle" Screensaver
#Add Windows 95 "Flying_Windows" Screensaver
#Add Windows 95 "3D_Flying_Objects" Screensaver
#Add Windows 95 "Space_Station" Screensaver
#Add Windows 95 "Starfield" Screensaver
#Add Windows 95 "Underwater" Screensaver

#Create A Help file
echo "YOU CAN ADD YOUR OWN SCREENSAVERS!" > Add_Your_Own_Screensavers_temp.txt
echo "" >> Add_Your_Own_Screensavers_temp.txt
echo "XScreensaver also supports .mp4 videos (trough mpv Media Player) as Screensavers so anything can be a screensaver as long as it's recorded" >> Add_Your_Own_Screensavers_temp.txt
echo "Just copy your .mp4 file in this folder and add the path of the video and parameters to the XScreensaver file." >> Add_Your_Own_Screensavers_temp.txt
echo "You'll find your .xscreensaver file as a hidden file on your HOME directory" >> Add_Your_Own_Screensavers_temp.txt
echo "Open the file and under the 'programs: ' line you can add your Screensaver " >> Add_Your_Own_Screensavers_temp.txt
echo "" >> Add_Your_Own_Screensavers_temp.txt
echo "[Example]" >> Add_Your_Own_Screensavers_temp.txt
echo "programs:" >> Add_Your_Own_Screensavers_temp.txt
echo '"my_screensaver" mpv --start=00:00:00 \' >> Add_Your_Own_Screensavers_temp.txt
echo '--no-stop-screensaver --fs \ ' >> Add_Your_Own_Screensavers_temp.txt
echo '--wid=$XSCREENSAVER_WINDOW \ ' >> Add_Your_Own_Screensavers_temp.txt
echo ' /home/<my_user>/Screensavers_Custom/my_screensaver.mp4 _replacethis_ ' >> Add_Your_Own_Screensavers_temp.txt
echo "" >> Add_Your_Own_Screensavers_temp.txt
echo "And that's it! As long as mpv is working correctly it should run without an issue" >> Add_Your_Own_Screensavers_temp.txt
#Last line doesn't write correctly
sed -i 's/_replacethis_/\\\\n\\\\/g' Add_Your_Own_Screensavers_temp.txt
 
 
#Copy it to the correct directory
cp Add_Your_Own_Screensavers_temp.txt /home/$USER/Screensavers_Custom/Add_Your_Own_Screensavers.txt
#Remove temporal setup file
rm -f Add_Your_Own_Screensavers_temp.txt

#Restart XScreensaver to save changes
xscreensaver-command -restart

#Needs testing on a clean install of Mint for full confirmation of the install script
#after that we can start on phase 2 of this code







