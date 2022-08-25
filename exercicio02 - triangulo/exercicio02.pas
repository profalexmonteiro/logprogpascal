unit exercicio02;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Btriangulo: TButton;
    Blimpar: TButton;
    Bsair: TButton;
    EladoA: TEdit;
    EladoB: TEdit;
    EladoC: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MResultado: TMemo;
    procedure BlimparClick(Sender: TObject);
    procedure BsairClick(Sender: TObject);
    procedure BtrianguloClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BtrianguloClick(Sender: TObject);
var
  a : double;
  b : double;
  c : double;
begin


end;

procedure TForm1.BlimparClick(Sender: TObject);
begin

end;

procedure TForm1.BsairClick(Sender: TObject);
begin

end;

end.

