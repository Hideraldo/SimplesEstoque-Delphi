object DM: TDM
  OldCreateOrder = False
  Height = 477
  Width = 698
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 200
    Top = 24
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\mysqlwin32\lib\libmysql.dll'
    Left = 56
    Top = 24
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=estoque'
      'User_Name=hideraldo'
      'Password=senha'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 336
    Top = 24
  end
  object tbProduto: TFDTable
    Active = True
    AfterScroll = tbProdutoAfterScroll
    IndexFieldNames = 'id'
    Connection = Conexao
    UpdateOptions.UpdateTableName = 'estoque.produtos'
    TableName = 'estoque.produtos'
    Left = 56
    Top = 112
    object tbProdutoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
    object tbProdutonome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
    object tbProdutofabricante: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fabricante'
      Origin = 'fabricante'
      Size = 30
    end
    object tbProdutovalidade: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'validade'
      Origin = 'validade'
      EditMask = '##/##/####;1;_'
    end
    object tbProdutoestoqueAtual: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'estoqueAtual'
      Origin = 'estoqueAtual'
    end
  end
  object tbMovimentacao: TFDTable
    Active = True
    BeforeDelete = tbMovimentacaoBeforeDelete
    AfterScroll = tbMovimentacaoAfterScroll
    IndexFieldNames = 'id'
    Connection = Conexao
    UpdateOptions.UpdateTableName = 'estoque.movimentacoes'
    TableName = 'estoque.movimentacoes'
    Left = 200
    Top = 120
    object tbMovimentacaoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
    object tbMovimentacaotipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
    end
    object tbMovimentacaodataHora: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dataHora'
      Origin = 'dataHora'
    end
    object tbMovimentacaoresponsavel: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'responsavel'
      Origin = 'responsavel'
      Size = 30
    end
    object tbMovimentacaoobservacoes: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'observacoes'
      Origin = 'observacoes'
      BlobType = ftMemo
    end
  end
  object tbMov_Prod: TFDTable
    Active = True
    AfterPost = tbMov_ProdAfterPost
    BeforeDelete = tbMov_ProdBeforeDelete
    AfterDelete = tbMov_ProdAfterDelete
    IndexName = 'fk_movimentacoes_prod_idx'
    MasterSource = dsMovimentaco
    MasterFields = 'id'
    Connection = Conexao
    UpdateOptions.UpdateTableName = 'estoque.movimentacoes_produto'
    TableName = 'estoque.movimentacoes_produto'
    Left = 336
    Top = 112
    object tbMov_Prodid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
    object tbMov_ProdidMovimentacoes: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idMovimentacoes'
      Origin = 'idMovimentacoes'
    end
    object tbMov_ProdidProdudos: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idProdudos'
      Origin = 'idProdudos'
    end
    object tbMov_Prodqtd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'qtd'
      Origin = 'qtd'
    end
    object tbMov_ProdnomeProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'nomeProduto'
      LookupDataSet = tbProduto
      LookupKeyFields = 'id'
      LookupResultField = 'nome'
      KeyFields = 'idProdudos'
      Size = 50
      Lookup = True
    end
  end
  object dsProdutos: TDataSource
    DataSet = tbProduto
    Left = 56
    Top = 160
  end
  object dsMovimentaco: TDataSource
    DataSet = tbMovimentacao
    Left = 200
    Top = 168
  end
  object dsMov_Prod: TDataSource
    DataSet = tbMov_Prod
    Left = 336
    Top = 168
  end
  object sqlAumentaEstoque: TFDCommand
    Connection = Conexao
    CommandText.Strings = (
      
        'UPDATE produtos SET estoqueAtual = estoqueAtual + :pQtd WHERE id' +
        ' = :pId')
    ParamData = <
      item
        Name = 'pQtd'
        ParamType = ptInput
      end
      item
        Name = 'pId'
        ParamType = ptInput
      end>
    Left = 64
    Top = 296
  end
  object sqlDiminuiEstoque: TFDCommand
    Connection = Conexao
    CommandText.Strings = (
      
        'UPDATE produtos SET estoqueAtual = estoqueAtual - :pQtd WHERE id' +
        ' = :pId')
    ParamData = <
      item
        Name = 'pQtd'
        ParamType = ptInput
      end
      item
        Name = 'pId'
        ParamType = ptInput
      end>
    Left = 64
    Top = 384
  end
  object sqlMovimentacoes: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM movimentacoes')
    Left = 240
    Top = 304
    ParamData = <
      item
        Name = 'pDataInicial'
      end
      item
        Name = 'pDataFinal'
      end>
  end
  object dsSqlMovimentacoes: TDataSource
    DataSet = sqlMovimentacoes
    Left = 240
    Top = 360
  end
  object sqlMovProdutos: TFDQuery
    Active = True
    IndexFieldNames = 'idMovimentacoes'
    MasterSource = dsSqlMovimentacoes
    MasterFields = 'id'
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM movimentacoes_produto')
    Left = 408
    Top = 304
    object sqlMovProdutosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object sqlMovProdutosidMovimentacoes: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idMovimentacoes'
      Origin = 'idMovimentacoes'
    end
    object sqlMovProdutosidProdudos: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idProdudos'
      Origin = 'idProdudos'
    end
    object sqlMovProdutosqtd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'qtd'
      Origin = 'qtd'
    end
    object sqlMovProdutosnomeProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'nomeProduto'
      LookupDataSet = tbProduto
      LookupKeyFields = 'id'
      LookupResultField = 'nome'
      KeyFields = 'idProdudos'
      Size = 50
      Lookup = True
    end
  end
  object dsSqlMovProdutos: TDataSource
    DataSet = sqlMovProdutos
    Left = 408
    Top = 368
  end
end
