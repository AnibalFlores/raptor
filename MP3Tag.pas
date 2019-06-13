unit MP3Tag;
{
TMP3Tag by MindBlast Software
www.gcs.co.za/mbs/mbs.htm

Description: Read/Saves/Removes a tag from an MP3 music file.
Also known as the ID3 Info Tag.
(Don't know about MP3 files? Go check out www.winamp.com)

* Built in Tag editor!!! Just set the filename and call the "Edit" method!

This component is released as FREEWARE.
Please visit our website for more great MP3 and other components.
-->  www.gcs.co.za/mbs/mbs.htm
Please contact me for any suggestions, comments, bugs, etc. at
-->  louw@gcs.co.za

Some general ID3 Tag information:
 Tag located in the last 128 bytes of file.
 You can use this record to read the data from an MP3 file.
 TReadWriteTag = packed record
    TAG    : Array[1..3] of char;
    Title  : Array[1..30] of char;
    Artist : Array[1..30] of char;
    Album  : Array[1..30] of char;
    Year   : Array[1..4] of char;
    Comment: Array[1..29] of char;
    TrackNum : Byte;
    Genre  : Byte;
  end;
To check if the MP3 file contains a tag or if the tag is valid,
you must check if TAG = 'TAG'.  


Disclaimer: You use this component at your own and exclusive risk.

}


interface
 {$R MP3TagRes.res}

uses
  Windows, SysUtils, Classes, Graphics, Forms, Dialogs,
  {ScrollLabel,} DsgnIntF, TypInfo, StdCtrls, ExtCtrls, Controls;


Const
  erCancel = 0;
  erSave   = 1;
  erRemove = 2;

  MAXGENRES = 114;
  GENRES: array [0..MAXGENRES] of String = (
  'Blues','Classic Rock','Country','Dance','Disco','Funk','Grunge','Hip-Hop','Jazz','Metal','New Age','Oldies',
  'Other','Pop','R&B','Rap','Reggae','Rock','Techno','Industrial','Alternative','Ska','Death Metal','Pranks',
  'Soundtrack','Euro-Techno','Ambient','Trip-Hop','Vocal','Jazz+Funk','Fusion','Trance','Classical','Instrumental',
  'Acid','House','Game','Sound Clip','Gospel','Noise','AlternRock','Bass','Soul','Punk','Space','Meditative',
  'Instrumental Pop','Instrumental Rock','Ethnic','Gothic','Darkwave','Techno-Industrial','Electronic','Pop-Folk',
  'Eurodance','Dream','Southern Rock','Comedy','Cult','Gangsta','Top 40','Christian Rap','Pop/Funk','Jungle',
  'Native American','Cabaret','New Wave','Psychadelic','Rave','Showtunes','Trailer','Lo-Fi','Tribal','Acid Punk',
  'Acid Jazz','Polka','Retro','Musical','Rock & Roll','Hard Rock','Folk','Folk/Rock','National Folk','Swing','Bebob',
  'Latin','Revival','Celtic','Bluegrass','Avantgarde','Gothic Rock','Progressive Rock','Psychedelic Rock','Symphonic Rock',
  'Slow Rock','Big Band','Chorus','Easy Listening','Acoustic','Humour','Speech','Chanson','Opera','Chamber Music','Sonata',
  'Symphony','Booty Bass','Primus','Porn Groove','Satire','Slow Jam','Club','Tango','Samba','Folklore'
  );

type
  String03 = String[3];
  String04 = String[4];
  String30 = String[30];
  String29 = String[29];

  TFileName    = Type String;

  TTag = packed record
    Tag       : String03;
    Title     : String30;
    Artist    : String30;
    Album     : String30;
    Year      : String04;
    Comment   : String29;
    TrackNum  : Byte;
    GenreID   : Byte;
   end;

  TErrorEvent = procedure(Sender: TObject; Error : String) of Object;

  TMP3Tag = class(TComponent)
  private
    FFileName  : TFileName;
    FValid     : Boolean;
    FTag       : TTag;
    FGenre     : String;
    FError     : String;

    FAutoSave  : Boolean;
    //If you press "Save" in the edit box it saves automatically

    FOnFileChange : TNotifyEvent;
    FOnChange     : TNotifyEvent;
    FOnError      : TErrorEvent;

    procedure SetFileName(Value: TFileName);
    procedure SetTitle(Value: String30);
    procedure SetArtist(Value: String30);
    procedure SetAlbum(Value: String30);
    procedure SetYear(Value: String04);
    procedure SetComment(Value: String29);
    procedure SetTrackNum(Value: Byte);
    procedure SetGenreID(Value: Byte);
    procedure SetTag(Value: TTag);

  protected

  public
    procedure Open;
    procedure Remove;
    procedure Save;
    Function  Edit:Byte;
  published
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property Filename  :TFilename read FFilename    write SetFilename;
    property MP3Tag    : TTag     read FTag         write SetTag;

    property Title     : String30 read FTag.Title   write SetTitle;
    property Artist    : String30 read FTag.Artist  write SetArtist;
    property Album     : String30 read FTag.Album   write SetAlbum;
    property Year      : String04 read FTag.Year    write SetYear;
    property Comment   : String29 read FTag.Comment write SetComment;
    property GenreID   : Byte     read FTag.GenreID write SetGenreID;
    property TrackNum  : Byte     read FTag.TrackNum write SetTrackNum;
    property Genre     : String   read FGenre;

    property EditAutoSave : Boolean read FAutoSave  write FAutoSave;

    property Valid: Boolean read FValid;
    property Error: String read FError;

    property onFileNameChange  : TNotifyEvent read FOnFileChange write FOnFileChange;
    property onChange : TNotifyEvent read FOnChange write FOnChange;
    property onError  : TErrorEvent  read FOnError  write FOnError;
  end;

  TMP3TagEditor = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    cb1: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    cb2: TComboBox;
    Label7: TLabel;
    Edit6: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    {sl         : TScrollLabel;}
    MP3i       : TMP3Tag;
    EditResult : Byte;
  public
    { Public declarations }
  end;

  TFileNameProperty = Class(TStringProperty)
     function GetAttributes : TPropertyAttributes; override;
     procedure Edit; override;
  End;

procedure Register;

var
  MP3TagEditor: TMP3TagEditor;

implementation

{$R *.DFM}


{---------------------------------------------------------------}
{       The code that follow directly are the Edit window       }
{       contained in the component                              }
{---------------------------------------------------------------}

procedure TMP3TagEditor.FormCreate(Sender: TObject);
Var
 Tel : Cardinal;
begin
 {sl:=TscrollLabel.create(self);
 With sl do
  begin
   parent:=panel1;
   align:=alClient;
   caption:='FileName';
   active:=False;
   scrollby:=1;
   Interval:=100;
   WaitOnEnd:=3000;
   color:=clTeal;
   font.color:=clWhite;
  end;}

  For Tel := 0 to MaxGenres do
   cb1.Items.add(Genres[Tel]);

  mp3i:=TMP3Tag.Create(Self);
end;

procedure TMP3TagEditor.Button2Click(Sender: TObject);
begin
  EditResult:=erSave;
  Close;
end;

procedure TMP3TagEditor.Button3Click(Sender: TObject);
begin
 EditResult:=erCancel;
 Close;
end;

procedure TMP3TagEditor.Button4Click(Sender: TObject);
begin
  EditResult:=erRemove;
  //Mp3i.Remove;
  Close;
end;

procedure TMP3TagEditor.FormShow(Sender: TObject);
begin
 With mp3i do
  begin
   edit1.text:=Title;
   edit2.text:=Artist;
   edit3.text:=Album;
   edit4.text:=Year;
   cb1.ItemIndex:=GenreID;
   cb2.ItemIndex:=TrackNum;
   edit5.text:=Comment;
   edit6.Text:=FileName;
   {sl.caption:=filename;
   sl.active:=true;}
  end;
end;

{---------------------------------------------------------------}
{   Component part follows                                      }
{   This handles all the main tag functions                     }
{---------------------------------------------------------------}

Type
 TReadWriteTag = packed record
    TAG    : Array[1..3] of char;
    Title  : Array[1..30] of char;
    Artist : Array[1..30] of char;
    Album  : Array[1..30] of char;
    Year   : Array[1..4] of char;
    Comment: Array[1..29] of char;
    TrackNum : Byte;
    Genre  : Byte;
end;

{----------------------------------------------------------}
//             Property editor for filename               //
{----------------------------------------------------------}

 function TFileNameProperty.GetAttributes:TPropertyAttributes;
 Begin
  Result:=[paDialog];
 end;

 {----------------------------------------------------------}

 procedure TFileNameProperty.Edit;
 Var
  OpenDialog : TOpenDialog;
 Begin
   OpenDialog := TOpenDialog.Create(Application);
   Try
     OpenDialog.Filter:='MP3 Files   (*.MP3)|*.MP3';
     OpenDialog.DefaultExt:='MP3';

     If OpenDialog.Execute then
      SetStrValue(OpenDialog.FileName);
   finally
      opendialog.free;
   end;
 end;

{--------------------------------------------}

procedure TMP3Tag.SetFileName(Value: TFileName);
begin
   FFileName:=Value;
   Open;
   if Assigned(onFileNameChange) then onFileNameChange(Self);
end;


procedure TMP3Tag.SetTitle(Value: String30);
begin
   FTag.Title:=Value;
   if Assigned(onChange) then onChange(Self);
end;

procedure TMP3Tag.SetArtist(Value: String30);
begin
   FTag.Artist:=Value;
   if Assigned(onChange) then onChange(Self);
end;

procedure TMP3Tag.SetAlbum(Value: String30);
begin
   FTag.Album:=Value;
   if Assigned(onChange) then onChange(Self);
end;

procedure TMP3Tag.SetYear(Value: String04);
begin
   FTag.Year:=Value;
   if Assigned(onChange) then onChange(Self);
end;

procedure TMP3Tag.SetComment(Value: String29);
begin
   FTag.Comment:=Value;
   if Assigned(onChange) then onChange(Self);
end;

procedure TMP3Tag.SetGenreID(Value: Byte);
begin
   FTag.GenreID:=Value;
   if Assigned(onChange) then onChange(Self);
end;

procedure TMP3Tag.SetTrackNum(Value: Byte);
begin
   FTag.TrackNum:=Value;
   if Assigned(onChange) then onChange(Self);
end;
{------------------------------------}

procedure TMP3Tag.SetTag(Value: TTag);
begin
   FTag:=Value;
   if Assigned(onChange) then onChange(Self);
end;

{-------------------------------------}



procedure ClearTag(Var ATag : TTag);
Begin
 With aTag do
  Begin
   Tag:='';
   Title:='';
   Artist:='';
   Album:='';
   Year:='';
   Comment:='';
   TrackNum:=0;
   GenreID:=12;
  end;
End;


procedure TMP3Tag.Open;

Function RemoveSpaces(St : String):String;
Var
 T : Byte;
Begin
 T:=Length(ST);
 While (T>0) and (St[T]=' ') do
  Dec(T);
 Result:=Copy(St,1,T);
End;


procedure FillTag(STag : TReadWriteTag; Var DTag : TTag);
Var
 T : Byte;
Begin

 ClearTag(DTag);

 For T:=1 to 3 do
   DTag.Tag:=DTag.Tag+STag.Tag[T];

 For T:=1 to 4 do
   DTag.Year:=DTag.Year+STag.Year[T];

 For T:=1 to 30 do
  Begin
   DTag.Artist:=DTag.Artist+STag.Artist[T];
   DTag.Title:=DTag.Title+STag.Title[T];
   DTag.Album:=DTag.Album+STag.Album[T];
   DTag.Comment:=DTag.Comment+STag.Comment[T];
  end;

 DTag.GenreID:=STag.Genre;
 DTag.TrackNum:=STag.TrackNum;

 DTag.Artist:=RemoveSpaces(DTag.Artist);
 DTag.Title:=RemoveSpaces(DTag.Title);
 DTag.Album:=RemoveSpaces(DTag.Album);
 DTag.Comment:=RemoveSpaces(DTag.Comment);
 DTag.Year:=RemoveSpaces(DTag.Year);
end;

Var
 aStream : TFileStream;
 ATag    : TReadWriteTag;
begin
 FValid:=False;
 ClearTag(FTag);
 IF FileExists(FFileName) then
  Begin
   aStream := TFileStream.Create(FFileName, fmOpenRead or fmShareDenyWrite);
   IF AStream.Size>128 then
    Begin
      aStream.Seek(-128,soFromEnd);
      aStream.ReadBuffer(aTag, 128);
      FillTag(aTag,FTag);
      IF FTag.Tag = 'TAG' then
       Begin
         FValid:=True;
       end Else
        Begin
         FError:='MP3 does not contain a mp3 tag or wrong file format!';
         ClearTag(FTag);
         FTag.Tag:='TAG';
         FTag.Title:=Copy(ExtractFileName(FFileName),1,30);
        end;

    end else FError:='File too small to be a MP3 file!';
   aStream.Free;
  end else FError:='File does not exist!';
 IF Not FValid then
  IF Assigned(OnError) then OnError(Self,FError);
end;

procedure TMP3Tag.Remove;
var
  aFile  : file;
  aTag   : TReadWriteTag;

begin
  If FileExists (FFileName) then begin
    AssignFile (aFile, FFileName);
    {$I-}
    Reset (aFile,1);
    {$I+}
    if (IOResult=0) and (FileSize(aFile) > 128) then begin
       Seek(AFile,FileSize(aFile)-128);
       BlockRead(aFile, ATag, 128);
       if aTag.TAG='TAG' then begin
         Seek (aFile,FileSize(aFile)-128);
         Truncate(aFile);
       end;
       Close(aFile);
    end;

    ClearTag(FTag);
    Open;
  end;
end;

procedure TMP3Tag.Save;

procedure FillReadWriteTag(STag : TTag; Var DTag : TReadWriteTag);
Begin

 FillChar (DTag, SizeOf(DTag), 0);

 DTag.Tag:='TAG';

 Move (STag.Year[1],DTag.Year, Length(STag.Year));
 Move (STag.Artist[1],DTag.Artist, Length(STag.Artist));
 Move (STag.Title[1],DTag.Title, Length(STag.Title));
 Move (STag.Album[1],DTag.Album, Length(STag.Album));
 Move (STag.Comment[1],DTag.Comment, Length(STag.Comment));
 DTag.TrackNum:=STag.TrackNum;
 DTag.Genre:=STag.GenreID;
end;


Var
 aStream : TFileStream;
 aTag    : TReadWriteTag;
begin
 FError:='';
 IF FileExists(FFileName) then
  Begin
   aStream := TFileStream.Create(FFileName, fmOpenReadWrite or fmShareDenyWrite);
   IF AStream.Size>128 then
    Begin
      aStream.Seek(-128,soFromEnd);
      aStream.ReadBuffer(aTag, 128);
      IF aTag.Tag = 'TAG' then aStream.Seek(-128,soFromEnd)
      Else aStream.Seek(0,soFromEnd);
    end else aStream.Seek(0,soFromEnd);
    FillReadWriteTag(FTag,ATag);
    aStream.WriteBuffer(aTag, 128);
    aStream.Free;
  end else FError:='File does not exist!';

  IF FError<>'' then
  IF Assigned(OnError) then OnError(Self,FError);
end;

function TMP3Tag.Edit:Byte;
Var
  EditTag : TMP3TagEditor;
Begin
  EditTag := TMP3TagEditor.Create(Application);
  Try
    EditTag.MP3i.Filename:=Self.Filename;
    EditTag.ShowModal;
    Case EditTag.EditResult of
     erCancel : {Do nothing};
     erSave   : Begin
                 IF FAutoSave then
                   Begin
                      With EditTag.mp3i do
                       begin
                        Title:=EditTag.edit1.text;
                        Artist:=EditTag.edit2.text;
                        Album:=EditTag.edit3.text;
                        Year:=EditTag.edit4.text;
                        Comment:=EditTag.edit5.text;
                        TrackNum:=EditTag.cb2.ItemIndex;
                        GenreID:=EditTag.cb1.ItemIndex;
                       end;
                      EditTag.mp3i.Save;
                   end;
                end;
       erRemove : EditTag.mp3i.Remove;
     End;
  finally
     Result:=EditTag.EditResult;
     EditTag.Destroy;
  end;

end;


{-------------------------------------}

constructor TMP3Tag.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   FError:='';
   FAutoSave:=True;
end;

destructor TMP3Tag.Destroy;
begin
   inherited Destroy;
end;

{---------------------------}


procedure Register;
begin
  RegisterComponents('MBS', [TMP3Tag]);
  RegisterPropertyEditor(TypeInfo(TFileName),TMP3Tag,
                          'FileName',TFileNameProperty);
end;

procedure TMP3TagEditor.FormDestroy(Sender: TObject);
begin
 IF mp3i<>nil then
   mp3i.Free;
 {IF sl<>nil then
  Sl.Free;}
end;

procedure TMP3TagEditor.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
 Case key of
  '0'..'9' : {Do nothing};
  else Key:=#0;
 end;
end;

end.
