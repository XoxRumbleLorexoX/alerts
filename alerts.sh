#!/bin/bash
echo "Script Is Working!"
cuz1=$(sudo arp-scan -l | grep -c 192.168.0.21)
mother1=$(sudo arp-scan -l | grep -c 192.168.0.11) #replace ip with the target that you iwsh to know entering and leaving the premises
sleep 1
cuz2=$(sudo arp-scan -l | grep -c 192.168.0.21)
mother2=$(sudo arp-scan -l | grep -c 192.168.0.11) #here too
date=$(date)


function messageC() {
  if [[ $cuz2 == 1 ]];
  then
    imessage -t "192.168.0.21, Thanga is home. $date" -c sixrumblelorexis@gmail.com # here too & also replace my apple id with yours
  elif [[ $cuz2 == 0 ]];
  then
    imessage -t "192.168.0.21, Thanga is not home. $date" -c sixrumblelorexis@gmail.com #here too & also replace my apple id with yours
  fi
}

function messageM() {
  if [[ $mother1 == 1 ]];
  then
    imessage -t "192.168.0.11, Mum is home. $date" -c sixrumblelorexis@gmail.com # here too & also replace my apple id with yours
  elif [[ $mother1 == 0 ]];
  then
    imessage -t "192.168.0.11, Mum is not home. $date" -c sixrumblelorexis@gmail.com #here too & also replace my apple id with yours
  fi
}

if [ $cuz1 -ne $cuz2 ];
then
messageC
fi


if [ $mother1 -ne $mother2 ];
then
messageM
fi


#plan to add double check feature to prevent errors in the whereabouts of whoever.
#attachment can easily be added such as a sound file instead of text.
#downlaod imessgae via pack installer via cmd line (terminal on mac)
#Usage: imessage [options]

#Specific options:
#    -t, --text [TEXT]                The TEXT to deliver
#    -a, --attachment [ATTACHMENT]    Add an attachment
#    -c, --contacts x,y,z             Deliver message to these CONTACTS

#Common options:
#    -h, --help                       Prints this help
#        --version                    Show version
