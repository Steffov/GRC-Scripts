# GRC-Scripts for Debian/ Ubuntu
Update and install scripts for the QT Gridcoin Wallet **NEW Now install script included!**


###Update & install script

__What do the script?__

Download, install or update newest Gridcoin wallet source code from git and compiles it automatically. The update part of the script proofs if the code at git is different to yours and starts only with the update if it's nessessary.



__Features__

- Installs all tools and programs are needed for compiling (build) the wallet on your machine.
- Only one file (script) needed for update and installation.
- Download, copy & unzip the latest snapshot during installation. (For faster synchronization after a fresh installation)
- The script ask if boost is installed by hand (manual) in the root directory or not. If you select by hand (j), it will copy the needed informations automatically in the gridcoinresearch.pro. (This is needed for successfully compiling / updating.)
- Log file which is tracking the changes (grcs_vlogs.txt).



__How to use__

* You can use git to get to clone the script to you machine. Or...
* Copy the "grc" file where you want on your computer.
* execute in this directory the following command: chmod 755 grc
  * without this the file isn't executable
* ./grc (for starting the script)

If you find errors, bugs or better solution feel free to contribute!
