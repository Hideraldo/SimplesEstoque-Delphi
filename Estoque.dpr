program Estoque;

uses
  Vcl.Forms,
  unitPrincipal in 'unitPrincipal.pas' {frmPrincipal},
  unitCadProdutos in 'unitCadProdutos.pas' {frmCadProdutos},
  unitCadMovimentacoes in 'unitCadMovimentacoes.pas' {frmCadMovimentacoes},
  unitConsMovimentacoes in 'unitConsMovimentacoes.pas' {frmConsMovimentacoes},
  unitDM in 'unitDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadProdutos, frmCadProdutos);
  Application.CreateForm(TfrmCadMovimentacoes, frmCadMovimentacoes);
  Application.CreateForm(TfrmConsMovimentacoes, frmConsMovimentacoes);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
