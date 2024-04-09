unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Timer1: TTimer;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TThreePoints = array [1 .. 3] of TPoint;
  TTwoPoints = array [1 .. 2] of TPoint;

  TPerson = record
    Size: integer;
    Center: TPoint;
    LegLeft, LegRight: TThreePoints;
    ArmLeft, ArmRight: TThreePoints;
    Body: TTwoPoints;
    Head: TRect;
  end;

  TFrame = procedure(const currPerson: TPerson);
  TFrames = array of TFrame;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var
  FirstPerson: TPerson;
  cartoon: TFrames;
  framesCount: integer;
  currFrame: integer;

procedure DrawBackground();
begin
    Form1.Canvas.Pen.Width := 3;

    Form1.Canvas.MoveTo(400, 25);
    Form1.Canvas.LineTo(100, 680);
    Form1.Canvas.MoveTo(800, 25);
    Form1.Canvas.LineTo(1100, 680);
    Form1.Canvas.Rectangle(60, 500, 100, 680);
    Form1.Canvas.Rectangle(1100, 500, 1140, 680);
    Form1.Canvas.Rectangle(60, 540, 1140, 640);
end;

function ConstructorPerson(const X, Y, Size: integer): TPerson;
var
  NewPerson: TPerson;
begin
  NewPerson.Size := Size;
  NewPerson.Center.X := X;
  NewPerson.Center.Y := Y;

  Result := NewPerson;
end;

procedure PersonFirstFrame(const CurrPerson: TPerson);
begin
  with CurrPerson, Center do
  begin
    Head.Create(X - Size, Y - 3 * Size, X + Size, Y - 1 * Size);
    Body[1].Create(X, Y - Size);
    Body[2].Create(X, Y + 2 * Size);

    ArmLeft[1].Create(X, Y);
    ArmLeft[2].Create(X - Size, Y-size);
    ArmLeft[3].Create(X - trunc(1.5 * Size), Y - 2*Size);

    ArmRight[1].Create(X, Y);
    ArmRight[2].Create(X + Size, Y-size);
    ArmRight[3].Create(X + trunc(1.5 * Size), Y - 2*Size);

    LegLeft[1].Create(X, Y + 2 * Size);
    LegLeft[2].Create(X - Size, Y + 3 * Size);
    LegLeft[3].Create(X - Size, Y + 4 * Size);

    LegRight[1].Create(X, Y + 2 * Size);
    LegRight[2].Create(X + Size, Y + 3 * Size);
    LegRight[3].Create(X + Size, Y + 4 * Size);
  end;
end;

procedure PersonSecondFrame(const CurrPerson: TPerson);
begin
  with CurrPerson, Center do
  begin
    Head.Create(X - Size, Y - 3 * Size, X + Size, Y - 1 * Size);
    Body[1].Create(X, Y - Size);
    Body[2].Create(X, Y + 2 * Size);

    ArmLeft[1].Create(X, Y);
    ArmLeft[2].Create(X - Size, Y+size);
    ArmLeft[3].Create(X - trunc(1.5 * Size), Y + 2 * Size);

    ArmRight[1].Create(X, Y);
    ArmRight[2].Create(X + Size, Y+size);
    ArmRight[3].Create(X + trunc(1.5 * Size), Y+2*Size);

    LegLeft[1].Create(X, Y + 2 * Size);
    LegLeft[2].Create(X - Size, Y + 3 * Size);
    LegLeft[3].Create(X - Size, Y + 4 * Size);

    LegRight[1].Create(X, Y + 2 * Size);
    LegRight[2].Create(X + Size, Y + 3 * Size);
    LegRight[3].Create(X + Size, Y + 4 * Size);
  end;
end;

procedure DrawPerson(const PersonToDraw: TPerson);
begin
  with Form1.Canvas do
  begin
    Pen.Width := 5;
    PolyLine(PersonToDraw.LegLeft);
    PolyLine(PersonToDraw.LegRight);
    PolyLine(PersonToDraw.ArmLeft);
    PolyLine(PersonToDraw.ArmRight);
    PolyLine(PersonToDraw.Body);
    Ellipse(PersonToDraw.Head);
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  currFrame := 0;
  FirstPerson := ConstructorPerson(StrToInt(Edit1.Text), StrToInt(Edit2.Text), StrToInt(Edit3.Text));
  PersonFirstFrame(FirstPerson);
  DrawPerson(FirstPerson);

  Timer1.Enabled := True;
  Timer1.Interval := 100;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    DrawBackground();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    framesCount := 30;
    currFrame := 0;

    SetLength(cartoon, framesCount);

    for var i := Low(cartoon) to High(cartoon) do
    begin
        if (i mod 2 = 0) then
            cartoon[i] := PersonFirstFrame
        else
            cartoon[i] := PersonSecondFrame;
    end;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Form1.Canvas.Pen.Mode := pmNotXor;
  DrawPerson(FirstPerson);
  with FirstPerson do
    FirstPerson := ConstructorPerson(Center.X + 5, Center.Y + 10, Size + 1);

  if currFrame >= framesCount-1 then
    Timer1.Enabled := false
  else
  begin
    cartoon[currFrame](FirstPerson);
    DrawPerson(FirstPerson);
    inc(currFrame);
  end;
end;

end.
