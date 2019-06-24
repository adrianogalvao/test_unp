unit UFMovFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UDMConexao, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.Buttons;

type
  TFMovFinanceiro = class(TForm)
    DBGrid1: TDBGrid;
    dsCorrentista: TDataSource;
    Button1: TButton;
    pnMovimento: TPanel;
    rgTipoMov: TRadioGroup;
    edtValor: TMaskEdit;
    Label1: TLabel;
    btnConfirmar: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMovFinanceiro: TFMovFinanceiro;

implementation

{$R *.dfm}

procedure TFMovFinanceiro.btnConfirmarClick(Sender: TObject);
  function RetornaTipoMov : string;
  begin
    case rgTipoMov.ItemIndex of
      0:
      begin
        Result := 'C';
      end;
    else
      Result := 'D';
    end;
  end;
begin
  DMConexao.cdsMovimentacao.Locate('IdCorrentista', DMConexao.cdsCorrentistaIdCorrentista.AsString, []);

  if rgTipoMov.ItemIndex = 1 then
  begin
    if StrToCurrDef(edtValor.Text, 0) > DMConexao.cdsCorrentistaSaldoFinanceiro.AsCurrency then
    begin
      Application.MessageBox('Transação com valor superior ao saldo em conta.', 'Aviso', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
  end;

  DMConexao.cdsMovimentacao.Insert;
  DMConexao.cdsMovimentacaoValor.AsCurrency := StrToCurrDef(edtValor.Text, 0);
  DMConexao.cdsMovimentacaoTipoMovimentacao.AsString := RetornaTipoMov;
  DMConexao.cdsMovimentacaoIdCorrentista.AsInteger := DMConexao.cdsCorrentistaIdCorrentista.AsInteger;
  DMConexao.cdsMovimentacao.Post;
  DMConexao.cdsMovimentacao.ApplyUpdates(0);

  Application.MessageBox('Movimento gerado com sucesso.', 'Aviso', MB_OK + MB_ICONINFORMATION);

  DMConexao.cdsCorrentista.Close;
  DMConexao.cdsCorrentista.Open;

  pnMovimento.Enabled := False;
  edtValor.Text := '';
  rgTipoMov.ItemIndex := 0;

  DMConexao.cdsMovimentacao.Close;
  DMConexao.cdsMovimentacao.Open;
end;

procedure TFMovFinanceiro.Button1Click(Sender: TObject);
begin
  pnMovimento.Enabled := True;
end;

procedure TFMovFinanceiro.FormCreate(Sender: TObject);
begin
  DMConexao.cdsCorrentista.Open;
  DMConexao.cdsMovimentacao.Open;
end;

procedure TFMovFinanceiro.FormDestroy(Sender: TObject);
begin
  DMConexao.cdsMovimentacao.Close;
  DMConexao.cdsCorrentista.Close;
end;

end.
