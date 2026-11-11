unit exercicio6;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Entradas, Calculos;

type

  { TForm1 }

  TForm1 = class(TForm)
    Bdigitar: TButton;
    Blimpar: TButton;
    Bsair: TButton;
    EnumNotas: TEdit;
    Emedia: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure BdigitarClick(Sender: TObject);
    procedure BlimparClick(Sender: TObject);
    procedure BsairClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BdigitarClick(Sender: TObject);
var
  texto: string;
  quantidade: Integer;
  nota, media: Double;
begin
  try
    quantidade := 0;
    media := 0;
    while True do
    begin
      texto := '';
      // Cancelar encerra a coleta preservando as notas ja informadas.
      if not InputQuery('Digite a nota ou -1 para terminar', 'NOTA:', texto) then Break;
      if not TentarNumero(texto, nota) then
      begin
        ShowMessage('Informe uma nota numerica ou -1 para terminar.');
        Continue;
      end;
      if nota = -1 then Break;
      if nota < 0 then
      begin
        ShowMessage('A nota nao pode ser negativa. Use -1 para terminar.');
        Continue;
      end;
      Inc(quantidade);
      media := media + (nota - media) / quantidade;
    end;
    EnumNotas.Text := IntToStr(quantidade);
    Emedia.Text := FloatToStr(media);
  except
    on E: EMathError do
      ShowMessage('Os valores informados excedem os limites do calculo.');
  end;
end;

procedure TForm1.BlimparClick(Sender: TObject);
begin
  EnumNotas.Text := '0';
  Emedia.Text := '0';
end;

procedure TForm1.BsairClick(Sender: TObject);
begin
  close;
end;

end.
