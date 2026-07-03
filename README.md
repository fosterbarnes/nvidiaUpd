 # <img src="icon.png" align="left" width="42" style="padding-right:15px"> ‎nvidiaUpd

Update NVIDIA drivers with a simple pwsh script

Downloads and installs the latest NVIDIA Game Ready Driver for the installed GeForce card.

Requires PowerShell 7+. Covers desktop GeForce GTX 400-series through RTX 50-series.

GPU IDs sourced from https://www.nvidia.com/Download/API/lookupValueSearch.aspx?TypeID=3 (psid=@ParentID, pfid=Value)

# Running/Installing


This code block  adds [nvidiaUpd.ps1](https://github.com/fosterbarnes/nvidiaUpd/blob/main/nvidiaUpd.ps1) to `APPDATA\nvidiaUpd\` , then adds a reference to the script to '`$PROFILE`'.

This allows you to run `nvupd`, `nvidiaupd` or `nvidiaupdate` to update nvidia drivers in the future

Run the following:


```
irm https://raw.githubusercontent.com/fosterbarnes/nvidiaUpd/main/install.ps1 | iex
```

Run the function and update NVIDIA drivers with:

```
nvupd
```