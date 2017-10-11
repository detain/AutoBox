*********************************
*  DevCon Restart x64           *
*  Version 1.0.0.0              *
*  x64 SSE2 Release Build       *
*  2017-10-02                   *
*                               *
*********************************
Settings: 
Note: Givin USB DeviceID is only for reference. 

DeviceID=USB\VID_1B1C&PID_1B33&REV_0205<-- Use Device ID with &REV_XXXX
         USB\VID_1B1C&PID_1B33         <-- Not Instance ID

ShowWindow=0 or 1

Run Startup.reg of configure manually.
HLM Run fires first at every logon.

Device Console (DevCon.exe) Commands | Microsoft Docs:
https://docs.microsoft.com/en-us/windows-hardware/drivers/devtest/devcon-general-commands
https://docs.microsoft.com/en-us/windows-hardware/drivers/devtest/devcon-restart
https://docs.microsoft.com/en-us/windows-hardware/drivers/install/standard-usb-identifiers