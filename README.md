Usage:

This package of scripts is meant to be run using Install-Workstation.ps1. Everything from there on out
should be automatic with the exception of registering products.

Before you begin:
This set of scripts isn't going to work on a default installation of Windows because the PowerShell
Execution policy is set to Restricted by default. You need to fix that by running:

Set-ExecutionPolicy Unrestricted -Confirm:$false

This will change the execution policy on the machine to allow running of scripts. This is a requirement to make these scripts work.

Notes:
Windows 10 generally will download the newest driver for your hardware, but if you run into trouble, you'll have to turn off that feature.
