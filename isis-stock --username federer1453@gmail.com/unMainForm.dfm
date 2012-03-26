object MainForm: TMainForm
  Left = 203
  Top = 168
  BorderStyle = bsDialog
  Caption = 'MainForm'
  ClientHeight = 482
  ClientWidth = 995
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnCategorias: TPanel
    Left = 0
    Top = 0
    Width = 993
    Height = 81
    TabOrder = 0
  end
  object edtCodigo: TEdit
    Left = 32
    Top = 112
    Width = 97
    Height = 21
    TabOrder = 1
  end
  object edtDescricao: TEdit
    Left = 152
    Top = 112
    Width = 553
    Height = 21
    TabOrder = 2
  end
  object btnPesquisar: TButton
    Left = 728
    Top = 110
    Width = 143
    Height = 22
    Caption = 'Pesquisar'
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 152
    Width = 945
    Height = 313
    DataSource = dsProdutos
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor_unitario'
        Title.Caption = 'Valor Unit'#225'rio'
        Width = 93
        Visible = True
      end>
  end
  object MainConn: TZConnection
    Protocol = 'sqlite-3'
    Database = 'estoque.db'
    Connected = True
    Left = 56
  end
  object tblCategorias: TZTable
    Connection = MainConn
    TableName = 'categorias'
    Left = 56
    Top = 32
  end
  object qryProdutos: TZQuery
    Connection = MainConn
    Active = True
    SQL.Strings = (
      'select * from produtos')
    Params = <>
    Left = 104
    Top = 32
  end
  object dsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 104
    Top = 64
  end
end
