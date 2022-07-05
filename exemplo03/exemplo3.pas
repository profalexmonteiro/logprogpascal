unit exemplo3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BitBtn1Click(Sender: TObject);
var
   nasc, atual, idade : integer;
begin
     //recuperacao de entradas
     nasc  := StrToInt( Edit1.Text );
     atual := StrToInt( Edit2.Text );

     //processamento
     idade := atual - nasc;

     //saida
     Edit3.Text := IntToStr(idade);

end;

end.

