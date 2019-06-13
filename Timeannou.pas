unit Timeannou;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, FileCtrl, Spin, ComCtrls;

type
  TTimeForm = class(TForm)
    BasesList: TFileListBox;
    IntrosList: TFileListBox;
    ComboTalker: TComboBox;
    Label11: TLabel;
    PPointSpin: TSpinEdit;
    Button1: TButton;
    Button2: TButton;
    BaseVol: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    TimeTrackBar: TTrackBar;
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TimeTrackBarChange(Sender: TObject);
    procedure BaseVolChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TimeForm: TTimeForm;

implementation
uses frontend;
{$R *.DFM}

procedure TTimeForm.FormActivate(Sender: TObject);
begin
BasesList.Directory:=form1.HourEdit.Text+'\Bases';
IntrosList.Directory:=form1.HourEdit.Text+'\Intros';
BasesList.ItemIndex:=0;
IntrosList.ItemIndex:=0;
basevol.Value:=form1.dflttecho;
basevol.MaxValue:=form1.dfltmaximo;
basevol.MinValue:=form1.piso;
TimeTrackBar.Max:= form1.dfltmaximo;
TimeTrackBar.Min:= form1.piso;
TimeTrackBar.Position:=form1.dflttecho;
end;

procedure TTimeForm.Button2Click(Sender: TObject);
begin
close
end;

procedure TTimeForm.Button1Click(Sender: TObject);
var
fila: integer;
begin
with form1 do
begin
fila:=grilla.Row;
if insertbtn.Down then insertafilas(1);
catalogar(uppercase(BasesList.FileName));
if grilla.row = grilla.rowcount-1 then
             grilla.RowCount:=grilla.RowCount+1;
grilla.row:=grilla.row+1;
grilla.RowCount:=grilla.RowCount-1;
enumerar(0);
grilla.Cells[15,fila]:=inttostr(PPointSpin.Value);
grilla.Cells[16,fila]:=IntrosList.FileName;
grilla.Cells[1,fila]:='15';
grilla.Cells[18,fila]:='29';
grilla.Cells[11,fila]:=inttostr(BaseVol.Value);
end;
close
end;

procedure TTimeForm.TimeTrackBarChange(Sender: TObject);
begin
basevol.Value:=TimeTrackBar.Position;
end;

procedure TTimeForm.BaseVolChange(Sender: TObject);
begin
TimeTrackBar.Position:=basevol.Value;
end;

end.
