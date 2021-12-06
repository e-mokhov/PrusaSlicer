; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "PrusaLargix"
#define MyAppVersion GetEnv ('PRUSA_VER')
#define MyAppPublisher "Largix"
#define MyAppExeName "prusa-slicer.exe"
#define LargixPath GetEnv ('LARGIX_PATH')
#define PrusaPath GetEnv ('PRUSA_PATH')
#define PrusaDepPath GetEnv ('PRUSA_DEP_PATH')
#define InstallDir   GetEnv('INSTALL_DIR')
#define PrusaInstallDir  GetEnv('PRUSA_INSTALL_DIR')

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{5C2802C6-1EE4-4EB1-89AD-FA3F5F5119FC}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={#PrusaInstallDir}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputBaseFilename={#MyAppName}
SetupIconFile={#PrusaPath}\build\src\Release\resources\icons\PrusaSlicer.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
OutputDir={#InstallDir}\{#MyAppVersion}
;\{#MyAppVersion}

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "{#PrusaPath}\build\src\Release\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#PrusaPath}\build\src\Release\PrusaSlicer.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#PrusaPath}\build\src\Release\PrusaSlicer.exp"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#PrusaPath}\build\src\Release\prusa-slicer.exp"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#PrusaPath}\build\src\Release\PrusaSlicer.lib"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#PrusaPath}\build\src\Release\prusa-slicer.lib"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#LargixPath}\PathNavigator\x64\Release\PathNavigator.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#LargixPath}\ProgramBuilder\x64\Release\ProgramBuilder.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#PrusaPath}\build\src\Release\resources\*"; DestDir: "{app}\resources"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#PrusaDepPath}\usr\local\bin\libgmp-10.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#PrusaDepPath}\usr\local\bin\libmpfr-4.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#PrusaPath}\installer\LargixConvertConfig.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#PrusaPath}\installer\Largix.ini"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
