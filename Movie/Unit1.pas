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
  TTwoPoints   = array [1 .. 2] of TPoint;
  TPolygon     = array of TPoint;

  TPerson = record
    Size: integer;
    Center: TPoint;
    LegLeft, LegRight: TThreePoints;
    ArmLeft, ArmRight: TThreePoints;
    Body: TTwoPoints;
    Head: TRect;
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

procedure DrawBackground();
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
    Pen.Color := clWebDarkOrchid;
    Brush.Color := clWhite;
    Pen.Width := 5;
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

  PersonFirstFrame(FirstPerson);
  DrawPerson(FirstPerson);

  Timer1.Enabled := True;
  Timer1.Interval := 100;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  DrawBackground();

  InitMovieBorders;

  DrawChristmasTree(300, 50);
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
    if (i mod 2 = 0) then
      Cartoon[i] := PersonFirstFrame
    else
      Cartoon[i] := PersonSecondFrame;
  end;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Form1.Canvas.Pen.Mode := pmNotXor;
  DrawPerson(FirstPerson);
  with FirstPerson do
    FirstPerson := ConstructorPerson(Center.x + 5, Center.y + 10, Size + 1);

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

    // MoveTo(GlobalX + 5 * LengthX div 8, GlobalY + 50);
    // LineTo(GlobalX + 7 * LengthX div 8, GlobalY + LengthY - 50);
    // Rectangle(GlobalX, 500, GlobalX + 40, 680);
    //
    // MoveTo(400, 25);
    // LineTo(100, 680);
    // MoveTo(800, 25);
    // LineTo(1100, 680);
    // Rectangle(60, 500, 100, 680);
    // Rectangle(1100, 500, 1140, 680);
    // Rectangle(60, 540, 1140, 640);
