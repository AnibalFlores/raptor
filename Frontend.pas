unit Frontend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleCtrls, AMovie_TLB, StdCtrls, MPlayer, Grids, ExtCtrls, Menus, Shellapi, ComCtrls,
  Buttons, ThdTimer, mpgtools, ToolWin, ImgList, FileCtrl, Spin,
  MMSystem, registry, DBCtrls, DBGrids, Db, DBTables, MPEGPlay;

type
  TForm1 = class(TForm)
    canal1: TActiveMovie;
    canal2: TActiveMovie;
    Status: TStatusBar;
    Visorpopup: TPopupMenu;
    AdjustDateTime1: TMenuItem;
    N1: TMenuItem;
    Panel1: TPanel;
    Visor: TLabel;
    Label1: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Shape1: TShape;
    LCurrent: TLabel;
    LNext: TLabel;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Timer1: TThreadedTimer;
    Playmode: TPopupMenu;
    Single: TMenuItem;
    Loop1: TMenuItem;
    JumpToList1: TMenuItem;
    SingleLogged1: TMenuItem;
    Memo1: TMemo;
    OpenDlg1: TOpenDialog;
    Panel2: TPanel;
    canal3: TActiveMovie;
    canal4: TActiveMovie;
    canal5: TActiveMovie;
    canal6: TActiveMovie;
    canal7: TActiveMovie;
    canal8: TActiveMovie;
    disabimag: TImageList;
    Hotimag: TImageList;
    Panel7: TPanel;
    LAartist1: TLabel;
    LATitle1: TLabel;
    TrackBar3: TTrackBar;
    ControlsPopUp: TPopupMenu;
    PlayControls1: TMenuItem;
    PlayList1: TMenuItem;
    Browser1: TMenuItem;
    Options1: TMenuItem;
    Filer1: TMenuItem;
    InfoPanel1: TMenuItem;
    Editor1: TMenuItem;
    PlayList: TPanel;
    grilla: TStringGrid;
    Label11: TLabel;
    CoolBar1: TCoolBar;
    OptionsTbar: TToolBar;
    PlayModebtn: TToolButton;
    OnAirbtn: TToolButton;
    Scrollbtn: TToolButton;
    CountBtn: TToolButton;
    Insertbtn: TToolButton;
    Infobtn: TToolButton;
    FilerTbar: TToolBar;
    QuickLoadbtn: TToolButton;
    QuickSavebtn: TToolButton;
    ToolButton18: TToolButton;
    LoadButton: TToolButton;
    SaveButton: TToolButton;
    ToolButton19: TToolButton;
    Importbtn: TToolButton;
    Mergebtn: TToolButton;
    PlayControlsTbar: TToolBar;
    StopBtn: TToolButton;
    PauseButton: TToolButton;
    PlayButton: TToolButton;
    ToolButton4: TToolButton;
    ToolButton20: TToolButton;
    Cuemixbtn: TToolButton;
    FadeStopbtn: TToolButton;
    EditorTbar: TToolBar;
    RowUpbtn: TToolButton;
    RowDownbtn: TToolButton;
    Deleventbtn: TToolButton;
    Browserbtn: TToolButton;
    Clearbtn: TToolButton;
    Panel3: TPanel;
    LAartist2: TLabel;
    LATitle2: TLabel;
    TrackBar1: TTrackBar;
    Panel4: TPanel;
    LAartist3: TLabel;
    LATitle3: TLabel;
    TrackBar2: TTrackBar;
    Panel5: TPanel;
    LAartist4: TLabel;
    LATitle4: TLabel;
    TrackBar4: TTrackBar;
    PopQDir: TPopupMenu;
    Configure: TMenuItem;
    canal9: TActiveMovie;
    canal10: TActiveMovie;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    canal11: TActiveMovie;
    canal12: TActiveMovie;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    Panel9: TPanel;
    DirectBtn: TSpeedButton;
    ProgramBtn: TSpeedButton;
    SpeedButton33: TSpeedButton;
    PadBox: TFileListBox;
    Label17: TLabel;
    Afade: TCheckBox;
    amute: TCheckBox;
    Afadetime: TSpinEdit;
    CoolBar2: TCoolBar;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Panel6: TPanel;
    TalkLabel: TLabel;
    TalkIntro1: TMenuItem;
    FPList: TCheckBox;
    InfoTbar: TPanel;
    Artist: TLabel;
    titulo: TLabel;
    Album: TLabel;
    PadBtn01: TButton;
    PadBtn02: TButton;
    PadBtn03: TButton;
    PadBtn04: TButton;
    PadBtn05: TButton;
    PadBtn06: TButton;
    PadBtn07: TButton;
    PadBtn08: TButton;
    PadBtn09: TButton;
    PadBtn10: TButton;
    PadBtn11: TButton;
    PadBtn12: TButton;
    PadBtn13: TButton;
    PadBtn14: TButton;
    PadBtn15: TButton;
    PadBtn16: TButton;
    PadBtn17: TButton;
    PadBtn18: TButton;
    PadBtn19: TButton;
    PadBtn20: TButton;
    Balbar11: TTrackBar;
    BalBar12: TTrackBar;
    BalBar09: TTrackBar;
    BalBar10: TTrackBar;
    ABalmix: TCheckBox;
    LtoR: TRadioButton;
    RtoL: TRadioButton;
    CLipUp: TCheckBox;
    ClipDown: TCheckBox;
    LANumLabel1: TLabel;
    LANumLabel2: TLabel;
    LANumLabel3: TLabel;
    LANumLabel4: TLabel;
    DateLabel: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    TabSheet7: TTabSheet;
    PlayCtrlNimg: TImageList;
    PlayCtrlHimg: TImageList;
    CDControls: TPanel;
    MediaPlayer1: TMediaPlayer;
    TrackBar5: TTrackBar;
    CDlabel: TLabel;
    Tracknum: TLabel;
    CDvol: TLabel;
    CDTimer: TThreadedTimer;
    Panel8: TPanel;
    Label2: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    StringGrid1: TStringGrid;
    CDPlayer1: TMenuItem;
    ImageIcons: TImageList;
    CutoffSpin: TSpinEdit;
    Label36: TLabel;
    Softspin: TSpinEdit;
    NormalSpin: TSpinEdit;
    Label37: TLabel;
    HighSpin: TSpinEdit;
    Label38: TLabel;
    DIntroSpin: TSpinEdit;
    Label39: TLabel;
    DOutroSpin: TSpinEdit;
    Label40: TLabel;
    Padedit: TEdit;
    Label41: TLabel;
    HourEdit: TEdit;
    Label42: TLabel;
    Label43: TLabel;
    Playlistedit: TEdit;
    ApplyBtn: TButton;
    Label44: TLabel;
    CDLineSpin: TSpinEdit;
    TabSheet8: TTabSheet;
    TimeTalkbtn: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    Typepopup: TPopupMenu;
    Music1: TMenuItem;
    Commercial1: TMenuItem;
    Off1: TMenuItem;
    Jingle1: TMenuItem;
    News1: TMenuItem;
    Announce1: TMenuItem;
    Program1: TMenuItem;
    Record1: TMenuItem;
    LiveMusic1: TMenuItem;
    Comment1: TMenuItem;
    Catalog1: TMenuItem;
    LAControls1: TToolBar;
    LaStopBtn1: TToolButton;
    LaPauseBtn1: TToolButton;
    LAplaybtn1: TToolButton;
    LARewBtn1: TToolButton;
    LaControls2: TToolBar;
    LaStopBtn2: TToolButton;
    LaPauseBtn2: TToolButton;
    LAplaybtn2: TToolButton;
    LARewBtn2: TToolButton;
    LaControls3: TToolBar;
    LAplaybtn3: TToolButton;
    LaStopBtn3: TToolButton;
    LaPauseBtn3: TToolButton;
    LARewBtn3: TToolButton;
    LaControls4: TToolBar;
    LAplaybtn4: TToolButton;
    LaStopBtn4: TToolButton;
    LaPauseBtn4: TToolButton;
    LARewBtn4: TToolButton;
    Browser: TPanel;
    FileListBox1: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    PageScroller1: TPageScroller;
    DirectBar: TToolBar;
    ToolButton1: TToolButton;
    FilterSupport: TFilterComboBox;
    ToolBar1: TToolBar;
    TypeToolBtn: TToolButton;
    ToolButton6: TToolButton;
    SoftToolBtn: TToolButton;
    NormalToolBtn: TToolButton;
    HighToolBtn: TToolButton;
    CustomToolBtn: TToolButton;
    CustomVolspin: TSpinEdit;
    NoMixToolBtn: TToolButton;
    BrwTitleLabel: TLabel;
    BrwArtistLabel: TLabel;
    TagInfoTool: TToolButton;
    TabSheet9: TTabSheet;
    MonthCalendar1: TMonthCalendar;
    TabSheet10: TTabSheet;
    Panel10: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    StringGrid2: TStringGrid;
    ListBox1: TListBox;
    Label9: TLabel;
    Edit1: TEdit;
    Label10: TLabel;
    GroupBox1: TGroupBox;
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    Label22: TLabel;
    ArtistsTable: TTable;
    SongsTable: TTable;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Button2: TButton;
    ImageFiler: TImageList;
    ImageEditor: TImageList;
    ImageOption: TImageList;
    CoolBar3: TCoolBar;
    ToolBar2: TToolBar;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolBar3: TToolBar;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolBar4: TToolBar;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ToolBar5: TToolBar;
    ToolButton28: TToolButton;
    ToolButton29: TToolButton;
    ToolButton30: TToolButton;
    ToolButton31: TToolButton;
    ToolButton32: TToolButton;
    Panel11: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    CueBrwBtn: TToolButton;
    MPEGPlayer: TMPEGPlayer;
    ComboBox1: TComboBox;
    TrackBar6: TTrackBar;
    OnAirVolabel: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TotalTimes;
    procedure PonerFecha;
    procedure ColocaOptions;
    procedure EventStatus;
    procedure LoopStatus;
    procedure Proximo;
    procedure Follow;
    procedure MixerCDLInStart;
    procedure MixerCDLInClose;
    procedure QuickSaveBtnClick(Sender: TObject);
    procedure Insertafilas(filas: integer);
    procedure Cargar1(fila: integer);
    procedure Cargar2(fila: integer);
    procedure CargaPunch(fila,canal: integer);
    procedure CargarHoras(Fila,Canal: integer);
    procedure CargaCDaudio(Fname:string);
    procedure AdjustDateTime1Click(Sender: TObject);
    procedure Label1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure VisorClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure LocalizaCD;
    procedure LoadListBox(const FName: string);
    procedure AppMessage(var Msg: Tmsg; var Handled: Boolean);
    procedure Catalogar(const FName: string);
    procedure Infocarga9(FName: string);
    procedure Infocarga10(FName: string);
    procedure Infocarga11(FName: string);
    procedure Infocarga12(FName: string);
    procedure enumerar(desde: integer);
    procedure canal1Timer(Sender: TObject);
    procedure canal2Timer(Sender: TObject);
    procedure grillaDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure grillaDblClick(Sender: TObject);
    procedure CountBtnClick(Sender: TObject);
    procedure Loop1Click(Sender: TObject);
    procedure SingleLogged1Click(Sender: TObject);
    procedure SingleClick(Sender: TObject);
    procedure JumpToList1Click(Sender: TObject);
    procedure DeleventbtnClick(Sender: TObject);
    procedure grillaRowMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure ScrollbtnClick(Sender: TObject);
    procedure CuemixbtnClick(Sender: TObject);
    procedure grillaClick(Sender: TObject);
    procedure ImportbtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OnAirbtnClick(Sender: TObject);
    procedure RowUpbtnClick(Sender: TObject);
    procedure RowDownbtnClick(Sender: TObject);
    procedure InsertbtnClick(Sender: TObject);
    procedure ClearbtnClick(Sender: TObject);
    procedure InfobtnClick(Sender: TObject);
    procedure MergebtnClick(Sender: TObject);
    procedure grillaDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FileListBox1StartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure grillaDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FileListBox1DblClick(Sender: TObject);
    procedure TimeTalkbtnClick(Sender: TObject);
    procedure canal3StateChange(Sender: TObject; oldState,
      newState: Integer);
    procedure canal5StateChange(Sender: TObject; oldState,
      newState: Integer);
    procedure canal6StateChange(Sender: TObject; oldState,
      newState: Integer);
    procedure canal7StateChange(Sender: TObject; oldState,
      newState: Integer);
    procedure canal8StateChange(Sender: TObject; oldState,
      newState: Integer);
    procedure ControlsPopUpPopup(Sender: TObject);
    procedure PlayControls1Click(Sender: TObject);
    procedure ControlsPopUpCambio;
    procedure QuickLoadBtnClick(Sender: TObject);
    procedure PlayList1Click(Sender: TObject);
    procedure Browser1Click(Sender: TObject);
    procedure Options1Click(Sender: TObject);
    procedure Filer1Click(Sender: TObject);
    procedure InfoPanel1Click(Sender: TObject);
    procedure Editor1Click(Sender: TObject);
    procedure grillaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton33Click(Sender: TObject);
    procedure DirectBarDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure DirectBarDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ConfigureClick(Sender: TObject);
    procedure DirectBarClick(Sender: TObject);
    procedure DirectBtnClick(Sender: TObject);
    procedure PadPlay1(fila: integer);
    procedure PadPlay2(fila: integer);
    procedure PadPlay3(fila: integer);
    procedure PadPlay4(fila: integer);
    procedure PadBtn01Click(Sender: TObject);
    procedure PadBtn02Click(Sender: TObject);
    procedure PadBtn03Click(Sender: TObject);
    procedure PadBtn04Click(Sender: TObject);
    procedure PadBtn05Click(Sender: TObject);
    procedure PadBtn06Click(Sender: TObject);
    procedure PadBtn07Click(Sender: TObject);
    procedure PadBtn08Click(Sender: TObject);
    procedure PadBtn09Click(Sender: TObject);
    procedure PadBtn10Click(Sender: TObject);
    procedure PadBtn11Click(Sender: TObject);
    procedure PadBtn12Click(Sender: TObject);
    procedure PadBtn13Click(Sender: TObject);
    procedure PadBtn14Click(Sender: TObject);
    procedure PadBtn15Click(Sender: TObject);
    procedure PadBtn16Click(Sender: TObject);
    procedure PadBtn17Click(Sender: TObject);
    procedure PadBtn18Click(Sender: TObject);
    procedure PadBtn19Click(Sender: TObject);
    procedure PadBtn20Click(Sender: TObject);
    procedure PadBoxClick(Sender: TObject);
    procedure LAplaybtn3Click(Sender: TObject);
    procedure LAplaybtn4Click(Sender: TObject);
    procedure LaPauseBtn4Click(Sender: TObject);
    procedure LaPauseBtn3Click(Sender: TObject);
    procedure TrackBar4Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure LaStopBtn1Click(Sender: TObject);
    procedure LaStopBtn2Click(Sender: TObject);
    procedure LaStopBtn3Click(Sender: TObject);
    procedure LaStopBtn4Click(Sender: TObject);
    procedure LAplaybtn1Click(Sender: TObject);
    procedure LAplaybtn2Click(Sender: TObject);
    procedure LaPauseBtn1Click(Sender: TObject);
    procedure LaPauseBtn2Click(Sender: TObject);
    procedure canal9Timer(Sender: TObject);
    procedure canal10Timer(Sender: TObject);
    procedure canal11Timer(Sender: TObject);
    procedure canal12Timer(Sender: TObject);
    procedure LARewBtn1Click(Sender: TObject);
    procedure LARewBtn2Click(Sender: TObject);
    procedure LARewBtn3Click(Sender: TObject);
    procedure LARewBtn4Click(Sender: TObject);
    procedure Panel7DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Panel7DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Panel3DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Panel4DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Panel5DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Panel3DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Panel4DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Panel5DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FadeStopbtnClick(Sender: TObject);
    procedure canal9StateChange(Sender: TObject; oldState,
      newState: Integer);
    procedure canal10StateChange(Sender: TObject; oldState,
      newState: Integer);
    procedure canal11StateChange(Sender: TObject; oldState,
      newState: Integer);
    procedure canal12StateChange(Sender: TObject; oldState,
      newState: Integer);
    procedure Label19Click(Sender: TObject);
    procedure Label18Click(Sender: TObject);
    procedure Label20Click(Sender: TObject);
    procedure Label21Click(Sender: TObject);
    procedure TalkIntro1Click(Sender: TObject);
    procedure FPListClick(Sender: TObject);
    procedure PadBtn01MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ProgramBtnClick(Sender: TObject);
    procedure PadBtn01DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure PadBtn01DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure grillaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormActivate(Sender: TObject);
    procedure Balbar11Change(Sender: TObject);
    procedure Balbar11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BalBar12Change(Sender: TObject);
    procedure BalBar09Change(Sender: TObject);
    procedure BalBar10Change(Sender: TObject);
    procedure BalBar12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BalBar09KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BalBar10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ABalmixClick(Sender: TObject);
    procedure AfadeClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure canal4OpenComplete(Sender: TObject);
    procedure TrackBar5Change(Sender: TObject);
    procedure CDControlsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure CDControlsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure CDTimerTimer(Sender: TObject);
    procedure MediaPlayer1Notify(Sender: TObject);
    procedure MediaPlayer1Click(Sender: TObject; Button: TMPBtnType;
      var DoDefault: Boolean);
    procedure CDvolClick(Sender: TObject);
    procedure MediaPlayer1PostClick(Sender: TObject; Button: TMPBtnType);
    procedure CDPlayer1Click(Sender: TObject);
    procedure ApplyBtnClick(Sender: TObject);
    procedure FilterSupportChange(Sender: TObject);
    procedure SoftToolBtnClick(Sender: TObject);
    procedure NormalToolBtnClick(Sender: TObject);
    procedure HighToolBtnClick(Sender: TObject);
    procedure CustomToolBtnClick(Sender: TObject);
    procedure PlayButtonClick(Sender: TObject);
    procedure StopBtnClick(Sender: TObject);
    procedure Music1Click(Sender: TObject);
    procedure CLipUpClick(Sender: TObject);
    procedure ClipDownClick(Sender: TObject);
    procedure FileListBox1Change(Sender: TObject);
    procedure TagInfoToolClick(Sender: TObject);
    procedure CueBrwBtnClick(Sender: TObject);
    procedure MPEGPlayerOpenStream(var Nonseekable: Boolean;
      var Context: Pointer);
    procedure MPEGPlayerCloseStream(Context: Pointer);
    procedure MPEGPlayerRestartStream(Context: Pointer; var res: Boolean);
    procedure MPEGPlayerSeekStream(Context: Pointer; numbytes,
      MoveMethod: Integer; var res: Integer);
    procedure MPEGPlayerGetStreamSize(Context: Pointer; var res: Integer);
    procedure ComboBox1Change(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);
    procedure TrackBar6Change(Sender: TObject);
  private
    { Private declarations }
  public
    {res: pointer;}
    hourdir: string;
    {Checkplay es True cuando un canal activa al otro
     (Outro rebasado) }
    CDFlag, Talkflag, timeanoun, cataloged, checkplay, pause, fadein1,
    fadein2, fadeout1, fadeout2,
    Fade9, Fade10, Fade11, Fade12, FadeCD: boolean;
    { Vars parametricas del manejo de volumen
    (enteros entre -10000 y 0) en fader }
    listo4,inc1, inc2, dectfade, declivefade9,declivefade10,
    declivefade11,declivefade12,declivefadecd, dec1, dec2, dfltsoft,
    dfltmaximo, paso1, paso2, piso,
    dflttecho,Selectecho, techo1, techo2,
    {Vars de control de lista y canal en play}
    player, puntero, siguiente, Punchan, Punching1,Punching2,
    {Vars de control de tiempo para fades}
    TimFI1,TimFI2,TimFO1,TimFO2,Punch,Punchpos1,Punchpos2,
    decbal9,decbal10,decbal11,decbal12,
    incbal9,incbal10,incbal11,incbal12,Device,NumDevs: integer;
    {Vars de control de intros y outros}
    TalkTime1, TalkTime2, intro1, intro2, outro1,
    outro2: double;
    {Vars de intro y outro por defecto}
    dfltIntro, dfltOutro: integer;
    { Public declarations }
  end;

var
  Form1: TForm1;
  Cat: TMPEGAudio;
implementation
uses editfor, PadsUnit, Quickdir, Timeannou, Loadplst;
type
   TVolumeType = record
    case Integer of
    0: (LongVolume: Longint);
    1: (LeftVolume,
        RightVolume : Word);
    end;
   TMSFRec = record
    Track: byte;
    Minutes: byte;
    Seconds: byte;
    Frame: byte;
    end;
var
    hMx: HMIXER;
    MxId: UINT;
    mlMixerLine: TMIXERLINE;
    mlcMixerLineControls: TMIXERLINECONTROLS;
    pmcMixerControl: PMIXERCONTROL;
    mcdMixerData: TMIXERCONTROLDETAILS;
    pmcdsMixerDataSigned: PMIXERCONTROLDETAILSSIGNED;
{$R *.DFM}
procedure TForm1.MixerCDLInStart;
Var
ivol: TVolumetype;
pmcdsVol: PMIXERCONTROLDETAILSSIGNED;
begin
cdflag:=false;
NumDevs:=waveOutGetNumDevs;
 begin
     if NumDevs<1 then begin
       ShowMessage('No Wave Devices to open');
       exit;
       end;

     if mixerGetID(0, MxId, MIXER_OBJECTF_AUX)<>MMSYSERR_NOERROR then
     begin
     {ShowMessage('Unable to get mixer ID');}
     exit;
     end;

     if mixerOpen(@hMx, MxId, 0, 0,MIXER_OBJECTF_AUX)<>MMSYSERR_NOERROR then begin
     {ShowMessage('Undefined mixer error');}
     exit;
     end;

  with mlMixerLine do begin
       cbStruct:=SizeOf(TMIXERLINE);
       dwComponentType:=MIXERLINE_COMPONENTTYPE_SRC_COMPACTDISC;
       end;
     if mixerGetLineInfo(hMx, @mlMixerLine,MIXER_GETLINEINFOF_COMPONENTTYPE)<>MMSYSERR_NOERROR then begin
     {ShowMessage('Cannot get mixer line info');}
       exit;
     end;

     GetMem(pmcMixerControl, SizeOf(TMIXERCONTROL));
  with mlcMixerLineControls do begin
       cbStruct:=SizeOf(TMIXERLINECONTROLS);
       dwLineID:=mlMixerLine.dwLineID;
       dwControlType:=MIXERCONTROL_CONTROLTYPE_VOLUME;
       cControls:=1;
       cbmxctrl:=SizeOf(TMIXERCONTROL);
       pamxctrl:=pmcMixerControl;
     end;
 if mixerGetLineControls(hMx, @mlcMixerLineControls,MIXER_GETLINECONTROLSF_ONEBYTYPE)<>MMSYSERR_NOERROR then begin
     {ShowMessage('Unable to get line controls.');}
       exit;
     end;

 GetMem(pmcdsMixerDataSigned, 2*SizeOf(TMIXERCONTROLDETAILSSIGNED));
     with mcdMixerData do begin
       cbStruct:=SizeOf(TMIXERCONTROLDETAILS);
       dwControlID:=pmcMixerControl^.dwControlID;
       cChannels:=mlMixerLine.cChannels;
       cMultipleItems:=0;
       cbDetails:=SizeOf(TMIXERCONTROLDETAILSSIGNED);
       paDetails:=pmcdsMixerDataSigned;
     end;
If mixerGetControlDetails(hMX,@mcdMixerData,MIXER_GETCONTROLDETAILSF_VALUE)<>MMSYSERR_NOERROR then begin
{showmessage('Unable to read mixer device');}
exit;
end
else
begin
pmcdsVol:=pmcdsMixerDataSigned;
iVol.LeftVolume:=pmcdsvol.lValue ;
inc(pmcdsVol);
iVol.RightVolume:=pmcdsvol.lValue;
Trackbar5.position :=(ivol.RightVolume+ ivol.LeftVolume) shr 9;
trackbar5.Enabled:=True;
cdflag:=true;
end;
end;
end;

procedure TForm1.MixerCDLInClose;
begin
Freemem(pmcMixerControl);
Freemem(pmcdsMixerDataSigned);
If MixerClose(hMx)<>MMSYSERR_NOERROR then begin
ShowMessage('Warning!!! Unable to Close mixer wave device');
exit ;
end;
trackbar5.Enabled:=False;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
Var
Habla, segundos, minutos:integer;
Talktime, position, final: double;

begin
{ Actualizar Reloj }
ponerfecha;
label1.Caption:=timetostr(time);
If Stopbtn.Down then Visor.Caption:='STOP'
else
BEGIN
{ Mostrar Tiempo del tema en curso }
if player = 1 then
   begin
   if Panel6.Visible then Talktime:=Talktime1;
   position:=canal1.CurrentPosition;
   final:=canal1.SelectionEnd;
   end
else
    begin
    if Panel6.Visible then Talktime:=Talktime2;
    position:=canal2.CurrentPosition;
    final:=canal2.SelectionEnd;
    end;
{ Verifica Countdown }
If Countbtn.Down then segundos:=trunc(final-Position)
 else segundos:=trunc(Position);
 minutos:= segundos div 60;
 segundos:= segundos mod 60;
If Countbtn.Down then Visor.Caption:=format('-%.2d:%.2d',[minutos,segundos])
 else Visor.Caption:=format(' %.2d:%.2d',[minutos,segundos]);
{**** TALK INTRO ****}
if panel6.Visible then
Begin
If Talkflag and (Talktime>0) then
begin
habla:=trunc(TalkTime-Position);
If habla <= 0 then TalkFlag:=False;
TalkLabel.Caption:=format('-%2.1f',[TalkTime-Position])
end
else Talklabel.Caption:='-0,0';
end;

END;

{********** Controlar Si Corresponde Activar rutinas de Fades *********}


if (player = 1) and Not(FadeStopbtn.Down) then
BEGIN
   begin
    if canal1.CurrentPosition > TimFO1/10 then Fadeout1:=True
     else Fadeout1:= False;
    if canal1.CurrentPosition < TimFI1/10 then FadeIn1:= True
     else FadeIn1:= False;
{********* Control de Intro y Outro ***************

 Si Checkplay es verdadero y se rebasa el intro que permite
 el canal activo entonces se cierra en otro automaticamente

 Si Checkplay es falso y se rebasa el outro del canal activo
 entonces se dispara el otro se pasa checkplay a verdadero
 y marcamos el siguiente paso de la lista }
if checkplay and (canal1.CurrentPosition > intro1/10)
    and Not(FadeStopbtn.Down) then
    begin
    canal2.Volume:=piso;
    cargar2(siguiente);
    canal2.AutoStart:=False;
    checkplay:=False;
    end;
if not(checkplay) and (canal1.CurrentPosition >= outro1/10) then
   begin
    if pausebutton.Down then exit
     else
    begin
     checkplay:=True;
     canal2.AutoStart:=True;
     canal2.Run;
     player:=2;
     TalkFlag:=true;
     proximo;
    end;
   end;
 end;
END;

if (player = 2) and Not(FadeStopbtn.Down) then
BEGIN
{********** Controlar Si Corresponde Activar rutinas de Fades *********}
  begin
    if canal2.CurrentPosition > TimFO2/10 then Fadeout2:=True
     else Fadeout2:= False;
    if canal2.CurrentPosition < TimFI2/10 then FadeIn2:= True
     else FadeIn2:= False;
  end;
{********* Control de Intro y Outro ***************

 Si Checkplay es verdadero y se rebasa el intro que permite
 el canal activo entonces se cierra el otro automaticamente

 Si Checkplay es falso y se rebasa el outro del canal activo
 entonces se dispara el otro se pasa checkplay a verdadero
 y marcamos el siguiente paso de la lista }
if checkplay and (canal2.CurrentPosition > intro2/10)
 and Not(FadeStopbtn.Down) then
    begin
    canal1.Volume:=piso;
    cargar1(siguiente);
    canal1.AutoStart:=False;
    checkplay:=False;
    end;
if not(checkplay) and (canal2.CurrentPosition >= outro2/10) then
   begin
    if pausebutton.Down then exit
    else
    begin
    checkplay:=True;
    canal1.AutoStart:=True;
    canal1.Run;
    proximo;
    player:=1;
    TalkFlag:=true;
    end;
   end;
END;
end;


procedure TForm1.FormCreate(Sender: TObject);
var
fila: integer;
begin
mpegplayer.Init;
 DragAcceptFiles(Form1.Handle, true);
 DragAcceptFiles(Application.Handle, true);
 Application.OnMessage := AppMessage;
colocaoptions;
Selectecho:=dflttecho;
timeanoun:=false;
techo1:=dflttecho;
techo2:=dflttecho;
paso2:=techo2-piso;//Valor a calcular para distinta velocidad de fades
paso1:=techo1-piso;
puntero:=0;// banda roja en fila cero
siguiente:=1;// banda azul en fila uno
grilla.cells[19,1]:='sg';
grilla.cells[19,0]:='Pt';
grilla.Row:=2;//banda amarilla en fila dos
checkplay:=True; {Marca el cambio entre canal 1 y 2 (true=mixing)}
pause:=False;// pausa desactivada
player:=1;// canal inicial uno
for fila:=0 to grilla.RowCount-1 do //Numerar los eventos
grilla.Cells[0,fila]:=format('%.5d',[fila+1]);//Formato 00001,00002...
QuickLoadBtnClick(sender);// Cargar ultima lista grabada
end;

procedure TForm1.ColocaOptions;
Begin
piso:=CutOffspin.Value;//Volumen minimo
dfltmaximo:=HighSpin.Value;//Volumen Publicidad
dflttecho:=NormalSpin.Value;//Volumen maximo (- 10000 a 0)
dfltsoft:=SoftSpin.Value;//Volumen Bases
hourdir:=Houredit.Text;
Padbox.Directory:=ExtractFilePath(PadEdit.Text);
Padbox.FileName:=PadEdit.Text;
dfltIntro:=DIntroSpin.Value;// Valor de Intro por defecto (decimas)
dfltOutro:=DOutroSpin.Value;// Valor de Outro por defecto (decimas)
TrackBar1.Min:=piso;
TrackBar2.Min:=piso;
TrackBar3.Min:=piso;
TrackBar4.Min:=piso;
end;

procedure TForm1.totaltimes;
var
 i: integer;
duration: TTime;
begin
grilla.Cells[4,grilla.row]:=timetostr(time);
duration:=strtotime(grilla.cells[3,0]);
for i:=grilla.row+1 to grilla.RowCount-1 do
begin
grilla.Cells[4,i]:=timetostr(strtotime(grilla.cells[4,i-1])+ strtotime('00:'+grilla.cells[3,i]));
duration:=duration+strtotime('00:'+ grilla.cells[3,i]);
end;
status.SimpleText:='Total Time:'+ timetostr(duration) +' End: '+ grilla.cells[4,grilla.RowCount-1];
end;

procedure TForm1.AdjustDateTime1Click(Sender: TObject);
begin
if shellexecute(getdesktopwindow(),nil,'C:\windows\control','TIMEDATE.CPL',nil,0)>32 then
ponerfecha;
end;

procedure TForm1.Label1DblClick(Sender: TObject);
begin
 AdjustDateTime1Click(sender);
end;

procedure TForm1.Cargar1(fila: integer);
VAR
tipo: integer;
BEGIN
tipo:=strtoint(grilla.cells[1,fila]);
If tipo=15 Then cargarhoras(fila,1);
if (tipo<11) or (tipo=15) Then
begin
TimFI1:=strtoint(grilla.cells[5,fila]);
TimFO1:=strtoint(grilla.cells[6,fila]);
Intro1:=strtoint(grilla.cells[7,fila]);
Outro1:=strtoint(grilla.cells[8,fila]);
techo1:=strtoint(grilla.cells[11,fila]);
TalkTime1:=strtoint(grilla.cells[14,fila]);
TalkFlag:=True;
paso1:=techo1-piso;
dec1:= paso1 div TimFO1;
if TimFI1 = 0 then canal1.Volume:=techo1 else
  begin
  canal1.Volume:=piso;
  inc1:= paso1 div TimFI1;
  end;
canal1.FileName:=grilla.Cells[9,fila];
if OnairBtn.Down then Cuemixbtn.Down:=false;
if  strtoint(grilla.cells[12,fila])>0 then
canal1.SelectionStart:=strtoint(grilla.cells[12,fila])/10
else canal1.SelectionStart:=-1;
if strtoint(grilla.cells[13,fila])<strtoint(grilla.cells[10,fila]) then
canal1.SelectionEnd:=strtoint(grilla.cells[13,fila])/10
else canal1.SelectionEnd:=-1;
canal1.pause;
if (strtoint(grilla.cells[15,fila])>-1)and (tipo<11) then cargapunch(fila,1);
end;
END;

procedure TForm1.Cargar2(fila: integer);
VAR
tipo: integer;
BEGIN
tipo:=strtoint(grilla.cells[1,fila]);
If tipo=15 Then cargarhoras(fila,2);
if (tipo<11) or (tipo=15) Then
begin
TimFI2:=strtoint(grilla.cells[5,fila]);
TimFO2:=strtoint(grilla.cells[6,fila]);
Intro2:=strtoint(grilla.cells[7,fila]);
Outro2:=strtoint(grilla.cells[8,fila]);
techo2:=strtoint(grilla.cells[11,fila]);
TalkTime2:=strtoint(grilla.cells[14,fila]);
TalkFlag:=True;
paso2:=techo2-piso;
dec2:= paso2 div TimFO2;
if TimFI2 = 0 then canal2.Volume:=techo2 else
 begin
 canal2.Volume:=piso;
 inc2:= paso2 div TimFI2;
 end;
canal2.FileName:=grilla.Cells[9,fila];
if OnairBtn.Down then Cuemixbtn.Down:=false;
if  strtoint(grilla.cells[12,fila])>0 then
canal2.SelectionStart:=strtoint(grilla.cells[12,fila])/10
else canal2.SelectionStart:=-1;
if strtoint(grilla.cells[13,fila])<strtoint(grilla.cells[10,fila]) then
canal2.SelectionEnd:=strtoint(grilla.cells[13,fila])/10
else canal2.SelectionEnd:=-1;
canal2.pause;
if (strtoint(grilla.cells[15,fila])>-1)and (tipo<11) then cargapunch(fila,2);
end;
END;

procedure TForm1.PlayButtonClick(Sender: TObject);
begin
If not(PlayButton.Down) Then PlayButton.Down:=true
 else
BEGIN
if player = 0 then player:= 1;
if player = 1 then
 begin
 cargar1(puntero);
 cargar2(siguiente);
 canal1.AutoStart:=True;
 canal1.Run;
 Trackbar6.Position:=Techo1;
 end;
if player = 2 then
 begin
 cargar2(puntero);
 cargar1(siguiente);
 canal2.AutoStart:=True;
 canal2.Run;
 Trackbar6.Position:=Techo2;
 end;
totaltimes;
FPList.Checked:=False;
{Playbutton.Enabled:= False;}
FadeStopBtn.Enabled:=True;
Pausebutton.Enabled:= True;
stopbtn.down:=False;
stopbtn.Enabled:=true;
pause:=False;
eventstatus;
END;
end;



procedure TForm1.Proximo;
begin
grilla.cells[19,puntero]:='';
grilla.cells[19,siguiente]:='Pt';
puntero:=siguiente;
if siguiente < grilla.RowCount-1 then siguiente:= siguiente+1 else LoopStatus;
grilla.cells[19,siguiente]:='Sg';
Eventstatus;
If scrollbtn.Down then grilla.TopRow:= puntero;
grilla.Repaint;
end;

procedure TForm1.LoopStatus;
begin
if PlayModebtn.ImageIndex=10 then siguiente:=0 else siguiente:=-1;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
{if player =1 then
   begin
   if pause then canal1.run else canal1.Pause;
   pause:= not(pause);
   end;
if player =2 then
   begin
   if pause then canal2.run else canal2.Pause;
   pause:= not(pause);
   end;
if pausebutton.Down then pause:=True
   else pause:=False;}
end;

procedure TForm1.StopBtnClick(Sender: TObject);
begin
If not(Stopbtn.Down) Then Stopbtn.Down:=true
else
Begin
canal1.Pause;
canal2.Pause;
canal3.FileName:='';//Cerrar todos los dispositivos
canal4.FileName:='';
canal5.FileName:='';
canal6.FileName:='';
canal7.FileName:='';
canal8.FileName:='';
canal1.AutoStart:=False;
canal2.AutoStart:=False;
checkplay:=False;
player:=0;
TalkFlag:=False;
Pausebutton.Down:=False;
{Stopbtn.Enabled:=False;}
{Playbutton.Enabled:= True;}
Playbutton.Down:=False;
FadeStopBtn.Down:=False;
FadeStopBtn.Enabled:=False;
Pausebutton.Enabled:= False;
eventstatus;
end;
end;

procedure TForm1.VisorClick(Sender: TObject);
begin
Countbtn.Down:=not(Countbtn.Down);
CountbtnClick(Visor);
end;

procedure TForm1.CountBtnClick(Sender: TObject);
begin
If Countbtn.Down then countbtn.ImageIndex:=8
 else countbtn.ImageIndex:=9;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
if puntero <> grilla.row then
begin
grilla.cells[19,siguiente]:='';
if grilla.cells[1,siguiente]='15' then
  begin
   canal3.FileName:='';
   canal5.FileName:='';
   canal6.FileName:='';
  end;
if grilla.cells[15,siguiente]<>'-1' then
 if player=1 then canal8.FileName:='' else canal7.FileName:='';
siguiente:= grilla.row;
grilla.cells[19,siguiente]:='Sg';
end;
if stopbtn.Down then proximo;
if player = 1 then cargar2(siguiente) else cargar1(siguiente);
eventstatus;
grilla.Repaint;
end;

procedure TForm1.Eventstatus;
begin
if stopbtn.Down then
begin
lcurrent.Caption:='On Air: ----';
lnext.Caption:= 'Next: ' + format('%.5d',[puntero+1])+ ' ' + grilla.Cells[2,puntero];
Visor.Caption:='STOP';
end
else
begin
lcurrent.Caption:='On Air: ' + format('%.5d',[puntero+1])+ ' ' + grilla.Cells[2,puntero];
lnext.Caption:= 'Next: ' + format('%.5d',[siguiente+1])+ ' ' + grilla.Cells[2,siguiente];
end;

end;

procedure TForm1.AppMessage(var Msg: Tmsg; var Handled: Boolean);
const
    BufferLength : word = 255;
var
    DroppedFilename : string;
    FileIndex : dword;
    QtyDroppedFiles : word;
    pDroppedFilename : array [0..255] of Char;
    DroppedFileLength : word;
begin
  if Msg.Message = WM_DROPFILES then
  begin
    FileIndex := $FFFFFFFF;
    QtyDroppedFiles := DragQueryFile(Msg.WParam, FileIndex,
                                     pDroppedFilename, BufferLength);
    {Drops1.Caption := 'Elementos Tirados: ' + IntToStr(QtyDroppedFiles);}

    if QtyDroppedFiles > 9999 then QtyDroppedFiles:=9999;
    if insertbtn.Down then insertafilas(QtyDroppedFiles);
    for FileIndex := 0 to (QtyDroppedFiles-1) do
    begin
      DroppedFileLength := DragQueryFile(Msg.WParam, FileIndex,
                                         pDroppedFilename, BufferLength);
      DroppedFilename := StrPas(pDroppedFilename);
      LoadListBox(uppercase(DroppedFilename));
    end;
    grilla.rowcount:=grilla.rowcount-1;
    enumerar(0);
    DragFinish(Msg.WParam);
    Handled := true;
  end;
end;

procedure TForm1.LoadListBox(const FName: string);
begin
  uppercase(fname);
  if (Pos('.MP2', FName) > 0) or (Pos('.MP3', FName) > 0) or (Pos('.WAV', FName)> 0)  then
  begin
  if not FileExists(FName) then
    MessageDlg(FName + #10 + 'No es archivo válido.', mtError, [mbOK] , 0)
  else
    Catalogar(Fname);
    if grilla.row = grilla.rowcount-1 then
    grilla.RowCount:=grilla.RowCount+1;
    grilla.row:=grilla.row+1;
  end
  else
  MessageDlg(FName + #10 + 'No es un archivo mp3/mp2 o Wav', mtError, [mbOK] , 0);
end;

procedure TForm1.Catalogar(const FName: string);
var
DriveIndex,minutos,duration, segundos: integer;
begin
cataloged:=True;
uppercase(FName);
if Pos('.WAV', FName)=0 then
begin
cat:=TMpegAudio.Create;
cat.FileDetectionPrecision:=85;
cat.FileName:=FName;
segundos:=cat.Duration;
duration:=segundos*10;
minutos:= segundos div 60;
grilla.Cells[2,grilla.row]:= cat.Title;//Name
cat.Free;
if Pos('.MP3', FName)>0 then grilla.cells[20,grilla.row]:='23';
if Pos('.MP2', FName)>0 then grilla.cells[20,grilla.row]:='24';
if Pos('.MPA', FName)>0 then grilla.cells[20,grilla.row]:='26';
cataloged:= False;
end
else
begin
canal4.AutoStart:=False;
canal4.FileName:=FName;
listo4:=grilla.row;
segundos:=trunc(canal4.duration);
duration:=segundos*10;
minutos:= segundos div 60;
grilla.Cells[2,grilla.row]:=extractfilename(lowercase(Fname));//Name
grilla.cells[20,grilla.row]:='28';
end;
with grilla do
begin
Cells[0,row]:= format('%.5d',[row+1]);//Evento
Cells[1,row]:=inttostr(TypeToolBtn.imageindex);//Type
Cells[3,row]:=format('%.2d:%.2d',[minutos,segundos mod 60]);//Duration xx:xx
Cells[4,row]:='00:00';//On Air xx:xx:xx
Cells[5,row]:='0';//Fade In (en decimas)
Cells[6,row]:=inttostr(duration);//Fade Out (en decimas)
if duration>100 then //es la duración minima?
begin
Cells[7,row]:=inttostr(dfltIntro);// Intro (en decimas)
if NoMixToolBtn.Down then Cells[8,row]:=inttostr(duration)
 else
  Cells[8,row]:=inttostr(duration - dfltOutro);//Outro (en decimas)
end
 else
 begin
 Cells[7,row]:='0';// Intro = cero
 Cells[8,row]:=inttostr(duration);//Outro = end
 end;
Cells[9,row]:= Fname;//Path completo
Cells[10,row]:=inttostr(duration);//Duracion en decimas
Cells[11,row]:=inttostr(Selectecho);//Volumen
Cells[12,row]:='0';//Start en decimas
Cells[13,row]:=inttostr(duration);// End en decimas
Cells[14,row]:='0';//Talk Intro en decimas.
Cells[15,row]:='-1';//No Punch
Cells[16,row]:=' ';//No filepunch
Cells[17,row]:='0';//Punch Volume
case GetDriveType(PChar(copy(ExtractFilePath(FName),1,3))) of
  DRIVE_REMOVABLE:
        DriveIndex := 29;
  DRIVE_FIXED:
        DriveIndex := 29;
  DRIVE_CDROM:
        DriveIndex := 30;
  DRIVE_RAMDISK:
        DriveIndex := 32;
  DRIVE_REMOTE:
        DriveIndex := 31;
end;
Cells[18,row]:=inttostr(DriveIndex);//Origen del archivo
end;
status.SimpleText:='';
end;

{* * *  Control de Fades * * *}

procedure TForm1.canal1Timer(Sender: TObject);
begin
{ Controla Pinchada de Tema }
if  punching1=1 then
 begin
   if  canal1.CurrentPosition > Punchpos1/10
    then
    begin
    canal7.Run;
    punching1:=0;
    end;
 end;
{ Controla Pinchada de base }
if  timeanoun and (punchan=1) then
 begin
   if  canal1.CurrentPosition > Punch/10
    then canal6.Run;
 end;
{ Controla Fade In canal1 }
if FadeIN1 then
begin
 canal1.Volume:=canal1.Volume + inc1;
 if canal1.Volume >= techo1 then canal1.Volume := techo1;
end;
{ Controla Fade Out canal1 }
if Fadeout1 then
begin
canal1.Volume:=canal1.Volume - dec1;
if canal1.Volume < piso then canal1.Stop;
end;
{canal1.Volume:= piso;}

{ Controla Timed Fade de canal1 }

if FadeStopBtn.Down then
begin
 if canal1.Volume <= piso then
 begin
 FadeStopBtn.Down:=False;
 stopbtn.Down:=true;
 StopBtnClick(canal1);
 end
 else canal1.Volume:=canal1.Volume - dectfade;
end;
end;

procedure TForm1.canal2Timer(Sender: TObject);
begin
{ Controla Pinchada de Tema }
if  punching2=2 then
 begin
   if  canal2.CurrentPosition > Punchpos2/10
    then
    begin
    canal8.Run;
    punching2:=0;
    end;
 end;

{ Controla Pinchada de base }
if  timeanoun and (punchan=2) then
 begin
   if  canal2.CurrentPosition > Punch/10
    then canal6.Run;
 end;
{ Controla Fade In canal2 }
if FadeIN2 then
begin
canal2.Volume:=canal2.Volume + inc2;
if canal2.Volume >= techo2 then canal2.Volume:= techo2;
end;

{ Controla Fade Out canal2 }
if Fadeout2 then
begin
canal2.Volume:=canal2.Volume - dec2;
if canal2.Volume < piso then canal2.Stop;
end;
{canal2.Volume:= piso;}

{ Controla Timed Fade de canal2 }

if FadeStopBtn.Down then
Begin
 if canal2.Volume <= piso then
 begin
 FadeStopBtn.Down:=False;
 stopbtn.Down:=true;
 StopBtnClick(canal2);
 end
 else canal2.Volume:=canal2.Volume - dectfade;
end;
end;

procedure TForm1.grillaDrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
Var
icon: integer;
begin
grilla.Canvas.Brush.Color:=clBlack;
grilla.Canvas.Font.Color:=clLime;

if col > 4 then
begin
 grilla.Canvas.Brush.Color:=clBlack;
 grilla.Canvas.Font.Color:=clBlack;
 {grilla.Canvas.Font.Style:=[fsbold];}
end;

if (row = grilla.row) and (col > 0) then
begin
 grilla.Canvas.Brush.Color:=clTeal;
 If col<5 then grilla.Canvas.Font.Color:=clWhite
 else grilla.Canvas.Font.Color:=clTeal;
 {grilla.Canvas.Font.Style:=[fsbold];}
end;
if (row = grilla.row) and (col = 0) then
begin
 grilla.Canvas.Brush.Color:=clBlack;
 grilla.Canvas.Font.Color:=clLime;
end;
if (grilla.cells[19,row] ='Sg') and (col = 0) then
begin
grilla.Canvas.Brush.Color:=clBlue;
grilla.canvas.Font.Color:=clwhite;
grilla.Canvas.Font.Style:=[fsbold];
end;
if (grilla.cells[19,row] ='Pt') and (col = 0) then
begin
grilla.Canvas.Brush.Color:=clred;
grilla.canvas.Font.Color:=clwhite;
grilla.Canvas.Font.Style:=[fsbold];
end;
grilla.Canvas.FillRect(rect);
if col = 1 then
begin
if grilla.cells[1,row]='' then icon:=12 else icon:=strtoint(grilla.cells[1,row]);
imageicons.Draw(grilla.canvas,rect.left,rect.top+1,icon);
if grilla.cells[18,row]='' then icon:=12 else icon:=strtoint(grilla.cells[18,row]);
imageicons.Draw(grilla.canvas,rect.left+17,rect.top+1,icon);
if grilla.cells[15,row]='' then icon:=12 else icon:=strtoint(grilla.cells[15,row]);
if icon=-1 then icon:=21 else icon:=22;
imageicons.Draw(grilla.canvas,rect.left+34,rect.top+1,icon);
if grilla.cells[20,row]='' then icon:=12 else icon:=strtoint(grilla.cells[20,row]);
imageicons.Draw(grilla.canvas,rect.left+48,rect.top+1,icon);
end
else
grilla.Canvas.Textout(rect.left+1,rect.top+1,grilla.cells[col,row]);
end;

procedure TForm1.QuickLoadBtnClick(Sender: TObject);
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
  FileStream := TFileStream.Create (PlayListEdit.Text,
    fmOpenRead);
  Reader := TReader.Create (FileStream, $ff);
  Reader.ReadListBegin;
  for i:=0 to Grilla.ColCount-1 do
  grilla.Cols[i].Clear;
  i:=0;
  while not Reader.EndOfList do
  begin
  grilla.RowCount:=i+1;
  for c:=0 to grilla.ColCount-1 do
  grilla.cells[c,i]:=Reader.ReadString;
  i:=i+1;
  end;
  Reader.ReadListEnd;
  Reader.Destroy;
  FileStream.Destroy;
puntero:=0;
siguiente:=1;
grilla.row:=2;
EventStatus;
end;

procedure TForm1.QuickSaveBtnClick(Sender: TObject);
var
    FileStream: TFileStream;
    Writer    : TWriter;
    i,c         : Integer;
begin
  for i:=0 to grilla.rowcount-1 do
  begin
  grilla.cells[4,i]:='00:00:00';
  grilla.cells[19,i]:='';
  end;

  FileStream := TFileStream.Create (PlayListEdit.Text,
    fmCreate or fmOpenWrite or fmShareDenyNone);
  Writer := TWriter.Create (FileStream, $ff);
  Writer.WriteListBegin;
  for i := 0 to grilla.RowCount-1 do
  for c:= 0 to grilla.ColCount -1 do
  Writer.WriteString (grilla.cells[c,i]);
  Writer.WriteListEnd;
  Writer.Destroy;
  FileStream.Destroy;
end;

procedure TForm1.grillaDblClick(Sender: TObject);
begin
Form1.canal4.FileName:=form1.grilla.cells[9,form1.grilla.Row];
editform.Show;
end;

procedure TForm1.Loop1Click(Sender: TObject);
begin
Playmodebtn.ImageIndex:=loop1.ImageIndex;
end;

procedure TForm1.SingleLogged1Click(Sender: TObject);
begin
Playmodebtn.ImageIndex:=SingleLogged1.ImageIndex;
end;

procedure TForm1.SingleClick(Sender: TObject);
begin
Playmodebtn.ImageIndex:=Single.ImageIndex;
end;

procedure TForm1.JumpToList1Click(Sender: TObject);
begin
Playmodebtn.ImageIndex:=JumpToList1.ImageIndex;
end;

procedure TForm1.DeleventbtnClick(Sender: TObject);
var
i: integer;
begin
grilla.rows[grilla.row].Clear;
for i:= grilla.row to grilla.rowcount-2 do
begin
grilla.rows[i]:=grilla.rows[i+1];
grilla.Cells[0,i]:=format('%.5d',[i]);
end;
grilla.rows[grilla.rowcount-1].Clear;
grilla.rowcount:=grilla.rowcount-1;
end;

procedure TForm1.grillaRowMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
enumerar(1);
end;
{  var
i: integer;
begin

if ToIndex < FromIndex then
begin
i:=ToIndex;
ToIndex:=FromIndex;
FromIndex:=i;
end;
for i:=FromIndex to ToIndex do
grilla.Cells[0,i]:=format('%.5d',[i+1]);
end;}

procedure TForm1.ScrollbtnClick(Sender: TObject);
begin
 If scrollbtn.Down then
 begin
 scrollbtn.ImageIndex:=7;
 grilla.TopRow:= puntero;
 end
  else
 scrollbtn.ImageIndex:=6;
end;

procedure TForm1.CuemixbtnClick(Sender: TObject);
Var
tiempo: integer;
begin
if OnairBtn.Down then
begin
If not(Cuemixbtn.Down) Then Cuemixbtn.Down:=true;
tiempo:=afadetime.Value;
if tiempo<10 then tiempo:=10;
if player = 1 then
begin
dec1:= paso1 div tiempo;
TimFO1:=trunc(canal1.currentposition * 10);
outro1:=canal1.currentposition * 10;
end
 else
begin
dec2:= paso2 div tiempo;
TimFO2:=trunc(canal2.currentposition*10);
outro2:=canal2.currentposition*10;
end;
end
else
begin
If player=1 then canal1.CurrentPosition:=(outro1/10)-2;
If player=2 then canal2.CurrentPosition:=(outro2/10)-2;
end;
end;

procedure TForm1.grillaClick(Sender: TObject);
var
Fname: string;
begin
if InfoTbar.Visible then
fname:=uppercase(grilla.Cells[9,grilla.row]);
if pos('.WAV',fname)=0 then
begin
cat:=TMpegAudio.Create;
cat.FileDetectionPrecision:=2;
cat.FileName:=fname;
titulo.Caption:=cat.Title;
artist.Caption:=cat.Artist;
album.Caption:=cat.FileName;
album.Hint:=cat.FileName;
{genero.Caption:=cat.GenreStr;
anio.Caption:=cat.Year;
comentario.Caption:=cat.Comment
InfoTbar.Caption:=Cat.Header + ' Info';}
cat.Free;
end
else
begin
titulo.Caption:=extractfilename(lowercase(Fname));
artist.Caption:='[Wav file No Tag]';
album.Caption:=FName;
album.Hint:=FName;
end;
end;

procedure TForm1.ImportbtnClick(Sender: TObject);
var
i,c: integer;
FName: string;
begin
if opendlg1.Execute then
begin
memo1.Lines.LoadFromFile(opendlg1.FileName);
i:=grilla.RowCount;
c:=grilla.row-1;
if insertbtn.Down then insertafilas(memo1.lines.Count+1) else grilla.row:=i-1;
for i:=0 to memo1.lines.Count-1 do
begin
FName:=uppercase(memo1.lines.strings[i]);
if (Pos('.MP2', FName) > 0) or (Pos('.MP3', FName) > 0) or (Pos('.WAV', FName)> 0) then
  begin
  if not FileExists(FName) then
    MessageDlg(FName + #10 + 'Path not Found or File Error', mtError, [mbOK] , 0)
  else
    Catalogar(Fname);
    if grilla.row = grilla.rowcount-1 then
    grilla.RowCount:=grilla.RowCount+1;
    grilla.row:=grilla.row+1;
  end
  else
  MessageDlg(FName + #10 + 'No MP3/MP2 or Wav file', mtError, [mbOK] , 0);
end;
if insertbtn.Down then grilla.RowCount:=grilla.RowCount-1;
DeleventbtnClick(Sender);
memo1.Lines.Clear;
enumerar(c);
end;
end;

procedure TForm1.enumerar(desde: integer);
Var
i: integer;
begin
for i:=desde to grilla.rowcount-1 do
begin
grilla.cells[0,i]:=format('%.5d',[i+1]);
if grilla.cells[19,i]='Pt' then puntero:=i;
if grilla.cells[19,i]='Sg' then siguiente:=i;
end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if not(playbutton.Enabled) or (OnAirbtn.Down) then
   begin
   Action:=caNone;
   MessageDlg('Exit not allowed while play or On Air', mtCustom, [mbOK] , 0);
   end
 else
 begin
 timer1.Enabled:=false;
 canal1.FileName:='';
 canal2.FileName:='';
 canal3.FileName:='';
 canal4.FileName:='';
 canal5.FileName:='';
 canal6.FileName:='';
 canal7.FileName:='';
 canal8.FileName:='';
 canal9.FileName:='';
 canal10.FileName:='';
 canal11.FileName:='';
 canal12.FileName:='';
 if cdflag then mixerCDLInClose;
 end;
end;

procedure TForm1.OnAirbtnClick(Sender: TObject);
begin
if Onairbtn.Down then
begin
 Onairbtn.ImageIndex:=5;
 cuemixbtn.Style:=tbsCheck;
 end
 else
 begin
 Onairbtn.ImageIndex:=4;
 cuemixbtn.Style:=tbsButton;
 end;

end;

procedure TForm1.Insertafilas(filas: integer);
var
b: integer;
begin
b:=grilla.RowCount-1;
grilla.RowCount:=grilla.RowCount+filas+2;
while grilla.Row <= b do
begin
grilla.Rows[filas+b+1]:=grilla.Rows[b];
grilla.Rows[b].Clear;
dec(b);
end;
DeleventbtnClick(deleventbtn);
end;

procedure TForm1.RowUpbtnClick(Sender: TObject);
var
i: integer;
temp: string;
begin
if grilla.row>0 then
begin
with grilla do
for i:=1 to grilla.ColCount-1 do
begin
temp:=Cells[i,row];
Cells[i,row]:=Cells[i,row-1];
Cells[i,row-1]:=temp;
end;
grilla.row:=grilla.row-1;
end;
end;

procedure TForm1.RowDownbtnClick(Sender: TObject);
var
i: integer;
temp: string;
begin
if grilla.row < grilla.rowcount-2 then
begin
with grilla do
for i:=1 to grilla.ColCount-1 do
begin
temp:=Cells[i,row];
Cells[i,row]:=grilla.Cells[i,row+1];
Cells[i,row+1]:=temp;
end;
grilla.row:=grilla.row+1;
end;
end;

procedure TForm1.InsertbtnClick(Sender: TObject);
begin
if insertbtn.Down then insertbtn.ImageIndex:=10
else insertbtn.ImageIndex:=11;
end;

procedure TForm1.ClearbtnClick(Sender: TObject);
Var
i: integer;
begin
if playbutton.Down Then
 MessageDlg('Function not allowed while Play', mtCustom, [mbOK] , 0)
else
begin
if MessageDlg('Delete All List Events. Are you sure?', mtConfirmation, [mbYes,mbNo] , 0)=mrYes
 then
 begin
 for i:=0 to grilla.rowcount-1 do
 grilla.Rows[i].Clear;
 grilla.rowcount:=1;
 grilla.row:=0;
 grilla.Cells[3,0]:='00:00';
 end;
end;
end;
procedure TForm1.InfobtnClick(Sender: TObject);
begin
InfoTbar.Visible:=infobtn.Down;
end;

procedure TForm1.MergebtnClick(Sender: TObject);
begin
MessageDlg('Function not allowed in this Trial Demo', mtCustom, [mbOK] , 0);
end;

procedure TForm1.grillaDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
Var
col,fila: integer;
begin
If (source=FilelistBox1) or (source.ClassType=TButton) then
begin
accept:=true;
grilla.MouseToCell(x,y,col,fila);
if (fila<=grilla.rowcount-1) and (fila>=0) then grilla.row:=fila;
end;
end;

procedure TForm1.FileListBox1StartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
if Filelistbox1.SelCount>1 then Filelistbox1.DragCursor:=crMultiDrag
else Filelistbox1.DragCursor:=crDrag;
end;

procedure TForm1.grillaDragDrop(Sender, Source: TObject; X, Y: Integer);
var
i,focus:integer;
begin
if source.ClassType=Tbutton then
begin
 i:=(source as Tbutton).Tag;
 if insertbtn.Down then insertafilas(1);
 catalogar(uppercase(Pads.PadList.Cells[2,i]));
 if grilla.row = grilla.rowcount-1 then
             grilla.RowCount:=grilla.RowCount+1;
 grilla.row:=grilla.row+1;
 grilla.RowCount:=grilla.RowCount-1;
 enumerar(0);
end;
{Files From Browser}
if source=filelistbox1 then
begin
focus:=filelistbox1.ItemIndex;
if filtersupport.ItemIndex>0 then
begin
if insertbtn.Down then insertafilas(1);
catalogar(uppercase(filelistbox1.FileName));
if grilla.row = grilla.rowcount-1 then
grilla.RowCount:=grilla.RowCount+1;
grilla.row:=grilla.row+1;
end
else
begin
if insertbtn.Down then insertafilas(filelistbox1.SelCount);
for i:=0 to filelistbox1.items.Count-1 do
 begin
  if filelistbox1.Selected[i] then
           begin
            filelistbox1.ItemIndex:=i;
            catalogar(uppercase(filelistbox1.FileName));
            if grilla.row = grilla.rowcount-1 then
            grilla.RowCount:=grilla.RowCount+1;
            grilla.row:=grilla.row+1;
           end;
 end;
end;
grilla.RowCount:=grilla.RowCount-1;
enumerar(0);
filelistbox1.ItemIndex:=focus;
end;
end;

procedure TForm1.FileListBox1DblClick(Sender: TObject);
begin
if Playlist.Visible then grillaDragDrop(grilla,filelistbox1,0,0);
end;

procedure TForm1.TimeTalkbtnClick(Sender: TObject);
begin
If playlist.Visible then TimeForm.Show;
end;

procedure TForm1.CargaPunch(fila,canal: integer);
begin
if canal=1 then
begin
canal7.FileName:=grilla.Cells[16,fila];
canal7.Pause;
canal7.Volume:=strtoint(grilla.cells[17,fila]);
punchpos1:=strtoint(grilla.Cells[15,fila]);
punching1:=1;
end;
if canal=2 then
begin
canal8.FileName:=grilla.Cells[16,fila];
canal8.Pause;
canal8.Volume:=strtoint(grilla.cells[17,fila]);
punchpos2:=strtoint(grilla.Cells[15,fila]);
punching2:=2;
end;

end;

procedure TForm1.CargarHoras(Fila,Canal: integer);
Var
volume: integer;
{hor,min,seg,mseg: word;
horas, minutos: string;
tiempo: Tdatetime;}
begin
canal6.FileName:=grilla.Cells[16,fila];
canal6.Pause;
{if canal=puntero then tiempo:=strtotime('00:00')
else
tiempo:=strtotime('00:'+grilla.Cells[3,puntero]);
decodeTime(time+tiempo,hor,min,seg,mseg);
horas:='HORA'+format('%.2d',[hor])+'.MP3';
minutos:='MINU'+format('%.2d',[min])+'.MP3';
canal3.FileName:=hourdir+'\Talk01\'+horas;
canal3.Pause;
canal5.FileName:=hourdir+'\Talk01\'+minutos;
canal5.Pause;}
volume:=strtoint(grilla.cells[17,fila]);
canal3.Volume:=volume;
canal5.Volume:=volume;
canal6.Volume:=volume;
timeanoun:=True;
punch:=strtoint(grilla.Cells[15,fila]);
punchan:=canal;
end;

procedure TForm1.PonerFecha;
begin
DateLabel.Caption := FormatDateTime('dddd d mmmm yyyy', now);
end;

procedure TForm1.canal3StateChange(Sender: TObject; oldState,
  newState: Integer);
begin
if  timeanoun and (oldState=2)and(newState=0) then
 begin
  canal5.Run;
  canal3.FileName:='';
 end;
end;

procedure TForm1.canal5StateChange(Sender: TObject; oldState,
  newState: Integer);
begin
if  timeanoun and (oldState=2)and(newState=0) then
 begin
 timeanoun:=False;
 canal5.FileName:='';
 end;
end;

procedure TForm1.canal6StateChange(Sender: TObject; oldState,
  newState: Integer);
Var
hor,min,seg,mseg: word;
begin
if timeanoun and (oldState=0)and(newState=2) then
begin
decodeTime(time,hor,min,seg,mseg);
canal3.FileName:=hourdir+'\Talk01\HORA'+format('%.2d',[hor])+'.MP3';
canal3.Pause;
end;
if timeanoun and (oldState=2)and(newState=0) then
begin
canal3.Run;
canal6.FileName:='';
decodeTime(time,hor,min,seg,mseg);
canal5.FileName:=hourdir+'\Talk01\MINU'+format('%.2d',[min])+'.MP3';
canal5.Pause;
punchan:=0;
end;
end;

procedure TForm1.canal7StateChange(Sender: TObject; oldState,
  newState: Integer);
begin
if (oldState=2)and(newState=0) then
 canal7.FileName:='';
end;

procedure TForm1.canal8StateChange(Sender: TObject; oldState,
  newState: Integer);
begin
if (oldState=2)and(newState=0) then
 canal8.FileName:='';
end;




procedure TForm1.ControlsPopUpPopup(Sender: TObject);
begin
ControlsPopUp.Items.Items[0].Checked:=PlayControlstbar.Visible;
ControlsPopUp.Items.Items[1].Checked:=Playlist.Visible;
ControlsPopUp.Items.Items[2].Checked:=Browser.Visible;
ControlsPopUp.Items.Items[3].Checked:=OptionsTbar.Visible;
ControlsPopUp.Items.Items[4].Checked:=FilerTbar.Visible;
ControlsPopUp.Items.Items[5].Checked:=InfoTbar.Visible;
ControlsPopUp.Items.Items[6].Checked:=EditorTbar.Visible;
ControlsPopUp.Items.Items[7].Checked:=Panel6.Visible;
ControlsPopUp.Items.Items[8].Checked:=CDControls.Visible;
end;


procedure TForm1.PlayControls1Click(Sender: TObject);
begin
PlayControls1.Checked:= not(PlayControls1.Checked);
ControlsPopUpCambio;
end;

procedure TForm1.ControlsPopUpCambio;
begin
PlayControlstbar.Visible:=ControlsPopUp.Items.Items[0].Checked;
Playlist.Visible:=ControlsPopUp.Items.Items[1].Checked;
Browser.Visible:=ControlsPopUp.Items.Items[2].Checked;
OptionsTbar.Visible:=ControlsPopUp.Items.Items[3].Checked;
FilerTbar.Visible:=ControlsPopUp.Items.Items[4].Checked;
InfoTbar.Visible:=ControlsPopUp.Items.Items[5].Checked;
infobtn.Down:=InfoTbar.Visible;
EditorTbar.Visible:=ControlsPopUp.Items.Items[6].Checked;
Panel6.Visible:=ControlsPopUp.Items.Items[7].Checked;
CDControls.Visible:=ControlsPopUp.Items.Items[8].Checked;
end;

procedure TForm1.PlayList1Click(Sender: TObject);
begin
PlayList1.Checked:=not(PlayList1.Checked);
if PlayList1.Checked then
begin
InfoPanel1.Checked:=True;
Filer1.Checked:=True;
Editor1.Checked:=True;
end
else
begin
InfoPanel1.Checked:=False;
Filer1.Checked:=False;
Editor1.Checked:=False;
end;
ControlsPopUpCambio;
end;

procedure TForm1.Browser1Click(Sender: TObject);
begin
Browser1.Checked:=not(Browser1.Checked);
ControlsPopUpCambio;
end;

procedure TForm1.Options1Click(Sender: TObject);
begin
Options1.Checked:=not(Options1.Checked);
ControlsPopUpCambio;
end;

procedure TForm1.Filer1Click(Sender: TObject);
begin
Filer1.Checked:=not(Filer1.Checked);
ControlsPopUpCambio;
end;

procedure TForm1.InfoPanel1Click(Sender: TObject);
begin
InfoPanel1.Checked:=not(InfoPanel1.Checked);
ControlsPopUpCambio;
end;

procedure TForm1.Editor1Click(Sender: TObject);
begin
Editor1.Checked:=not(Editor1.Checked);
ControlsPopUpCambio;
end;

procedure TForm1.grillaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
IF key=46 then deleventbtn.Click;
end;

procedure TForm1.SpeedButton33Click(Sender: TObject);
begin
pads.show;
end;

procedure TForm1.DirectBarDragDrop(Sender, Source: TObject; X, Y: Integer);
Var
b: integer;
begin
IF Source=DirectoryListbox1 then
begin
      with TToolButton.Create(DirectBar) do
      begin
        Parent := DirectBar;
        Name:='BT'+inttostr(DirectBar.ButtonCount);
        Caption := 'DirButton'+format('%.2d',[DirectBar.ButtonCount]);
        ImageIndex :=0;
        Hint:= DirectoryListBox1.Directory;
        Showhint:=true;
        Style :=tbsCheck;
        OnClick:=DirectBarClick;
        OnDragDrop:=DirectBarDragDrop;
        OnDragOver:=DirectBarDragOver;
        Grouped:=True;
      end;
Quickform.DirsGrid.RowCount:=Quickform.DirsGrid.RowCount+1;
for b:=Quickform.DirsGrid.RowCount downto 1 do
Quickform.DirsGrid.Rows[b]:=Quickform.DirsGrid.Rows[b-1];
Quickform.DirsGrid.Cells[3,1]:='0';
Quickform.DirsGrid.Cells[4,1]:='0';
Quickform.DirsGrid.Cells[5,1]:='-1000';
Quickform.DirsGrid.Cells[6,1]:='Yes';
end;
end;

procedure TForm1.DirectBarDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
If source=DirectoryListbox1 then accept:=true;
end;

procedure TForm1.ConfigureClick(Sender: TObject);
begin
Quickform.show;
end;

procedure TForm1.DirectBarClick(Sender: TObject);
var
i: integer;
s: string;
begin

for i:=0 to directbar.ButtonCount-1 do
if directbar.Buttons[i].Down=true then
begin
s:=directbar.Buttons[i].hint;
drivecombobox1.Drive:=s[1];
DirectoryListBox1.Directory:=s;
TypeToolBtn.ImageIndex:=strtoint(Quickform.DirsGrid.Cells[4,i+1]);
CustomToolBtn.Down:=True;
CustomVolSpin.Value:=strtoint(Quickform.DirsGrid.Cells[5,i+1]);
selectecho:=CustomVolspin.Value;
if Quickform.DirsGrid.Cells[6,i+1]='No' then NoMixToolBtn.Down:=True
 else NoMixToolBtn.Down:=False;
end;
end;

procedure TForm1.DirectBtnClick(Sender: TObject);
begin
FPList.Checked:=False;
LaTitle1.Color:=clTeal;
Laartist1.Color:=clTeal;
LaTitle2.Color:=clTeal;
Laartist2.Color:=clTeal;
LaTitle3.Color:=clTeal;
Laartist3.Color:=clTeal;
LaTitle4.Color:=clTeal;
Laartist4.Color:=clTeal;
end;



procedure TForm1.PadPlay1(fila: integer);
begin
if  directBtn.Down or LaStopBtn3.Down then
begin
infocarga9(uppercase(Pads.PadList.Cells[2,fila]));
if Pads.PadList.Cells[3,fila]<>'' then
Trackbar2.Position:=strtoint(Pads.PadList.Cells[3,fila]);
If directbtn.Down then
begin
canal9.AutoStart:=True;
canal9.Run;
LAplaybtn3.Down:=true;
end
else
canal9.AutoStart:=False;
end;
end;

procedure TForm1.PadPlay2(fila: integer);
begin
if  directBtn.Down or LaStopBtn4.Down then
begin
infocarga10(uppercase(Pads.PadList.Cells[2,fila]));
if Pads.PadList.Cells[3,fila]<>'' then
Trackbar4.Position:=strtoint(Pads.PadList.Cells[3,fila]);
If directbtn.Down then
begin
canal10.AutoStart:=True;
canal10.Run;
LAplaybtn4.Down:=true;
end
Else
canal10.AutoStart:=False;
end;
end;

procedure TForm1.PadPlay3(fila: integer);
begin
if  directBtn.Down or LaStopBtn1.Down then
begin
infocarga11(uppercase(Pads.PadList.Cells[2,fila]));
if Pads.PadList.Cells[3,fila]<>'' then
Trackbar3.Position:=strtoint(Pads.PadList.Cells[3,fila]);
If directbtn.Down then
begin
canal11.AutoStart:=True;
canal11.Run;
LAplaybtn1.Down:=true;
end
else
canal11.AutoStart:=False;
end;
end;

procedure TForm1.PadPlay4(fila: integer);
begin
if  directBtn.Down or LaStopBtn2.Down then
begin
infocarga12(uppercase(Pads.PadList.Cells[2,fila]));
if Pads.PadList.Cells[3,fila]<>'' then
Trackbar1.Position:=strtoint(Pads.PadList.Cells[3,fila]);
If directbtn.Down then
begin
canal12.AutoStart:=True;
canal12.Run;
LAplaybtn2.Down:=true;
end
else
canal12.AutoStart:=False;
end;
end;

procedure TForm1.PadBtn01Click(Sender: TObject);
begin
padplay3(1);
end;

procedure TForm1.PadBtn02Click(Sender: TObject);
begin
padplay3(2);
end;

procedure TForm1.PadBtn03Click(Sender: TObject);
begin
padplay3(3);
end;

procedure TForm1.PadBtn04Click(Sender: TObject);
begin
padplay3(4);
end;

procedure TForm1.PadBtn05Click(Sender: TObject);
begin
padplay3(5);
end;

procedure TForm1.PadBtn06Click(Sender: TObject);
begin
padplay1(6);
end;

procedure TForm1.PadBtn07Click(Sender: TObject);
begin
padplay1(7);
end;

procedure TForm1.PadBtn08Click(Sender: TObject);
begin
padplay1(8);
end;

procedure TForm1.PadBtn09Click(Sender: TObject);
begin
padplay1(9);
end;

procedure TForm1.PadBtn10Click(Sender: TObject);
begin
padplay1(10);
end;

procedure TForm1.PadBtn11Click(Sender: TObject);
begin
padplay4(11);
end;

procedure TForm1.PadBtn12Click(Sender: TObject);
begin
padplay4(12);
end;

procedure TForm1.PadBtn13Click(Sender: TObject);
begin
padplay4(13);
end;

procedure TForm1.PadBtn14Click(Sender: TObject);
begin
padplay4(14);
end;

procedure TForm1.PadBtn15Click(Sender: TObject);
begin
padplay4(15);
end;

procedure TForm1.PadBtn16Click(Sender: TObject);
begin
padplay2(16);
end;

procedure TForm1.PadBtn17Click(Sender: TObject);
begin
padplay2(17);
end;

procedure TForm1.PadBtn18Click(Sender: TObject);
begin
padplay2(18);
end;

procedure TForm1.PadBtn19Click(Sender: TObject);
begin
padplay2(19);
end;

procedure TForm1.PadBtn20Click(Sender: TObject);
begin
padplay2(20);
end;

procedure TForm1.PadBoxClick(Sender: TObject);
begin
pads.LoadList(padbox.FileName);
pads.etiqueBtn;
end;

procedure TForm1.LAplaybtn3Click(Sender: TObject);
begin
if abalmix.Checked then
if RtoL.Checked then
begin
 if balbar09.Position<0 then balbar09.Position:=10000;
 decbal9:=Balbar09.Position div Afadetime.Value
end
 else
begin
 if balbar09.Position>0 then balbar09.Position:=-10000;
 decbal9:=(0-Balbar09.Position) div Afadetime.Value;
end;
if clipDown.Checked and not(LaStopBtn4.Down) then LaStopBtn4.Click;
LaPauseBtn3.Down:=false;
canal9.Run;
end;

procedure TForm1.LAplaybtn4Click(Sender: TObject);
begin
if abalmix.Checked then
if RtoL.Checked then
begin
 if balbar10.Position<0 then balbar10.Position:=10000;
 decbal10:=Balbar10.Position div Afadetime.Value
end
 else
begin
 if balbar10.Position>0 then balbar10.Position:=-10000;
 decbal10:=(0-Balbar10.Position) div Afadetime.Value;
end;
if clipDown.Checked and not(LaStopBtn3.Down) then LaStopBtn3.Click;
LaPauseBtn4.Down:=false;
canal10.Run;
end;

procedure TForm1.LaPauseBtn4Click(Sender: TObject);
begin
if LaPauseBtn4.Down then canal10.Pause else canal10.run;
end;

procedure TForm1.LaPauseBtn3Click(Sender: TObject);
begin
if LaPauseBtn3.Down then canal9.Pause else canal9.run;
end;

procedure TForm1.TrackBar4Change(Sender: TObject);
begin
canal10.Volume:=Trackbar4.Position;
label21.Caption:=inttostr(Trackbar4.Position);
end;

procedure TForm1.TrackBar2Change(Sender: TObject);
begin
canal9.Volume:=Trackbar2.Position;
label20.Caption:=inttostr(Trackbar2.Position);
end;

procedure TForm1.TrackBar3Change(Sender: TObject);
begin
canal11.Volume:=Trackbar3.Position;
label19.Caption:=inttostr(Trackbar3.Position);
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
canal12.Volume:=Trackbar1.Position;
label18.Caption:=inttostr(Trackbar1.Position);
end;

procedure TForm1.LaStopBtn1Click(Sender: TObject);
begin
if afade.Checked then
begin
if abalmix.Checked then
if RtoL.Checked then incbal11:=(10000 - Balbar11.Position) div Afadetime.Value
else incbal11:=(10000-Balbar11.Position) div Afadetime.Value;
declivefade11:=(trackbar3.Position-piso)div afadetime.Value;
Fade11:=true;
end
else
canal11.Stop;
end;

procedure TForm1.LaStopBtn2Click(Sender: TObject);
begin
if afade.Checked then
begin
if abalmix.Checked then
if RtoL.Checked then incbal12:=(10000 - Balbar12.Position) div Afadetime.Value
else incbal12:=(10000-Balbar12.Position) div Afadetime.Value;
declivefade12:=(trackbar1.Position-piso)div afadetime.Value;
Fade12:=true;
end
else
canal12.Stop;
end;

procedure TForm1.LaStopBtn3Click(Sender: TObject);
begin
if afade.Checked then
begin
if abalmix.Checked then
if RtoL.Checked then incbal9:=(10000 - Balbar09.Position) div Afadetime.Value
else incbal9:=(10000-Balbar09.Position) div Afadetime.Value;
declivefade9:=(trackbar2.Position-piso)div Afadetime.Value;
Fade9:=true;
end
else
canal9.Stop;
end;

procedure TForm1.LaStopBtn4Click(Sender: TObject);
begin
if afade.Checked then
begin
if abalmix.Checked then
if RtoL.Checked then incbal10:=(10000 - Balbar10.Position) div Afadetime.Value
else incbal10:=(10000-Balbar10.Position) div Afadetime.Value;
declivefade10:=(trackbar4.Position-piso)div afadetime.Value;
Fade10:=true;
end
else
canal10.Stop;
end;

procedure TForm1.LAplaybtn1Click(Sender: TObject);
begin
if abalmix.Checked then
if RtoL.Checked then
begin
 if balbar11.Position<0 then balbar11.Position:=10000;
 decbal11:=Balbar11.Position div Afadetime.Value
end
 else
begin
 if balbar11.Position>0 then balbar11.Position:=-10000;
 decbal11:=(0-Balbar11.Position) div Afadetime.Value;
end;
if clipup.Checked and not(LaStopBtn2.Down) then LaStopBtn2.Click;
LaPauseBtn1.Down:=false;
canal11.Run;
end;

procedure TForm1.LAplaybtn2Click(Sender: TObject);
begin
if abalmix.Checked then
if RtoL.Checked then
begin
 if balbar12.Position<0 then balbar12.Position:=10000;
 decbal12:=Balbar12.Position div Afadetime.Value
end
 else
begin
 if balbar12.Position>0 then balbar12.Position:=-10000;
 decbal12:=(0-Balbar12.Position) div Afadetime.Value;
end;
if clipup.Checked and not(LaStopBtn1.Down) then LaStopBtn1.Click;
LaPauseBtn2.Down:=false;
canal12.Run;
end;

procedure TForm1.LaPauseBtn1Click(Sender: TObject);
begin
if LaPauseBtn1.Down then canal11.Pause else canal11.run;
end;

procedure TForm1.LaPauseBtn2Click(Sender: TObject);
begin
if LaPauseBtn2.Down then canal12.Pause else canal12.run;
end;

procedure TForm1.canal9Timer(Sender: TObject);
Var
segundos, minutos:integer;
position,final:double;
begin
position:=canal9.CurrentPosition;
final:=canal9.SelectionEnd;
segundos:=trunc(final-Position);
minutos:= segundos div 60;
segundos:= segundos mod 60;
label15.Caption:=format('-%.2d:%.2d',[minutos,segundos]);

{ Controla Timed Fade de canal9 }
if Fade9 then
 Begin
 if canal9.Volume <= piso then
 begin
  fade9:=false;
  canal9.Stop;
 end
  else
   Trackbar2.Position:=canal9.Volume - declivefade9;
end;
{ Controla Auto BalMix de canal9}
if LAplaybtn3.Down and abalmix.Checked then
begin
if RtoL.Checked and (balbar09.position>0) then
begin
balbar09.position:=Balbar09.Position-decbal9;
if balbar09.position<0 then balbar09.position:=0;
end;
if LtoR.Checked and (balbar09.position<0) then
begin
balbar09.position:=Balbar09.Position+decbal9;
if  balbar09.position>0 then balbar09.position:=0;
end;
end;
if Fade9 and abalmix.Checked then
begin
if RtoL.Checked and (balbar09.position>-10000) then balbar09.position:=Balbar09.Position-incbal9;
if LtoR.Checked and (balbar09.position<10000) then balbar09.position:=Balbar09.Position+incbal9;
end;
end;

procedure TForm1.canal10Timer(Sender: TObject);
Var
segundos, minutos:integer;
position,final:double;
begin
position:=canal10.CurrentPosition;
final:=canal10.SelectionEnd;
segundos:=trunc(final-Position);
minutos:= segundos div 60;
segundos:= segundos mod 60;
label16.Caption:=format('-%.2d:%.2d',[minutos,segundos]);

{ Controla Timed Fade de canal10 }
if Fade10 then
 Begin
 if canal10.Volume <= piso then
 begin
  fade10:=false;
  canal10.Stop;
 end
  else
   Trackbar4.Position:=canal10.Volume - declivefade10;
end;
{ Controla Auto BalMix de canal10}
if LAplaybtn4.Down and abalmix.Checked then
begin
if RtoL.Checked and (balbar10.position>0) then
begin
balbar10.position:=Balbar10.Position-decbal10;
if balbar10.position<0 then balbar10.position:=0;
end;
if LtoR.Checked and (balbar10.position<0) then
begin
balbar10.position:=Balbar10.Position+decbal10;
if  balbar10.position>0 then balbar10.position:=0;
end;
end;
if Fade10 and abalmix.Checked then
begin
if RtoL.Checked and (balbar10.position>-10000) then balbar10.position:=Balbar10.Position-incbal10;
if LtoR.Checked and (balbar10.position<10000) then balbar10.position:=Balbar10.Position+incbal10;
end;
end;


procedure TForm1.canal11Timer(Sender: TObject);
Var
segundos, minutos:integer;
position,final:double;
begin
position:=canal11.CurrentPosition;
final:=canal11.SelectionEnd;
segundos:=trunc(final-Position);
minutos:= segundos div 60;
segundos:= segundos mod 60;
label13.Caption:=format('-%.2d:%.2d',[minutos,segundos]);

{ Controla Timed Fade de canal11 }
if Fade11 then
 Begin
 if canal11.Volume <= piso then
 begin
  fade11:=false;
  canal11.Stop;
 end
  else
   Trackbar3.Position:=canal11.Volume - declivefade11;
end;
{ Controla Auto BalMix de canal11}
if LAplaybtn1.Down and abalmix.Checked then
begin
if RtoL.Checked and (balbar11.position>0) then
begin
balbar11.position:=Balbar11.Position-decbal11;
if balbar11.position<0 then balbar11.position:=0;
end;
if LtoR.Checked and (balbar11.position<0) then
begin
balbar11.position:=Balbar11.Position+decbal11;
if  balbar11.position>0 then balbar11.position:=0;
end;
end;
if Fade11 and abalmix.Checked then
begin
if RtoL.Checked and (balbar11.position>-10000) then balbar11.position:=Balbar11.Position-incbal11;
if LtoR.Checked and (balbar11.position<10000) then balbar11.position:=Balbar11.Position+incbal11;
end;
end;

procedure TForm1.canal12Timer(Sender: TObject);
Var
segundos, minutos:integer;
position,final:double;
begin
position:=canal12.CurrentPosition;
final:=canal12.SelectionEnd;
segundos:=trunc(final-Position);
minutos:= segundos div 60;
segundos:= segundos mod 60;
label14.Caption:=format('-%.2d:%.2d',[minutos,segundos]);

{ Controla Timed Fade de canal12 }
if Fade12 then
 Begin
 if canal12.Volume <= piso then
 begin
  fade12:=false;
  canal12.Stop;
 end
  else
   Trackbar1.Position:=canal12.Volume - declivefade12;
end;
{ Controla Auto BalMix de canal12}
if LAplaybtn2.Down and abalmix.Checked then
begin
if RtoL.Checked and (balbar12.position>0) then
begin
balbar12.position:=Balbar12.Position-decbal12;
if balbar12.position<0 then balbar12.position:=0;
end;
if LtoR.Checked and (balbar12.position<0) then
begin
balbar12.position:=Balbar12.Position+decbal12;
if  balbar12.position>0 then balbar12.position:=0;
end;
end;
if Fade12 and abalmix.Checked then
begin
if RtoL.Checked and (balbar12.position>-10000) then balbar12.position:=Balbar12.Position-incbal12;
if LtoR.Checked and (balbar12.position<10000) then balbar12.position:=Balbar12.Position+incbal12;
end;
end;

procedure TForm1.LARewBtn1Click(Sender: TObject);
begin
if LARewBtn1.Down then canal11.AutoRewind:=true
 else canal11.AutoRewind:=False;
end;

procedure TForm1.LARewBtn2Click(Sender: TObject);
begin
if LARewBtn2.Down then canal12.AutoRewind:=true
 else canal12.AutoRewind:=False;
end;

procedure TForm1.LARewBtn3Click(Sender: TObject);
begin
if LARewBtn3.Down then canal9.AutoRewind:=true
 else canal9.AutoRewind:=False;
end;

procedure TForm1.LARewBtn4Click(Sender: TObject);
begin
if LARewBtn4.Down then canal10.AutoRewind:=true
 else canal10.AutoRewind:=False;
end;

procedure TForm1.Panel7DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
if source.ClassType=Tbutton then Padplay3((source as Tbutton).Tag);
if (source=filelistbox1) and LaStopBtn1.Down then
begin
infocarga11(uppercase(filelistbox1.FileName));
Trackbar3.Position:=Selectecho;
end;
If directbtn.Down then
begin
canal11.AutoStart:=True;
canal11.Run;
end
else
canal11.AutoStart:=False;
end;

procedure TForm1.Panel7DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
if (source=filelistbox1) and LaStopBtn1.Down then Accept:=true;
if (source.ClassType=Tbutton) and LaStopBtn1.Down then Accept:=true;
end;

procedure TForm1.Panel3DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
if (source=filelistbox1) and LaStopBtn2.Down then Accept:=true;
end;

procedure TForm1.Panel4DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
if (source=filelistbox1) and LaStopBtn3.Down then Accept:=true;
end;

procedure TForm1.Panel5DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
if (source=filelistbox1) and LaStopBtn4.Down then Accept:=true;
end;

procedure TForm1.Panel3DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
if source.ClassType=Tbutton then Padplay4((source as Tbutton).Tag);
if (source=filelistbox1) and LaStopBtn2.Down then
begin
infocarga12(uppercase(filelistbox1.FileName));
Trackbar1.Position:=Selectecho;
end;
If directbtn.Down then
begin
canal12.AutoStart:=True;
canal12.Run;
end
else
canal12.AutoStart:=False;
end;

procedure TForm1.Panel4DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
if source.ClassType=Tbutton then Padplay1((source as Tbutton).Tag);
if (source=filelistbox1) and LaStopBtn3.Down then
begin
infocarga9(uppercase(filelistbox1.FileName));
Trackbar2.Position:=Selectecho;
end;
If directbtn.Down then
begin
canal9.AutoStart:=True;
canal9.Run;
end
else
canal9.AutoStart:=False;
end;

procedure TForm1.Infocarga9(FName: string);
begin
if pos('.CDA',FName)>0 then
begin
cargaCDaudio(Fname);
showmessage('Drop CDTracks over The Cd Player');
exit;
end;
if pos('.WAV',FName)=0 then
begin
cat:=TMpegAudio.Create;
cat.FileDetectionPrecision:=2;
cat.FileName:=FName;
canal9.FileName:=FName;
LATitle3.Caption:=cat.Title;
LAartist3.Caption:=cat.Artist;
label15.Caption:=format('-%.2d:%.2d',[cat.duration div 60,cat.duration mod 60]);
fade9:=false;
cat.Destroy;
end
else
begin
canal9.FileName:=FName;
LATitle3.Caption:=extractfilename(lowercase(FName));
LAartist3.Caption:='[Wav File No Tag]';
fade9:=false;
end;
if abalmix.Checked then
if LtoR.Checked then Balbar09.Position:=-10000 else Balbar09.Position:=10000
else Balbar09.Position:=0;
end;

procedure TForm1.Infocarga10(FName: string);
begin
if pos('.CDA',FName)>0 then
begin
cargaCDaudio(Fname);
showmessage('Drop CDTracks over The Cd Player');
exit;
end;
if pos('.WAV',FName)=0 then
begin
cat:=TMpegAudio.Create;
cat.FileDetectionPrecision:=2;
cat.FileName:=FName;
canal10.FileName:=FName;
LATitle4.Caption:=cat.Title;
LAartist4.Caption:=cat.Artist;
label16.Caption:=format('-%.2d:%.2d',[cat.duration div 60,cat.duration mod 60]);
fade10:=false;
cat.Destroy;
end
else
begin
canal10.FileName:=FName;
LATitle4.Caption:=extractfilename(lowercase(FName));
LAartist4.Caption:='[Wav File No Tag]';
fade10:=false;
end;
if abalmix.Checked then
if LtoR.Checked then Balbar10.Position:=-10000 else Balbar10.Position:=10000
else Balbar10.Position:=0;
end;

procedure TForm1.Infocarga11(FName: string);
begin
if pos('.CDA',FName)>0 then
begin
cargaCDaudio(Fname);
showmessage('Drop CDTracks over The Cd Player');
exit;
end;
if pos('.WAV',FName)=0 then
begin
cat:=TMpegAudio.Create;
cat.FileDetectionPrecision:=2;
cat.FileName:=FName;
canal11.FileName:=FName;
LATitle1.Caption:=cat.Title;
LAartist1.Caption:=cat.Artist;
label13.Caption:=format('-%.2d:%.2d',[cat.duration div 60,cat.duration mod 60]);
fade11:=false;
cat.Destroy;
end
else
begin
canal11.FileName:=FName;
LATitle1.Caption:=extractfilename(lowercase(FName));
LAartist1.Caption:='[Wav File No Tag]';
fade11:=false;
end;
if abalmix.Checked then
if LtoR.Checked then Balbar11.Position:=-10000 else Balbar11.Position:=10000
else Balbar11.Position:=0;
end;

procedure TForm1.Infocarga12(FName: string);
begin
if pos('.CDA',FName)>0 then
begin
cargaCDaudio(Fname);
showmessage('Drop CDTracks over The Cd Player');
exit;
end;
if pos('.WAV',FName)=0 then
begin
cat:=TMpegAudio.Create;
cat.FileDetectionPrecision:=2;
cat.FileName:=FName;
canal12.FileName:=FName;
LATitle2.Caption:=cat.Title;
LAartist2.Caption:=cat.Artist;
label14.Caption:=format('-%.2d:%.2d',[cat.duration div 60,cat.duration mod 60]);
fade12:=false;
cat.Destroy;
end
else
begin
canal12.FileName:=FName;
LATitle2.Caption:=extractfilename(lowercase(FName));
LAartist2.Caption:='[Wav File No Tag]';
fade12:=false;
end;
if abalmix.Checked then
if LtoR.Checked then Balbar12.Position:=-10000 else Balbar12.Position:=10000
else Balbar12.Position:=0;
end;

procedure TForm1.Panel5DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
if source.ClassType=Tbutton then Padplay2((source as Tbutton).Tag);
if (source=filelistbox1) and LaStopBtn4.Down then
begin
infocarga10(uppercase(filelistbox1.FileName));
Trackbar4.Position:=Selectecho;
end;
If directbtn.Down then
begin
canal10.AutoStart:=True;
canal10.Run;
end
else
canal10.AutoStart:=False;
end;

procedure TForm1.FadeStopbtnClick(Sender: TObject);
Var
Tiempo: integer;
begin
tiempo:=afadetime.Value;
If tiempo < 10 then tiempo:=10;
If player = 1 then
dectfade:= paso1 div tiempo else dectfade:= paso2 div tiempo;
If not(FadeStopbtn.Down) Then FadeStopbtn.Down:=true;
end;

procedure TForm1.canal9StateChange(Sender: TObject; oldState,
  newState: Integer);
begin
if (oldState=0)and(newState=2) then
    LAplaybtn3.Down:=True;
if (oldState=2)and(newState=0) then
 begin
 LaStopBtn3.Down:=true;
 if amute.Checked then
    trackbar2.Position:=piso;
 if fplist.Checked then
    begin
    infocarga9(uppercase(grilla.Cells[9,puntero]));
    trackbar2.Position:=strtoint(grilla.cells[11,puntero]);
    Follow;
    end;
 end;
end;

procedure TForm1.canal10StateChange(Sender: TObject; oldState,
  newState: Integer);
begin
if (oldState=0)and(newState=2) then
    LAplaybtn4.Down:=True;
if (oldState=2)and(newState=0) then
 begin
 LaStopBtn4.Down:=true;
 if amute.Checked then
    trackbar4.Position:=piso;
 if fplist.Checked then
   begin
   infocarga10(uppercase(grilla.Cells[9,puntero]));
   trackbar4.Position:=strtoint(grilla.cells[11,puntero]);
   Follow;
   end;
 end;
end;

procedure TForm1.canal11StateChange(Sender: TObject; oldState,
  newState: Integer);
begin
if (oldState=0)and(newState=2) then
    LAplaybtn1.Down:=True;
if (oldState=2)and(newState=0) then
 begin
 LaStopBtn1.Down:=true;
 if amute.Checked then
     trackbar3.Position:=piso;
  if fplist.Checked then
   begin
   infocarga11(uppercase(grilla.Cells[9,puntero]));
   trackbar3.Position:=strtoint(grilla.cells[11,puntero]);
   Follow;
   end;
 end;
end;

procedure TForm1.canal12StateChange(Sender: TObject; oldState,
  newState: Integer);
begin
if (oldState=0)and(newState=2) then
    LAplaybtn2.Down:=True;
if (oldState=2)and(newState=0) then
 begin
 LaStopBtn2.Down:=true;
 if amute.Checked then
   trackbar1.Position:=piso;
 if fplist.Checked then
   begin
   infocarga12(uppercase(grilla.Cells[9,puntero]));
   trackbar1.Position:=strtoint(grilla.cells[11,puntero]);
   Follow;
   end;
 end;
end;

procedure TForm1.Follow;
begin
puntero:=siguiente;
if siguiente < grilla.RowCount-1 then siguiente:= siguiente+1
 else siguiente:=0;
eventstatus;
grilla.Repaint;
end;

procedure TForm1.Label19Click(Sender: TObject);
begin
Trackbar3.Position:=selectecho;
end;

procedure TForm1.Label18Click(Sender: TObject);
begin
Trackbar1.Position:=selectecho;
end;

procedure TForm1.Label20Click(Sender: TObject);
begin
Trackbar2.Position:=selectecho;
end;

procedure TForm1.Label21Click(Sender: TObject);
begin
Trackbar4.Position:=selectecho;
end;

procedure TForm1.TalkIntro1Click(Sender: TObject);
begin
TalkIntro1.Checked:=not(TalkIntro1.Checked);
ControlsPopUpCambio;
end;

procedure TForm1.FPListClick(Sender: TObject);
begin
If FPList.Checked then
 If directbtn.Down or Playbutton.Down then
 begin
 FPList.Checked:=False;
 MessageDlg(
 'Follow Playlist NOT ALLOWED: While Playlist is running or DIRECT mode is selected', mtCustom, [mbOK] , 0);
 end
 else
 amute.Checked:=False;
end;

procedure TForm1.PadBtn01MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if button=mbRight then (sender as Tbutton).BeginDrag(true);
end;

procedure TForm1.ProgramBtnClick(Sender: TObject);
begin
canal9.AutoStart:=False;
canal10.AutoStart:=False;
canal11.AutoStart:=False;
canal12.AutoStart:=False;
LaTitle1.Color:=clGray;
Laartist1.Color:=clGray;
LaTitle2.Color:=clGray;
Laartist2.Color:=clGray;
LaTitle3.Color:=clGray;
Laartist3.Color:=clGray;
LaTitle4.Color:=clGray;
Laartist4.Color:=clGray;
end;

procedure TForm1.PadBtn01DragDrop(Sender, Source: TObject; X, Y: Integer);
Var
a: integer;
begin
if source=grilla then
begin
a:=(sender as Tbutton).tag;
cat:=TMpegAudio.Create;
cat.FileDetectionPrecision:=2;
cat.FileName:=grilla.Cells[9,grilla.row];
pads.Padlist.Cells[1,a]:=Copy(cat.Title, 1, 15);
pads.Padlist.Cells[2,a]:=grilla.Cells[9,grilla.row];
pads.Padlist.Cells[3,a]:=grilla.cells[11,grilla.row];
cat.Destroy;
pads.SaveBtnClick(sender);
end;
end;


procedure TForm1.PadBtn01DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
if source=grilla then accept:=true;
end;

procedure TForm1.grillaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if button=mbRight then (sender as TStringGrid).BeginDrag(true);
end;

procedure TForm1.FormActivate(Sender: TObject);
Var
cadena: string;
registro: TRegistryIniFile;
Begin
registro:= TRegistryIniFile.Create('SoftShield');
if (now()>=strtoDateTime('30/9/1999')) or (Registro.ReadString('Class', 'inherited', 'ERROR')<>'ERROR') then
begin
application.messagebox('Sorry this Demo has expired Contact The author','Time Expired',MB_OK+MB_ICONINFORMATION);
registro.WriteString('Class', 'inherited', '{A099AF}');
registro.Free;
close;
end
else
begin
registro.Free;
mixerCDLInStart;
if not(cdflag) then LocalizaCD;
if NumDevs>1 then cuebrwbtn.Enabled:=true;
PadBoxClick(sender);
{ponerfecha;}
end;
end;

procedure TForm1.Balbar11Change(Sender: TObject);
begin
canal11.Balance:=Balbar11.Position;
end;

procedure TForm1.Balbar11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if shift=[ssCtrl] then Balbar11.Position:=0;
end;

procedure TForm1.BalBar12Change(Sender: TObject);
begin
canal12.Balance:=Balbar12.Position;
end;

procedure TForm1.BalBar09Change(Sender: TObject);
begin
canal9.Balance:=Balbar09.Position;
end;

procedure TForm1.BalBar10Change(Sender: TObject);
begin
canal10.Balance:=BalBar10.Position;
end;

procedure TForm1.BalBar12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if shift=[ssCtrl] then Balbar12.Position:=0;
end;

procedure TForm1.BalBar09KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if shift=[ssCtrl] then Balbar09.Position:=0;
end;

procedure TForm1.BalBar10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if shift=[ssCtrl] then Balbar10.Position:=0;
end;

procedure TForm1.ABalmixClick(Sender: TObject);
begin
If Abalmix.Checked then
begin
LtoR.Enabled:=False;
RtoL.Enabled:=False;
afade.Checked:=True;
end
else
begin
LtoR.Enabled:=True;
RtoL.Enabled:=True;
end;
end;
procedure TForm1.AfadeClick(Sender: TObject);
begin
If not(Afade.Checked) then  Abalmix.Checked:=False;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
ponerfecha;
end;

procedure TForm1.canal4OpenComplete(Sender: TObject);
var
minutos,duration, segundos: integer;
begin
If cataloged then
begin
segundos:=trunc(canal4.duration);
duration:=trunc(canal4.duration*10);
minutos:= segundos div 60;
with grilla do
begin
Cells[0,listo4]:= format('%.5d',[row+1]);//Evento
Cells[20,listo4]:='25';//Type
Cells[3,listo4]:=format('%.2d:%.2d',[minutos,segundos mod 60]);//Duration xx:xx
Cells[6,listo4]:=inttostr(duration);//Fade Out (en decimas)
if duration>100 then //es la duración minima?
begin
Cells[7,listo4]:=inttostr(dfltIntro);// Intro (en decimas)
Cells[8,listo4]:=inttostr(duration - dfltOutro);//Outro (en decimas)
end
 else
 begin
 Cells[7,listo4]:='0';// Intro = cero
 Cells[8,listo4]:=inttostr(duration);//Outro = end
 end;
Cells[10,listo4]:=inttostr(duration);//Duracion en decimas
Cells[13,listo4]:=inttostr(duration);// End en decimas
Cells[17,listo4]:='0'//Common file
end;
cataloged:= False;
end;
end;
procedure TForm1.TrackBar5Change(Sender: TObject);
Var
ivol: TVolumetype;
pmcdsVol: PMIXERCONTROLDETAILSSIGNED;
begin
iVol.LeftVolume :=  TrackBar5.position shl 8;
iVol.RightVolume := iVol.LeftVolume;
IF cdflag then
begin
pmcdsVol:=pmcdsMixerDataSigned;
pmcdsvol.lValue:=iVol.LeftVolume;
inc(pmcdsVol);
pmcdsvol.lValue:=iVol.RightVolume;
If mixerSetControlDetails(hMX,@mcdMixerData,MIXER_GETCONTROLDETAILSF_VALUE)<>MMSYSERR_NOERROR then
begin
showmessage('Unable to set mixer device');
exit;
end;
end
else
auxSetVolume(Device, iVol.LongVolume);
cdvol.Caption:=inttostr(TrackBar5.position);
end;

procedure TForm1.CDControlsDragDrop(Sender, Source: TObject; X,
  Y: Integer);
Var
Fname: string;
begin
if source=filelistbox1 then
begin
Fname:=Uppercase(filelistbox1.FileName);
If pos('.CDA',Fname)>0 then
begin
cargaCDaudio(Fname);
mediaplayer1.TimeFormat:=tfTMSF;
cdtimer.Enabled:=true;
end
else
showmessage('Only CDTracks can be dropped here');
end;
end;

procedure TForm1.cargaCDaudio(Fname:string);
begin
mediaplayer1.FileName:=Fname;
mediaplayer1.Open;
mediaplayer1.Position:=filelistbox1.ItemIndex+1;
mediaplayer1.Pause;
end;

procedure TForm1.CDControlsDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
if source=filelistbox1 then Accept:=true;
end;

procedure TForm1.CDTimerTimer(Sender: TObject);
var
pos: TMSFRec;
min, sec: longint;
ATime: TDateTime;
begin
if mediaplayer1.mode <> mpOpen then
begin
pos:=tmsfRec(mediaplayer1.position);
min := (mediaplayer1.TrackLength[pos.track]) and $FF;
sec := ((mediaplayer1.TrackLength[pos.track]) and $FF00) div $100;
Atime:=strtotime(format('%.2d:%.2d',[min,sec]))-strtotime(format('%.2d:%.2d',[pos.minutes,pos.seconds]));
Tracknum.caption:=format('Track %.2d',[pos.track]);
CDLabel.Caption:='-'+ copy(timetostr(Atime),1,5);
{Controla AFade CD}
If fadecd then
  begin
  trackbar5.position:=trackbar5.position-declivefadecd;
       if Trackbar5.position = 0 then
              begin
                 fadecd:=False;
                 mediaplayer1.Stop;
              end;
  end;
end;
end;

procedure TForm1.MediaPlayer1Notify(Sender: TObject);
begin
with Sender as TMediaPlayer do
  begin
    if Mode=mpStopped then
    cdtimer.Enabled:=False
    else
    cdtimer.Enabled:=True;
  Notify := True;
  end;
end;

procedure TForm1.MediaPlayer1Click(Sender: TObject; Button: TMPBtnType;
  var DoDefault: Boolean);
begin

if  Button=btPlay then cdtimer.Enabled:=true;
if  (Button=btEject) and (mediaplayer1.mode = mpStopped)
 then cdtimer.Enabled:=False;
if  (Button=btEject) and (mediaplayer1.mode <> mpStopped)
 then Dodefault:=false;
if (button = btStop) and afade.Checked then
 begin
  Dodefault:=false;
  declivefadecd:=trackbar5.position div afadetime.value;
  fadecd:=true;
 end;
end;

procedure TForm1.CDvolClick(Sender: TObject);
begin
trackbar5.position:=CDLineSpin.Value;
end;

procedure TForm1.MediaPlayer1PostClick(Sender: TObject;
  Button: TMPBtnType);
begin
if cdtimer.Enabled=false then cdtimertimer(sender);
end;

procedure TForm1.CDPlayer1Click(Sender: TObject);
begin
CDPlayer1.Checked:=not(CDPlayer1.Checked);
ControlsPopUpCambio;
end;

procedure TForm1.localizaCD;
var
 AuxCaps: TAuxCaps;
 I: integer;
begin
device:=-1;
for I :=0 to auxGetNumDevs - 1 do
begin
auxGetDevCaps(I, @AuxCaps, SizeOf(AuxCaps));
if ((AuxCaps.dwSupport and AUXCAPS_VOLUME) <> 0) and
 ((AuxCaps.wTechnology and  AUXCAPS_CDAUDIO <> 0))
   then
device:=I;
end;
If device=-1 then ShowMessage('Unable to Locate CDLine In') else
begin
trackbar5.Enabled:=True;
cdflag:=false;
end;
end;
procedure TForm1.ApplyBtnClick(Sender: TObject);
begin
colocaoptions;
end;

procedure TForm1.FilterSupportChange(Sender: TObject);
begin
if FilterSupport.ItemIndex=0 then
begin
filelistbox1.MultiSelect:=True;
filelistbox1.ExtendedSelect:=True;
end
else
begin
filelistbox1.MultiSelect:=False;
filelistbox1.ExtendedSelect:=False;
end;
end;

procedure TForm1.SoftToolBtnClick(Sender: TObject);
begin
if SoftToolBtn.Down then selectecho:=dfltsoft;
end;

procedure TForm1.NormalToolBtnClick(Sender: TObject);
begin
if NormalToolBtn.Down then selectecho:=dflttecho;
end;

procedure TForm1.HighToolBtnClick(Sender: TObject);
begin
if HighToolBtn.Down then selectecho:=dfltmaximo;
end;

procedure TForm1.CustomToolBtnClick(Sender: TObject);
begin
if CustomToolBtn.Down then selectecho:=CustomVolspin.Value;
end;






procedure TForm1.Music1Click(Sender: TObject);
begin
typetoolbtn.ImageIndex:=(sender as TmenuItem).ImageIndex;
end;

procedure TForm1.CLipUpClick(Sender: TObject);
begin
If clipup.Checked then
begin
LANumlabel1.Color:=clTeal;
LANumlabel2.Color:=clTeal;
end
else
begin
LANumlabel1.Color:=clGray;
LANumlabel2.Color:=clGray;
end;
end;

procedure TForm1.ClipDownClick(Sender: TObject);
begin
If clipdown.Checked then
begin
LANumlabel3.Color:=clTeal;
LANumlabel4.Color:=clTeal;
end
else
begin
LANumlabel3.Color:=clGray;
LANumlabel4.Color:=clGray;
end;
end;

procedure TForm1.FileListBox1Change(Sender: TObject);
begin
if TagInfoTool.Down then
begin
cat:=TMpegAudio.Create;
cat.FileDetectionPrecision:=2;
cat.FileName:=FileListBox1.FileName;
BrwTitlelabel.Caption:='  '+ cat.Title;
BrwArtistLabel.Caption:='  '+ cat.Artist;
cat.Free;
end;
{else
begin
BrwTitlelabel.Caption:='  Tag info disabled';
BrwArtistLabel.Caption:='  Raptor Copyright 1999';
end;}
end;

procedure TForm1.TagInfoToolClick(Sender: TObject);
begin
if TagInfoTool.Down then
begin
filelistbox1.Height:=232;
BrwTitleLabel.Visible:=true;
BrwArtistLabel.Visible:=true;
end
else
begin
filelistbox1.Height:=264;
BrwTitleLabel.Visible:=False;
BrwArtistLabel.Visible:=False;
end;
end;
procedure TForm1.CueBrwBtnClick(Sender: TObject);
begin
if MpegPlayer.Paused then
  begin
    MpegPlayer.Paused:=false;
    mpegplayer.StreamName:=FileListbox1.FileName;
    mpegplayer.Open;
    mpegplayer.Play;
    CueBrwBtn.ImageIndex:=44;
  end
  else
  begin
    mpegplayer.StreamName:=FileListbox1.FileName;
    mpegplayer.Open;
    mpegplayer.play;
    mpegplayer.Paused:=True;
    CueBrwBtn.ImageIndex:=45;
  end;

end;

procedure TForm1.MPEGPlayerOpenStream(var Nonseekable: Boolean;
  var Context: Pointer);
var t:TFileStream;
begin
  t:=TFileStream.Create(MpegPlayer.StreamName, fmOpenRead or fmShareExclusive);
  Context:=pointer(t);
end;

procedure TForm1.MPEGPlayerCloseStream(Context: Pointer);
begin
TFileStream(handle).free;
end;

procedure TForm1.MPEGPlayerRestartStream(Context: Pointer;
  var res: Boolean);
begin
res:=((TFileStream(handle).Seek(0,soFromBeginning))=0);
end;

procedure TForm1.MPEGPlayerSeekStream(Context: Pointer; numbytes,
  MoveMethod: Integer; var res: Integer);
begin
res:=(TFileStream(handle).Seek(NumBytes,MoveMethod));
end;

procedure TForm1.MPEGPlayerGetStreamSize(Context: Pointer;
  var res: Integer);
begin
 res:=TFileStream(handle).Size;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
if combobox1.ItemIndex=0 then
begin
dbgrid1.Height:=137;
dbgrid2.top:=137;
dbgrid2.Height:=120;
ArtistsTable.MasterSource:=nil;
ArtistsTable.MasterFields:='';
ArtistsTable.IndexName:='ArtistIdx';
SongsTable.MasterSource:=DataSource1;
SongsTable.IndexName:='Artista';
SongsTable.MasterFields:='Code';
end
else
begin
dbgrid1.Height:=218;
dbgrid2.top:=218;
dbgrid2.Height:=40;
SongsTable.MasterSource:=nil;
SongsTable.MasterFields:='';
ArtistsTable.IndexName:='CodeIdx';
ArtistsTable.MasterSource:=DataSource2;
ArtistsTable.MasterFields:='Artist';
case combobox1.ItemIndex of
1:SongsTable.IndexName:='TitleIdx';
2:SongsTable.IndexName:='DurationIdx';
3:SongsTable.IndexName:='PassIdx';
4:SongsTable.IndexName:='LoadedIdx';
5:SongsTable.IndexName:='LastpassIdx';
end;
end;
end;
procedure TForm1.LoadButtonClick(Sender: TObject);
begin
LoadplstFrm.show;
end;

procedure TForm1.TrackBar6Change(Sender: TObject);
begin
OnAirVolabel.Caption:=inttostr(TrackBar6.position);
If Player=1 then canal1.Volume:=TrackBar6.position
else canal2.Volume:=TrackBar6.position;
end;

end.


