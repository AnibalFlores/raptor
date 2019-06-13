unit Padsunit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ImgList, ComCtrls, ToolWin,mpgtools, FileCtrl, Grids,Quickdir,frontend;

type
  TPads = class(TForm)
    PadList: TStringGrid;
    PadDirectory: TDirectoryListBox;
    PadListBox: TFileListBox;
    PadDrive: TDriveComboBox;
    HighRadio: TRadioButton;
    NormalRadio: TRadioButton;
    Softradio: TRadioButton;
    SaveBtn: TButton;
    SaveAsBtn: TButton;
    CancelBtn: TButton;
    LoadBtn: TButton;
    PadSaveDlg: TSaveDialog;
    PadOpenDlg: TOpenDialog;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    PageScroller1: TPageScroller;
    DirectBar: TToolBar;
    ToolButton1: TToolButton;
    VolBar: TTrackBar;
    procedure Etiquetar;
    procedure LoadBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure PadListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure PadListBoxDblClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure PadListRowMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure CreateBar;
    procedure DirectBarClick(Sender: TObject);
    procedure PadListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure PadListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EtiqueBtn;
    procedure SaveList(fname: String);
    procedure LoadList(fname: String);
    procedure SaveAsBtnClick(Sender: TObject);
    procedure PadListSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure PadListBoxStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure PadListDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure PadListGetEditMask(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure PadListSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure VolBarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Pads: TPads;

implementation

{$R *.DFM}

procedure TPads.LoadBtnClick(Sender: TObject);

begin
if Application.MessageBox('This operation will replace all The current assignments','Raptor Info',MB_OKCANCEL+MB_ICONINFORMATION)=1
then
begin
padopendlg.InitialDir:=form1.PadBox.Directory;
If padopendlg.Execute then
begin
form1.PadBox.Directory:=padopendlg.InitialDir;
LoadList(padopendlg.FileName);
{pads.Caption:='Buttons from '+ padopendlg.FileName;}
end;
end;
end;

procedure TPads.LoadList(fname: String);
var
    i,c: integer;
    FileStream: TFileStream;
    Reader    : TReader;
  begin
  { try opening a non existent file
  }
  try
    {FileStream := TFileStream.Create ('c:\windows\escritorio\bogus.txt',
      fmOpenRead);}
  except
    on EFOpenError do
    application.messagebox('No Puedo Abrir El Archivo','Info',0);
  end;
  FileStream := TFileStream.Create (fname,
    fmOpenRead);
  Reader := TReader.Create (FileStream, $ff);
  Reader.ReadListBegin;
  for i:=1 to Padlist.RowCount-1 do
  Padlist.Rows[i].Clear;
  i:=1;
  while not Reader.EndOfList do
  begin
  Padlist.RowCount:=i+1;
  for c:=0 to Padlist.ColCount-1 do
  Padlist.cells[c,i]:=Reader.ReadString;
  i:=i+1;
  end;
  Reader.ReadListEnd;
  Reader.Destroy;
  FileStream.Destroy;
end;

procedure TPads.FormActivate(Sender: TObject);
begin
pads.Caption:='Buttons from '+ form1.PadBox.FileName;
etiquetar;
createbar;
end;

procedure TPads.Etiquetar;
Var
i: integer;
begin
padlist.Cells[0,0]:='Btn';
padlist.Cells[1,0]:='Name';
padlist.Cells[2,0]:='Path';
padlist.Cells[3,0]:='Volume';
for i:=1 to 20 do
padlist.Cells[0,i]:=format('%.2d',[i]);
end;

procedure TPads.CancelBtnClick(Sender: TObject);
begin
close;
end;

procedure TPads.PadListDragDrop(Sender, Source: TObject; X, Y: Integer);
begin

if source=Padlistbox then
begin
cat:=TMpegAudio.Create;
cat.FileName:=Padlistbox.FileName;
Padlist.Cells[1,padlist.row]:=Copy(cat.Title, 1, 15);
Padlist.Cells[2,padlist.row]:=Padlistbox.FileName;
if highradio.Checked then
 Padlist.Cells[3,padlist.row]:=inttostr(form1.dfltmaximo);
if Normalradio.Checked then
 Padlist.Cells[3,padlist.row]:=inttostr(form1.dflttecho);
if Softradio.Checked then
 Padlist.Cells[3,padlist.row]:=inttostr(form1.dfltSoft);
if padlist.row < 20 then padlist.row:=padlist.row+1;
cat.Destroy;
end;
end;

procedure TPads.PadListBoxDblClick(Sender: TObject);
begin
PadListDragDrop(PadList,Padlistbox,0,0);
end;

procedure TPads.SaveBtnClick(Sender: TObject);
begin
SaveList(form1.PadBox.FileName);
etiqueBtn;
close;
end;

procedure TPads.etiquebtn;
begin
with form1 do
begin
PadBtn01.Caption:=padlist.Cells[1,1];
PadBtn02.Caption:=padlist.Cells[1,2];
PadBtn03.Caption:=padlist.Cells[1,3];
PadBtn04.Caption:=padlist.Cells[1,4];
PadBtn05.Caption:=padlist.Cells[1,5];
PadBtn06.Caption:=padlist.Cells[1,6];
PadBtn07.Caption:=padlist.Cells[1,7];
PadBtn08.Caption:=padlist.Cells[1,8];
PadBtn09.Caption:=padlist.Cells[1,9];
PadBtn10.Caption:=padlist.Cells[1,10];
PadBtn11.Caption:=padlist.Cells[1,11];
PadBtn12.Caption:=padlist.Cells[1,12];
PadBtn13.Caption:=padlist.Cells[1,13];
PadBtn14.Caption:=padlist.Cells[1,14];
PadBtn15.Caption:=padlist.Cells[1,15];
PadBtn16.Caption:=padlist.Cells[1,16];
PadBtn17.Caption:=padlist.Cells[1,17];
PadBtn18.Caption:=padlist.Cells[1,18];
PadBtn19.Caption:=padlist.Cells[1,19];
PadBtn20.Caption:=padlist.Cells[1,20];
end;
end;

procedure TPads.SaveList(fname: string);
var
    FileStream: TFileStream;
    Writer    : TWriter;
    i,c         : Integer;
begin
  FileStream := TFileStream.Create (fname,
    fmCreate or fmOpenWrite or fmShareDenyNone);
  Writer := TWriter.Create (FileStream, $ff);
  Writer.WriteListBegin;
  for i := 1 to Padlist.RowCount-1 do
  for c:= 0 to Padlist.ColCount -1 do
  Writer.WriteString (Padlist.cells[c,i]);
  Writer.WriteListEnd;
  Writer.Destroy;
  FileStream.Destroy;
end;

procedure TPads.PadListRowMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
etiquetar;
end;

procedure TPads.FormCreate(Sender: TObject);
begin
createbar;
end;

procedure TPads.CreateBar;
Var
i,f :integer;
begin
f:=Quickform.DirsGrid.RowCount;
while DirectBar.ButtonCount>0 do
DirectBar.Buttons[0].Destroy;
for i:=f-1 downto 1 do
begin
      with TToolButton.Create(DirectBar) do
      begin
        Parent :=DirectBar;
        Caption := Quickform.DirsGrid.Cells[1,i];
        Name:='BT'+inttostr(i);
        ImageIndex :=strtoint(Quickform.DirsGrid.Cells[3,i]);
        Hint:= Quickform.DirsGrid.Cells[2,i];
        Showhint:=true;
        Style :=tbsCheck;
        OnClick:=DirectBarClick;
        Grouped:=True;
      end;
end;
end;

procedure TPads.DirectBarClick(Sender: TObject);
var
i: integer;
s: string;
begin

for i:=0 to directbar.ButtonCount-1 do
if directbar.Buttons[i].Down=true then
begin
s:=directbar.Buttons[i].hint;
Paddrive.Drive:=s[1];
PadListBox.Directory:=s;
end;
end;

procedure TPads.PadListDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
Var
col,fila: integer;
begin
if source=Padlistbox then
begin
Accept:=True;
PadList.MouseToCell(x,y,col,fila);
if (fila<=padlist.rowcount-1) and (fila>0) then PadList.row:=fila;
end;
end;

procedure TPads.PadListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If (Key = 46) and (Shift =[ssCtrl]) then
begin
Padlist.Rows[padlist.row].Clear;
etiquetar;
end;
end;
procedure TPads.SaveAsBtnClick(Sender: TObject);
begin
padsavedlg.InitialDir:=form1.PadBox.Directory;
if padsavedlg.Execute then
begin
form1.PadBox.Directory:=padsavedlg.InitialDir;
SaveList(padsavedlg.FileName);
etiqueBtn;
form1.PadBox.Update;
close;
end;
end;

procedure TPads.PadListSetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: String);
begin
if acol=1 then
   if length(PadList.Cells[1,arow])>16 then
    PadList.Cells[1,arow]:=copy(PadList.Cells[1,arow],1,16);
end;

procedure TPads.PadListBoxStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
if PadListbox.SelCount>1 then PadListbox.DragCursor:=crMultiDrag
else PadListbox.DragCursor:=crDrag;
end;

procedure TPads.PadListDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if acol=0 then
begin
case arow of
0:padlist.Canvas.Brush.Color:=clTeal;
1..5: padlist.Canvas.Brush.Color:=clGray;
6..10:padlist.Canvas.Brush.Color:=clSilver;
11..15:padlist.Canvas.Brush.Color:=clGray;
16..20:padlist.Canvas.Brush.Color:=clSilver;
end;
padlist.Canvas.Font.Color:=clBlack;
padlist.Canvas.FillRect(rect);
padlist.Canvas.TextOut(rect.left+2,rect.top+2,padlist.cells[0,arow]);
end;
if state=[gdFocused] then
begin
padlist.Canvas.Font.Color:=clBlack;
padlist.Canvas.FillRect(rect);
padlist.Canvas.TextOut(rect.left+2,rect.top+2,padlist.cells[acol,arow]);
end;
end;

procedure TPads.PadListGetEditMask(Sender: TObject; ACol, ARow: Integer;
  var Value: String);
begin
PadList.Font.Color:=clGreen;
end;

procedure TPads.PadListSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
Var
rect: Trect;
begin
volbar.Visible:=False;
case acol of
1:PadList.Font.Color:=clLime;
0,2:Canselect:=false;
3:
begin
Canselect:=false;
rect:=PadList.CellRect(3,arow);
removecontrol(volbar);
insertcontrol(volbar);
volbar.Top:=rect.top+29;
volbar.Left:=rect.Left-150;
volbar.Tag:=arow;
volbar.Position:=strtoint(padlist.cells[3,arow]);
volbar.Visible:=true;
end;
end;
end;
procedure TPads.VolBarChange(Sender: TObject);
begin
padlist.cells[3,volbar.tag]:=inttostr(volbar.position);
end;

end.
