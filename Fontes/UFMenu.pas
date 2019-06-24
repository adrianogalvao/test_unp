unit UFMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UDMConexao, Vcl.StdCtrls, MidasLib, UFCadCorrentista,
  UFMovFinanceiro;

type
  TFMenu = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenu: TFMenu;

implementation

{$R *.dfm}

procedure TFMenu.Button1Click(Sender: TObject);
begin
  FCadCorrentista := TFCadCorrentista.Create(Self);
  FCadCorrentista.ShowModal;
  FreeAndNil(FCadCorrentista);
end;

procedure TFMenu.Button2Click(Sender: TObject);
begin
  FMovFinanceiro := TFMovFinanceiro.Create(Self);
  FMovFinanceiro.ShowModal;
  FreeAndNil(FMovFinanceiro);
end;

end.
