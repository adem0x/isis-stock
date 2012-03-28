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
    qryProdutos: TZQuery;
    dsProdutos: TDataSource;
    cmbCategorias: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbCategoriasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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

procedure TMainForm.edtCodigoChange(Sender: TObject);
begin
   qryProdutos.Close;
   qryProdutos.SQL.Clear;
   qryProdutos.SQL.Add(Format('select codigo,descricao,preco_unitario from produtos where %s like %s',[TEdit(Sender).Hint,QuotedStr('%'+TEdit(Sender).Text+'%')]));
   qryProdutos.Open;
end;

procedure TMainForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
   R : TRect;
begin
   R:=Rect;
   Dec(R.Bottom,2);
   if Column.Field=qryProdutos.FieldByName('descricao') then
   begin
   if not (gdSelected in State) then
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.Canvas.TextRect(R,R.Left,R.Top,qryProdutos.FieldByName('descricao').AsString);
   end;

end;

procedure TMainForm.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      13:
         DBGrid1.SetFocus;
   end;
end;

procedure TMainForm.cmbCategoriasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   IdCategory:Integer;
begin
   case key of
      13:
      begin
         OpenConnection;
         IdCategory:=cmbCategorias.ItemIndex+1;
         qryProdutos.Close;
         qryProdutos.SQL.Clear;
         if(cmbCategorias.ItemIndex=0)then
            qryProdutos.SQL.Add('select * from produtos')
         else
            qryProdutos.SQL.Add(Format('select * from produtos where id_categoria=%d',[IdCategory]));

         qryProdutos.Open;
         edtDescricao.SetFocus;
      end;
   end;
end;

end.
