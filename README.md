# LanSchool Riddance
This project contains windows scripts to get rid of Lenovo's LanSchool.

## Requirements
- This script only works on LanSchool Air.
- You will need administrator permissions to run this.

## Installation
To install this script, clone the repository (or download the .zip), then double click the `setuplanschool.bat`.

> [!IMPORTANT]
> For `setuplanschool.bat` to work, `n.bat` **must** be contained in the same directory.

This will automatically install the script, as well as set the LanSchool service to Manual, if LanSchool is not running.

It will also copy n.bat to System32, allowing you to run it from anywhere.

## Usage
To kill or start LanSchool Air and its service, press `[Win] + R`, then type `n` and press `[ENTER]`.

This will open an UAC prompt (if needed), then run itself again. 

If LanSchool is already running, the script will kill it and set the service to Manual.

If LanSchool is not running, the script will start the service, running all of LanSchool's components.