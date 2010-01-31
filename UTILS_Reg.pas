unit UTILS_Reg;

interface

uses
  Windows,
  SysUtils,
  Classes;

  function WinRegConnect(MachineName: String; RootKey: HKEY; var RemoteKey: HKEY): boolean;
  function WinRegDisconnect(RemoteKey: HKEY): boolean;
  function WinRegValueExists(RootKey: HKEY; Name: String; Wow64: Boolean): boolean;
  function WinRegGetValueType(RootKey: HKEY; Name: String; var Value: Cardinal; Wow64: Boolean): boolean;
  function WinRegKeyExists(RootKey: HKEY; Name: String; Wow64: Boolean): boolean;
  function WinRegDelValue(RootKey: HKEY; Name: String; Wow64: Boolean): boolean;
  function WinRegDelKey(RootKey: HKEY; Name: String; Wow64: Boolean): boolean;
  function WinRegEnum(hRootKey: HKEY; szKey: String; Buffer: TStringList; bKeys: Boolean; Wow64: Boolean): Boolean;
  function WinRegSetString(RootKey: HKEY; Name: String; Value: String; Wow64: Boolean): boolean;
  function WinRegSetMultiString(RootKey: HKEY; Name: String; Value: String; Wow64: Boolean): boolean;
  function WinRegSetExpandString(RootKey: HKEY; Name: String; Value: String; Wow64: Boolean): boolean;
  function WinRegSetDword(RootKey: HKEY; Name: String; Value: Cardinal; Wow64: Boolean): boolean;
  function WinRegSetBinary(RootKey: HKEY; Name: String; Value: Array of Byte; Wow64: Boolean): boolean;
  function WinRegGetString(RootKey: HKEY; Name: String; Var Value: String; Wow64: Boolean): boolean;
  function WinRegGetMultiString(RootKey: HKEY; Name: String; Var Value: String; Wow64: Boolean): boolean;
  function WinRegGetExpandString(RootKey: HKEY; Name: String; Var Value: String; Wow64: Boolean): boolean;
  function WinRegGetDWORD(RootKey: HKEY; Name: String; Var Value: Cardinal; Wow64: Boolean): boolean;
  function WinRegGetBinary(RootKey: HKEY; Name: String; Var Value: String; Wow64: Boolean): boolean;
  function Binary2DateTime(RootKey: HKEY; Name: String; var Value: TDateTime; Wow64: Boolean): Boolean;
  function DateTime2Binary(RootKey: HKEY; Name: String; var Value: TDateTime; Wow64: Boolean): Boolean;
  function Binary2Integer(RootKey: HKEY; Name: String; var Value: Integer; Wow64: Boolean): Boolean;
  function Integer2Binary(RootKey: HKEY; Name: String; var Value: Integer; Wow64: Boolean): Boolean;

  const
  KEY_WOW64_64KEY    = $00100;
  KEY_WOW64_32KEY    = $00200;
implementation

function IsWow64: Boolean;
type
  TIsWow64Process = function( // Type of IsWow64Process API fn
    Handle: Windows.THandle; var Res: Windows.BOOL
  ): Windows.BOOL; stdcall;
var
  IsWow64Result: Windows.BOOL;      // Result from IsWow64Process
  IsWow64Process: TIsWow64Process;  // IsWow64Process fn reference
begin
  // Try to load required function from kernel32
  IsWow64Process := Windows.GetProcAddress(
    Windows.GetModuleHandle('kernel32.dll'), 'IsWow64Process'
  );
  if Assigned(IsWow64Process) then
  begin
    // Function is implemented: call it
    if not IsWow64Process(
      Windows.GetCurrentProcess, IsWow64Result
    ) then
      raise SysUtils.Exception.Create('IsWow64: bad process handle');
    // Return result of function
    Result := IsWow64Result;
  end
  else
    // Function not implemented: can't be running on Wow64
    Result := False;
end;

function Binary2DateTime(RootKey: HKEY; Name: String; var Value: TDateTime; Wow64: Boolean): Boolean;
var
  dtBuff: TDateTime;
  dtBytes: array [1..8] of Byte absolute dtBuff;
  szBin: string;
  i: integer;
begin
  Result := WinRegGetBinary(RootKey, Name, szBin, Wow64);

  if Result then
  Result := Length(szBin) = 8;

  if Result then
  begin
    for i := 1 to 8 do
    dtBytes[i] := ord(szBin[i]);
    Value := dtBuff;
  end;
end;

function DateTime2Binary(RootKey: HKEY; Name: String; var Value: TDateTime; Wow64: Boolean): Boolean;
var
  dtBuff: TDateTime;
  dtBytes: array [1..8] of byte absolute dtBuff;
begin
  dtBuff := Value;
  Result := WinRegSetBinary(RootKey, Name, dtBytes, Wow64);
end;

function Binary2Integer(RootKey: HKEY; Name: String; var Value: Integer; Wow64: Boolean): Boolean;
var
  iBuff: Integer;
  dtBytes: array [1..4] of Byte absolute iBuff;
  szBin: string;
  i: integer;
begin
  Result := WinRegGetBinary(RootKey, Name, szBin, Wow64);

  if Result then
  Result := Length(szBin) = 4;

  if Result then
  begin
    for i := 1 to 4 do
    dtBytes[i] := ord(szBin[i]);
    Value := iBuff;
  end;
end;

function Integer2Binary(RootKey: HKEY; Name: String; var Value: Integer; Wow64: Boolean): Boolean;
var
  iBuff: Integer;
  dtBytes: array [1..4] of Byte absolute iBuff;
begin
  iBuff := Value;
  Result := WinRegSetBinary(RootKey, Name, dtBytes, Wow64);
end;

function LastPos(Needle: Char; Haystack: String): integer;
begin
  for Result := Length(Haystack) downto 1 do
  if Haystack[Result] = Needle then
  Break;
end;

function WinRegConnect(MachineName: String; RootKey: HKEY; var RemoteKey: HKEY): boolean;
begin
  Result := (RegConnectRegistry(PChar(MachineName), RootKey, RemoteKey) = ERROR_SUCCESS);
end;

function WinRegDisconnect(RemoteKey: HKEY): boolean;
begin
  Result := (RegCloseKey(RemoteKey) = ERROR_SUCCESS);
end;

function RegSetValue(RootKey: HKEY; Name: String; ValType: Cardinal; PVal: Pointer; ValSize: Cardinal; Wow64: Boolean): boolean;
var
  SubKey: String;
  n: integer;
  dispo: DWORD;
  hTemp: HKEY;
  bSuccess: Boolean;
  _hKey: Cardinal;
begin
  Result := False;
  
  n := LastPos('\', Name);
  if n > 0 then
  begin
    SubKey := Copy(Name, 1, n - 1);

    if Wow64 and IsWow64 then
    _hKey := KEY_WRITE or KEY_WOW64_64KEY else
    if IsWow64 and not Wow64 then
    _hKey := KEY_WRITE or KEY_WOW64_32KEY else
    _hKey := KEY_WRITE;

    bSuccess := RegCreateKeyEx(RootKey, PChar(SubKey), 0, nil, REG_OPTION_NON_VOLATILE, _hKey, nil, hTemp, @dispo) = ERROR_SUCCESS;

    if bSuccess then
    begin
      SubKey := Copy(Name, n + 1, Length(Name) - n);
      Result := (RegSetValueEx(hTemp, PChar(SubKey), 0, ValType, PVal, ValSize) = ERROR_SUCCESS);
      RegCloseKey(hTemp);
    end;
  end;
end;

function RegGetValue(RootKey: HKEY; Name: String; ValType: Cardinal; var PVal: Pointer;
  var ValSize: Cardinal; Wow64: Boolean): boolean;
var
  SubKey: String;
  n: integer;
  MyValType: DWORD;
  hTemp: HKEY;
  Buf: Pointer;
  BufSize: Cardinal;
  _hKey: Cardinal;
begin
  Result := False;
  n := LastPos('\', Name);
  if n > 0 then
  begin
    SubKey := Copy(Name, 1, n - 1);

    if Wow64 and IsWow64 then
    _hKey := KEY_READ or KEY_WOW64_64KEY else
    if IsWow64 and not Wow64 then
    _hKey := KEY_READ or KEY_WOW64_32KEY else
    _hKey := KEY_READ;

    if RegOpenKeyEx(RootKey, PChar(SubKey), 0, _hKey, hTemp) = ERROR_SUCCESS then
    begin
      SubKey := Copy(Name, n + 1, Length(Name) - n);
      if RegQueryValueEx(hTemp, PChar(SubKey), nil, @MyValType, nil, @BufSize) = ERROR_SUCCESS then
      begin
        GetMem(Buf, BufSize);
        if RegQueryValueEx(hTemp, PChar(SubKey), nil, @MyValType, Buf, @BufSize) = ERROR_SUCCESS then
        begin
          if ValType = MyValType then
          begin
            PVal := Buf;
            ValSize := BufSize;
            Result := True;
          end
          else
          FreeMem(Buf);
        end
        else
        FreeMem(Buf);
      end;
      RegCloseKey(hTemp);
    end;
  end;
end;

function WinRegValueExists(RootKey: HKEY; Name: String; Wow64: Boolean): boolean;
var
  SubKey: String;
  n: integer;
  hTemp: HKEY;
  _hKey: THandle;
begin
  Result := False;
  n := LastPos('\', Name);
  if n > 0 then
  begin
    SubKey := Copy(Name, 1, n - 1);

    if Wow64 and IsWow64 then
    _hKey := KEY_READ or KEY_WOW64_64KEY else
    if IsWow64 and not Wow64 then
    _hKey := KEY_READ or KEY_WOW64_32KEY else
    _hKey := KEY_READ;

    if RegOpenKeyEx(RootKey, PChar(SubKey), 0, _hKey, hTemp) = ERROR_SUCCESS then
    begin
      SubKey := Copy(Name, n + 1, Length(Name) - n);
      Result := (RegQueryValueEx(hTemp, PChar(SubKey), nil, nil, nil, nil) = ERROR_SUCCESS);
      RegCloseKey(hTemp);
    end;
  end;
end;

function WinRegGetValueType(RootKey: HKEY; Name: String; var Value: Cardinal; Wow64: Boolean): boolean;
var
  SubKey: String;
  n: integer;
  hTemp: HKEY;
  ValType: Cardinal;
  _hKey: Cardinal;
begin
  Result := False;
  Value := REG_NONE;
  n := LastPos('\', Name);
  if n > 0 then
  begin
    SubKey := Copy(Name, 1, n - 1);

    if Wow64 and IsWow64 then
    _hKey := KEY_READ or KEY_WOW64_64KEY else
    if IsWow64 and not Wow64 then
    _hKey := KEY_READ or KEY_WOW64_32KEY else
    _hKey := KEY_READ;

    if (RegOpenKeyEx(RootKey, PChar(SubKey), 0, _hKey, hTemp) = ERROR_SUCCESS) then
    begin
      SubKey := Copy(Name, n + 1, Length(Name) - n);
      Result := (RegQueryValueEx(hTemp, PChar(SubKey), nil, @ValType, nil, nil) = ERROR_SUCCESS);
      if Result then
      Value := ValType;
      RegCloseKey(hTemp);
    end;
  end;
end;

function WinRegKeyExists(RootKey: HKEY; Name: String; Wow64: Boolean): boolean;
var
  SubKey: String;
  n: integer;
  hTemp: HKEY;
  _hKey: Cardinal;
begin
  Result := False;
  n := LastPos('\', Name);
  if n > 0 then
  begin
    SubKey := Copy(Name, 1, n - 1);

    if Wow64 and IsWow64 then
    _hKey := KEY_READ or KEY_WOW64_64KEY else
    if IsWow64 and not Wow64 then
    _hKey := KEY_READ or KEY_WOW64_32KEY else
    _hKey := KEY_READ;

    if RegOpenKeyEx(RootKey, PChar(SubKey), 0, _hKey, hTemp) = ERROR_SUCCESS then
    begin
      Result := True;
      RegCloseKey(hTemp);
    end;
  end;
end;

function WinRegDelValue(RootKey: HKEY; Name: String; Wow64: Boolean): boolean;
var
  SubKey: String;
  n: integer;
  hTemp: HKEY;
  _hKey: Cardinal;
begin
  Result := False;
  n := LastPos('\', Name);
  if n > 0 then
  begin
    SubKey := Copy(Name, 1, n - 1);

    if Wow64 and IsWow64 then
    _hKey := KEY_WRITE or KEY_WOW64_64KEY else
    if IsWow64 and not Wow64 then
    _hKey := KEY_WRITE or KEY_WOW64_32KEY else
    _hKey := KEY_WRITE;

    if RegOpenKeyEx(RootKey, PChar(SubKey), 0, _hKey, hTemp) = ERROR_SUCCESS then
    begin
      SubKey := Copy(Name, n + 1, Length(Name) - n);
      Result := (RegDeleteValue(hTemp, PChar(SubKey)) = ERROR_SUCCESS);
      RegCloseKey(hTemp);
    end;
  end;
end;

function WinRegDelKey(RootKey: HKEY; Name: String; Wow64: Boolean): boolean;
var
  SubKey: String;
  n: integer;
  hTemp: HKEY;
  _hKey: Cardinal;
begin
  Result := False;
  n := LastPos('\', Name);
  if n > 0 then
  begin
    SubKey := Copy(Name, 1, n - 1);

    if Wow64 and IsWow64 then
    _hKey := KEY_WRITE or KEY_WOW64_64KEY else
    if IsWow64 and not Wow64 then
    _hKey := KEY_WRITE or KEY_WOW64_32KEY else
    _hKey := KEY_WRITE;

    if RegOpenKeyEx(RootKey, PChar(SubKey), 0, _hKey, hTemp) = ERROR_SUCCESS then
    begin
      SubKey := Copy(Name, n + 1, Length(Name) - n);
      Result := (RegDeleteKey(hTemp, PChar(SubKey)) = ERROR_SUCCESS);
      RegCloseKey(hTemp);
    end;
  end;
end;

function WinRegEnum(hRootKey: HKEY; szKey: String; Buffer: TStringList; bKeys: Boolean; Wow64: Boolean): Boolean;
var
  i: integer;
  iRes: integer;
  s: String;
  hTemp: HKEY;
  Buf: Pointer;
  BufSize: Cardinal;
  _hKey: Cardinal;
begin
  Result := False;
  Buffer.Clear;

  if Wow64 and IsWow64 then
  _hKey := KEY_READ or KEY_WOW64_64KEY else
  if IsWow64 and not Wow64 then
  _hKey := KEY_READ or KEY_WOW64_32KEY else
  _hKey := KEY_READ;

  if RegOpenKeyEx(hRootKey, PChar(szKey), 0, _hKey, hTemp) = ERROR_SUCCESS then
  begin
    Result := True;
    BufSize := 1024;
    GetMem(buf, BufSize);
    i := 0;
    iRes := ERROR_SUCCESS;
    while iRes = ERROR_SUCCESS do
    begin
      BufSize := 1024;
      if bKeys then
        iRes := RegEnumKeyEx(hTemp, i, buf, BufSize, nil, nil, nil, nil)
      else
        iRes := RegEnumValue(hTemp, i, buf, BufSize, nil, nil, nil, nil);
      if iRes = ERROR_SUCCESS then
      begin
        SetLength(s, BufSize);
        CopyMemory(@s[1], buf, BufSize);
        Buffer.Add(s);
        inc(i);
      end;
    end;
    FreeMem(buf);
    RegCloseKey(hTemp);
  end;
end;

function WinRegSetString(RootKey: HKEY; Name: String; Value: String; Wow64: Boolean): boolean;
begin
  Result := RegSetValue(RootKey, Name, REG_SZ, PChar(Value + #0), Length(Value) + 1, Wow64);
end;

function WinRegSetMultiString(RootKey: HKEY; Name: String; Value: String; Wow64: Boolean): boolean;
begin
  Result := RegSetValue(RootKey, Name, REG_MULTI_SZ, PChar(Value + #0#0), Length(Value) + 2, Wow64);
end;

function WinRegSetExpandString(RootKey: HKEY; Name: String; Value: String; Wow64: Boolean): boolean;
begin
  Result := RegSetValue(RootKey, Name, REG_EXPAND_SZ, PChar(Value + #0), Length(Value) + 1, Wow64);
end;

function WinRegSetDword(RootKey: HKEY; Name: String; Value: Cardinal; Wow64: Boolean): boolean;
begin
  Result := RegSetValue(RootKey, Name, REG_DWORD, @Value, SizeOf(Cardinal), Wow64);
end;

function WinRegSetBinary(RootKey: HKEY; Name: String; Value: Array of Byte; Wow64: Boolean): boolean;
begin
  Result := RegSetValue(RootKey, Name, REG_BINARY, @Value, SizeOf(Value), Wow64);
end;

function WinRegGetString(RootKey: HKEY; Name: String; Var Value: String; Wow64: Boolean): boolean;
var
  Buf: Pointer;
  BufSize: Cardinal;
begin
  Result := False;
  if RegGetValue(RootKey, Name, REG_SZ, Buf, BufSize, Wow64) then
  begin
    Dec(BufSize);
    SetLength(Value, BufSize);
    if BufSize > 0 then
      CopyMemory(@Value[1], Buf, BufSize);
    FreeMem(Buf);
    Result := True;
  end;
end;

function WinRegGetMultiString(RootKey: HKEY; Name: String; Var Value: String; Wow64: Boolean): boolean;
var
  Buf: Pointer;
  BufSize: Cardinal;
begin
  Result := False;
  if RegGetValue(RootKey, Name, REG_MULTI_SZ, Buf, BufSize, Wow64) then
  begin
    Dec(BufSize);
    SetLength(Value, BufSize);
    if BufSize > 0 then
      CopyMemory(@Value[1], Buf, BufSize);
    FreeMem(Buf);
    Result := True;
  end;
end;

function WinRegGetExpandString(RootKey: HKEY; Name: String; Var Value: String; Wow64: Boolean): boolean;
var
  Buf: Pointer;
  BufSize: Cardinal;
begin
  Result := False;
  if RegGetValue(RootKey, Name, REG_EXPAND_SZ, Buf, BufSize, Wow64) then
  begin
    Dec(BufSize);
    SetLength(Value, BufSize);
    if BufSize > 0 then
      CopyMemory(@Value[1], Buf, BufSize);
    FreeMem(Buf);
    Result := True;
  end;
end;

function WinRegGetDWORD(RootKey: HKEY; Name: String; Var Value: Cardinal; Wow64: Boolean): boolean;
var
  Buf: Pointer;
  BufSize: Cardinal;
begin
  Result := False;
  if RegGetValue(RootKey, Name, REG_DWORD, Buf, BufSize, Wow64) then
  begin
    CopyMemory(@Value, Buf, BufSize);
    FreeMem(Buf);
    Result := True;
  end;
end;

function WinRegGetBinary(RootKey: HKEY; Name: String; Var Value: String; Wow64: Boolean): boolean;
var
  Buf: Pointer;
  BufSize: Cardinal;
begin
  Result := False;
  if RegGetValue(RootKey, Name, REG_BINARY, Buf, BufSize, Wow64) then
  begin
    SetLength(Value, BufSize);
    CopyMemory(@Value[1], Buf, BufSize);
    FreeMem(Buf);
    Result := True;
  end;
end;

end.

