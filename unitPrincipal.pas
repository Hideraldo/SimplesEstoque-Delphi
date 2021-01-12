unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    menuPrincipal: TMainMenu;
    menuSistema: TMenuItem;
    menuSair: TMenuItem;
    menuCadastros: TMenuItem;
    menuProdutos: TMenuItem;
    menuMovimentaes: TMenuItem;
    menuGerenciarMovimentaes: TMenuItem;
    menuConsultarMovimentaes: TMenuItem;
    Panel1: TPanel;
    btnCadProdutos: TBitBtn;
    btnMovimentacao: TBitBtn;
    btnConsulta: TBitBtn;
    procedure menuSairClick(Sender: TObject);
    procedure menuProdutosClick(Sender: TObject);
    procedure menuGerenciarMovimentaesClick(Sender: TObject);
    procedure menuConsultarMovimentaesClick(Sender: TObject);
    procedure btnCadProdutosClick(Sender: TObject);
    procedure btnMovimentacaoClick(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses unitCadProdutos, unitCadMovimentacoes, unitConsMovimentacoes;

procedure TfrmPrincipal.btnCadProdutosClick(Sender: TObject);
begin
  frmCadProdutos.ShowModal;
end;

procedure TfrmPrincipal.btnConsultaClick(Sender: TObject);
begin
  frmConsMovimentacoes.ShowModal;
end;

procedure TfrmPrincipal.btnMovimentacaoClick(Sender: TObject);
begin
  frmCadMovimentacoes.ShowModal;
end;

procedure TfrmPrincipal.menuConsultarMovimentaesClick(Sender: TObject);
begin
  frmConsMovimentacoes.ShowModal;
end;

procedure TfrmPrincipal.menuGerenciarMovimentaesClick(Sender: TObject);
begin
  frmCadMovimentacoes.ShowModal;
end;

procedure TfrmPrincipal.menuProdutosClick(Sender: TObject);
begin
  frmCadProdutos.ShowModal;
end;

procedure TfrmPrincipal.menuSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
