program Estoque;

uses
  Forms,
  unMainForm in 'unMainForm.pas' {MainForm},
  unFrmEdit in 'unFrmEdit.pas' {frmEdit};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
