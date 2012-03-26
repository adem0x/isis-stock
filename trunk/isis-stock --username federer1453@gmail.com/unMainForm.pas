unit unMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBClient, Provider, DB, Grids, DBGrids, ZDataset, StdCtrls,
  ExtCtrls, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable,
  ZConnection,Buttons,Math;

type
  TMainForm = class(TForm)
    MainConn: TZConnection;
    tblCategorias: TZTable;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    btnPesquisar: TButton;
    DBGrid1: TDBGrid;
    qryProdutos: TZQuery;
    dsProdutos: TDataSource;
    cmbCategorias: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cmbCategoriasChange(Sender: TObject);
  private
    { Private declarations }
    function LoadCategories:Integer;
  public
    { Public declarations }
    function OpenConnection:Integer;
    function CloseTable(Table:TZAbstractDataset):Integer;
    function GetConnection:TZConnection;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

{ TMainForm }

function TMainForm.CloseTable(Table: TZAbstractDataset): Integer;
begin
   Table.Close;
   MainConn.Disconnect;
end;

function TMainForm.GetConnection:TZConnection;
begin
   try
      Result:=MainConn;
   except
      Result:=nil;
   end;
end;

function TMainForm.LoadCategories:Integer;
begin
   if(OpenConnection=0)then
   begin
      tblCategorias.Open;
      tblCategorias.First;

      while not tblCategorias.Eof do
      begin
         cmbCategorias.Items.Add(tblCategorias.FieldByName('descricao').AsString);
         tblCategorias.Next;
      end;

      cmbCategorias.ItemIndex:=0;
      tblCategorias.Close;
      Result:=0;
   end
   else
      Result:=-1;
end;

function TMainForm.OpenConnection: Integer;
begin
   try
      MainConn.Connect;
      Result:=0;
   except
      Result:=-1;
   end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
   LoadCategories;
end;

procedure TMainForm.cmbCategoriasChange(Sender: TObject);
var
   IdCategory:Integer;
begin
   OpenConnection;
   IdCategory:=cmbCategorias.ItemIndex+1;
   qryProdutos.Close;
   qryProdutos.SQL.Clear;
   qryProdutos.SQL.Add(Format('select * from produtos where id_categoria=%d',[IdCategory]));
   qryProdutos.Open;

   edtCodigo.Text:=qryProdutos.FieldByName('codigo').AsString;
   edtDescricao.Text:=qryProdutos.FieldByName('descricao').AsString;
   edtDescricao.SetFocus;
end;

end.
