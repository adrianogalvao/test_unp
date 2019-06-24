unit UDMConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMSSQL, Data.DB, Data.SqlExpr,
  Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider;

type
  TDMConexao = class(TDataModule)
    Conexao: TSQLConnection;
    sqlCorrentista: TSQLDataSet;
    dspCorrentista: TDataSetProvider;
    cdsCorrentista: TClientDataSet;
    sqlCorrentistaIdCorrentista: TIntegerField;
    sqlCorrentistaNome: TStringField;
    sqlCorrentistaSaldoFinanceiro: TFMTBCDField;
    sqlCorrentistaDataCriacao: TSQLTimeStampField;
    cdsCorrentistaIdCorrentista: TIntegerField;
    cdsCorrentistaNome: TStringField;
    cdsCorrentistaSaldoFinanceiro: TFMTBCDField;
    cdsCorrentistaDataCriacao: TSQLTimeStampField;
    sqlMovimentacao: TSQLDataSet;
    dspMovimentacao: TDataSetProvider;
    cdsMovimentacao: TClientDataSet;
    sqlMovimentacaoIdMovimentacao: TIntegerField;
    sqlMovimentacaoValor: TFMTBCDField;
    sqlMovimentacaoTipoMovimentacao: TStringField;
    sqlMovimentacaoNome: TStringField;
    sqlMovimentacaoSaldoFinanceiro: TFMTBCDField;
    sqlMovimentacaoIdCorrentista: TIntegerField;
    cdsMovimentacaoIdMovimentacao: TIntegerField;
    cdsMovimentacaoValor: TFMTBCDField;
    cdsMovimentacaoTipoMovimentacao: TStringField;
    cdsMovimentacaoNome: TStringField;
    cdsMovimentacaoSaldoFinanceiro: TFMTBCDField;
    cdsMovimentacaoIdCorrentista: TIntegerField;
    procedure cdsCorrentistaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConexao: TDMConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMConexao.cdsCorrentistaNewRecord(DataSet: TDataSet);
begin
  cdsCorrentistaSaldoFinanceiro.AsCurrency := 0;
end;

end.
