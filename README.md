# Gridly for Debian/ Ubuntu & Arch
Gridly is your personal Gridcoin wallet wizard and the replacement for the former grc script. 


### Update, install & download blocks script

__What do this script?__

Download, install or update newest Gridcoin wallet source code from git and compiles it automatically and easy. Gridly works for the qt wallet and for the daemon. The update part of the script proofs if the code at git is different to yours and starts only if it's necessary. The function download blocks makes a backup before the official snapshot will be downloaded and installed.



__Features__

- Installs all tools and programs are needed for compiling (build) the wallet on your machine. (approx. 400 MB free disc space needed! Without blockchain.)
- Only one file (script) needed for update, installation and download blocks.
- Download, copy & unzip the latest snapshot during installation and download blocks process. (For faster synchronization)
- Log file which is tracking the update changes. Saved in ```~/GridcoindResearch/gridlyb/grcs_vlogs.txt```.
- Creates ```gridcoinresearch.conf``` for the daemon and ask you all needed information during the installation process. **new**
- Creates menu entry with icon for qt wallet when required. Start your wallet with a click from your usual Linux menu. **new**
- Download blocks makes a backup of the current ```~/GridcoindResearch/``` content and saves it to ```~/GridcoindResearch/gridlyb/<date>```. Old ```gridcoinresearch.conf``` and ```wallet.dat``` will automaticly be pushed back to ```~/GridcoindResearch/```! No further action needed after download blocks. **new**


__How to use__

* You can use git to get to clone the script to you machine. Or...
* Copy the "gridly.sh" file where you want on your computer.
* execute in this directory the following command: ```chmod +x gridly.sh```
  * without this the file isn't executable
* ```./gridly.sh``` (for starting the script)

If you find errors, bugs or better solution feel free to contribute!

#### Information
- Debian users should check if the own user is in the sudo group. If not do first...  
```su [password]```  
```gpasswd -a [user] sudo```
- **Disc space needed on Debian**
  - aprox. 405 mb for compiling tools
  - aprox. 161 MB for Gridcoin source code
  - Total: aprox. 566 MB
       + in addition aprox. 2,5 GB for Gridcoin Blockchain _(11. Apr 2017)_  

### Changelog
======================   
__1.0.4 | 12.05.2017__
- Added Debian tools for compiling Gridcoin *Hotfix*
- Added needed disc space (Debian) in README
 
__1.0.3 | 11.05.2017__
- Slight changes for apt install Debian tools.

__1.0.2 | 10.05.2017__
- Changed libzip4 to libzip2 for the Debian install process 

__1.0.1 | 02.04.2017__
- Added download blocks warning

__1.0.0 | 02.04.2017__
- Changed name from grc to gridly.sh
- Complete overhaul of the script
- Added menu structure
- Added Arch compatibility (OS query function)
- Added function for creating menu entry (qt wallet)
- Added installation & update process for the daemon
- Added query 'email',’rpcuser' and 'rpcpassword'during daemon installation process
- Added download block function (latest snapshot & backup files)
- Added ```pgrep gridcoin``` to make sure wallet is running or not (before update)
- Smaller text changes
- Removed manual boost part
