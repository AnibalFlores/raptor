unit MPEGPlay;

interface

uses
  Windows, Messages, SysUtils, Classes, ExtCtrls;

type ErrString = array[0..5] of string[50];

const plmOpened  = 0;
      plmReady   = 1;
      plmStopped = 2;
      plmPlaying = 3;
      plmPaused  = 4;

const  ErrStr : ErrString = ('MPEG library not loaded',
                             'Internal decoder error',
                             'Incorrect mode',
                             'Input stream error',
                             'Input stream is non-seekable',
                             'Output device failure');

type TMPEGError = class (Exception)
                  public
                    ErrCode : byte;
                    Constructor CreateErr(Mess:string; Err:byte);
                  end;

type TMPEGPlayer = class;

     MPInitProc = function:integer; stdcall;
     MPCMProc   = function:boolean; stdcall;
     MPOFNProc  = function (mode:integer; value:pchar):boolean; stdcall;
     MPSVProc   = function (value:integer):boolean; stdcall;
     MPPProc    = function (sp, ep :integer; v:pointer):integer; stdcall;
     MPDProc    = function (value:boolean):boolean; stdcall;
     MPFProc    = function:single; stdcall;
     CBCSProc   = procedure (obj:TMPegPlayer; var cant_seek:boolean; var res:pointer); stdcall;
     CBClSProc  = (*ResCloseStream*)procedure (obj:TMPegPlayer; handle :pointer); stdcall;
     CBRSSProc  = (*ResRestartStream*)procedure (obj:TMPegPlayer; handle :pointer; var res:boolean); stdcall;
     CBRSProc   = (*ResReadStream*) procedure(obj:TMPegPlayer; handle:pointer;
                                        var read_buffer;
                                        nNumberOfBytesToRead:longInt;
                                        var nNumberOfBytesRead:longInt;var res:boolean); stdcall;
     CBRSPProc  = (*ResSetPointer*)procedure(obj:TMPegPlayer; handle:pointer;
                                            NumBytes,MoveMethod:LongInt;var res:LongInt); stdcall;
     CBGSProc   = (*ResGetSize*) procedure (obj:TMPegPlayer; handle:pointer; var res:longint); stdcall;
     MPSISProc  = function (value:pchar;
                            from_res:boolean;
                            CBCS:CBCSProc;
                            CBClS:CBClSProc;
                            CBRSS:CBRSSProc;
                            CBRS:CBRSProc;
                            CBRSP:CBRSPProc;
                            CBGS:CBGSProc;opps:pointer):boolean; stdcall;

  TPlayPriority = (Idle,Lowest,BelowNormal,Normal,AboveNormal, Highest, TimeCritical);
  TOutputDevice = (wavemapper, pcmfile);

     TOpenStreamEvent = procedure (var Nonseekable:boolean; var Context:pointer) of object;
     // Event must return context, that will be passes to other stream-handling
     // functions
     // if the event fails, it returns nil
     TCloseStreamEvent = procedure (Context:pointer) of object;
     TRestartStreamEvent = procedure (Context:pointer; var res:boolean) of object;
     TReadStreamEvent = procedure (Context:pointer;var read_buffer;
                                   nNumberOfBytesToRead:LongInt;
                                   var nNumberOfBytesRead:LongInt; var res:boolean) of object;
     TSeekStreamEvent = procedure (Context:pointer; numbytes:LongInt;MoveMethod:LongInt; var res:LongInt) of object;
     // MoveMethod can be next:
     // FILE_BEGIN = 0;
     // FILE_CURRENT = 1;
     // FILE_END = 2;
     TGetStreamSizeEvent = procedure (Context:pointer; var res: longint) of object;
     TPosUpdateEvent = procedure (Pos,Len:longint) of object;

  TMPEGPlayer = class(TComponent)
  private
    DLLHandle    : THandle;
    FDLLPath     : string;
    FStreamName  : String;
    FOutFilename : string;
    FOutputDevice: integer;
    FStartPos    : integer;
    FEndPos      : integer;
    FOpened      : boolean;
    FPlayStarted : boolean;
    FPaused      : boolean;
    FPlayStopped : boolean;
    FAutoPlay    : boolean;
    FPriority    : integer;
    FSeekable    : boolean;
    FResource    : boolean;
    FUseTimer    : boolean;
    FTimerFreq   : integer;
    FPlayCount   : integer;
    PosUpdateTimer : TTimer;
    FOnPosUpdate : TPosUpdateEvent;
    FOnPlayEnd   : TNotifyEvent;
    FOpenEvent   : TOpenStreamEvent;
    FCloseEvent  : TCloseStreamEvent;
    FRestartEvent: TRestartStreamEvent;
    FGetSizeEvent: TGetStreamSizeEvent;
    FSeekEvent   : TSeekStreamEvent;
    FReadEvent   : TReadStreamEvent;
    FStreamLength : longint;

    {Dll Prodecures}
    DllInit            : MPCMProc;
    DllDeInit          : MPInitProc;
    DllOpen            : MPSISProc;
    DllPause           : MPDProc;
    DllStop            : MPCMProc;
    DllPlay            : MPPProc;
    DLLRestart         : MPCMProc;
    DllSetPriority     : MPSVProc;
    DllSetOutputDevice : MPOFNProc;
    DllClose           : MPCMProc;
    DllGetFrequency    : MPInitProc;
    DllGetBitRate      : MPInitProc;
    DllGetLayer        : MPInitProc;
    DllGetPlayerMode   : MPInitProc;
    DllGetCurrentPos   : MPInitProc;
    DllGetLength       : MPInitProc;
    DllResetPlayerMode : MPCMProc;
    DllSeek            : MPSVProc;
    DLLLastError       : MPInitProc;

    LE:integer;
    function LastError:integer;
    function GetLoaded:boolean;

    procedure SetOutFilename(value:string);

    procedure SetOutputDevice(value:TOutputDevice);
    function GetOutputDevice:TOutputDevice;

    procedure SetTimerFreq(value:integer);

  protected

    function GetPosition:integer;
    function GetPlayMode:integer;
    function GetFrequency:integer;
    function GetBitrate:integer;
    function GetLayer:integer;
    function GetLength:integer;
    procedure SetStreamName(value:string);
    procedure Seek(value:integer);
    function GetPlayStopped:boolean;
    procedure Pause(value:boolean);
    function  GetPriority:TPlayPriority;
    procedure SetPriority(P:TPlayPriority);
    procedure UpdateTimer(Sender: TObject); virtual;

  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    procedure Init;
    procedure Play;
    procedure Restart;
    procedure Stop;
    procedure Open;
    procedure Close;
    procedure Deinit;
    property Paused : boolean read FPaused write Pause;
    property CurrentPosition : integer read GetPosition write Seek;
    property Mode : integer read GetPlayMode;
    property Frequency : integer read GetFrequency;
    property Bitrate : integer read GetBitrate;
    property Layer : integer read GetLayer;
    property PlayStopped : boolean read GetPlayStopped;
    property Length : integer read FStreamLength;
    property DLLLoaded : boolean read GetLoaded;

  published
    property Seekable : boolean read FSeekable write FSeekable;
    property FromStream : boolean read FResource write FResource;
    property PlayerPriority : TPlayPriority read GetPriority write SetPriority;
    property UseTimer : boolean read FUseTimer write FUseTimer;
    property TimerFreq : integer read FTimerFreq write SetTimerFreq;
    property AutoPlay : boolean read FAutoPlay write FAutoPlay;
    property StreamName : String read FStreamName write SetStreamName;
    property OutputDevice: TOutputDevice read GetOutputDevice write SetOutputDevice;
    property OutFilename: string read FOutFilename write SetOutFilename;
    property PathToDLL : String read FDLLPath write FDLLPath;
    property StartPos : integer read FStartPos write FStartPos;
    property EndPos : integer read FEndPos write FEndPos;
    property PlayedXTimes : integer read FPlayCount;

    property OnOpenStream : TOpenStreamEvent read FOpenEvent write FOpenEvent;
    property OnCloseStream: TCloseStreamEvent read FCloseEvent  write FCloseEvent;
    property OnRestartStream: TRestartStreamEvent read FRestartEvent  write FRestartEvent;
    property OnGetStreamSize: TGetStreamSizeEvent read FGetSizeEvent write FGetSizeEvent;
    property OnSeekStream : TSeekStreamEvent read FSeekEvent write FSeekEvent;
    property OnReadStream : TReadStreamEvent read FReadEvent write FReadEvent;

    property OnPosUpdate:TPosUpdateEvent read FOnPosUpdate write FOnPosUpdate;
    property OnPlayEnd : TNotifyEvent read FOnPlayEnd write FOnPlayEnd;
  end;

procedure Register;

implementation

Constructor TMPEGError.CreateErr;
begin
  inherited Create(Mess);
  ErrCode:=Err;
end;

procedure CBCS (obj:TMPegPlayer; var cant_seek:boolean; var res:pointer); stdcall;
begin
  if Assigned(Obj.OnOpenStream) then Obj.OnOpenStream(cant_seek, res) else
     res:=nil;
end;

procedure CBClS (obj:TMPegPlayer; handle :pointer); stdcall;
begin
  if Assigned(Obj.OnCloseStream) then Obj.OnCloseStream(handle);
end;

procedure CBRSS (obj:TMPegPlayer; handle :pointer; var res : boolean); stdcall;
begin
  if Assigned(Obj.OnRestartStream) then Obj.OnRestartStream(handle, res)
  else res:=false;
end;

procedure CBRS (obj:TMPegPlayer; handle:pointer;
                   var read_buffer;
                   nNumberOfBytesToRead:longint;
                   var nNumberOfBytesRead:longInt; var res:boolean); stdcall;
begin
  if Assigned(Obj.OnReadStream) then Obj.OnReadStream(handle,read_buffer,nNumberOfBytesToRead,nNumberOfBytesRead,res) else
  res:=false;
end;

procedure CBRSP (obj:TMPegPlayer; handle:pointer;
                        NumBytes,MoveMethod:LongInt; var res:LongInt); stdcall;
begin
  if Assigned(Obj.OnSeekStream) then Obj.OnSeekStream(handle,NumBytes,MoveMethod, res) else
     res:=-1;
end;

procedure CBGS (obj:TMPegPlayer; handle:pointer; var res:longint); stdcall;
begin
  if Assigned (Obj.OnGetStreamSize) then Obj.OnGetStreamSize(handle,res) else res:=-1;
end;

function TMPEGPlayer.LastError;
begin
  if (@DLLLastError<>nil) then
    result:=DLLLastError else
    result:=0;
end;

function TMPEGPlayer.GetLoaded;
begin
  result:=DLLHandle<>0;
end;

constructor TMPEGPlayer.Create;
begin
  inherited Create(AOwner);
  FPlayStopped := false;
  FPlayStarted := false;
end;

destructor TMPEGPlayer.Destroy;
begin
  PosUpdateTimer.free;
  inherited Destroy;
end;

procedure TMPEGPlayer.UpdateTimer(Sender: TObject);
var
  l:longint;
begin
  if not(FOpened) or not(FPlayStarted) then
  begin
    PosUpdateTimer.Enabled := false;
    exit;
  end;
  l := CurrentPosition;
  if l>FStreamLength then l := 0;
  if assigned(FOnPosUpdate) then FOnPosUpdate(l,FStreamLength);
  if FPlayStopped then
  begin
    PosUpdateTimer.Enabled := false;
    FPlayStarted := false;
    if assigned(FOnPlayEnd) then
    begin
      FPlayStopped := false;
      FOnPlayEnd(Self);
    end;
  end;
end;

procedure TMPEGPlayer.Init;
var s:string;

begin
  s:=FDLLPath;
  if (FDLLPath<>'') and (FDLLPath[system.Length(FDLLPath)]<>'\')
  and (FDLLPath[system.Length(FDLLPath)]<>':') then s:=s+'\';
    s:=s+'mpegdll.dll'#0;
  DLLHandle:=LoadLibrary(@S[1]);
  if DLLHandle=0 then Raise TMPEGError.Create('Can''t load MPEG library');
  @DllInit            :=GetProcAddress(DLLHandle,'init');
  @DllDeInit          := GetProcAddress(DLLHandle,'deinit');
  @DllOpen            := GetProcAddress(DLLHandle,'Open');
  @DllPause           := GetProcAddress(DLLHandle,'Pause');
  @DllRestart         := GetProcAddress(DLLHandle,'Restart');
  @DllStop            := GetProcAddress(DLLHandle,'Stop');
  @DllSetPriority     := GetProcAddress(DLLHandle,'SetPriority');
  @DllSetOutputDevice := GetProcAddress(DLLHandle,'SetOutputDevice');
  @DllPlay            := GetProcAddress(DLLHandle,'Play');
  @DllClose           := GetProcAddress(DLLHandle,'Close');
  @DllGetFrequency    := GetProcAddress(DLLHandle,'GetFrequency');
  @DllGetBitRate      := GetProcAddress(DLLHandle,'GetBitrate');
  @DllGetLayer        := GetProcAddress(DLLHandle,'GetLayer');
  @DllGetPlayerMode   := GetProcAddress(DLLHandle,'GetPlayerMode');
  @DllGetCurrentPos   := GetProcAddress(DLLHandle,'GetCurrentPos');
  @DllGetLength       := GetProcAddress(DLLHandle,'GetLength');
  @DllResetPlayerMode := GetProcAddress(DLLHandle,'ResetPlayerMode');
  @DllSeek            := GetProcAddress(DLLHandle,'Seek');
  @DLLLastError       := GetProcAddress(DLLHandle,'LastError');

  if (@DllInit=nil)
  or (@DllDeInit=nil)
  or (@DllOpen=nil)
  or (@DllPause=nil)
  or (@DllRestart=nil)
  or (@DllStop=nil)
  or (@DllSetPriority=nil)
  or (@DllSetOutputDevice=nil)
  or (@DllPlay=nil)
  or (@DllClose=nil)
  or (@DllGetFrequency=nil)
  or (@DllGetBitRate=nil)
  or (@DllGetLayer=nil)
  or (@DllGetPlayerMode=nil)
  or (@DllGetCurrentPos=nil)
  or (@DllGetLength=nil)
  or (@DllResetPlayerMode=nil)
  or (@DllSeek=nil)
  or (@DLLLastError=nil)
  then begin
    FreeLibrary(DLLHandle);
    DLLHandle:=0;
    Raise TMPEGError.CreateErr(ErrStr[0],0);
  end;
  if DllInit=false then
  begin
    LE:=LastError;
    DLLHandle:=0;
    Raise TMPEGError.CreateErr(ErrStr[LE],LE);
  end;
  PosUpdateTimer := TTimer.create(self);
  PosUpdateTimer.OnTimer := UpdateTimer;
  PosUpdateTimer.Enabled := false;
  PosUpdateTimer.Interval := TimerFreq;
  if not UseTimer then PosUpdateTimer.Interval := 0;
  FStreamLength := 0;
end;

procedure TMPEGPlayer.Deinit;
begin
  if DLLHandle=0 then Raise TMPEGError.CreateErr(ErrStr[0],0);
  if FOpened then Close;
  if @DLLDeInit<>nil then DLLDeInit;
  FreeLibrary(DLLHandle);
  DLLHandle:=0;
  @DllInit            := nil;
  @DllDeInit          := nil;
  @DllOpen            := nil;
  @DllPause           := nil;
  @DLLRestart         := nil;
  @DllStop            := nil;
  @DllSetPriority     := nil;
  @DllSetOutputDevice := nil;
  @DllPlay            := nil;
  @DllClose           := nil;
  @DllGetFrequency    := nil;
  @DllGetBitRate      := nil;
  @DllGetLayer        := nil;
  @DllGetPlayerMode   := nil;
  @DllGetCurrentPos   := nil;
  @DllGetLength       := nil;
  @DllResetPlayerMode := nil;
  @DllSeek            := nil;
  @DLLLastError       := nil;
end;

procedure TMPEGPlayer.Open;
var p:pchar;

begin
  if DLLHandle=0 then Raise TMPEGError.CreateErr(ErrStr[0],0);
  if FOpened then Close;
  FOpened := false;

    if FResource then
    begin
      DLLOpen(nil,true,CBCS,CBClS,CBRSS,CBRS,CBRSP,CBGS,self);
      LE:=LastError;
    end
    else
    begin
      if FStreamName = '' then
         Raise TMPEGError.CreateErr('Can''t play non-specified stream',254);

      GetMem(p,512);
      StrPCopy(p,FStreamName);
      DLLOpen(p, false, nil,nil,nil,nil,nil,nil,nil);
      LE:=LastError;
      FreeMem(p,512);
    end;
    if LE>0 then
      Raise TMPEGError.CreateErr(ErrStr[LE],LE);
    FOpened:=true;
    FPlayCount:=1;
    FStreamLength:=GetLength;
    if AutoPlay then Play;
end;

procedure TMPEGPlayer.Pause(value:boolean);
begin
  if DLLHandle=0 then Raise TMPEGError.CreateErr(ErrStr[0],0);
  if not(FPlayStarted) or (FPlayStopped) then
  begin
    FPaused := false;
    if value then Raise TMPEGError.CreateErr(ErrStr[2],2);
    exit;
  end;
    DLLPause(not value);
    LE:=LastError;
    if LE>0 then Raise TMPEGError.CreateErr(ErrStr[LE],LE);
    FPaused:=value;
end;

procedure TMPEGPlayer.Stop;
begin
  if not(FPlayStarted) or (FPlayStopped) then
    Raise TMPEGError.CreateErr(ErrStr[2],2);
  if DLLHandle=0 then Raise TMPEGError.CreateErr(ErrStr[0],0);
    DLLStop;
    LE:=LastError;
    if LE>0 then Raise TMPEGError.CreateErr(ErrStr[LE],LE);
    FPlayStarted := false;
    FPaused:=false;
end;

procedure TMPEGPlayer.Restart;
begin
  if DLLHandle=0 then Raise TMPEGError.CreateErr(ErrStr[0],0);
  if not FOpened then Raise TMPEGError.CreateErr(ErrStr[2],2);
  FPlayStopped:=false;
  DllRestart;
  LE:=LastError;
  if LE>0 then Raise TMPEGError.CreateErr(ErrStr[LE],LE);
  FPlayStarted := true;
  inc(FPlayCount);
  if (UseTimer) and (PosUpdateTimer.Interval<>0) then
  begin
    PosUpdateTimer.Enabled := true;
    UpdateTimer(self);
  end;
end;

procedure TMPEGPlayer.Play;
var p      : pchar;
    b      : integer;

begin
  if DLLHandle=0 then Raise TMPEGError.CreateErr(ErrStr[0],0);
  if FPaused then
  begin
    Pause(false);
    exit;
  end;
  if FPlayStarted then exit;
  if not FOpened then Open;
  if not FOpened then exit;
  if FPlayCount>1 then
  begin
    Restart;
    exit;
  end;
    DLLSetPriority(FPriority);
    LE:=LastError;
    if LE>0 then Raise TMPEGError.CreateErr(ErrStr[LE],LE);

    GetMem(p,260);
    StrPCopy(p,FOutFilename);
    DllSetOutPutDevice(FOutputDevice,p);
    FreeMem(p,260);
    LE:=LastError;
    if (LE>0) then Raise TMPEGError.CreateErr(ErrStr[LE],LE);

    b:=DllPlay(FStartPos, FEndPos,@FPlayStopped);
    LE:=LastError;
    if (LE>0) or (b<>0) then Raise TMPEGError.CreateErr(ErrStr[LE],LE);
    FPlayStarted := true;
    inc(FPlayCount);
    if (UseTimer) and (PosUpdateTimer.Interval<>0) then
    begin
      PosUpdateTimer.Enabled := true;
      UpdateTimer(self);
    end;
end;

procedure TMPEGPlayer.Close;
begin
  if DLLHandle=0 then Raise TMPEGError.CreateErr(ErrStr[0],0);
  FOpened := false;
  FPaused:=false;
  FPlayStarted := false;
  FPlayCount:=0;
  DllClose;
  LE:=LastError;
  if LE>0 then Raise TMPEGError.CreateErr(ErrStr[LE],LE);
end;

function TMPEGPlayer.GetFrequency:integer;
begin
  if DLLHandle=0 then Raise TMPEGError.CreateErr(ErrStr[0],0);
  result:=DLLGetFrequency;
  LE:=LastError;
  if LE>0 then Raise TMPEGError.CreateErr(ErrStr[LE],LE);
end;

function TMPEGPlayer.GetBitrate:integer;
begin
  if DLLHandle=0 then Raise TMPEGError.CreateErr(ErrStr[0],0);
  result:=DLLGetBitrate;
  LE:=LastError;
  if LE>0 then Raise TMPEGError.CreateErr(ErrStr[LE],LE);
end;

function TMPEGPlayer.GetLayer:integer;
begin
  if DLLHandle=0 then Raise TMPEGError.CreateErr(ErrStr[0],0);
    result:=DLLGetLayer;
    LE:=LastError;
    if LE>0 then Raise TMPEGError.CreateErr(ErrStr[LE],LE);
end;

function TMPEGPlayer.GetPlayMode;
begin
  if DLLHandle=0 then Raise TMPEGError.CreateErr(ErrStr[0],0);
    result:=DLLGetPlayerMode;
    LE:=LastError;
    if LE>0 then Raise TMPEGError.CreateErr(ErrStr[LE],LE);
end;

function TMPEGPlayer.GetPosition;
begin
  if DLLHandle=0 then Raise TMPEGError.CreateErr(ErrStr[0],0);
    result:=DLLGetCurrentPos;
    LE:=LastError;
    if LE>0 then Raise TMPEGError.CreateErr(ErrStr[LE],LE);
end;

function TMPEGPlayer.GetLength;
begin
  if DLLHandle=0 then Raise TMPEGError.CreateErr(ErrStr[0],0);
    result:=DLLGetLength;
    LE:=LastError;
    if LE>0 then Raise TMPEGError.CreateErr(ErrStr[LE],LE);
end;

function TMPEGPlayer.GetPlayStopped;
begin
  if DLLHandle=0 then Raise TMPEGError.CreateErr(ErrStr[0],0);
  result:=FPlayStopped;
  if result then
  begin
    result:=DllResetPlayerMode;
    LE:=LastError;
    if LE>0 then Raise TMPEGError.CreateErr(ErrStr[LE],LE);
    FPlayStarted := false;
  end;
end;

procedure TMPEGPlayer.SetStreamName;
begin
  FStreamName:=value;
  if FOpened then Close;
end;

procedure TMPEGPlayer.Seek;
begin
  if DLLHandle=0 then Raise TMPEGError.CreateErr(ErrStr[0],0);
    DLLSeek(value);
    LE:=LastError;
    if LE>0 then Raise TMPEGError.CreateErr(ErrStr[LE],LE);
end;

procedure TMPEGPlayer.SetPriority(P:TPlayPriority);
begin
  case p of
    Idle         : fPriority := THREAD_PRIORITY_IDLE;
    Lowest       : fPriority := THREAD_PRIORITY_LOWEST;
    BelowNormal  : fPriority := THREAD_PRIORITY_Below_Normal;
    Normal       : fPriority := THREAD_PRIORITY_NORMAL;
    AboveNormal  : fPriority := THREAD_PRIORITY_ABOVE_NORMAL;
    Highest      : fPriority := THREAD_PRIORITY_HIGHEST;
    TimeCritical : fPriority := THREAD_PRIORITY_TIME_CRITICAL;
  end;
  if DLLHandle<>0 then
  begin
    DLLSetPriority(FPriority);
    LE:=LastError;
    if LE>0 then Raise TMPEGError.CreateErr(ErrStr[LE],LE);
  end;
end;

function TMPEGPlayer.GetPriority:TPlayPriority;
begin
  case fPriority of
    THREAD_PRIORITY_IDLE          : GetPriority := Idle;
    THREAD_PRIORITY_LOWEST        : GetPriority := Lowest;
    THREAD_PRIORITY_Below_Normal  : GetPriority := BelowNormal;
    THREAD_PRIORITY_NORMAL        : GetPriority := Normal;
    THREAD_PRIORITY_ABOVE_NORMAL  : GetPriority := AboveNormal;
    THREAD_PRIORITY_HIGHEST       : GetPriority := Highest;
    THREAD_PRIORITY_TIME_CRITICAL : GetPriority := TimeCritical;
    else GetPriority := Normal;
  end;
end;

procedure TMPEGPlayer.SetOutFilename;
begin
  FOutFileName:=value;
end;

procedure TMPEGPlayer.SetTimerFreq;
begin
  FTimerFreq:=value;
  if value=0 then UseTimer:=false;
end;

procedure TMPEGPlayer.SetOutputDevice;
begin
  if FOutFilename='' then FOutputDevice:=0 else
  if value=wavemapper then FOutputDevice:=0 else FOutputDevice:=2;
end;

function TMPEGPlayer.GetOutputDevice;
begin
  if FOutputDevice=0 then result:=wavemapper else result:=pcmfile;
end;

procedure Register;
begin
  RegisterComponents('Wabbit''s', [TMPEGPlayer]);
end;

end.
