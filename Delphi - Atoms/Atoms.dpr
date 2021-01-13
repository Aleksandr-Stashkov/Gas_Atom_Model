program Atoms;

uses
  Forms,
  MainForm in 'MainForm.pas' {MainForm1},
  UnitBox in 'UnitBox.pas',
  UnitCluster in 'UnitCluster.pas';

{$R *.res}


begin
  Application.Initialize;
  Application.CreateForm(TMainForm1, MainForm1);
  Application.Run;

end.
