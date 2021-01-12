unit unitCadMovimentacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadMovimentacoes = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cboMovimentacao: TDBComboBox;
    edtDataHora: TDBEdit;
    edtResponsavel: TDBEdit;
    memObsvaco: TDBMemo;
    dbnGerMovimentacoes: TDBNavigator;
    dbgMovimentacoes: TDBGrid;
    Label6: TLabel;
    dbnProdMovimentacoes: TDBNavigator;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    Label9: TLabel;
    lblTotal: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure dbnGerMovimentacoesClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadMovimentacoes: TfrmCadMovimentacoes;

implementation

{$R *.dfm}

uses unitDM;

procedure TfrmCadMovimentacoes.dbnGerMovimentacoesClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbInsert then
    begin
      DM.tbMovimentacao.FieldByName('dataHora').Value := Now;
    end;

end;

procedure TfrmCadMovimentacoes.FormShow(Sender: TObject);
begin
  DM.calcularTotais;
end;

end.
