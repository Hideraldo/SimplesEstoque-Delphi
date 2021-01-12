unit unitDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.UI, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Dialogs;

type
  TDM = class(TDataModule)
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    Conexao: TFDConnection;
    tbProduto: TFDTable;
    tbMovimentacao: TFDTable;
    tbMov_Prod: TFDTable;
    dsProdutos: TDataSource;
    dsMovimentaco: TDataSource;
    dsMov_Prod: TDataSource;
    sqlAumentaEstoque: TFDCommand;
    sqlDiminuiEstoque: TFDCommand;
    sqlMovimentacoes: TFDQuery;
    dsSqlMovimentacoes: TDataSource;
    tbProdutoid: TFDAutoIncField;
    tbProdutonome: TStringField;
    tbProdutofabricante: TStringField;
    tbProdutovalidade: TDateField;
    tbProdutoestoqueAtual: TIntegerField;
    tbMovimentacaoid: TFDAutoIncField;
    tbMovimentacaotipo: TStringField;
    tbMovimentacaodataHora: TDateTimeField;
    tbMovimentacaoresponsavel: TStringField;
    tbMovimentacaoobservacoes: TMemoField;
    tbMov_Prodid: TFDAutoIncField;
    tbMov_ProdidMovimentacoes: TIntegerField;
    tbMov_ProdidProdudos: TIntegerField;
    tbMov_Prodqtd: TIntegerField;
    tbMov_ProdnomeProduto: TStringField;
    sqlMovProdutos: TFDQuery;
    dsSqlMovProdutos: TDataSource;
    sqlMovProdutosid: TFDAutoIncField;
    sqlMovProdutosidMovimentacoes: TIntegerField;
    sqlMovProdutosidProdudos: TIntegerField;
    sqlMovProdutosqtd: TIntegerField;
    sqlMovProdutosnomeProduto: TStringField;
    procedure tbProdutoAfterScroll(DataSet: TDataSet);
    procedure tbMov_ProdAfterPost(DataSet: TDataSet);
    procedure tbMov_ProdAfterDelete(DataSet: TDataSet);
    procedure calcularTotais;
    procedure tbMovimentacaoAfterScroll(DataSet: TDataSet);
    procedure tbMov_ProdBeforeDelete(DataSet: TDataSet);
    procedure tbMovimentacaoBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses unitCadProdutos, unitCadMovimentacoes;

{$R *.dfm}

procedure TDM.calcularTotais;
var
  totais : Integer;
begin
  if tbMov_Prod.State in [dsBrowse] then
    begin
      tbMov_Prod.First;

        while not tbMov_Prod.Eof do
          begin
            totais := totais + tbMov_Prod.FieldByName('qtd').Value;
            tbMov_Prod.Next;
          end;

        frmCadMovimentacoes.lblTotal.Caption := IntToStr(totais);
    end;
end;

procedure TDM.tbMovimentacaoAfterScroll(DataSet: TDataSet);
begin
  calcularTotais;
end;

procedure TDM.tbMovimentacaoBeforeDelete(DataSet: TDataSet);
begin
  if tbMov_Prod.RecordCount > 0 then
    begin
      ShowMessage('Existem produtos cadastrados nesta movimentação. Exclua-os primeiro.');
      abort;
    end;

end;

procedure TDM.tbMov_ProdAfterDelete(DataSet: TDataSet);
begin
  calcularTotais;
end;

procedure TDM.tbMov_ProdAfterPost(DataSet: TDataSet);
begin
  calcularTotais;

  if (tbMovimentacao.FieldByName('tipo').Value = 'Entrada no Estoque') then
    begin
      sqlAumentaEstoque.ParamByName('pId').Value := tbMov_Prod.FieldByName('idProdudos').Value;
      sqlAumentaEstoque.ParamByName('pQtd').Value := tbMov_Prod.FieldByName('qtd').Value;
      sqlAumentaEstoque.Execute;
    end;

  if (tbMovimentacao.FieldByName('tipo').Value = 'Saída do Estoque') then
    begin
      sqlDiminuiEstoque.ParamByName('pId').Value := tbMov_Prod.FieldByName('idProdudos').Value;
      sqlDiminuiEstoque.ParamByName('pQtd').Value := tbMov_Prod.FieldByName('qtd').Value;
      sqlDiminuiEstoque.Execute;
    end;
end;

procedure TDM.tbMov_ProdBeforeDelete(DataSet: TDataSet);
begin
if (tbMovimentacao.FieldByName('tipo').Value = 'Saída do Estoque') then
    begin
      sqlAumentaEstoque.ParamByName('pId').Value := tbMov_Prod.FieldByName('idProdudos').Value;
      sqlAumentaEstoque.ParamByName('pQtd').Value := tbMov_Prod.FieldByName('qtd').Value;
      sqlAumentaEstoque.Execute;
    end;

  if (tbMovimentacao.FieldByName('tipo').Value = 'Entrada no Estoque') then
    begin
      sqlDiminuiEstoque.ParamByName('pId').Value := tbMov_Prod.FieldByName('idProdudos').Value;
      sqlDiminuiEstoque.ParamByName('pQtd').Value := tbMov_Prod.FieldByName('qtd').Value;
      sqlDiminuiEstoque.Execute;
    end;
end;

procedure TDM.tbProdutoAfterScroll(DataSet: TDataSet);
begin
  if tbProduto.Eof = True then
    begin
      frmCadProdutos.btnProximo.Enabled := False;
      frmCadProdutos.btnUltimo.Enabled := False;
    end
  else
    begin
      frmCadProdutos.btnProximo.Enabled := True;
      frmCadProdutos.btnUltimo.Enabled := True;
    end;

  if tbProduto.Bof = True then
    begin
      frmCadProdutos.btnAnterior.Enabled := False;
      frmCadProdutos.btnPrimeiro.Enabled := False;
    end
  else
    begin
      frmCadProdutos.btnAnterior.Enabled := True;
      frmCadProdutos.btnPrimeiro.Enabled := True;
    end;
end;

end.
