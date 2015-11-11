# GRC-Scripts
Update and install scripts for the QT Gridcoin Wallet

What do the script?
    Download new Gridcoin wallet code from git and compiles it automatically. (only the UI research wallet!)
    Proofs if the code at git is different to yours and starts only with the update if it's different.

Features
    The script will ask you if you install boost by hand in the root directory or not. If you select by hand (j), it will copy the needed informations automatically in the gridcoinstake.pro. This is needed for successfully compiling.

How to use
    Copy the updaste file into the Gridcoin-Research folder.
    ~/GridcoinResearch chmod 755 update (in the console)
    ./update (for starting the script)
