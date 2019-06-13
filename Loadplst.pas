unit Loadplst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Grids, DBGrids, Db, DBTables, Buttons, ExtCtrls,
  TeEngine, Series, TeeProcs, Chart, DBChart;

type
  TLoadplstFrm = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBMemo1: TDBMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBNavigator1: TDBNavigator;
    StatChart: TDBChart;
    Series1: TBarSeries;
    StatCombo: TComboBox;
    Series2: TBarSeries;
    procedure DBMemo1Change(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure StatComboChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoadplstFrm: TLoadplstFrm;

implementation

{$R *.DFM}

procedure TLoadplstFrm.DBMemo1Change(Sender: TObject);
begin
DBmemo1.Color:=clsilver;
DBmemo1.Font.Color:=clBlack;
end;

procedure TLoadplstFrm.DBMemo1Exit(Sender: TObject);
begin
DBmemo1.Color:=clBlack;
DBmemo1.Font.Color:=clLime;
end;

procedure TLoadplstFrm.BitBtn2Click(Sender: TObject);
begin
close
end;

procedure TLoadplstFrm.StatComboChange(Sender: TObject);
begin
StatChart.SeriesList.Series[0].YValues.ValueSource:=statcombo.Text;
StatChart.Foot.Text.Clear;
StatChart.Foot.Text.Append(statcombo.Text+' Events');
end;

end.
