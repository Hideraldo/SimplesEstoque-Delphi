unit unitConsMovimentacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask;

type
  TfrmConsMovimentacoes = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    editDataInicial: TMaskEdit;
    editDataFinal: TMaskEdit;
    btnConsMovimentacaoes: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label4: TLabel;
    lblTotal: TLabel;
    procedure btnConsMovimentacaoesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsMovimentacoes: TfrmConsMovimentacoes;

implementation

{$R *.dfm}

uses unitDM;

procedure TfrmConsMovimentacoes.btnConsMovimentacaoesClick(Sender: TObject);
begin
  DM.sqlMovimentacoes.Close;
  DM.sqlMovimentacoes.SQL.Clear;
  DM.sqlMovimentacoes.SQL.Text := 'SELECT * FROM movimentacoes WHERE Date(dataHora) BETWEEN :pDataInicial AND :pDataFinal';
  DM.sqlMovimentacoes.ParamByName('pDataInicial').Value := FormatDateTime('yyyy-mm-dd', StrToDate(editDataInicial.Text));
  DM.sqlMovimentacoes.ParamByName('pDataFinal').Value := FormatDateTime('yyyy-mm-dd', StrToDate(editDataFinal.Text));
  DM.sqlMovimentacoes.Open;

  lblTotal.Caption := IntToStr(DM.sqlMovimentacoes.RecordCount);
end;

procedure TfrmConsMovimentacoes.FormShow(Sender: TObject);
begin
  DM.sqlMovimentacoes.Refresh;
  DM.sqlMovProdutos.Refresh;

  lblTotal.Caption := IntToStr(DM.sqlMovimentacoes.RecordCount);
end;

end.
