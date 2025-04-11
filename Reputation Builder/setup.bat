@echo off
title Reputation Builder (Galactica) Bot by @MeoMunDep
color 0A

cd %~dp0

echo Checking configuration files...

(for %%F in (datas.txt privateKeys.txt proxies.txt) do (
    if not exist %%F (
        type nul > %%F
        echo Created %%F
    )
))

echo Configuration files checked.

echo Checking dependencies...
if exist "..\node_modules" (
    echo Using node_modules from parent directory...
    cd ..
    CALL npm install user-agents axios colors https-proxy-agent socks-proxy-agent solc web3 ethers bs58
    cd %~dp0
) else (
    echo Installing dependencies in current directory...
    CALL npm install user-agents axios colors https-proxy-agent socks-proxy-agent solc web3 ethers bs58
)
echo Dependencies installation completed!

echo Starting the bot...
node meomundep

pause
exit
