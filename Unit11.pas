unit Unit11;

interface

uses
  
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Math, jpeg, ExtCtrls, Printers,ActnList;

type
  TForm11 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    StaticText1: TStaticText;
    Edit1: TEdit;
    CB1: TComboBox;
    CB2: TComboBox;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    BitBtn2: TBitBtn;
    ActionList1: TActionList;
    Action1: TAction;
    PrintDialog: TPrintDialog;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Action1Execute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
        BlattBreite, BlattHoehe,

    Rand, ZeilenHoehe,i : INTEGER;
    str:TStringlist;
  public
    { Public-Deklarationen }
  end;

var
  Form11: TForm11;

implementation

uses FastStrings, Unit1, Unit10, Unit2, Unit3, Unit4, Unit6, Unit7, Unit8;

{$R *.dfm}
function Zs(Von, Bis: Integer): Integer;
begin
Randomize;
  Result := Random(Succ(Bis - Von)) + Von;
end;
function textwrap(textstr:String; onum:Integer; BOOL:Boolean; zs:String; tr:Boolean=False)  :String;
var
again:Boolean;
tmpa, tmpb:String;
i:Integer;
begin



again:=True;
while((again=true)and(onum<>0))   do begin

if textstr[onum] = ' ' then begin
textstr[onum] := #13;
//textstr:=StringReplace(textstr, #13, #13+zs,  [rfReplaceAll, rfIgnoreCase]);
again:=false;
end else onum:=onum-1;

end;
tmpa:='';
for i := 1 to onum do  begin
tmpa:=tmpa+textstr[i];
//showmessage(tmpa);
end;

//tmpa:=textstr[1]+textstr[2]+textstr[3]+textstr[4]+textstr[5]+textstr[6];

for i := onum+1 to length(textstr)-1 do  begin
tmpb:=tmpb+textstr[i];
end;


if tr = true  then result:=tmpb;
if tr = false then result:=tmpa;


 if BOOL = FALSE then begin
 result:=inttostr(length(textstr)-onum);
 end;





end;
function IsNumeric(value: string): boolean;
var iDummy: integer;
begin
result := true;
try
idummy := StrToInt(value);
except
result := false;
end;
end;

procedure TForm11.Action1Execute(Sender: TObject);
begin
Form1.Button4.Click;
end;

procedure TForm11.BitBtn2Click(Sender: TObject);
var vs:Boolean;
begin
vs:=true;
Memo1.Visible:=not vs;
Button2.Visible:=not vs;
Button3.Visible:=not vs;
Statictext1.Visible:=vs;

Statictext3.Visible:=vs;
Statictext4.Visible:=vs;
Memo1.Text:='';
CB1.Visible:=vs;
CB2.Visible:=VS;
Edit1.Visible:=VS;
Button1.Visible:=VS;
Form1.Top:=Top;
Form1.Left:=Left;
Form1.Show;
Hide;
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

procedure TForm11.Button1Click(Sender: TObject);
var vs:Boolean;
    tmp:TStringlist;
    z,z2,u,i2:Integer;
    path,a,b:String;
    tar:TArray;
begin

if (not IsNumeric(Edit1.Text))or(edit1.Text = '') then begin showmessage('Bitte eine Zahl eingeben!'); exit; end;

vs:=false;
path:=Form1.Path;
Memo1.Visible:=not vs;
Button2.Visible:=not vs;
Button3.Visible:=not vs;
Statictext1.Visible:=vs;

Statictext3.Visible:=vs;
Statictext4.Visible:=vs;
CB1.Visible:=vs;
CB2.Visible:=VS;
Edit1.Visible:=VS;
Button1.Visible:=VS;

str := TStringList.Create;
tmp := TStringList.Create;


for i2 := 0 to high(form1.vocis) do begin
  if  (strtoint(form1.vocis[i2].lektion) >= strtoint(cb1.text)) and(strtoint(form1.vocis[i2].lektion) <= strtoint(cb2.text)) then begin
  str.add(form1.Vocis[i2].Franz+'|'+form1.Vocis[i2].Deutsch+'|'+form1.Vocis[i2].Lektion+'|'+form1.Vocis[i2].Fehler+'|'+form1.Vocis[i2].ID);
  end;
end;

for z2 := 0 to ZS(1, 10000) do         begin

for z := 0 to str.Count-1 do begin
 u := random(str.Count-1);
 a := str[z];
 b := str[u];
str[z]:=b;
str[u]:=a;
end;
        end;
i:=0;
if strtoint(Edit1.text) > str.count-1 then i:=str.count-1
else i:=strtoint(Edit1.text)-1;

for z := 0 to i do begin
     tar := explode('|', str[z], 0);

tar[0]:=StringReplace(tar[0], '[]', ' // ', [rfReplaceAll]);
tar[1]:=StringReplace(tar[1], '[]', ' // ', [rfReplaceAll]);
Memo1.Lines.Add(''+tar[1]+#10+'     _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _');
memo1.Lines.add('');


end;
 tmp.Free;

end;


function loesungsblatt(loesung:Boolean):Boolean;
begin


end;


procedure TForm11.Button2Click(Sender: TObject);
var
  ppix,ppiy,mmx,mmy,hmar,vmar,ls,i:integer;
      al,ii,

    Yy,tmp,count: INTEGER;
    sts:TStringlist;
    letters,dan:String;
    tar:TArray;
begin
sts:=TStringList.Create;
sts.Add(' _-$-_ ');

for al:=0 to str.count-1 do sts.add(str[al]);


  BlattBreite := Printer.PageWidth;
   BlattHoehe := Printer.PageHeight;
   ZeilenHoehe := ((Printer.PageHeight DIV 6) DIV 8);
     with printer do begin
     tmp:=1;
      
      With Canvas do
        begin
      count:=strtointDef(  InputBox('Kopien', 'Wie viele Male soll der Test gedruckt werden?','1'), 1);
for i := 1 to count do begin
         BeginDoc;
          {Establish printer parameters}
          ppix:=GetDeviceCaps(Handle,LOGPIXELSX);  {Pixels per inch, x direction}
          ppiy:=GetDeviceCaps(Handle,LOGPIXELSY);  {  "			"  y direction}
          mmx:=round(ppix/25.4);                   {Pixels per mm, x direction}
          mmy:=round(ppiy/25.4);                   {	"	"	 y direction}
          hmar:=mmx*5;                            {Horizontal (left hand) margin}
          vmar:=mmy*5;                            {Vertical (top) margin}
          Font.PixelsPerInch:=ppix;                {BUG!}
          Font.Name:='Times New Roman';
          {Set font size and style, Print Heading}
          Font.Size:=14;
          ls:=textheight('X');                {line spacing = height of the current text.}
          Font.Size:=12;
          yy:=vmar;
          setTextAlign(printer.canvas.handle,TA_LEFT);

for ii := 0 to strtoint(edit1.text) do begin
  if sts[ii]=' _-$-_ ' then    begin dan:='Lektion '+cb1.Text+' bis '+cb2.Text+'         Datum:________________ Name:_______________ Klasse:____'; TextOut (8*Hmar+Hmar*2,yy, dan);   yy:=yy+ls;end;
 if (sts[ii]<>' _-$-_ ')and(sts[ii]<>'') then begin
  if(tmp<ceil(ii/23)) then begin Printer.NewPage;  yy:=vmar;         end;
 tmp:=ceil(ii/23);
 letters:='-------------------------------';
 letters:=letters+'---------------------------------------------------------------';
 tar:=explode('|', sts[ii], 0);
 tar[1]:=StringReplace(tar[1], '[]', ' // ', [rfReplaceAll]);
 tar[1]:=StringReplace(tar[1], #13, '', [rfReplaceAll]);

 yy:=Yy+ls; TextOut (Hmar,Yy+ls, inttostr(ii)+') '+tar[1]);
 yy:=Yy+ls; TextOut (8*Hmar*2,Yy+ls, letters);

 MoveTo (0, Yy+ZeilenHoehe+ls div 2+5);
 LineTo (BlattBreite, Yy+ls+ls div 2+45);
 end;
end;
EndDoc;
end;

if MessageDlg('Soll ein Lösungsblatt gedruckt werden?',mtConfirmation, [mbyes, mbno], 0) = mrYes then begin
         begindoc;
          {Establish printer parameters}
          ppix:=GetDeviceCaps(Handle,LOGPIXELSX);  {Pixels per inch, x direction}
          ppiy:=GetDeviceCaps(Handle,LOGPIXELSY);  {  "			"  y direction}
          mmx:=round(ppix/25.4);                   {Pixels per mm, x direction}
          mmy:=round(ppiy/25.4);                   {	"	"	 y direction}
          hmar:=mmx*5;                            {Horizontal (left hand) margin}
          vmar:=mmy*5;                            {Vertical (top) margin}
          Font.PixelsPerInch:=ppix;                {BUG!}
          Font.Name:='Times New Roman';

          Font.Size:=14;
          ls:=textheight('X');                {line spacing = height of the current text.}
          Font.Size:=12;

yy:=vmar;
setTextAlign(printer.canvas.handle,TA_LEFT);
for ii := 0 to strtoint(edit1.text) do begin
  if sts[ii]=' _-$-_ ' then    begin dan:='Lektion '+cb1.Text+' bis '+cb2.Text+'         LOESUNGEN ---- LOESUNGEN ---- LOESUNGEN';TextOut (8*Hmar+Hmar*4,yy, dan);   yy:=yy+ls;end;
 if (sts[ii]<>' _-$-_ ')and(sts[ii]<>'') then begin
  if(tmp<ceil(ii/23)) then begin Printer.NewPage;  yy:=vmar; end;
 tmp:=ceil(ii/23);
 letters:='-------------------------------';
 letters:=letters+'---------------------------------------------------------------';
 tar:=explode('|', sts[ii], 0);
 tar[1]:=StringReplace(tar[1], '[]', ' // ', [rfReplaceAll]);
 tar[1]:=StringReplace(tar[1], #13, '', [rfReplaceAll]);
 tar[0]:=StringReplace(tar[0], '[]', ' // ', [rfReplaceAll]);
 tar[0]:=StringReplace(tar[0], #13, '', [rfReplaceAll]);

 yy:=Yy+ls; TextOut (Hmar,Yy+ls, inttostr(ii)+') '+tar[1]);
 yy:=Yy+ls; TextOut (8*Hmar*2,Yy+ls, letters);
 TextOut (8*Hmar*2,Yy+ls-80, tar[0]);
 MoveTo (0, Yy+ZeilenHoehe+ls div 2+5);
 LineTo (BlattBreite, Yy+ls+ls div 2+45);
 end;
end;
enddoc;
end;

        end;

    end;
end;


procedure TForm11.Button3Click(Sender: TObject);
var vs:Boolean;
begin
vs:=true;
Memo1.Text:='';
Memo1.Visible:=not vs;
Button2.Visible:=not vs;
//Button3.Visible:=not vs;
Statictext1.Visible:=vs;

Statictext3.Visible:=vs;
Statictext4.Visible:=vs;
CB1.Visible:=vs;
CB2.Visible:=VS;
Edit1.Visible:=VS;
Button1.Visible:=VS;
end;



procedure TForm11.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then Button1.Click;
end;

procedure TForm11.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form1.Close;
end;

procedure TForm11.FormCreate(Sender: TObject);
begin
  Image1.Picture:=Form1.Image1.Picture;
end;

procedure TForm11.FormShow(Sender: TObject);
begin
CB1.Items:=FOrm1.Edit1.Items;
CB2.Items:=FOrm1.Edit1.Items;
CB1.Itemindex:=Form1.Edit1.Itemindex;
CB2.ItemIndex:=Form1.Edit2.Itemindex;
Memo1.Text:='';
end;

end.
