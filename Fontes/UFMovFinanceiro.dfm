object FMovFinanceiro: TFMovFinanceiro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Movimenta'#231#227'o Financeira'
  ClientHeight = 262
  ClientWidth = 583
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 583
    Height = 169
    Align = alTop
    DataSource = dsCorrentista
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IdCorrentista'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SaldoFinanceiro'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataCriacao'
        Width = 124
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 5
    Top = 173
    Width = 75
    Height = 25
    Caption = 'Inserir'
    TabOrder = 1
    OnClick = Button1Click
  end
  object pnMovimento: TPanel
    Left = 7
    Top = 201
    Width = 570
    Height = 56
    Enabled = False
    TabOrder = 2
    object Label1: TLabel
      Left = 199
      Top = 8
      Width = 94
      Height = 13
      Caption = 'Valor do Movimento'
    end
    object rgTipoMov: TRadioGroup
      Left = 8
      Top = 3
      Width = 185
      Height = 46
      Caption = ' Tipo de Movimenta'#231#227'o '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Cr'#233'dito'
        'D'#233'bito')
      TabOrder = 0
    end
    object edtValor: TMaskEdit
      Left = 199
      Top = 24
      Width = 120
      Height = 24
      Alignment = taCenter
      EditMask = '999,99;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      TabOrder = 1
      Text = '   ,  '
    end
    object btnConfirmar: TBitBtn
      Left = 326
      Top = 8
      Width = 235
      Height = 41
      Caption = 'Gerar Movimento'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 2
      OnClick = btnConfirmarClick
    end
  end
  object dsCorrentista: TDataSource
    DataSet = DMConexao.cdsCorrentista
    Left = 536
    Top = 40
  end
end
