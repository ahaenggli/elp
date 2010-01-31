unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, jpeg, DateUtils, IdHttp, ActnList;

type
  TArray = Array of string;
  TForm9 = class(TForm)
    Label6: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    StaticText1: TStaticText;
    StaticText3: TStaticText;
    BitBtn2: TBitBtn;
    Timer1: TTimer;
    Image1: TImage;
    Label1: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormHide(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Memo2Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private-Deklarationen }
FileName,Filecache,Path,max:String;
isc,isc2,ii,iii:Integer;
str:TStringlist;
words:TArray;
FileCacheSL:TStringList;
    FWndProc  : TWndMethod;
    FWndProc2  : TWndMethod;
    procedure MemoWndProc(var Msg: TMessage);
    procedure Memo2WndProc(var Msg: TMessage);
  public
    { Public-Deklarationen }
  end;

var
  Form9: TForm9;

implementation

uses FastStrings, Unit1, Unit2, Unit3, Unit4, Unit6, Unit7, Unit10;

{$R *.dfm}
procedure TForm9.MemoWndProc(var Msg: TMessage);
begin
  if Msg.Msg = WM_SETFOCUS then
  begin
    HideCaret(Memo1.Handle); // Cursor verstecken
    Msg.Result := 0;
  end else
    FWndProc(Msg); // alte Fensterproceure aufrufen
end;

function explode(cDelimiter,  sValue : string; iCount : integer) : TArray;
var
s : string; i,p : integer;
begin

        s := sValue; i := 0;
        while length(s) > 0 do
        begin
                inc(i);
                SetLength(result, i);
                p := pos(cDelimiter,s);

                if ( p > 0 ) and ( ( i < iCount ) OR ( iCount = 0) ) then
                begin

                        result[i - 1] := copy(s,0,p-1);

                        {updated, thanks Irfan}
                        s := copy(s,p + length(cDelimiter),length(s));
                end else
                begin result[i - 1] := s;
                        s :=  '';
                end;
        end;

end;
function InArray(text:string;strings:array of string):boolean;
      var
        i:integer;
      begin
      result := false;
        For i := 0 to High(Strings) do begin
              If strings[i] = text then
                begin
                result := true;
                exit;
                end
              else
                result := false;
          end;
      end;
function clearSTlist(sl:TStringlist):TSTringlist;
var i:Integer;
     sl2:TStringlist;
begin
sl2:=TStringlist.Create;
  for i := 0 to sl.Count - 1 do begin
    if sl[i]<>'' then sl2.Add(sl[i]);
  end;
result:=sl2;
end;

procedure TForm9.Timer1Timer(Sender: TObject);
 var
        tar,ttt: TArray; i2:integer;
begin
inc(ii);
if strtoint(edit1.text) = 0 then edit1.text:='4500';

timer1.interval:=strtoint(edit1.text);
if (ii mod 2)=0 then begin

  str.delete(0);
   str.SaveToFile(FileName);

    if str.Text <> '' then
      begin
    str.Clear;
    str.LoadFromFile(FileName);
    words:=explode('|', str[0], 0);
    ttt:=explode('[]', words[isc], 0);
    Memo1.Text:='';
    Memo1.Lines[0]:=ttt[0];
  for i2:=1 to high(ttt) do Memo1.Lines.add(ttt[i2]);


    Memo2.Text:='';
     inc(iii);
     label4.Caption:=inttostr(iii)+'/'+max;
      end;
      str:=clearSTlist(str);
       if str.Text = '' then
        begin
        timer1.enabled:=false;
        Memo1.Text:='';
        Memo2.Text:='';


        Form1.Top:=Top;
        Form1.Left:=Left;
        Form1.Show;
        Hide;
        end;

end else begin

tar := explode('[]',words[isc2],0);
     Memo2.Lines[0]:=tar[0];
     for i2:=1 to high(tar) do Memo2.Lines.add(tar[i2]);
end;

{t:=True;t2:=True;
 label2.canvas.font.Size:=memo1.font.size;

if (abs( label2.Canvas.TextWidth(Memo1.Lines[0])+8) >= abs(memo1.width)) then
    Memo1.ScrollBars:=ssHorizontal else
       t:=False;

       if Memo1.Height <= (Memo1.Lines.Count) * abs(Memo1.Font.Height) then
    Memo1.ScrollBars := ssVertical else
         t2:=False;
  }
//if (t2=False) and (t=False) then     Memo1.ScrollBars := ssNone;

    
end;
procedure VerticalAlignMemo(MyMemo: TMemo);
var
  R: Trect;
  LineHeight, LineTop: integer;
  TmpLabel: TLabel;
  TmpString: string;
  TmpCnt: integer;
  TmpControl: TWinControl;
begin
  TmpLabel := TLabel.Create(NIL);
  TmpLabel.Parent := form1;
  TmpLabel.Visible := False;
  TmpLabel.Font.Assign(MyMemo.Font);
  LineHeight := TmpLabel.Canvas.TextHeight('T');
  TmpLabel.Free;

  TmpString := MyMemo.Text;
  LineTop := Trunc(((MyMemo.Height - 4) / 2) - (LineHeight / 2));
  TmpCnt := 1;
  while pos(#13, TmpString) > 0 do
  begin
    TmpString := Copy(TmpString, pos(#13, TmpString) + 1, Length(TmpString));
    TmpCnt := TmpCnt + 1;
    if (TmpCnt * (LineHeight / 2)) <= (MyMemo.Height / 2) then
      LineTop := Trunc(((MyMemo.Height - 4) / 2) - (TmpCnt * (LineHeight / 2)));
  end;

  R := Rect(1, LineTop, MyMemo.Width - 2, MyMemo.Height);

  SendMessage(MyMemo.Handle, EM_SETRECTNP, 0, LongInt(@R));
  SendMessage(MyMemo.Handle, EM_SCROLLCARET, 0, 0);

  TmpControl := MyMemo.Parent;
  while TmpControl.HasParent = True do
    TmpControl := TmpControl.Parent;
  if TmpControl.Visible = True then
    MyMemo.Repaint;
end;
procedure TForm9.Memo1Change(Sender: TObject);
begin
  VerticalAlignMemo(Memo1);
end;

procedure TForm9.Memo2Change(Sender: TObject);
begin
 VerticalAlignMemo(Memo2);
end;

procedure TForm9.Memo2WndProc(var Msg: TMessage);
begin
  if Msg.Msg = WM_SETFOCUS then
  begin
    HideCaret(Memo2.Handle); // Cursor verstecken
    Msg.Result := 0;
  end else
    FWndProc2(Msg); // alte Fensterproceure aufrufen
end;

procedure TForm9.Action1Execute(Sender: TObject);
begin
Form1.Button4.Click;
end;

procedure TForm9.BitBtn2Click(Sender: TObject);
begin
timer1.enabled:=false;
        Memo1.Text:='';
        Memo2.Text:='';

        Form1.Top:=Form9.Top;
        Form1.Left:=Form9.Left;

        Form1.Show;
        Form9.Hide;
end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form1.Close;
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
ii:=0;
Memo1.Text:='';
Memo2.Text:='';
FileName:=Form1.FileName;
Filecache:=Form1.FileCache;
Path:=Form1.Path;
memo1.BorderStyle:=bsnone;
str:=Tstringlist.Create;
filecachesl:=Tstringlist.Create;
  FWndProc := Memo1.WindowProc; // alte Fensterproceure merken
  Memo1.WindowProc := MemoWndProc; // Fensterproceure auf eigene Fensterprocedure umbiegen
   FWndProc2 := Memo2.WindowProc; // alte Fensterproceure merken
  Memo2.WindowProc := Memo2WndProc; // Fensterproceure auf eigene Fensterprocedure umbiegen
  Image1.Picture:=Form1.Image1.Picture;
end;

procedure TForm9.FormHide(Sender: TObject);
begin
timer1.enabled:=false;
end;

procedure TForm9.FormShow(Sender: TObject);
var
    ttt:TArray;
    i2:Integer;
begin
if form1.ischanged=True then begin isc:=0; isc2:=1;end
   else begin isc := 1;isc2:=0;  end;
     ii:=0;
   str.LoadFromFile(FileName);
    words:=explode('|', str[0], 0);
    ttt:=explode('[]', words[isc], 0);
    Memo1.Text:='';
    Memo1.Lines[0]:=ttt[0];
  for i2:=1 to high(ttt) do Memo1.lines.add(ttt[i2]);
    Memo2.Text:='';
    max:=inttostr(str.count); iii:=1;
    timer1.enabled:=true;
            label4.Caption:=inttostr(iii)+'/'+max;
                     end;

end.
