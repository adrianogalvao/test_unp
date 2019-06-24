object DMConexao: TDMConexao
  OldCreateOrder = False
  Height = 432
  Width = 630
  object Conexao: TSQLConnection
    ConnectionName = 'UnPBank'
    DriverName = 'MSSQL'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MSSQL'
      'SchemaOverride=%.dbo'
      'DriverUnit=Data.DBXMSSQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver210.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=21.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMsSqlMetaDataCommandFactory,DbxMSSQLDr' +
        'iver210.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMsSqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMSSQLDriver,Version=21.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxmss.dll'
      'VendorLib=sqlncli11.dll'
      'VendorLibWin64=sqlncli11.dll'
      'HostName=.\SQL_DEV'
      'Database=TestUnP'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'OSAuthentication=True'
      'PrepareSQL=True'
      'User_Name=sa'
      'Password='
      'BlobSize=-1'
      'ErrorResourceFile='
      'OS Authentication=True'
      'Prepare SQL=False')
    Left = 104
    Top = 40
  end
  object sqlCorrentista: TSQLDataSet
    SchemaName = 'dbo'
    GetMetadata = False
    CommandText = 
      'select '#13#10'  IdCorrentista, '#13#10'  Nome, '#13#10'  SaldoFinanceiro, '#13#10'  Dat' +
      'aCriacao '#13#10'from Correntista'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 136
    Top = 96
    object sqlCorrentistaIdCorrentista: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'IdCorrentista'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlCorrentistaNome: TStringField
      FieldName = 'Nome'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlCorrentistaSaldoFinanceiro: TFMTBCDField
      FieldName = 'SaldoFinanceiro'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object sqlCorrentistaDataCriacao: TSQLTimeStampField
      FieldName = 'DataCriacao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspCorrentista: TDataSetProvider
    DataSet = sqlCorrentista
    Options = [poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 136
    Top = 144
  end
  object cdsCorrentista: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCorrentista'
    OnNewRecord = cdsCorrentistaNewRecord
    Left = 136
    Top = 192
    object cdsCorrentistaIdCorrentista: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      FieldName = 'IdCorrentista'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsCorrentistaNome: TStringField
      FieldName = 'Nome'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsCorrentistaSaldoFinanceiro: TFMTBCDField
      DisplayLabel = 'Saldo Financeiro'
      FieldName = 'SaldoFinanceiro'
      ProviderFlags = [pfInUpdate]
      currency = True
      Precision = 15
      Size = 2
    end
    object cdsCorrentistaDataCriacao: TSQLTimeStampField
      DisplayLabel = 'Data Cria'#231#227'o'
      FieldName = 'DataCriacao'
      ProviderFlags = [pfInUpdate]
    end
  end
  object sqlMovimentacao: TSQLDataSet
    SchemaName = 'dbo'
    GetMetadata = False
    CommandText = 
      'select '#13#10#9'M.IdMovimentacao,'#13#10#9'M.Valor,'#13#10#9'M.TipoMovimentacao,'#13#10#9'C' +
      '.Nome,'#13#10#9'C.SaldoFinanceiro, '#13#10#9'M.IdCorrentista'#13#10'from Movimentaca' +
      'o M'#13#10'inner join Correntista C On (C.IdCorrentista = M.IdCorrenti' +
      'sta)'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 232
    Top = 96
    object sqlMovimentacaoIdMovimentacao: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'IdMovimentacao'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlMovimentacaoValor: TFMTBCDField
      FieldName = 'Valor'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object sqlMovimentacaoTipoMovimentacao: TStringField
      FieldName = 'TipoMovimentacao'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object sqlMovimentacaoNome: TStringField
      FieldName = 'Nome'
      ProviderFlags = []
      Size = 100
    end
    object sqlMovimentacaoSaldoFinanceiro: TFMTBCDField
      FieldName = 'SaldoFinanceiro'
      ProviderFlags = []
      Precision = 15
      Size = 2
    end
    object sqlMovimentacaoIdCorrentista: TIntegerField
      FieldName = 'IdCorrentista'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspMovimentacao: TDataSetProvider
    DataSet = sqlMovimentacao
    Options = [poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 232
    Top = 144
  end
  object cdsMovimentacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMovimentacao'
    Left = 232
    Top = 192
    object cdsMovimentacaoIdMovimentacao: TIntegerField
      FieldName = 'IdMovimentacao'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsMovimentacaoValor: TFMTBCDField
      FieldName = 'Valor'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object cdsMovimentacaoTipoMovimentacao: TStringField
      FieldName = 'TipoMovimentacao'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsMovimentacaoNome: TStringField
      FieldName = 'Nome'
      ProviderFlags = []
      Size = 100
    end
    object cdsMovimentacaoSaldoFinanceiro: TFMTBCDField
      FieldName = 'SaldoFinanceiro'
      ProviderFlags = []
      Precision = 15
      Size = 2
    end
    object cdsMovimentacaoIdCorrentista: TIntegerField
      FieldName = 'IdCorrentista'
      ProviderFlags = [pfInUpdate]
    end
  end
end
