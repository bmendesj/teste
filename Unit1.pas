unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  Vcl.StdCtrls, Vcl.DBCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  RESTClient1: TRESTClient;
  RESTResponse1: TRESTResponse;
  RESTRequest1: TRESTRequest;
begin
  RESTClient1 := TRESTClient.Create(nil);
  RESTClient1.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
  RESTClient1.AcceptCharset := 'utf-8, *;q=0.8';
  RESTClient1.BaseURL := 'https://receitaws.com.br/v1/cnpj/82176983000186';

  RESTResponse1 := TRESTResponse.Create(nil);
  RESTResponse1.ContentType := 'application/json';

  RESTRequest1 := TRESTRequest.Create(nil);
  RESTRequest1.Client := RESTClient1;
  RESTRequest1.Response := RESTResponse1;
  RESTRequest1.Execute;

  Memo1.Lines.Clear;
  Memo1.Lines.Add(RESTRequest1.Response.Content);
end;

end.
