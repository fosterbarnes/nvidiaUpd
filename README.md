 # <img src="icon.png" align="left" width="42" style="padding-right:15px"> ‎nvidiaUpd

Update NVIDIA drivers with a simple pwsh script

Downloads and installs the latest NVIDIA Game Ready Driver for the installed GeForce card. 

GPU IDs sourced from https://www.nvidia.com/Download/API/lookupValueSearch.aspx?TypeID=3 (psid=@ParentID, pfid=Value)

Requires PowerShell 7+. Supports desktop GeForce GTX 400-series through RTX 50-series.

If you don't have PowerShell 7, install it ([v7.6.3](https://github.com/PowerShell/PowerShell/releases/tag/v7.6.3)) :

<table border="0"><tbody><tr>
<td align="center" valign="top">
<a href="https://github.com/PowerShell/PowerShell/releases/download/v7.6.3/PowerShell-7.6.3-win-x64.msi">
<img src="./.resources/svg/download_x64.svg" width="180" height="auto" alt="x64 installer"/></a></td>
<td align="center" valign="top">
<a href="https://github.com/PowerShell/PowerShell/releases/download/v7.6.3/PowerShell-7.6.3-win-arm64.msi"><img src="./.resources/svg/download_arm.svg" width="180" height="auto" alt="ARM64 installer"/></a></td>
</tr></tbody></table>

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

Optionally, add desktop and start menu shortcuts with this inno setup installer:

<table border="0"><tbody><tr>
<td align="center" valign="top">
<a href="https://github.com/fosterbarnes/nvidiaUpd/releases/download/v1.0/nvidiaUpd-x64-installer.exe">
<img src="./.resources/svg/download_x64.svg" width="180" height="auto" alt="x64 installer"/></a></td>
<td align="center" valign="top">
<a href="https://github.com/fosterbarnes/nvidiaUpd/releases/download/v1.0/nvidiaUpd-arm64-installer.exe"><img src="./.resources/svg/download_arm.svg" width="180" height="auto" alt="ARM64 installer"/></a></td>
</tr></tbody></table>