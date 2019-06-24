program UnPBank;

uses
  Vcl.Forms,
  UFMenu in 'UFMenu.pas' {FMenu},
  UDMConexao in 'UDMConexao.pas' {DMConexao: TDataModule},
  UFCadCorrentista in 'UFCadCorrentista.pas' {FCadCorrentista},
  UFMovFinanceiro in 'UFMovFinanceiro.pas' {FMovFinanceiro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMConexao, DMConexao);
  Application.CreateForm(TFMenu, FMenu);
  Application.Run;
end.
