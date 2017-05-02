#!/bin/bash
#Purpose = Using Gridcoin on a easy way with Linux
#Created on 15-04-2017
#Author = Steffov
#Version 1.0.0

RED='\033[0;41;30m'
STD='\033[0;0;39m'

#Current date. Needed for the backup process.
DATE=$(date +%b-%d-%y+%s)

#The Gridcoin config, blockchain and wallet directory.
CDIR=~/.GridcoinResearch

#Temp directory. Needed for the backup process.
TDIR=/tmp/gridlyb

function main_menu()
{ #Main menu from gridly. Thinks that gridly can are in this place.
    while :
    do
	clear	
	echo "************************************************"
        echo "* Hello, I'm Gridly! 			       *"
	echo "*    Your personal Gridcoin wallet wizard!     *"
        echo "*       My creator is Steffov           v1.0.0 *"
        echo "************************************************";	
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"	
	echo "        M A I N - M E N U          "
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "1. Install"
	echo "2. Update"
	echo "3. Download Blocks (latest snapshot)"
#	echo "4. gridcoinresearchd | command centre"
	echo "4. Exit"
	echo "~~~~~~~~~~~~~~~~~~~~~"
        read -p "Please tell me, how can I help you? [ 1 - 4]" m_choice
        echo
        
        case "$m_choice" in 
		1) _install ;;
	 	2) _update ;;
	    	3) _downloadblocks ;;
#		4) _gridcoindCom
            	4) clear
			echo "Gridly says good bye and thanks!" 
			echo "If you need me again, call Gridly! :)" 
				exit 0;;
		*) echo -e "${RED}Erm, wooot?${STD}" && sleep 2
	esac
    done
}

function os_req()
{ #Gathering information about the OS. Needed for the installation process.
clear
	echo "****************************************************"
	echo "First of all I need to know which Linux distribution" 
	echo "do you use?" 
	echo "****************************************************"
	PS3='Your OS?'
	select os in \
	    	'Debian based' \
		    'Arch based'
do
	case $REPLY in
		1 ) OS='Debian based' ;;
	        2 ) OS='Arch based' ;;
		* ) echo -e "${RED}I can only handle 1) or 2), sorry.${STD}" && sleep 2 
	esac
		if [[ -n $os ]]; then
		echo "You are using a $os system. Great!"
		sleep 2
		break
	fi
done
}

_install()
{ #Install process
	if [ "$os" == "" ] ; then
	os_req	
	fi		
	clear
	echo "****************** 1/4 steps ***********************"
	echo "   You need tools and programs for compiling the    "
	echo "   Gridcoin source. Gathering them now for you...    "
	echo "****************************************************";
	if [ "$os" == "Debian based" ] ; then
		sudo apt-get install ntp git build-essential libssl-dev libdb-dev libdb++-dev libqrencode-dev libcurl4-openssl-dev curl libzip-dev libzip4 libboost-atomic-dev libboost-chrono-dev libboost-date-time-dev libboost-filesystem-dev libboost-program-options-dev libboost-serialization-dev libboost-system-dev libboost-thread-dev qt5-default liblibqt5webkit5-dev
	elif  [ "$os" == "Arch based" ] ; then
		sudo pacman -S boost-libs libzip miniupnpc curl boost db git qrencode qt5-base qt5-tools
	fi
	
	clear
	echo "****************** 2/4 steps ***********************"
	echo "   Next I'll download the Gridcoin source from      "
	echo "  Github and clone it into your home directory...	  "
	echo "****************************************************";
	sleep 2
		echo "git download ist starting..."
			cd ~/
				git clone https://github.com/gridcoin/Gridcoin-Research
				
while true
do
	clear
	echo "****************** 3/4 steps ***********************"
	echo "    It's time to build your Wallet from source! "
	echo "       It'll take a while, please be patient!          "
	echo "****************************************************";
	echo "1. -qt wallet! (I'm a graphical guy)"
	echo "2. The daemon! (I love the command line)"
	read -p "Decide now! What can I install for you? [1 or 2]:" pichoice
		case $pichoice in
			1 ) 
			p='qt'
				cd ~/Gridcoin-Research
					sed -i 's/QT += qaxcontainer/CONFIG += qaxcontainer/' gridcoinresearch.pro
							if [[ -e $(which qmake-qt4) ]]; then
        			                        qmake-qt4 gridcoinresearch.pro USE_QRCODE=1 NO_UPGRADE=1
        			                else
        			                        qmake gridcoinresearch.pro USE_QRCODE=1 NO_UPGRADE=1
        			                fi
        			                        make
								strip gridcoinresearch
									sudo install -m 755 gridcoinresearch /usr/bin/gridcoinresearch
									break;;
			2 ) p='d'
				cd ~/Gridcoin-Research/src
					mkdir -p obj/zerocoin && chmod +x leveldb/build_detect_platform 
							make -f makefile.unix USE_UPNP=-
								strip gridcoinresearchd
									sudo install -m 755 gridcoinresearchd /usr/bin/gridcoinresearchd
										mkdir ~/.GridcoinResearch
											cd ~/		
												chmod 700 .GridcoinResearch
													cd .GridcoinResearch
							clear	
							echo "****************** Config ***********************"
							echo " I need some information for your config file"
							echo "*************************************************";
							read -p "email address? (Your email, must match your BOINC projects!):" email
							read -p "rpcuser username? (Anything you want, does not need to match BOINC):" user
							read -p "rpcpassword? (Anything you want, does not need to match BOINC)" pass
							echo "email=$email
server=1
daemon=1
rpcallowip=127.0.0.1
rpcuser=$user
rpcpassword=$pass
addnode=node.gridcoin.us" > gridcoinresearch.conf
break;;
			* ) echo -e "${RED}I can only handle 1) or 2), sorry.${STD}" && sleep 2;;
    esac
done

while true
do
	clear
	echo "****************** 4/4 steps ***********************"
        echo "      Your Gridcoin wallet is now ready to use!  "
	echo "                                            "
	echo " Do you wish to download and use the latest Snapshot"
	echo "               from official source?            "
	echo "****************************************************";
	echo "1. Yes"
	echo "2. No"
	read -p "It safes a lot of time. Trust me! [1 or 2]:" snapshot
		case $snapshot in
			1 ) _snapshot
				echo "";
					echo "100%! Blockchain is downloaded and installed. "
						sleep 2
				break;;				
			2 ) echo "Okay. But don't blame me for wasting your time. :)"
				break;;
			* ) echo -e "${RED}I can only handle 1) or 2), sorry.${STD}" && sleep 2;;
    esac
done
	if [ "$p" == "qt" ]; then
	while true
	do
		clear
		echo "****************** Menu entry? ***********************"
        	echo "      Do you like to have a menu entry for          "
		echo "                   your wallet?                "
        	echo "****************************************************";
		echo "1. Yes"
		echo "2. No"
		read -p "You will find the wallet in the office category [1 or 2]:" menue
		case $menue in
			1 ) sudo echo "[Desktop Entry]
Encoding=UTF-8
Name=GridcoinResearch-Qt
Comment=Gridcoin P2P Cryptocurrency
Exec=/usr/bin/gridcoinresearch %u
Terminal=false
Type=Application
Icon=grc-small
MimeType=x-scheme-handler/gridcoin;
Categories=Application;Office;" > /tmp/gridcoinresearch-qt.desktop
				sudo mv /tmp/gridcoinresearch-qt.desktop /usr/share/applications/
					sudo install -Dm644 ~/Gridcoin-Research/share/pixmaps/grc-small.png /usr/share/pixmaps/grc-small.png 
						break;;
			2 ) echo "Okay no problem. Just type gridcoinresearch every time into your command line. That's old school, but fine to me. :)"
				sleep 2
					break;;
			* ) echo -e "${RED}I can only handle 1) or 2), sorry.${STD}" && sleep 2;;
    esac
done
	fi
	clear
	echo "******************** Finish ************************"
        echo "           Thanks for crunching Boinc units       "
	echo "                        &                        "
        echo "                  using Gridcoin!                 "
	echo "****************************************************";
read -p "Press any key..."
}

_update ()
{ #Update process
	clear
	cd ~/Gridcoin-Research
	vchange=`git pull` 
#	version=`git reset --hard origin/master`
	if  [ "$vchange" == "Already up-to-date." ] || [ "$vchange" == "Bereits aktuell." ]; then
		echo "****************************************************"
		echo "          Gridcoin Wallet is up-do-date!"
		echo "                No Update needed         "
        	echo "****************************************************";
read -p "Press any key..."
main_menu
        fi
                echo `date` >> $CDIR/gridlyb/grcs_vlogs.txt
                echo $vchange >> $CDIR/gridlyb/grcs_vlogs.txt #Copies the git change information into the log file
		echo "****************************************************"
		echo "              Stating update sequence..."
                echo "****************************************************";
		if [ `pgrep gridcoin` ] ; then
			killall gridcoinresearch
			echo "Gridcoin wallet has been closed for update reason..."
		fi
while true
do
	clear
	echo "******************* Update *************************"
	echo "   It's time to build the new Wallet version from  "
	echo "   source! It'll take a while, please be patient!  "
	echo "****************************************************";
	echo "1. -qt wallet! (I'm a graphical guy)"
	echo "2. The daemon! (I love the command line)"
	read -p "Decide now! What can I update for you? [1 or 2]:" puchoice
		case $puchoice in
			1 ) 
				cd ~/Gridcoin-Research
					rm -f build/o.*
					sed -i 's/QT += qaxcontainer/CONFIG += qaxcontainer/' gridcoinresearch.pro
							if [[ -e $(which qmake-qt4) ]]; then
        			                        qmake-qt4 gridcoinresearch.pro USE_QRCODE=1 NO_UPGRADE=1
        			                else
        			                        qmake gridcoinresearch.pro USE_QRCODE=1 NO_UPGRADE=1
        			                fi
        			                        make
								strip gridcoinresearch
									sudo install -m 755 gridcoinresearch /usr/bin/gridcoinresearch
									break;;
			2 ) 
				cd ~/Gridcoin-Research/				
				make clean					
				cd ~/Gridcoin-Research/src
					mkdir -p obj/zerocoin && chmod +x leveldb/build_detect_platform
							make -f makefile.unix clean 
								make -f makefile.unix USE_UPNP=-
								strip gridcoinresearchd
									sudo install -m 755 gridcoinresearchd /usr/bin/gridcoinresearchd
									break;;
			* ) echo -e "${RED}I can only handle 1) or 2), sorry.${STD}" && sleep 2;;
	esac
done    
				echo "=============================================="
                                echo "Update done! Please start the Gridcoin wallet "
                                echo "=============================================="	
read -p "Press any key..."
}

_downloadblocks ()
{ #Download snapshot from official source
	clear
	echo "****************** 1/4 steps ***********************"
	echo "   Now I backup your current files, download the   "
	echo "          latest snapshot and unzip these...  "
	echo "****************************************************";
	shopt -s dotglob
	echo -ne '#                     (0%)\r'
if [ ! -d "$CDIR" ]; then
	mkdir $CDIR
fi
	mkdir -p $TDIR/$DATE
	echo -ne '##                     (10%)\r'
	if [ -d "$CDIR/gridlyb/" ]; then
		mv $CDIR/gridlyb/* $TDIR/
	echo -ne '####                   (20%)\r'
		rm -r $CDIR/gridlyb/
	fi
		mv $CDIR/* $TDIR/$DATE
	echo -ne '########               (40%)\r'
		_snapshot
	echo -ne '############           (60%)\r'	
	mv $TDIR/ $CDIR
	echo -ne '################       (80%)\r'
	cp $CDIR/gridlyb/$DATE/gridcoinresearch.conf $CDIR
	cp $CDIR/gridlyb/$DATE/wallet.dat $CDIR
	echo -ne '####################   (100%)\r'
	echo -ne '\n'
	sleep 2
	clear
}

_snapshot ()
{ #download & unzip latest shnapshot
	cd ~/.GridcoinResearch/
		wget http://download.gridcoin.us/download/downloadstake/signed/snapshot.zip
			unzip snapshot.zip
}

main_menu

exit 0
