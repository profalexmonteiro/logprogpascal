unit exemplo6;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btCalcular: TButton;
    btLimpar: TButton;
    btSair: TButton;
    edPeso: TEdit;
    edAltura: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lIMC: TLabel;
    mResultado: TMemo;
    rbFeminino: TRadioButton;
    rbMasculino: TRadioButton;
    rgSexo: TRadioGroup;
    procedure btCalcularClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btCalcularClick(Sender: TObject);
var
  altura, peso, imc : double;
begin
     //entrada
     peso := StrToFloat( edPeso.Text );
     altura := StrToFloat( edAltura.Text );

     //processamento
     imc := peso / sqr(altura);

     if( rgSexo.ItemIndex = 0 ) then
         if( imc < 19.1 ) then
             mResultado.Lines.Add('Abaixo do peso')
         else
           if ( imc < 25.8 ) then
             mResultado.Lines.Add('Peso Normal')
           else
             if ( imc < 27.3 ) then
               mResultado.Lines.Add('Marginalmente acima do peso')
             else
               if (imc < 31.1) then
                mResultado.Lines.Add('Acima do Peso ideal')
               else
                 mResultado.Lines.Add('OBESA')
     else
         if( imc < 20.7 ) then
             mResultado.Lines.Add('Abaixo do peso')
         else
           if ( imc < 26.4 ) then
             mResultado.Lines.Add('Peso Normal')
           else
             if ( imc < 27.8 ) then
               mResultado.Lines.Add('Marginalmente acima do peso')
             else
               if (imc < 32.3) then
                mResultado.Lines.Add('Acima do Peso ideal')
               else
                 mResultado.Lines.Add('OBESO')



     //saida

end;

procedure TForm1.btLimparClick(Sender: TObject);
begin
  edAltura.Text := '0.0';
  edPeso.Text := '0.0';
  mResultado.Lines.Clear;
end;

procedure TForm1.btSairClick(Sender: TObject);
begin
  close;
end;

end.

