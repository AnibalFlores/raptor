unit Quickdir;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls,comctrls,frontend, Menus, ExtCtrls;

type
  TQuickform = class(TForm)
    DirsGrid: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    QDVolsel: TTrackBar;
    QDBigIcons: TListBox;
    KindList: TListBox;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Load(Sender: TObject);
    procedure Save(Sender: TObject);
    procedure Deleterow;
    procedure CreateBar(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DirsGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DirsGridKeyPress(Sender: TObject; var Key: Char);
    procedure DirsGridSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure DirsGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure QDBigIconsSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure QDBigIconsDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure QDBigIconsClick(Sender: TObject);
    procedure DirsGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure KindListDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure KindListClick(Sender: TObject);
    procedure QDVolselChange(Sender: TObject);
  private
    { Private declarations }
  public
    rowdel: boolean;
    { Public declarations }
  end;

var
  Quickform: TQuickform;

implementation

{$R *.DFM}

procedure TQuickform.FormActivate(Sender: TObject);
Var
i,f :integer;
begin
QDBigIcons.Visible:=False;
f:=form1.DirectBar.ButtonCount;
dirsgrid.rowcount:=f+1;
dirsgrid.FixedRows:=1;
dirsgrid.Rows[0].CommaText:='Button,Name,Path,Icon,Kind,Volume,Mix';
for i:=0 to f-1 do
begin
dirsgrid.Cells[0,i+1]:=format('%.2d',[i+1]);
dirsgrid.Cells[1,i+1]:=form1.DirectBar.Buttons[i].Caption;
dirsgrid.Cells[2,i+1]:=form1.DirectBar.Buttons[i].Hint;
dirsgrid.Cells[3,i+1]:=inttostr(form1.DirectBar.Buttons[i].ImageIndex);
end;
end;

procedure TQuickform.Button1Click(Sender: TObject);
begin
CreateBar(Button1);
save(Button1);
close
end;

procedure TQuickform.CreateBar(Sender: TObject);
Var
i,f :integer;
begin
f:=dirsgrid.rowcount;
while form1.DirectBar.ButtonCount>0 do
form1.DirectBar.Buttons[0].Destroy;
for i:=f-1 downto 1 do
begin
      with TToolButton.Create(form1.DirectBar) do
      begin
        Parent := form1.DirectBar;
        Caption := dirsgrid.Cells[1,i];
        Name:='BT'+inttostr(i);
        ImageIndex :=strtoint(dirsgrid.Cells[3,i]);
        Hint:= dirsgrid.Cells[2,i];
        Showhint:=true;
        Style :=tbsCheck;
        OnClick:=form1.DirectBarClick;
        OnDragDrop:=form1.DirectBarDragDrop;
        OnDragOver:=form1.DirectBarDragOver;
        Grouped:=True;
      end;
end;
end;

procedure TQuickform.Button2Click(Sender: TObject);
begin
close
end;

procedure TQuickform.Load(Sender: TObject);
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
    application.messagebox('No Puedo Abrir El Archivo','Info',1);
  end;
  FileStream := TFileStream.Create ('D:\Listas\dirs.lst',
    fmOpenRead);
  Reader := TReader.Create (FileStream, $ff);
  Reader.ReadListBegin;
  for i:=0 to dirsgrid.RowCount-1 do
  dirsgrid.Rows[i].Clear;
  i:=0;
  while not Reader.EndOfList do
  begin
  dirsgrid.RowCount:=i+1;
  for c:=0 to dirsgrid.ColCount-1 do
  dirsgrid.cells[c,i]:=Reader.ReadString;
  i:=i+1;
  end;
  Reader.ReadListEnd;
  Reader.Destroy;
  FileStream.Destroy;
end;

procedure TQuickform.Save(Sender: TObject);
var
    FileStream: TFileStream;
    Writer    : TWriter;
    i,c         : Integer;
begin
  FileStream := TFileStream.Create ('D:\Listas\dirs.lst',
    fmCreate or fmOpenWrite or fmShareDenyNone);
  Writer := TWriter.Create (FileStream, $ff);
  Writer.WriteListBegin;
  for i := 0 to dirsgrid.RowCount-1 do
  for c:= 0 to dirsgrid.ColCount -1 do
  Writer.WriteString (dirsgrid.cells[c,i]);
  Writer.WriteListEnd;
  Writer.Destroy;
  FileStream.Destroy;
end;

procedure TQuickform.FormCreate(Sender: TObject);
begin
load(Quickform);
CreateBar(Quickform);
end;

procedure TQuickform.DirsGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=46) and (shift=[ssCtrl]) then deleterow;
end;

procedure TQuickform.Deleterow;
var
I: integer;
begin
if DirsGrid.rowcount>2 then
begin
for i:=DirsGrid.row to DirsGrid.rowcount-1 do
DirsGrid.Rows[i]:=DirsGrid.Rows[i+1];
DirsGrid.rowcount:=DirsGrid.rowcount-1;
rowdel:=true;
end;
end;

procedure TQuickform.DirsGridKeyPress(Sender: TObject; var Key: Char);
begin
if (key=chr(46)) and rowdel then
begin
key:=chr(0);
rowdel:=false;
end;
end;
procedure TQuickform.DirsGridSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
if acol=1 then
   if length(Dirsgrid.Cells[1,arow])>10 then Dirsgrid.Cells[1,arow]:=copy(Dirsgrid.Cells[1,arow],1,10);
end;
procedure TQuickform.DirsGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
Var
Rect: Trect;
begin
QDBigIcons.Visible:=False;
KindList.Visible:=False;
QDVolSel.Visible:=False;
if Acol=3 then
begin
Canselect:=false;
rect:=DirsGrid.CellRect(3,arow);
removecontrol(QDBigIcons);
insertcontrol(QDBigIcons);
QDBigIcons.Top:=rect.Top+28;
QDBigIcons.Left:=rect.left+1;
QDBigIcons.Tag:=arow;
QDBigIcons.ItemIndex:=strtoint(DirsGrid.Cells[3,arow]);
QDBigIcons.Visible:=True;
QDBigIcons.SetFocus;
end;
if Acol=4 then
begin
Canselect:=false;
rect:=DirsGrid.CellRect(4,arow);
removecontrol(KindList);
insertcontrol(KindList);
KindList.Top:=rect.Top+28;
KindList.Left:=rect.left+1;
KindList.Tag:=arow;
KindList.ItemIndex:=strtoint(DirsGrid.Cells[4,arow]);
KindList.Visible:=True;
KindList.SetFocus;
end;
if Acol=5 then
begin
Canselect:=false;
rect:=DirsGrid.CellRect(5,arow);
removecontrol(QDVolSel);
insertcontrol(QDVolSel);
QDVolSel.Top:=rect.Top+28;
QDVolSel.Left:=rect.left-160;
QDVolSel.Tag:=arow;
QDVolSel.position:=strtoint(DirsGrid.Cells[5,arow]);
QDVolSel.Visible:=True;
QDVolSel.SetFocus;
end;
if Acol=6 then
begin
Canselect:=false;
if dirsgrid.Cells[6,arow]='Yes' then dirsgrid.Cells[6,arow]:='No'
 else dirsgrid.Cells[6,arow]:='Yes';
end;
end;

procedure TQuickform.QDBigIconsSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
Dirsgrid.Cells[3,QDBigIcons.tag]:=inttostr(item.Index);
end;

procedure TQuickform.QDBigIconsDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
QDBigIcons.Canvas.FillRect(rect);
Form1.Hotimag.Draw(QDBigIcons.canvas,rect.left,rect.top,index);
QDBigIcons.Canvas.TextOut(rect.left+33,rect.top+15,QDBigIcons.Items.Strings[index]);

end;

procedure TQuickform.QDBigIconsClick(Sender: TObject);
begin
dirsgrid.Cells[3,QDBigIcons.tag]:=inttostr(QDBigIcons.ItemIndex);
end;

procedure TQuickform.DirsGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if acol=0 then
begin
case arow of
0:DirsGrid.Canvas.Brush.Color:=clTeal;
else DirsGrid.Canvas.Brush.Color:=clGray;
end;
DirsGrid.Canvas.Font.Color:=clBlack;
DirsGrid.Canvas.FillRect(rect);
DirsGrid.Canvas.TextOut(rect.left+2,rect.top+2,DirsGrid.cells[0,arow]);
end;
if (acol>0) and (arow>0) then
begin
DirsGrid.Canvas.Font.Color:=clLime;
DirsGrid.Canvas.Brush.Color:=clBlack;
DirsGrid.Canvas.FillRect(rect);
DirsGrid.Canvas.TextOut(rect.left+2,rect.top+2,DirsGrid.cells[acol,arow]);
end;
end;
procedure TQuickform.KindListDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
form1.ImageIcons.draw(KindList.canvas,rect.left+1,rect.top+1,index);
KindList.canvas.TextOut(Rect.left+18,rect.top+2,KindList.Items.Strings[index]);
end;

procedure TQuickform.KindListClick(Sender: TObject);
begin
dirsgrid.Cells[4,KindList.tag]:=inttostr(KindList.ItemIndex);
end;

procedure TQuickform.QDVolselChange(Sender: TObject);
begin
dirsgrid.Cells[5,QDVolsel.tag]:=inttostr(QDVolsel.position);
end;

end.
