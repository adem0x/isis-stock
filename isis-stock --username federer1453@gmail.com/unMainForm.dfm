object MainForm: TMainForm
  Left = 203
  Top = 168
  BorderStyle = bsDialog
  Caption = 'Isis Stock'
  ClientHeight = 458
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Century Gothic'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 84
    Height = 19
    Caption = 'Categorias'
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 58
    Height = 19
    Caption = 'C'#243'digo'
  end
  object Label3: TLabel
    Left = 138
    Top = 64
    Width = 77
    Height = 19
    Caption = 'Descri'#231#227'o'
  end
  object edtCodigo: TEdit
    Left = 16
    Top = 88
    Width = 97
    Height = 27
    Hint = 'codigo'
    CharCase = ecUpperCase
    TabOrder = 1
    OnChange = edtCodigoChange
    OnKeyDown = edtCodigoKeyDown
  end
  object edtDescricao: TEdit
    Left = 137
    Top = 88
    Width = 553
    Height = 27
    Hint = 'descricao'
    CharCase = ecUpperCase
    TabOrder = 2
    OnChange = edtCodigoChange
    OnKeyDown = edtCodigoKeyDown
  end
  object btnPesquisar: TButton
    Left = 712
    Top = 87
    Width = 143
    Height = 27
    Caption = 'Pesquisar'
    TabOrder = 3
  end
  object cmbCategorias: TComboBox
    Left = 16
    Top = 32
    Width = 569
    Height = 27
    ItemHeight = 19
    TabOrder = 0
    Text = 'cmbCategorias'
    OnKeyDown = cmbCategoriasKeyDown
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 144
    Width = 841
    Height = 265
    DataSource = dsProdutos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Century Gothic'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        Title.Caption = 'C'#243'digo'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 457
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco_unitario'
        Title.Caption = 'Pre'#231'o Unit'#225'rio'
        Width = 195
        Visible = True
      end>
  end
  object MainConn: TZConnection
    Protocol = 'sqlite-3'
    Database = 'estoque.db'
    Left = 56
  end
  object tblCategorias: TZTable
    Connection = MainConn
    SortedFields = 'id_categoria'
    TableName = 'categorias'
    IndexFieldNames = 'id_categoria Asc'
    Left = 56
    Top = 32
  end
  object qryProdutos: TZQuery
    Connection = MainConn
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
