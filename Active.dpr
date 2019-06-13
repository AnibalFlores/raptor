program Active;

uses
  Forms,
  Frontend in 'Frontend.pas' {Form1},
  MPGTools in 'Mpgtools.pas',
  editfor in 'editfor.pas' {EditForm},
  Padsunit in 'Padsunit.pas' {Pads},
  Quickdir in 'Quickdir.pas' {Quickform},
  Timeannou in 'Timeannou.pas' {TimeForm},
  MPEGPlay in 'MPEGPlay.pas',
  Loadplst in 'Loadplst.pas' {LoadplstFrm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Raptor';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TEditForm, EditForm);
  Application.CreateForm(TQuickform, Quickform);
  Application.CreateForm(TPads, Pads);
  Application.CreateForm(TTimeForm, TimeForm);
  Application.CreateForm(TLoadplstFrm, LoadplstFrm);
  Application.Run;
 end.
