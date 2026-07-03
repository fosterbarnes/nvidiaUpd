#ifndef AppName
#define AppName "nvidiaUpd"
#endif
#ifndef AppVersion
#define AppVersion "1.0.0"
#endif
#ifndef AppPublisher
#define AppPublisher "fosterbarnes"
#endif
#ifndef AppURL
#define AppURL "https://github.com/fosterbarnes/nvidiaUpd"
#endif
#ifndef SetupIconFile
#define SetupIconFile "..\icon.ico"
#endif
#ifndef AppCopyright
#define AppCopyright "Copyright © 2026 Foster Barnes"
#endif
#define ScriptPath "{app}\nvidiaUpd.ps1"

[Setup]
AppId={{A3B8C4D1-9E2F-4A7B-8C5D-1E6F9A2B3C4D}
AppName={#AppName}
UninstallDisplayName={#AppDisplayName}
AppVersion={#AppVersion}
VersionInfoVersion={#AppVersion}.0
VersionInfoProductVersion={#AppVersion}
VersionInfoCopyright={#AppCopyright}
DisableDirPage=auto
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}
AppUpdatesURL={#AppURL}
DefaultDirName={userappdata}\{#AppName}
UninstallDisplayIcon={app}\icon.ico
ArchitecturesAllowed={#ArchitecturesAllowed}
ArchitecturesInstallIn64BitMode={#ArchitecturesInstallIn64BitMode}
DisableProgramGroupPage=yes
LicenseFile=..\LICENSE
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=commandline
OutputDir=Output
OutputBaseFilename={#OutputBaseFilename}
SetupIconFile={#SetupIconFile}
SolidCompression=yes
WizardStyle=classic dark

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Messages]
SetupWindowTitle=nvidiaUpd v{#AppVersion} shortcuts ({#SetupWindowTitleArch})

[Files]
Source: "..\icon.ico"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{autoprograms}\{#AppName}"; Filename: "{code:GetPwshPath}"; Parameters: "-NoProfile -ExecutionPolicy Bypass -File ""{#ScriptPath}"""; IconFilename: "{app}\icon.ico"
Name: "{autodesktop}\{#AppName}"; Filename: "{code:GetPwshPath}"; Parameters: "-NoProfile -ExecutionPolicy Bypass -File ""{#ScriptPath}"""; IconFilename: "{app}\icon.ico"

#include "nvidiaUpd.installer.code.iss"
