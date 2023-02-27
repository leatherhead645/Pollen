#!/bin/bash

if [ $(id -u) -ne 0 ]; then
    echo "Run this script as root (sudo)"
    exit
fi

echo "+##############################################+"
echo "# Welcome To Pollen (v1)!                      #"
echo "# The User Policy Editor                       #"
echo "# -------------------------------------------- #"
echo "# Credit:                                      #"
echo "# Pollen Developer - Scaratek                  #"
echo "# Logo Designer - Nitelite                     #"
echo "# Found the Overlook - Rafflesia               #"
echo "# Made the Original Script - OlyB              #"
echo "# Fixed a tiny little bug - r58Playz           #"
echo "+##############################################+"

mkdir -p /tmp/overlay/etc/opt/chrome/policies/managed
echo '{"URLBlocklist": [], "SystemFeaturesDisableList": [], "ChromeOsMultiProfileUserBehavior": "unrestricted", "DeveloperToolsAvailability": 1, "AllowDeletingBrowserHistory": true, "IncognitoModeAvailability": 0, "DisableSafeBrowsingProceedAnyway": false, "AllowScreenLock": true, "ForceGoogleSafeSearch": false, "ChromeOsLockOnIdleSuspend": false, "SecondaryGoogleAccountSigninAllowed": true, "ExtensionInstallForcelist": null, "SafeSitesFilterBehavior": 0, "ForceYouTubeRestrict": 0, "ExtensionAllowedTypes": null, "ExtensionInstallAllowlist": null, "ExtensionInstallBlocklist": null, "ExtensionSettings": null}' > /tmp/overlay/etc/opt/chrome/policies/managed/policy.json
cp -a -L /etc/* /tmp/overlay/etc 2> /dev/null
mount --bind /tmp/overlay/etc /etc

echo ""
echo "Pollen has been successfully applied!"