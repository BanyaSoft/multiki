unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TThreePoints = array [1 .. 3] of TPoint;
  TTwoPoints = array [1 .. 2] of TPoint;

  TPerson = record
    Size: integer;
    Centre: TPoint;
    LegLeft, LegRight: TThreePoints;
    ArmLeft, ArmRight: TThreePoints;
    Body: TTwoPoints;
    Head: TRect;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var
  FirstPerson: TPerson;

function ConstructorPerson(const X, Y, Size: integer): TPerson;
var
  NewPerson: TPerson;
begin
  NewPerson.Size := Size;
  NewPerson.Centre.X := X;
  NewPerson.Centre.Y := Y;
end;

function PersonFirstFrame(const CurrPerson: TPerson): TPerson;
begin

end;

procedure DrawPerson(const PersonToDraw: TPerson);
begin
  with Form1.Canvas do
  begin
    Polyline(PersonToDraw.LegLeft);
    Polyline(PersonToDraw.LegRight);
    Polyline(PersonToDraw.ArmLeft);
    Polyline(PersonToDraw.ArmRight);
    Polyline(PersonToDraw.Body);
    Ellipse(PersonToDraw.Head);
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  FirstPerson := ConstructorPerson(StrToInt(Edit1.Text), StrToInt(Edit2.Text), StrToInt(Edit3.Text));
  FirstPerson := PersonFirstFrame(FirstPerson);
  DrawPerson(FirstPerson);
end;

end.
