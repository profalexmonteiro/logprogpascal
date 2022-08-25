unit exemplo4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    EgrausC: TEdit;
    EgrausF: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Label2Click(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var
   F, C : double;
begin
     //recuperação de variáveis
     F := StrToFloat( EgrausF.Text );

     //processamento
     C := 5/9*(F-32);

     //saida
     EgrausC.Text := FloatToStr(C);

end;

procedure TForm1.Button2Click(Sender: TObject);
var
   C, F: double;
begin
     //recuperação de entradas
     C := StrToFloat( EgrausC.Text );

     //processamento
     F := 1.8*C+32;

     //Saída
     EgrausF.Text := FloatToStr(F);

end;

end.

