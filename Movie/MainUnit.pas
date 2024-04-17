unit MainUnit;

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
  TTwoPoints   = array [1 .. 2] of TPoint;
  TPolygon     = array of TPoint;

  TPerson = record
    Size: integer;
    Center: TPoint;
    LegLeft, LegRight: TThreePoints;
    ArmLeft, ArmRight: TThreePoints;
    Body: TThreePoints;
    Head: TRect;
  end;

  TEquipment = record
    SnowShoeLeft, SnowShoeRight: TTwoPoints;
    SnowStickLeft, SnowStickRight: TTwoPoints;
  end;

  TFrame  = procedure(const currPerson: TPerson);
  TFrames = array of TFrame;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const
  GlobalX = 100;
  GlobalY = 100;
  LengthX = 2000;
  LengthY = 1100;

var
  FirstPerson: TPerson;
  Cartoon: TFrames;
  FramesCount: integer;
  CurrFrame: integer;

procedure InitMovieBorders;
var
  Borders: TRect;
begin
  Borders.Create(TPoint.Create(GlobalX, GlobalY), TPoint.Create(GlobalX + LengthX, GlobalY + LengthY));

  with Form1.Canvas do
  begin
    Pen.Width := 6;
    Pen.Mode := pmCopy;
    Pen.Color := clBlack;
    Brush.Style := bsClear;

    Rectangle(GlobalX, GlobalY, GlobalX + LengthX, GlobalY + LengthY);
  end;

end;

procedure DrawFirstBackground;
var
  Fence: TPolygon;
begin
  with Form1.Canvas do
  begin
    Pen.Width := 3;
    Pen.Color := clBlack;
    Brush.Style := bsVertical;
    Brush.Color := clBlack;

    SetLength(Fence, 4);

    Fence[0] := TPoint.Create(GlobalX + 3 * LengthX div 8, GlobalY + 150);
    Fence[1] := TPoint.Create(GlobalX + 3 * LengthX div 8, GlobalY + 150 - 50);
    Fence[2] := TPoint.Create(GlobalX + LengthX div 8, GlobalY + LengthY - 50 - 200);
    Fence[3] := TPoint.Create(GlobalX + LengthX div 8, GlobalY + LengthY - 50);
    Polygon(Fence);

    Fence[0] := TPoint.Create(GlobalX + 5 * LengthX div 8, GlobalY + 150);
    Fence[1] := TPoint.Create(GlobalX + 5 * LengthX div 8, GlobalY + 150 - 50);
    Fence[2] := TPoint.Create(GlobalX + 7 * LengthX div 8, GlobalY + LengthY - 50 - 200);
    Fence[3] := TPoint.Create(GlobalX + 7 * LengthX div 8, GlobalY + LengthY - 50);
    Polygon(Fence);

    MoveTo(GlobalX + 3 * LengthX div 8, GlobalY + 150);
    LineTo(GlobalX + 5 * LengthX div 8, GlobalY + 150);

    Fence[0] := TPoint.Create(GlobalX + LengthX div 8, GlobalY + LengthY - 50 - 200);
    Fence[1] := TPoint.Create(GlobalX + LengthX div 8, GlobalY + LengthY - 50);
    Fence[2] := TPoint.Create(GlobalX, GlobalY + LengthY - 50);
    Fence[3] := TPoint.Create(GlobalX, GlobalY + LengthY - 50 - 200);
    Polygon(Fence);

    Fence[0] := TPoint.Create(GlobalX + 7 * LengthX div 8, GlobalY + LengthY - 50 - 200);
    Fence[1] := TPoint.Create(GlobalX + 7 * LengthX div 8, GlobalY + LengthY - 50);
    Fence[2] := TPoint.Create(GlobalX + LengthX, GlobalY + LengthY - 50);
    Fence[3] := TPoint.Create(GlobalX + LengthX, GlobalY + LengthY - 50 - 200);
    Polygon(Fence);

  end;
end;

procedure DrawChristmasTree(x, y, n: integer); // (x,y) Root bottom right
begin
  With Form1.Canvas do
  Begin
    Pen.Width := 1;
    Pen.Color := clWebSaddleBrown;
    Brush.Color := clWebSaddleBrown;
    Polygon([Point(x - 10, y - 50), Point(x - 10, y), Point(x - 90, y),
      Point(x - 90, y - 50)]);
    Pen.Width := 5;
    Pen.Color := clWebDarkgreen;
    Brush.Color := clWebDarkgreen;
    Polygon([Point(x, y - 210), Point(x - 20, y - 210), Point(x + 50, y - 140),
      Point(x + 30, y - 140), Point(x + 100 - 10, y - 50),
      Point(x - 200, y - 50), Point(x - 130, y - 140), Point(x - 150, y - 140),
      Point(x - 80, y - 210), Point(x - 100, y - 210), Point(x - 50, y - 260)]);
    case n of
      1:
        begin
          Pen.Width := 2;
          Pen.Color := clYellow;
          Brush.Color := clPurple;
          Ellipse(x + 5, y - 100, x + 15, y - 110);
          Pen.Color := clAqua;
          Brush.Color := clRed;
          Ellipse(x - 100, y - 170, x - 110, y - 180);
          Pen.Color := clFuchsia;
          Brush.Color := clSkyBlue;
          Ellipse(x - 60, y - 110, x - 70, y - 120);
          Pen.Color := clWebLightCoral;
          Brush.Color := clWebDarkBlue;
          Ellipse(x - 40, y - 210, x - 30, y - 220);
        end;
      2:
        begin
          Pen.Width := 2;
          Pen.Color := clFuchsia;
          Brush.Color := clSkyBlue;
          Ellipse(x + 15, y - 100, x + 25, y - 110);
          Pen.Color := clWebLightCoral;
          Brush.Color := clWebDarkBlue;
          Ellipse(x - 100, y - 170, x - 110, y - 180);
          Pen.Color := clLime;
          Brush.Color := clPurple;
          Ellipse(x - 160, y - 80, x - 170, y - 90);
          Pen.Color := clAqua;
          Brush.Color := clRed;
          Ellipse(x - 40, y - 210, x - 30, y - 220);
        end;
    end;
  end;
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
    Head.Create(x - 9 * Size div 8, y - 2 * Size, x + 3 * Size div 8, y - Size div 2);
    Body[1].Create(x - 2 * Size div 10, y - Size div 2);
    Body[2].Create(x, y);
    Body[3].Create(x + 2 * Size div 10, y + 2 * Size);

    ArmLeft[1].Create(x, y);
    ArmLeft[2].Create(x - Size, y + Size);
    ArmLeft[3].Create(x - 3 * Size div 2, y + Size div 4);

    ArmRight[1].Create(x, y);
    ArmRight[2].Create(x + Size div 2, y + 9 * Size div 10);
    ArmRight[3].Create(x + Size div 2, y - Size div 4);

    LegLeft[1].Create(Body[3].x, Body[3].y);
    with LegLeft[1] do
    begin
      LegLeft[2].Create(x - 3 * Size div 2, y + Size);
      LegLeft[3].Create(x - Size div 2, y + 5 * Size div 2);
    end;

    LegRight[1].Create(Body[3].x, Body[3].y);
    with LegRight[1] do
    begin
      LegRight[2].Create(x - Size div 2, y + Size);
      LegRight[3].Create(x + Size div 2, y + 5 * Size div 2);
    end;
  end;
end;

procedure PersonSecondFrame(const currPerson: TPerson);
begin
  with currPerson, Center do
  begin
    Head.Create(x - 9 * Size div 8, y - 2 * Size, x + 3 * Size div 8, y - Size div 2);
    Body[1].Create(x - 2 * Size div 10, y - Size div 2);
    Body[2].Create(x, y);
    Body[3].Create(x + 2 * Size div 10, y + 2 * Size);

    ArmLeft[1].Create(x, y);
    ArmLeft[2].Create(x - 3 * Size div 4, y + Size);
    ArmLeft[3].Create(x - 3 * Size div 2, y + 3 * Size div 4);

    ArmRight[1].Create(x, y);
    ArmRight[2].Create(x + Size div 2, y + 9 * Size div 10);
    ArmRight[3].Create(x - Size div 10, y + 3 * Size div 4);

    LegLeft[1].Create(Body[3].x, Body[3].y);
    with LegLeft[1] do
    begin
      LegLeft[2].Create(x - 3 * Size div 2, y + Size);
      LegLeft[3].Create(x - Size div 2, y + 5 * Size div 2);
    end;

    LegRight[1].Create(Body[3].x, Body[3].y);
    with LegRight[1] do
    begin
      LegRight[2].Create(x - Size div 2, y + Size);
      LegRight[3].Create(x + Size div 2, y + 5 * Size div 2);
    end;
  end;
end;

procedure PersonThirdFrame(const currPerson: TPerson);
begin
  with currPerson, Center do
  begin
    Head.Create(x - 9 * Size div 8, y - 2 * Size, x + 3 * Size div 8, y - Size div 2);
    Body[1].Create(x - 2 * Size div 10, y - Size div 2);
    Body[2].Create(x, y);
    Body[3].Create(x + 2 * Size div 10, y + 2 * Size);

    ArmLeft[1].Create(x, y);
    ArmLeft[2].Create(x - Size div 2, y + Size);
    ArmLeft[3].Create(x - Size, y + 6 * Size div 4);

    ArmRight[1].Create(x, y);
    ArmRight[2].Create(x + Size div 2, y + 9 * Size div 10);
    ArmRight[3].Create(x - Size div 10, y + 6 * Size div 4);

    LegLeft[1].Create(Body[3].x, Body[3].y);
    with LegLeft[1] do
    begin
      LegLeft[2].Create(x - 3 * Size div 2, y + Size);
      LegLeft[3].Create(x - Size div 2, y + 5 * Size div 2);
    end;

    LegRight[1].Create(Body[3].x, Body[3].y);
    with LegRight[1] do
    begin
      LegRight[2].Create(x - Size div 2, y + Size);
      LegRight[3].Create(x + Size div 2, y + 5 * Size div 2);
    end;
  end;
end;

procedure PersonForthFrame(const currPerson: TPerson);
begin
  with currPerson, Center do
  begin
    Head.Create(x - 2 * Size div 4, y - 3 * Size div 2, x + 2 * Size div 4, y - Size div 2);
    Body[1].Create(x, y - Size div 2);
    Body[2].Create(x, y);
    Body[3].Create(x, y + 3 * Size div 2);

    ArmLeft[1].Create(x, y);
    ArmLeft[2].Create(x - Size div 2, y - Size div 3);
    ArmLeft[3].Create(x - Size, y - 3 * Size div 3);

    ArmRight[1].Create(x, y);
    ArmRight[2].Create(x + Size div 2, y - Size div 3);
    ArmRight[3].Create(x + Size, y - 3 * Size div 3);

    LegLeft[1].Create(Body[3].x, Body[3].y);
    with LegLeft[1] do
    begin
      LegLeft[2].Create(x - Size div 2, y + Size div 2);
      LegLeft[3].Create(x - 2 *Size div 5, y + 2 * Size);
    end;

    LegRight[1].Create(Body[3].x, Body[3].y);
    with LegRight[1] do
    begin
      LegRight[2].Create(x + Size div 2, y + Size div 2);
      LegRight[3].Create(x + 2 *Size div 5, y + 2 * Size);
    end;
  end;
end;

procedure PersonFifthFrame(const currPerson: TPerson);
begin
  with currPerson, Center do
  begin
    Head.Create(x - 2 * Size div 4, y - 3 * Size div 2, x + 2 * Size div 4, y - Size div 2);
    Body[1].Create(x, y - Size div 2);
    Body[2].Create(x, y);
    Body[3].Create(x, y + 3 * Size div 2);

    ArmLeft[1].Create(x, y);
    ArmLeft[2].Create(x - Size div 2, y + Size div 5);
    ArmLeft[3].Create(x - Size, y - Size div 5);

    ArmRight[1].Create(x, y);
    ArmRight[2].Create(x + Size div 2, y + Size div 5);
    ArmRight[3].Create(x + Size, y - Size div 5);

    LegLeft[1].Create(Body[3].x, Body[3].y);
    with LegLeft[1] do
    begin
      LegLeft[2].Create(x - Size div 2, y + Size div 2);
      LegLeft[3].Create(x - 2 *Size div 5, y + 2 * Size);
    end;

    LegRight[1].Create(Body[3].x, Body[3].y);
    with LegRight[1] do
    begin
      LegRight[2].Create(x + Size div 2, y + Size div 2);
      LegRight[3].Create(x + 2 *Size div 5, y + 2 * Size);
    end;
  end;
end;

procedure PersonSixthFrame(const currPerson: TPerson);
begin
  with currPerson, Center do
  begin
    Head.Create(x - 2 * Size div 4, y - 3 * Size div 2, x + 2 * Size div 4, y - Size div 2);
    Body[1].Create(x, y - Size div 2);
    Body[2].Create(x, y);
    Body[3].Create(x, y + 3 * Size div 2);

    ArmLeft[1].Create(x, y);
    ArmLeft[2].Create(x - 1 * Size div 3, y + 2 * Size div 4);
    ArmLeft[3].Create(x - 2 * Size div 4, y + 5 * Size div 4);

    ArmRight[1].Create(x, y);
    ArmRight[2].Create(x + 1 * Size div 3, y + 2 * Size div 4);
    ArmRight[3].Create(x + 2 * Size div 4, y + 5 * Size div 4);

    LegLeft[1].Create(Body[3].x, Body[3].y);
    with LegLeft[1] do
    begin
      LegLeft[2].Create(x - Size div 2, y + Size div 2);
      LegLeft[3].Create(x - 2 *Size div 5, y + 2 * Size);
    end;

    LegRight[1].Create(Body[3].x, Body[3].y);
    with LegRight[1] do
    begin
      LegRight[2].Create(x + Size div 2, y + Size div 2);
      LegRight[3].Create(x + 2 *Size div 5, y + 2 * Size);
    end;
  end;
end;

procedure DrawPerson(const PersonToDraw: TPerson);
begin
  with Form1.Canvas do
  begin
    Pen.Color := clBlack;
    Pen.Mode := pmNotXor;
    Brush.Style := bsClear;

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
  CurrFrame := 0;
  FirstPerson := ConstructorPerson(StrToInt(Edit1.Text), StrToInt(Edit2.Text), StrToInt(Edit3.Text));

  PersonThirdFrame(FirstPerson);
  DrawPerson(FirstPerson);

  Timer1.Enabled := True;
  Timer1.Interval := 500;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  DrawFirstBackground();

  InitMovieBorders;

  DrawChristmasTree(400, 400, 1);
  DrawSnowMan(1100, 50);
  Button2.Enabled := false; // Button is not clickable more after frist click
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FramesCount := 30;
  CurrFrame := 0;

  SetLength(Cartoon, FramesCount);

  for var i := Low(Cartoon) to High(Cartoon) do
  begin
    case i mod 3 of
      0:
        Cartoon[i] := PersonFirstFrame;
      1:
        Cartoon[i] := PersonSecondFrame;
      2:
        Cartoon[i] := PersonThirdFrame;

    end;
  end;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Canvas.Pen.Mode := pmNotXor;
  DrawPerson(FirstPerson);
  with FirstPerson do
    FirstPerson := ConstructorPerson(Center.x - 5, Center.y + 10, Size + 1);

  if CurrFrame >= FramesCount - 1 then
    Timer1.Enabled := false
  else
  begin
    Cartoon[CurrFrame](FirstPerson);
    DrawPerson(FirstPerson);
    inc(CurrFrame);
  end;
end;

end.
