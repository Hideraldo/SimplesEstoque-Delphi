unit unitCadProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadProdutos = class(TForm)
    Label1: TLabel;
    pnlBotoes: TPanel;
    btnPrimeiro: TBitBtn;
    btnAnterior: TBitBtn;
    btnNovo: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnExcluir: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbtNomeProd: TDBEdit;
    dbtFabricante: TDBEdit;
    dbtDataValid: TDBEdit;
    dbtQuantidade: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProdutos: TfrmCadProdutos;

implementation

{$R *.dfm}

uses unitDM;

procedure TfrmCadProdutos.btnAnteriorClick(Sender: TObject);
begin
  DM.tbProduto.Prior;
end;

procedure TfrmCadProdutos.btnCancelarClick(Sender: TObject);
begin
  btnNovo.Enabled := True;
  btnExcluir.Enabled := True;
  btnSalvar.Enabled := False;
  btnCancelar.Enabled := False;

  DM.tbProduto.Cancel;
end;

procedure TfrmCadProdutos.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Excluir realmente o registro','Atenção', MB_ICONQUESTION+MB_YESNO) = mrYes then
    begin
      DM.tbProduto.Delete;
    end;

end;

procedure TfrmCadProdutos.btnNovoClick(Sender: TObject);
begin
  btnNovo.Enabled := False;
  btnExcluir.Enabled := False;
  btnSalvar.Enabled := True;
  btnCancelar.Enabled := True;

  DM.tbProduto.Append;
end;

procedure TfrmCadProdutos.btnPrimeiroClick(Sender: TObject);
begin
  DM.tbProduto.First;
end;

procedure TfrmCadProdutos.btnProximoClick(Sender: TObject);
begin
  DM.tbProduto.Next;
end;

procedure TfrmCadProdutos.btnSalvarClick(Sender: TObject);
begin
  btnNovo.Enabled := True;
  btnExcluir.Enabled := True;
  btnSalvar.Enabled := False;
  btnCancelar.Enabled := False;

  DM.tbProduto.Post;
end;

procedure TfrmCadProdutos.btnUltimoClick(Sender: TObject);
begin
  DM.tbProduto.Last;
end;

procedure TfrmCadProdutos.FormShow(Sender: TObject);
begin
  DM.tbProduto.Refresh;
end;

end.
