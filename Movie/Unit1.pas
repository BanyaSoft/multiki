unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
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
  with Form1.Canvas do
  begin
    Pen.Width := 3;
    MoveTo(400, 25);
    LineTo(100, 680);
    MoveTo(800, 25);
    LineTo(1100, 680);
    Rectangle(60, 500, 100, 680);
    Rectangle(1100, 500, 1140, 680);
    Rectangle(60, 540, 1140, 640);
  end;
end;

procedure DrawChristmasTree(x, y: integer); // TODO
begin
end;

procedure DrawSnowMan(x, y: integer); // (x,y) head top center
begin
  with Form1.Canvas do
  begin
    Pen.Color := clAqua;
    Brush.Color := clCream;
    Ellipse(x - 100, y + 150, x + 100, y + 350);
    Ellipse(x - 70, y + 50, x + 70, y + 160);
    Ellipse(x - 30, y, x + 30, y + 50);
    Pen.Color := clred;
    Brush.Color := clred;
    Pen.Width := 5;
    Ellipse(x - 15, y + 12, x - 13, y + 15);
    Ellipse(x + 15, y + 12, x + 13, y + 15);
    Pen.Width := 3;
    Pen.Color := clblue;
    Brush.Color := clGradientActiveCaption;
    Rectangle(x - 20, y - 20, x + 20, y + 6);
    MoveTo(x - 50, y + 70);
    LineTo(x - 150, y + 30);
    MoveTo(x + 50, y + 70);
    LineTo(x + 150, y + 30);
  end;
end;

function ConstructorPerson(const x, y, Size: integer): TPerson;
var
  NewPerson: TPerson;
begin
  NewPerson.Size := Size;
  NewPerson.Center.x := x;
  NewPerson.Center.y := y;

  Result := NewPerson;
end;

procedure PersonFirstFrame(const currPerson: TPerson);
begin
  with currPerson, Center do
  begin
    Head.Create(x - Size, y - 3 * Size, x + Size, y - 1 * Size);
    Body[1].Create(x, y - Size);
    Body[2].Create(x, y + 2 * Size);

    ArmLeft[1].Create(x, y);
    ArmLeft[2].Create(x - Size, y - Size);
    ArmLeft[3].Create(x - trunc(1.5 * Size), y - 2 * Size);

    ArmRight[1].Create(x, y);
    ArmRight[2].Create(x + Size, y - Size);
    ArmRight[3].Create(x + trunc(1.5 * Size), y - 2 * Size);

    LegLeft[1].Create(x, y + 2 * Size);
    LegLeft[2].Create(x - Size, y + 3 * Size);
    LegLeft[3].Create(x - Size, y + 4 * Size);

    LegRight[1].Create(x, y + 2 * Size);
    LegRight[2].Create(x + Size, y + 3 * Size);
    LegRight[3].Create(x + Size, y + 4 * Size);
  end;
end;

procedure PersonSecondFrame(const currPerson: TPerson);
begin
  with currPerson, Center do
  begin
    Head.Create(x - Size, y - 3 * Size, x + Size, y - 1 * Size);
    Body[1].Create(x, y - Size);
    Body[2].Create(x, y + 2 * Size);

    ArmLeft[1].Create(x, y);
    ArmLeft[2].Create(x - Size, y + Size);
    ArmLeft[3].Create(x - trunc(1.5 * Size), y + 2 * Size);

    ArmRight[1].Create(x, y);
    ArmRight[2].Create(x + Size, y + Size);
    ArmRight[3].Create(x + trunc(1.5 * Size), y + 2 * Size);

    LegLeft[1].Create(x, y + 2 * Size);
    LegLeft[2].Create(x - Size, y + 3 * Size);
    LegLeft[3].Create(x - Size, y + 4 * Size);

    LegRight[1].Create(x, y + 2 * Size);
    LegRight[2].Create(x + Size, y + 3 * Size);
    LegRight[3].Create(x + Size, y + 4 * Size);
  end;
end;

procedure DrawPerson(const PersonToDraw: TPerson);
begin
  with Form1.Canvas do
  begin
    Pen.Color := clWebDarkOrchid;
    Brush.Color := clWhite;
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
  FirstPerson := ConstructorPerson(StrToInt(Edit1.Text), StrToInt(Edit2.Text),
    StrToInt(Edit3.Text));
  PersonFirstFrame(FirstPerson);
  DrawPerson(FirstPerson);

  Timer1.Enabled := True;
  Timer1.Interval := 100;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  DrawBackground();
  DrawChristmasTree(300, 50);
  DrawSnowMan(1100, 50);
  Button2.Enabled := false; // Button is not clickable more after frist click
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
    FirstPerson := ConstructorPerson(Center.x + 5, Center.y + 10, Size + 1);

  if currFrame >= framesCount - 1 then
    Timer1.Enabled := false
  else
  begin
    cartoon[currFrame](FirstPerson);
    DrawPerson(FirstPerson);
    inc(currFrame);
  end;
end;

end.
