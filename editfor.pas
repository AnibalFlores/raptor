unit editfor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Frontend, ExtCtrls, Spin, ComCtrls;

type
  TEditForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CueBar: TTrackBar;
    Cuestopbtn: TButton;
    Timer1: TTimer;
    Label5: TLabel;
    FineRwbtn: TButton;
    Fineffbtn: TButton;
    FindOutro: TButton;
    FindIntro: TButton;
    MPrevbtn: TButton;
    MNextbtn: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    FadeInSpin: TSpinEdit;
    IntroSpin: TSpinEdit;
    FadeOutSpin: TSpinEdit;
    OutroSpin: TSpinEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Volumenbar: TTrackBar;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    StartSpin: TSpinEdit;
    Label10: TLabel;
    EndSpin: TSpinEdit;
    Label11: TLabel;
    SpinEdit3: TSpinEdit;
    TalkSpin: TSpinEdit;
    Label8: TLabel;
    PunchSpin: TSpinEdit;
    OpenDialog1: TOpenDialog;
    Punchname: TEdit;
    BrowBtn: TButton;
    Label12: TLabel;
    Label13: TLabel;
    PunCheck: TCheckBox;
    PunchVolSpin: TSpinEdit;
    Label14: TLabel;
    TrackBar1: TTrackBar;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Tomarvalores(row: integer);
    procedure Ponervalores(row: integer);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure IntroSpinChange(Sender: TObject);
    procedure OutroSpinChange(Sender: TObject);
    procedure FadeOutSpinChange(Sender: TObject);
    procedure FadeInSpinChange(Sender: TObject);
    procedure CuestopbtnClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CueBarEnter(Sender: TObject);
    procedure CueBarChange(Sender: TObject);
    procedure IntroSpinClick(Sender: TObject);
    procedure OutroSpinClick(Sender: TObject);
    procedure FadeInSpinClick(Sender: TObject);
    procedure FadeOutSpinClick(Sender: TObject);
    procedure VolumenbarChange(Sender: TObject);
    procedure MPrevbtnClick(Sender: TObject);
    procedure MNextbtnClick(Sender: TObject);
    procedure FindIntroClick(Sender: TObject);
    procedure FindOutroClick(Sender: TObject);
    procedure FineffbtnClick(Sender: TObject);
    procedure FineRwbtnClick(Sender: TObject);
    procedure CueBarExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure EndSpinChange(Sender: TObject);
    procedure EndSpinClick(Sender: TObject);
    procedure StartSpinChange(Sender: TObject);
    procedure StartSpinClick(Sender: TObject);
    procedure TalkSpinClick(Sender: TObject);
    procedure TalkSpinChange(Sender: TObject);
    procedure PunCheckClick(Sender: TObject);
    procedure BrowBtnClick(Sender: TObject);
    procedure PunchSpinClick(Sender: TObject);
    procedure Punchactive;
    procedure Punchdisabled;
    procedure TrackBar1Change(Sender: TObject);
    procedure PunchVolSpinChange(Sender: TObject);
  private
    { Private declarations }
  public
    tope, row : integer;
    { Public declarations }
  end;

var
  EditForm: TEditForm;

implementation

{$R *.DFM}

procedure TEditForm.FormCreate(Sender: TObject);
begin
editform.Caption:='Searching Values...';
end;

procedure TEditForm.FormShow(Sender: TObject);
begin
row:= form1.grilla.Row;
tope:=strtoint(form1.grilla.cells[10,row]);
cuebar.Max:=tope;
volumenbar.max:=0;
volumenbar.min:=form1.piso;
tomarvalores(row);
if row>form1.puntero then cuebar.Position:=0
else
begin
form1.canal4.SelectionStart:=(OutroSpin.Value-20)/10;
cuebar.Position:=OutroSpin.Value-20;
end;
SpinEdit3.Value:=volumenbar.position;
end;

procedure TEditForm.Tomarvalores(row: integer);
begin
with form1.grilla do
begin
editform.Caption:='Info:'+ cells[2,row];
FadeInSpin.Value:=strtoint(cells[5,row]);
FadeOutSpin.Value:=strtoint(cells[6,row]);
IntroSpin.Value:=strtoint(cells[7,row]);
OutroSpin.Value:=strtoint(cells[8,row]);
StartSpin.Value:=strtoint(cells[12,row]);
EndSpin.Value:=strtoint(cells[13,row]);
if OutroSpin.Value> EndSpin.Value then OutroSpin.Value:=EndSpin.Value;
PunchSpin.MaxValue:=EndSpin.Value;
TalkSpin.Value:=strtoint(cells[14,row]);
PunchSpin.MinValue:=-1;
PunchSpin.Value:=strtoint(cells[15,row]);
PunchVolSpin.Value:=strtoint(cells[17,row]);
PunchName.Text:=cells[16,row];
if punchSpin.Value=-1 then Punchdisabled
else punchactive;
volumenbar.Position:=strtoint(cells[11,row]);
end;
end;

procedure TEditForm.Ponervalores(row: integer);
begin
with form1.grilla do
begin
if OutroSpin.Value> EndSpin.Value then OutroSpin.Value:=EndSpin.Value;
cells[5,row]:=inttostr(FadeInSpin.Value);
cells[6,row]:=inttostr(FadeOutSpin.Value);
cells[7,row]:=inttostr(IntroSpin.Value);
cells[8,row]:=inttostr(OutroSpin.Value);
cells[12,row]:=inttostr(StartSpin.Value);
cells[13,row]:=inttostr(EndSpin.Value);
cells[14,row]:=inttostr(TalkSpin.Value);
cells[15,row]:=inttostr(PunchSpin.Value);
cells[16,row]:=PunchName.Text;
cells[11,row]:=inttostr(Volumenbar.Position);
cells[17,row]:=inttostr(punchvolspin.Value);
end;
end;

procedure TEditForm.Button3Click(Sender: TObject);
begin
tomarvalores(row);
end;

procedure TEditForm.Button2Click(Sender: TObject);
begin
form1.canal4.Stop;
form1.canal4.AutoStart:=false;
form1.canal4.FileName:='';
close
end;

procedure TEditForm.Button1Click(Sender: TObject);
begin
ponervalores(row);
form1.canal4.Stop;
form1.canal4.AutoStart:=false;
form1.canal4.FileName:='';
close;
end;

procedure TEditForm.IntroSpinChange(Sender: TObject);
begin
if Introspin.Value < 0 then Introspin.Value:=0;
end;

procedure TEditForm.OutroSpinChange(Sender: TObject);
begin
if Outrospin.Value > tope then Outrospin.Value:=tope;
end;

procedure TEditForm.FadeOutSpinChange(Sender: TObject);
begin
if FadeOutspin.Value > tope then FadeOutspin.Value:=tope;
end;

procedure TEditForm.FadeInSpinChange(Sender: TObject);
begin
if FadeInSpin.Value < 0 then FadeInSpin.Value:=0;
end;

procedure TEditForm.CuestopbtnClick(Sender: TObject);
begin
if Cuestopbtn.Caption='CUE' then
 begin
 Form1.canal4.Run;
 Cuestopbtn.Caption:='STOP';
 timer1.Enabled:=True;
 end
 else
 begin
 Form1.canal4.Stop;
 Cuestopbtn.Caption:='CUE';
 timer1.Enabled:=False;
 end;
end;
procedure TEditForm.Timer1Timer(Sender: TObject);
begin
cuebar.Position:=trunc(form1.canal4.CurrentPosition * 10);
end;



procedure TEditForm.CueBarEnter(Sender: TObject);
begin
if Cuestopbtn.Caption='STOP' then Cuestopbtn.Click;
end;

procedure TEditForm.CueBarChange(Sender: TObject);
begin
label5.Caption:=format('%.5d',[cuebar.Position]);
end;

procedure TEditForm.IntroSpinClick(Sender: TObject);
begin
IntroSpin.Value:=strtoint(Label5.Caption);
end;

procedure TEditForm.OutroSpinClick(Sender: TObject);
begin
OutroSpin.Value:=strtoint(Label5.Caption);
end;

procedure TEditForm.FadeInSpinClick(Sender: TObject);
begin
FadeInSpin.Value:=strtoint(Label5.Caption);
end;

procedure TEditForm.FadeOutSpinClick(Sender: TObject);
begin
FadeOutSpin.Value:=strtoint(Label5.Caption);
end;

procedure TEditForm.VolumenbarChange(Sender: TObject);
begin
SpinEdit3.Value:=volumenbar.position;
form1.canal4.Volume:=volumenbar.Position;
end;

procedure TEditForm.MPrevbtnClick(Sender: TObject);
Var
fila: integer;
begin
if row=0 then fila:=form1.grilla.RowCount-1
else fila:=row-1;
introspin.Value:=strtoint(form1.grilla.cells[10,fila]);
introspin.Value:=introspin.Value-strtoint(form1.grilla.cells[8,fila]);
FindIntroClick(mprevbtn);
end;

procedure TEditForm.MNextbtnClick(Sender: TObject);
Var
fila: integer;
begin
if row = form1.grilla.RowCount-1 then fila:=0
else fila:=row+1;
OutroSpin.Value:=strtoint(form1.grilla.cells[10,row]);
Outrospin.Value:=OutroSpin.Value - strtoint(form1.grilla.cells[7,fila]);
FindOutroClick(MNextbtn);
end;

procedure TEditForm.FindIntroClick(Sender: TObject);
begin
form1.canal4.CurrentPosition:=introspin.Value/10;
cuebar.Position:=introspin.Value;
end;

procedure TEditForm.FindOutroClick(Sender: TObject);
begin
form1.canal4.CurrentPosition:=Outrospin.Value/10;
cuebar.Position:=Outrospin.Value;
end;

procedure TEditForm.FineffbtnClick(Sender: TObject);
begin
cuebar.Position:=cuebar.Position+1;
form1.canal4.CurrentPosition:=cuebar.Position/10;
end;

procedure TEditForm.FineRwbtnClick(Sender: TObject);
begin
cuebar.Position:=cuebar.Position-1;
form1.canal4.CurrentPosition:=cuebar.Position/10;
end;

procedure TEditForm.CueBarExit(Sender: TObject);
begin
Form1.canal4.CurrentPosition:=cuebar.Position/10;
end;

procedure TEditForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key=' ' then
begin
EditForm.ActiveControl:=Cuestopbtn;
Cuestopbtn.Click;
end;
end;
procedure TEditForm.Button5Click(Sender: TObject);
begin
volumenbar.Position:=form1.dflttecho;
end;

procedure TEditForm.Button6Click(Sender: TObject);
begin
volumenbar.Position:=form1.dfltmaximo;
end;

procedure TEditForm.Button4Click(Sender: TObject);
begin
volumenbar.Position:=form1.dfltsoft;
end;

procedure TEditForm.EndSpinChange(Sender: TObject);
begin
if Endspin.Value > tope then Endspin.Value:=tope;
EndSpin.Value:=(EndSpin.Value div 10)* 10;
end;

procedure TEditForm.EndSpinClick(Sender: TObject);
begin
EndSpin.Value:=strtoint(Label5.Caption);
end;

procedure TEditForm.StartSpinChange(Sender: TObject);
begin
if StartSpin.Value < 0 then StartSpin.Value:=0;
StartSpin.Value:=(StartSpin.Value div 10)* 10;
end;

procedure TEditForm.StartSpinClick(Sender: TObject);
begin
StartSpin.Value:=strtoint(Label5.Caption);
end;

procedure TEditForm.TalkSpinClick(Sender: TObject);
begin
TalkSpin.Value:=strtoint(Label5.Caption);
end;

procedure TEditForm.TalkSpinChange(Sender: TObject);
begin
if TalkSpin.Value < 0 then TalkSpin.Value:=0;
end;

procedure TEditForm.PunCheckClick(Sender: TObject);
begin
if puncheck.Checked then PunchActive else PunchDisabled;
end;

procedure TEditForm.punchactive;
begin
puncheck.Checked:=True;
punchSpin.Enabled:=true;
PunchSpin.Value:=strtoint(form1.grilla.cells[15,row]);
if  PunchSpin.Value=-1 then PunchSpin.Value:=30;
PunchSpin.MinValue:=0;
browbtn.Enabled:=true;
punchname.Enabled:=true;
punchVolspin.Enabled:=True;
trackbar1.Enabled:=True;
end;

procedure TEditForm.punchdisabled;
begin
puncheck.Checked:=False;
PunchSpin.MinValue:=-1;
punchSpin.Value:=-1;
punchSpin.Enabled:=False;
browbtn.Enabled:=False;
punchname.Enabled:=False;
{punchname.Text:='';}
punchVolspin.Enabled:=False;
trackbar1.Enabled:=False;
end;

procedure TEditForm.BrowBtnClick(Sender: TObject);
begin
If OpenDialog1.Execute then
 punchname.Text:= opendialog1.FileName;
end;
procedure TEditForm.PunchSpinClick(Sender: TObject);
begin
PunchSpin.Value:=strtoint(Label5.Caption);
end;

procedure TEditForm.TrackBar1Change(Sender: TObject);
begin
punchvolspin.Value:=trackbar1.Position;
end;

procedure TEditForm.PunchVolSpinChange(Sender: TObject);
begin
trackbar1.Position:=punchvolspin.Value;
end;

end.
