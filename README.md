# GRC-Scripts
Update and install scripts for the QT Gridcoin Wallet


###Update script

__What do the script?__

Download new Gridcoin wallet code from git and compiles it automatically.
Proofs if the code at git is different to yours and starts only with the update if it's different.



__Features__

* The script will ask you if you install boost by hand in the root directory or not. If you select by hand (j), it will copy the needed informations automatically in the gridcoinstake.pro. This is needed for successfully compiling.
* Log file which is tracking the changes (grcs_vlogs.txt).



__How to use__

* Copy the update file into the Gridcoin-Research folder.
* execute in ~/GridcoinResearch the following command: chmod 755 update
  * without this the file isn't exucutable
* ./update (for starting the script)
