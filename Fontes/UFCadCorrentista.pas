unit UFCadCorrentista;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UDMConexao, Vcl.ComCtrls, Vcl.ToolWin,
  Data.DB, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, Vcl.ImgList, Vcl.Buttons,
  Datasnap.DBClient;

type
  TFCadCorrentista = class(TForm)
    dsCorrentista: TDataSource;
    PaginaCentral: TPageControl;
    tsConsulta: TTabSheet;
    tsCadastro: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    btnInserir: TToolButton;
    btnEditar: TToolButton;
    btnCancelar: TToolButton;
    ActionList: TActionList;
    ImageList: TImageList;
    btnExcluir: TToolButton;
    btnSalvar: TToolButton;
    ToolButton1: TToolButton;
    btnSair: TToolButton;
    edtConsulta: TEdit;
    RadioGroup1: TRadioGroup;
    btnConsultar: TBitBtn;
    ActionInserir: TAction;
    ActionEditar: TAction;
    ActionCancelar: TAction;
    ActionExcluir: TAction;
    ActionSalvar: TAction;
    procedure FormCreate(Sender: TObject);
    procedure dsCorrentistaStateChange(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure ActionInserirExecute(Sender: TObject);
    procedure ActionEditarExecute(Sender: TObject);
    procedure ActionCancelarExecute(Sender: TObject);
    procedure ActionExcluirExecute(Sender: TObject);
    procedure ActionSalvarExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadCorrentista: TFCadCorrentista;

implementation

{$R *.dfm}

procedure TFCadCorrentista.ActionCancelarExecute(Sender: TObject);
begin
  if TClientDataSet(dsCorrentista.DataSet).IsEmpty then
    Abort;

  if TClientDataSet(dsCorrentista.DataSet).State in [dsEdit, dsInsert] then
  begin
    if Application.MessageBox('Deseja Cancelar o Registro Atual?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = idyes then
    begin
      TClientDataSet(dsCorrentista.DataSet).CancelUpdates;

      PaginaCentral.ActivePage := tsConsulta;
    end;
  end
  else
  begin
    PaginaCentral.ActivePage := tsConsulta;
  end;
end;

procedure TFCadCorrentista.ActionEditarExecute(Sender: TObject);
begin
  if TClientDataSet(dsCorrentista.DataSet).IsEmpty then
    Abort;

  PaginaCentral.ActivePage := tsCadastro;
  TClientDataSet(dsCorrentista.DataSet).Edit;

  try
    TClientDataSet(dsCorrentista.DataSet).Fields[1].FocusControl;
  except

  end;
end;

procedure TFCadCorrentista.ActionExcluirExecute(Sender: TObject);
begin
  if TClientDataSet(dsCorrentista.DataSet).IsEmpty then
    Abort;

  if Application.MessageBox('Deseja Realmente Excluir o Registro ?', 'Confirmação.', MB_ICONQUESTION + MB_YESNO) = idYes then
  begin
    try
      TClientDataSet(dsCorrentista.DataSet).Delete;
      TClientDataSet(dsCorrentista.DataSet).ApplyUpdates(0)
    except
      on E: exception do
      begin
        Application.MessageBox(pchar('Não Foi Possível Excluir o Registro.' + #13 + #10 + 'Mensagem : ' + e.Message), 'Aviso', MB_ICONINFORMATION + MB_OK);
        Abort;
      end;
    end;
  end;
end;

procedure TFCadCorrentista.ActionInserirExecute(Sender: TObject);
begin
  if not (dsCorrentista.DataSet.State in [dsEdit, dsInsert]) then
  begin
    TClientDataSet(dsCorrentista.DataSet).ReadOnly := False;
    PaginaCentral.ActivePage := tsCadastro;

    TClientDataSet(dsCorrentista.DataSet).Append;

    try
      TClientDataSet(dsCorrentista.DataSet).Fields[1].FocusControl;
    except

    end;
  end;
end;

procedure TFCadCorrentista.ActionSalvarExecute(Sender: TObject);
begin
  try
    Self.tsCadastro.SetFocus;

    if TClientDataSet(dsCorrentista.DataSet).IsEmpty then
      Abort;

    if TClientDataSet(dsCorrentista.DataSet).State in [dsInsert, dsEdit] then
      TClientDataSet(dsCorrentista.DataSet).Post;

    TClientDataSet(dsCorrentista.DataSet).ApplyUpdates(0);
    TClientDataSet(dsCorrentista.DataSet).Refresh;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar('Erro ao Gravar o Registro, Se o Problema Insistir Procure o Suporte.' + #13 + #10 + 'Mensagem : ' + e.Message), 'Aviso', MB_ICONINFORMATION + MB_OK);
    end;
  end;

  if not (TClientDataSet(dsCorrentista.DataSet).State in [dsInsert, dsedit]) then
    PaginaCentral.ActivePage := tsConsulta;
end;

procedure TFCadCorrentista.btnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFCadCorrentista.dsCorrentistaStateChange(Sender: TObject);
begin
  ActionInserir.Enabled  := (dsCorrentista.State in [dsBrowse, dsInactive]);
  ActionSalvar.Enabled   := (dsCorrentista.State in [dsInsert, dsEdit]);
  ActionCancelar.Enabled := (dsCorrentista.State in [dsInsert, dsEdit]);
  ActionEditar.Enabled   := ((dsCorrentista.State in [dsBrowse]) and (dsCorrentista.DataSet.RecordCount > 0));
  ActionExcluir.Enabled  := ((dsCorrentista.State in [dsBrowse]) and (dsCorrentista.DataSet.RecordCount > 0));
end;

procedure TFCadCorrentista.FormCreate(Sender: TObject);
begin
  DMConexao.cdsCorrentista.Open;
end;

procedure TFCadCorrentista.FormDestroy(Sender: TObject);
begin
  DMConexao.cdsCorrentista.Close;
end;

end.
