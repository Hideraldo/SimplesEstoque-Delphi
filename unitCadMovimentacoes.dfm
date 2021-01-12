object frmCadMovimentacoes: TfrmCadMovimentacoes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Movimenta'#231#245'es'
  ClientHeight = 469
  ClientWidth = 1073
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 32
    Width = 309
    Height = 29
    Caption = 'Gerenciar Movimenta'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 88
    Width = 144
    Height = 16
    Caption = 'Tipo da Movimenta'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 40
    Top = 152
    Width = 78
    Height = 16
    Caption = 'Data e Hora'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 40
    Top = 216
    Width = 82
    Height = 16
    Caption = 'Respons'#225'vel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 40
    Top = 280
    Width = 77
    Height = 16
    Caption = 'Observa'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 776
    Top = 39
    Width = 221
    Height = 19
    Caption = 'Produtos da Movimenta'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 744
    Top = 112
    Width = 116
    Height = 16
    Caption = 'Escolha o Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 952
    Top = 112
    Width = 74
    Height = 16
    Caption = 'Quantidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 744
    Top = 410
    Width = 120
    Height = 16
    Caption = 'Total de Produtos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTotal: TLabel
    Left = 880
    Top = 412
    Width = 16
    Height = 16
    Caption = '00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cboMovimentacao: TDBComboBox
    Left = 40
    Top = 110
    Width = 185
    Height = 24
    Style = csDropDownList
    DataField = 'tipo'
    DataSource = DM.dsMovimentaco
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Items.Strings = (
      'Entrada no Estoque'
      'Sa'#237'da do Estoque')
    ParentFont = False
    TabOrder = 0
  end
  object edtDataHora: TDBEdit
    Left = 40
    Top = 171
    Width = 144
    Height = 24
    DataField = 'dataHora'
    DataSource = DM.dsMovimentaco
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object edtResponsavel: TDBEdit
    Left = 40
    Top = 235
    Width = 144
    Height = 24
    DataField = 'responsavel'
    DataSource = DM.dsMovimentaco
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object memObsvaco: TDBMemo
    Left = 40
    Top = 299
    Width = 309
    Height = 126
    DataField = 'observacoes'
    DataSource = DM.dsMovimentaco
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object dbnGerMovimentacoes: TDBNavigator
    Left = 368
    Top = 31
    Width = 344
    Height = 41
    DataSource = DM.dsMovimentaco
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
    TabOrder = 4
    OnClick = dbnGerMovimentacoesClick
  end
  object dbgMovimentacoes: TDBGrid
    Left = 368
    Top = 107
    Width = 345
    Height = 318
    DataSource = DM.dsMovimentaco
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'tipo'
        Title.Caption = 'TIPO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dataHora'
        Title.Caption = 'DATA e HORA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'responsavel'
        Title.Caption = 'RESPONS'#193'VEL'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 107
        Visible = True
      end>
  end
  object dbnProdMovimentacoes: TDBNavigator
    Left = 776
    Top = 64
    Width = 220
    Height = 37
    DataSource = DM.dsMov_Prod
    VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost]
    TabOrder = 6
  end
  object DBGrid1: TDBGrid
    Left = 744
    Top = 161
    Width = 285
    Height = 232
    DataSource = DM.dsMov_Prod
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'nomeProduto'
        Title.Caption = 'PRODUTO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 174
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtd'
        Title.Caption = 'QUANTIDADE'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object DBEdit1: TDBEdit
    Left = 952
    Top = 131
    Width = 77
    Height = 24
    DataField = 'qtd'
    DataSource = DM.dsMov_Prod
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 744
    Top = 131
    Width = 193
    Height = 24
    DataField = 'idProdudos'
    DataSource = DM.dsMov_Prod
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'id'
    ListField = 'nome'
    ListSource = DM.dsProdutos
    ParentFont = False
    TabOrder = 9
  end
end
