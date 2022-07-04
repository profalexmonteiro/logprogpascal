unit exemplo2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    bbSair: TButton;
    BitBtn1: TBitBtn;
    procedure bbSairClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btCalcularClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btCalcularClick(Sender: TObject);
begin

end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
   s_altura, s_base, s_area : string;
   area, base, altura : double;
begin
     //recuperação de variavéis
     s_altura := inputBox('Digite a altura','Valor: ','');
     s_base := inputBox('Digite a base','Valor: ','');

     //processamento
     base := StrToFloat(s_base);
     altura := StrToFloat(s_altura);

     area := base*altura/2;

     s_area := FloatToStr(area);

     //saída
     ShowMessage('A área do triangulo é: ' + s_area);
end;

procedure TForm1.bbSairClick(Sender: TObject);
begin
  close;
end;

end.

