# GRC-Scripts
Update and install scripts for the QT Gridcoin Wallet

__What do the script?__

Download new Gridcoin wallet code from git and compiles it automatically.
Proofs if the code at git is different to yours and starts only with the update if it's different.

__Features__

The script will ask you if you install boost by hand in the root directory or not. If you select by hand (j), it will copy the needed informations automatically in the gridcoinstake.pro. This is needed for successfully compiling.

__How to use__

Copy the updaste file into the Gridcoin-Research folder.
~/GridcoinResearch chmod 755 update (in the console)
./update (for starting the script)
