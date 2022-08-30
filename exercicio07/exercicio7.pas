unit exercicio7;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    bQueda: TButton;
    bLimpar: TButton;
    bSair: TButton;
    eFluxo: TEdit;
    eAltura: TEdit;
    eQueda: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RadioGroup1: TRadioGroup;
    procedure bLimparClick(Sender: TObject);
    procedure bQuedaClick(Sender: TObject);
    procedure bSairClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.bQuedaClick(Sender: TObject);
var
  tg : integer;
  Q, hg, Pg : double;
  a, b : double;
begin
  //entrada
  Q  := StrToFloat( eFluxo.Text);
  hg := StrToFloat( eAltura.Text );
  tg := RadioGroup1.ItemIndex;

  //processamento
  case tg of
       0:begin
         a := 0.722;
         b := 0.197;
       end;
       1:begin
         a := 0.583;
         b := 0.512;
       end;
       2: begin
         a := 0.333;
         b := 0.302;
       end;
       3: begin
         a := 0.825;
         b := 0.164;
       end;
  end;

  Pg := (a*sqr(Q)*hg)/ln(1+b*Q);

  //saida
  eQueda.Text:= FloatToStr( Pg );

end;

procedure TForm1.bSairClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.bLimparClick(Sender: TObject);
begin
  eQueda.Text := '0';
  eAltura.Text := '0';
  eFluxo.Text  := '0';
end;

end.

