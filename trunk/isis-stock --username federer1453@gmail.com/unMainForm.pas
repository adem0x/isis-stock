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
    pnCategorias: TPanel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    btnPesquisar: TButton;
    DBGrid1: TDBGrid;
    qryProdutos: TZQuery;
    dsProdutos: TDataSource;
  private
    { Private declarations }
    function LoadCategories:Integer;
  public
    { Public declarations }
    function OpenConnection:Integer;
    function GetConnection:TZConnection;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

{ TMainForm }

function TMainForm.GetConnection:TZConnection;
begin
   try
      Result:=MainConn;
   except
      Result:=nil;
   end;
end;

function TMainForm.LoadCategories: Integer;
var
   iLeft:Integer;
   iCount:Integer;
begin
   if(OpenConnection=0)then
   begin
      iLeft:=0;
      iCount:=Floor(1000/tblCategorias.RecordCount);
      tblCategorias.Open;
      tblCategorias.First;

      while not tblCategorias.Eof do
      begin
         with TSpeedButton.Create(nil)do
         begin
            Parent:=pnCategorias;
            SetBounds(iLeft,0,);
         end;
      end;
   end;
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

end.
