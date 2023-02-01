#!/bin/bash
#NTP detection
#Jamf Trust DNS Active or not
#please note the way this works, a device may report DNS traffic vectoring as not active.
#This may prove to be a false positive where a device has just installed the profile and needs a restart or a reinstall.
#If it returns false, and the profile is installed assume a restart needs to take place.
#otherwise depending on your scope assume it is installed and not active.

status=$(curl https://dns-test.wandera.com | grep '<h1>' | tr -d ' ' | tr -d '</h1>')
if [[  ${status} == 'SecureDNStrafficisactive' ]]; then
	
	echo "<result>DoH Enabled</result>"
else
	echo "<result>DoH not Enabled</result>"
	
fi
