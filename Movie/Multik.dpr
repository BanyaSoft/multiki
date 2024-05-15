program Multik;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  DataTypes in 'DataTypes.pas',
  AudioRoutine in 'AudioRoutine.pas',
  AnimationRoutine in 'AnimationRoutine.pas',
  StaticImageRoutine in 'StaticImageRoutine.pas',
  Dance in 'Dance.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
