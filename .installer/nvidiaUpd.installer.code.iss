[Code]
var
  PwshExePath: String;

function FileExistsChecked(const Path: String): Boolean;
begin
  Result := (Path <> '') and FileExists(Path);
end;

function FindPwshViaWhere(): String;
var
  ResultCode: Integer;
  TempFile: String;
  Lines: TArrayOfString;
  I: Integer;
  Line: String;
begin
  Result := '';
  TempFile := ExpandConstant('{tmp}\nvidiaupd-pwsh-where.txt');
  if Exec(ExpandConstant('{cmd}'), '/c where pwsh 1>"' + TempFile + '" 2>nul', '', SW_HIDE, ewWaitUntilTerminated, ResultCode) then
  begin
    if LoadStringsFromFile(TempFile, Lines) then
    begin
      for I := 0 to GetArrayLength(Lines) - 1 do
      begin
        Line := Trim(Lines[I]);
        if FileExistsChecked(Line) then
        begin
          Result := Line;
          Break;
        end;
      end;
    end;
  end;
  DeleteFile(TempFile);
end;

function DiscoverPwshPath(): String;
var
  Candidates: TArrayOfString;
  I: Integer;
begin
  SetArrayLength(Candidates, 5);
  Candidates[0] := ExpandConstant('{autopf}\PowerShell\7\pwsh.exe');
  Candidates[1] := ExpandConstant('{autopf}\PowerShell\7-preview\pwsh.exe');
  Candidates[2] := ExpandConstant('{localappdata}\Microsoft\WindowsApps\pwsh.exe');
  Candidates[3] := ExpandConstant('{localappdata}\Programs\PowerShell\7\pwsh.exe');
  if GetEnv('USERPROFILE') <> '' then
    Candidates[4] := AddBackslash(GetEnv('USERPROFILE')) + 'scoop\apps\pwsh\current\pwsh.exe'
  else
    Candidates[4] := '';

  for I := 0 to GetArrayLength(Candidates) - 1 do
  begin
    if FileExistsChecked(Candidates[I]) then
    begin
      Result := Candidates[I];
      Exit;
    end;
  end;

  Result := FindPwshViaWhere();
end;

function GetPwshPath(Param: String): String;
begin
  Result := PwshExePath;
end;

function InitializeSetup(): Boolean;
var
  ScriptPath: String;
begin
  PwshExePath := DiscoverPwshPath();
  if PwshExePath = '' then
  begin
    MsgBox(
      'PowerShell 7 (pwsh) was not found on this PC.' + #13#10 + #13#10 +
      'Install it from https://aka.ms/powershell, then run this installer again.',
      mbError, MB_OK);
    Result := False;
    Exit;
  end;

  ScriptPath := ExpandConstant('{userappdata}\{#AppName}\nvidiaUpd.ps1');
  if not FileExists(ScriptPath) then
    if MsgBox(
      'The updater script was not found at:' + #13#10 + #13#10 +
      ScriptPath + #13#10 + #13#10 +
      'Run the install.ps1 step from the README first, then continue.' + #13#10 + #13#10 +
      'Continue anyway?',
      mbConfirmation, MB_YESNO) = IDNO then
    begin
      Result := False;
      Exit;
    end;

  Result := True;
end;
