unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Types,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  DataTypes, Vcl.MPlayer, Math, Dance;

type
  TMainForm = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    timeStarter1: TTimer;
    Button1: TButton;
    timeAnimation1: TTimer;
    timeAnimation2: TTimer;
    timeStarter2: TTimer;
    Trash: TTimer;
    MediaPlayer1: TMediaPlayer;
    timeStarter3: TTimer;
    timeAnimation3: TTimer;
    timeDebug: TTimer;
    timeStarter4: TTimer;
    timeAnimation4: TTimer;
    mpVictoryMusic: TMediaPlayer;
    mpClap: TMediaPlayer;
    imgMain: TImage;
    FirstPersonHU: TTimer;
    FirstPersonHD: TTimer;
    SecondPersonHU: TTimer;
    SecondPersonHD: TTimer;
    procedure timeStarter1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonClear(Sender: TObject);
    procedure timeAnimation1Timer(Sender: TObject);
    procedure timeStarter2Timer(Sender: TObject);
    procedure timeAnimation2Timer(Sender: TObject);
    procedure timeStarter3Timer(Sender: TObject);
    procedure timeAnimation3Timer(Sender: TObject);
    procedure TrashTimer(Sender: TObject);
    procedure timeDebugTimer(Sender: TObject);
    procedure timeStarter4Timer(Sender: TObject);
    procedure timeAnimation4Timer(Sender: TObject);
    procedure FirstPersonHUTimer(Sender: TObject);
    procedure FirstPersonHDTimer(Sender: TObject);
    procedure SecondPersonHUTimer(Sender: TObject);
    procedure SecondPersonHDTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

var
  FirstPerson: TPerson;
  FirstEquip: TEquipment;
  SecondPerson: TPerson;
  SecondEquip: TEquipment;
  PersonAnimation: TPersonFrames;
  EquipAnimation: TEquipFrames;
  FramesCount: integer;
  CurrFrame: integer;
  CurrFrame2: integer;
  xc, yc, xc_start, yc_start: integer;
  k: real;
  i: integer;
  sign: boolean;

  CheerPerson1, CheerPerson2: TVectorPerson;
  PonPonL1, PonPonR1, PonPonL2, PonPonR2: TPonPon;
  stayArmRight1, stayArmLeft1, stayArmRight2, stayArmLeft2: TPointsArm;
  angleRightArm1, angleLeftArm1, angleRightArm2, angleLeftArm2: TAnglesArm;
  angle1, angle2, baseAngle1, baseAngle2, angleRotated1, angleRotated2: single;

  currLeft, currRight, prevLeft, prevRight, stayLeft, stayRight, stayEnding,
    stayLeft1, stayRight1, leg: TPoint;

  angleEnding: single;
  dlength, length, framesAmount, lengthLeg, lengthFeet, Radius: integer;

procedure DrawChristmasTree(x, y, n: integer);
forward
procedure DrawSnowMan(x, y, size: integer);
forward

procedure DrawWhiteSpace;
var
  Borders: TRect;
begin
  Borders.Create(TPoint.Create(0, 0), TPoint.Create(LengthX, LengthY));

  with MainForm.imgMain.Canvas do
  begin
    Brush.Color := MainForm.Color;
    Brush.Style := bsSolid;

    FillRect(Borders);
  end;
end;

procedure InitMovieBorders;
var
  Borders: TRect;
begin
  Borders.Create(TPoint.Create(GlobalX, GlobalY),
    TPoint.Create(LengthX - GlobalX, LengthY - GlobalY));

  with MainForm.imgMain.Canvas do
  begin
    Pen.Width := 6;
    Pen.Color := clBlack;
    Pen.Mode := pmCopy;
    Brush.Color := MainForm.Color;
    Brush.Style := bsClear;

    Rectangle(GlobalX, GlobalY, LengthX - GlobalX, LengthY - GlobalY);
  end;

end;

procedure DrawFirstBackground;
var
  Fence: TPolygon;
begin

  InitMovieBorders();
  with MainForm.imgMain.Canvas do
  begin

    Pen.Width := 3;
    Pen.Color := clBlack;
    Pen.Mode := pmCopy;
    Brush.Color := clBlack;
    Brush.Style := bsVertical;

    SetLength(Fence, 4);

    Fence[0] := TPoint.Create(GlobalX + 3 * LengthX div 8, 3 * GlobalY div 2);
    Fence[1] := TPoint.Create(GlobalX + 3 * LengthX div 8, 2 * GlobalY);
    Fence[2] := TPoint.Create(GlobalX + LengthX div 8, LengthY - GlobalY);
    Fence[3] := TPoint.Create(GlobalX + LengthX div 8,
      LengthY - 5 * GlobalY div 2);
    Polygon(Fence);

    Fence[0] := TPoint.Create(GlobalX + 5 * LengthX div 8, 3 * GlobalY div 2);
    Fence[1] := TPoint.Create(GlobalX + 5 * LengthX div 8, 2 * GlobalY);
    Fence[2] := TPoint.Create(GlobalX + 7 * LengthX div 8, LengthY - GlobalY);
    Fence[3] := TPoint.Create(GlobalX + 7 * LengthX div 8,
      LengthY - 5 * GlobalY div 2);
    Polygon(Fence);

    MoveTo(GlobalX + 3 * LengthX div 8, 2 * GlobalY);
    LineTo(GlobalX + 5 * LengthX div 8, 2 * GlobalY);
    {
      MoveTo(GlobalX + LengthX div 8, GlobalY + LengthY - 50 - 200);
      LineTo(GlobalX + LengthX div 8, GlobalY + LengthY - 50);

      MoveTo(GlobalX + 7 * LengthX div 8, GlobalY + LengthY - 50 - 200);
      LineTo(GlobalX + 7 * LengthX div 8, GlobalY + LengthY - 50);
    }
    Fence[0] := TPoint.Create(GlobalX + LengthX div 8,
      LengthY - 5 * GlobalY div 2);
    Fence[1] := TPoint.Create(GlobalX + LengthX div 8, LengthY - GlobalY);
    Fence[2] := TPoint.Create(GlobalX, LengthY - GlobalY);
    Fence[3] := TPoint.Create(GlobalX, LengthY - 5 * GlobalY div 2);
    Polygon(Fence);

    Fence[0] := TPoint.Create(GlobalX + 7 * LengthX div 8,
      LengthY - 5 * GlobalY div 2);
    Fence[1] := TPoint.Create(GlobalX + 7 * LengthX div 8, LengthY - GlobalY);
    Fence[2] := TPoint.Create(LengthX - GlobalX, LengthY - GlobalY);
    Fence[3] := TPoint.Create(LengthX - GlobalX, LengthY - 5 * GlobalY div 2);
    Polygon(Fence);
  end;

  DrawChristmasTree(600, 450, 1);
  DrawChristmasTree(525, 550, 2);
  DrawChristmasTree(450, 650, 2);
  DrawChristmasTree(375, 750, 1);
  DrawChristmasTree(300, 850, 2);

  DrawSnowMan(LengthX - 2 * GlobalX, GlobalY * 4, 6);
end;

procedure DrawChristmasTree(x, y, n: integer); // (x,y) Root bottom right
begin
  With MainForm.imgMain.Canvas do
  Begin
    Pen.Width := 1;
    Pen.Color := clWebSaddleBrown;
    Pen.Mode := pmCopy;
    Brush.Color := clWebSaddleBrown;
    Brush.Style := bsSolid;

    Polygon([Point(x - 10, y - 50), Point(x - 10, y), Point(x - 90, y),
      Point(x - 90, y - 50)]);

    Pen.Width := 5;
    Pen.Color := clWebDarkgreen;
    Brush.Color := clWebDarkgreen;

    Polygon([Point(x, y - 210), Point(x - 20, y - 210), Point(x + 50, y - 140),
      Point(x + 30, y - 140), Point(x + 100 - 10, y - 50),
      Point(x - 200, y - 50), Point(x - 130, y - 140), Point(x - 150, y - 140),
      Point(x - 80, y - 210), Point(x - 100, y - 210), Point(x - 50, y - 260)]);

    Pen.Width := 4;
    Pen.Color := clWebDarkSlategray;
    Brush.Color := clWhite;
    Brush.Style := bsClear;

    PolyLine([Point(x, y - 210), Point(x - 20, y - 210), Point(x + 50, y - 140),
      Point(x + 30, y - 140), Point(x + 100 - 10, y - 50),
      Point(x - 200, y - 50), Point(x - 130, y - 140), Point(x - 150, y - 140),
      Point(x - 80, y - 210), Point(x - 100, y - 210), Point(x - 50, y - 260),
      Point(x, y - 210)]);
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

procedure DrawSnowMan(x, y, size: integer); // (x,y) head top center
begin
  with MainForm.imgMain.Canvas do
  begin
    Pen.Width := 3;
    Pen.Color := clAqua;
    Pen.Mode := pmCopy;
    Brush.Color := clCream;
    Brush.Style := bsSolid;

    Ellipse(x - 10 * size, y + 15 * size, x + 10 * size, y + 35 * size);
    Ellipse(x - 7 * size, y + 5 * size, x + 7 * size, y + 16 * size);
    Ellipse(x - 3 * size, y, x + 3 * size, y + 5 * size);

    Pen.Color := clRed;
    Brush.Color := clRed;
    Pen.Width := 5;
    Ellipse(x - 15, y + 12, x - 13, y + 15);
    Ellipse(x + 15, y + 12, x + 13, y + 15);

    Pen.Width := 3;
    Pen.Color := clblue;
    Brush.Color := clGradientActiveCaption;
    Rectangle(x - 2 * size, y - 2 * size, x + 2 * size, y + size);
    MoveTo(x - 5 * size, y + 7 * size);
    LineTo(x - 15 * size, y + 3 * size);
    MoveTo(x + 5 * size, y + 7 * size);
    LineTo(x + 15 * size, y + 3 * size);
  end;
end;

procedure DrawLittleFlag(x, y, size: integer);
begin
  with MainForm.imgMain.Canvas do
  begin
    Pen.Width := 6;
    Pen.Color := clBlack;
    Pen.Mode := pmCopy;
    Brush.Color := clWhite;
    Brush.Style := bsClear;
    MoveTo(x, y + size);
    LineTo(x, y);
    LineTo(x + size div 2, y + size div 4);
    LineTo(x, y + size div 3);
  end;
end;

procedure DrawSecondBackground;
var
  Fence: TPolygon;
  i, currX, currY, lenUnit: integer;
begin
  lenUnit := LengthX div 100;
  SetLength(Fence, 4);

  DrawWhiteSpace();
  InitMovieBorders();

  with MainForm.imgMain.Canvas, MainForm do
  begin
    Pen.Width := 6;
    Pen.Color := clBlack;
    Pen.Mode := pmCopy;
    Brush.Color := clBlack;
    Brush.Style := bsCross;

    Fence[0] := TPoint.Create(GlobalX + lenUnit, LengthY - GlobalY - lenUnit
      * 20 + 20);
    Fence[1] := TPoint.Create(GlobalX + lenUnit * 90,
      LengthY - GlobalY - lenUnit * 10 + 20);
    Fence[2] := TPoint.Create(GlobalX + lenUnit * 90,
      LengthY - GlobalY - lenUnit * 2 + 20);
    Fence[3] := TPoint.Create(GlobalX + lenUnit, LengthY - GlobalY - lenUnit
      * 12 + 20);
    Polygon(Fence);

    Fence[0] := TPoint.Create(GlobalX + lenUnit, LengthY - GlobalY - lenUnit
      * 45 + 20);
    Fence[1] := TPoint.Create(GlobalX + lenUnit * 90,
      LengthY - GlobalY - lenUnit * 35 + 20);
    Fence[2] := TPoint.Create(GlobalX + lenUnit * 90,
      LengthY - GlobalY - lenUnit * 27 + 20);
    Fence[3] := TPoint.Create(GlobalX + lenUnit, LengthY - GlobalY - lenUnit
      * 37 + 20);
    Polygon(Fence);

    Pen.Width := 4;
    Pen.Color := clBlack;
    Pen.Mode := pmCopy;
    Brush.Color := MainForm.Color;
    Brush.Style := bsClear;

    currX := GlobalX + lenUnit;
    currY := LengthY - GlobalY - lenUnit * 45 + 20;
    MoveTo(currX, currY);

    for i := 1 to 30 do
    begin
      if i mod 5 = 0 then
        currY := currY + 1;

      LineTo(currX, currY + 8 * lenUnit);
      currX := currX + 3 * lenUnit;
      currY := currY + trunc(3 * lenUnit / 8.9);
      MoveTo(currX, currY);
    end;

    currX := GlobalX + lenUnit;
    currY := LengthY - GlobalY - lenUnit * 20 + 20;
    MoveTo(currX, currY);

    for i := 1 to 30 do
    begin
      if i mod 5 = 0 then
        currY := currY + 1;

      LineTo(currX, currY + 8 * lenUnit);
      currX := currX + 3 * lenUnit;
      currY := currY + trunc(3 * lenUnit / 8.9);
      MoveTo(currX, currY);
    end;

    DrawLittleFlag(GlobalX + lenUnit, LengthY - GlobalY - 5 * lenUnit - 75
      + 20, 75);
    DrawLittleFlag(GlobalX + 12 * lenUnit, LengthY - GlobalY - 4 * lenUnit - 75
      + 20, 75);
    DrawLittleFlag(GlobalX + 24 * lenUnit, LengthY - GlobalY - 3 * lenUnit - 75
      + 20, 75);
    DrawLittleFlag(GlobalX + 36 * lenUnit, LengthY - GlobalY - 2 * lenUnit - 75
      + 20, 75);
    DrawLittleFlag(GlobalX + 48 * lenUnit, LengthY - GlobalY - 1 * lenUnit - 75
      + 20, 75);

    DrawLittleFlag(GlobalX + 50 * lenUnit, GlobalY + 5 * lenUnit - 75 + 20, 75);
    DrawLittleFlag(GlobalX + 62 * lenUnit, GlobalY + 6 * lenUnit - 75 + 20, 75);
    DrawLittleFlag(GlobalX + 74 * lenUnit, GlobalY + 7 * lenUnit - 75 + 20, 75);
    DrawLittleFlag(GlobalX + 86 * lenUnit, GlobalY + 8 * lenUnit - 75 + 20, 75);

    Pen.Width := 6;
    Pen.Color := clBlack;
    Pen.Mode := pmCopy;
    Brush.Color := clblue;
    Brush.Style := bsSolid;

    Fence[0] := TPoint.Create(GlobalX + 85 * lenUnit,
      GlobalY + 18 * lenUnit + 36);
    Fence[1] := TPoint.Create(GlobalX + 80 * lenUnit,
      GlobalY + 17 * lenUnit + 37);
    Fence[2] := TPoint.Create(GlobalX + 70 * lenUnit,
      GlobalY + 33 * lenUnit + 39);
    Fence[3] := TPoint.Create(GlobalX + 75 * lenUnit,
      GlobalY + 34 * lenUnit + 38);
    Polygon(Fence);
  end;
end;

procedure DrawThirdBackground;
var
  lenUnit: integer;
begin
  with MainForm.imgMain.Canvas, MainForm do
  begin
    Pen.Width := 10;
    Pen.Color := clBlack;
    Pen.Mode := pmCopy;
    Brush.Color := clBtnFace;
    Brush.Style := bsSolid;

    lenUnit := ClientWidth div 100;

    Rectangle(GlobalX, GlobalY, ClientWidth - GlobalX, ClientHeight - GlobalY);

    Rectangle(GlobalX + 10 * lenUnit, LengthY - GlobalY * 3,
      GlobalX + 30 * lenUnit, ClientHeight - GlobalY);
    Rectangle(GlobalX + 30 * lenUnit, LengthY - GlobalY * 5,
      GlobalX + 50 * lenUnit, ClientHeight - GlobalY);
    Rectangle(GlobalX + 50 * lenUnit, LengthY - GlobalY * 4 + 50,
      GlobalX + 70 * lenUnit, ClientHeight - GlobalY);

    MoveTo(GlobalX + lenUnit * 80, ClientHeight - GlobalY);
    LineTo(GlobalX + lenUnit * 80, ClientHeight - 6 * GlobalY);
    Brush.Color := clblue;
    Rectangle(GlobalX + lenUnit * 80, ClientHeight - 6 * GlobalY,
      GlobalX + lenUnit * 85, ClientHeight - 3 * GlobalY);

    // Volume of the third-place podium
    MoveTo(GlobalX + 10 * lenUnit, LengthY - GlobalY * 3);
    LineTo(GlobalX + 15 * lenUnit, LengthY - GlobalY * 4);
    LineTo(GlobalX + 30 * lenUnit, LengthY - GlobalY * 4);
    // first  place
    MoveTo(GlobalX + 30 * lenUnit, LengthY - GlobalY * 5);
    LineTo(GlobalX + 35 * lenUnit, LengthY - GlobalY * 6);
    LineTo(GlobalX + 54 * lenUnit, LengthY - GlobalY * 6);
    LineTo(GlobalX + 50 * lenUnit, LengthY - GlobalY * 5);
    // second
    MoveTo(GlobalX + 50 * lenUnit, LengthY - GlobalY * 4 + 50);
    LineTo(GlobalX + 54 * lenUnit, LengthY - GlobalY * 4 - 50);
    LineTo(GlobalX + 73 * lenUnit, LengthY - GlobalY * 4 - 50);
    LineTo(GlobalX + 70 * lenUnit, LengthY - GlobalY * 4 + 50);

    MoveTo(GlobalX + 73 * lenUnit, LengthY - GlobalY * 4 - 50);
    LineTo(GlobalX + 73 * lenUnit, LengthY - GlobalY - lenUnit - 10);

    MoveTo(GlobalX + 54 * lenUnit, LengthY - GlobalY * 6);
    LineTo(GlobalX + 54 * lenUnit, LengthY - GlobalY * 4 - 50);

    Brush.Color := clBtnFace;
  end;

end;

procedure DrawLogo;
var
  Poly: TPolygon;
  LogoLength: integer;
  OffsetX, OffsetY: integer;
  Radius: integer;
begin
  LogoLength := 700;
  OffsetX := 500;
  OffsetY := 100;

  with MainForm.imgMain.Canvas do
  begin
    Pen.Width := 1;
    Pen.Color := clMaroon;
    Pen.Mode := pmCopy;
    Brush.Color := clMaroon;
    Brush.Style := bsSolid;

    SetLength(Poly, 4);
    Poly[0] := TPoint.Create(GlobalX + OffsetX + 500, GlobalY + OffsetY);
    Poly[1] := TPoint.Create(GlobalX + OffsetX + 500, GlobalY + OffsetY + 100);
    Poly[2] := TPoint.Create(GlobalX + OffsetX + 500 + 200,
      GlobalY + OffsetY + 100);
    Poly[3] := TPoint.Create(GlobalX + OffsetX + 500 + 200, GlobalY + OffsetY);
    Polygon(Poly);

    Poly[0] := TPoint.Create(GlobalX + OffsetX + 500 + 100, GlobalY + OffsetY);
    Poly[1] := TPoint.Create(GlobalX + OffsetX + 500 + 200, GlobalY + OffsetY);
    Poly[2] := TPoint.Create(GlobalX + OffsetX + 500 + 200,
      GlobalY + OffsetY + 500);
    Poly[3] := TPoint.Create(GlobalX + OffsetX + 500 + 100,
      GlobalY + OffsetY + 500);
    Polygon(Poly);

    Pen.Width := 1;
    Pen.Color := clNavy;
    Pen.Mode := pmCopy;
    Brush.Color := clNavy;
    Brush.Style := bsSolid;

    Poly[0] := TPoint.Create(GlobalX + OffsetX + 100, GlobalY + OffsetY);
    Poly[1] := TPoint.Create(GlobalX + OffsetX + 100, GlobalY + OffsetY + 100);
    Poly[2] := TPoint.Create(GlobalX + OffsetX + 100 + 200,
      GlobalY + OffsetY + 100);
    Poly[3] := TPoint.Create(GlobalX + OffsetX + 100 + 200, GlobalY + OffsetY);
    Polygon(Poly);

    Poly[0] := TPoint.Create(GlobalX + OffsetX + 100 + 100,
      GlobalY + OffsetY + 400);
    Poly[1] := TPoint.Create(GlobalX + OffsetX + 100,
      GlobalY + OffsetY + 400 + 100);
    Poly[2] := TPoint.Create(GlobalX + OffsetX + 100 + 200,
      GlobalY + OffsetY + 400 + 100);
    Poly[3] := TPoint.Create(GlobalX + OffsetX + 100 + 200,
      GlobalY + OffsetY + 400);
    Polygon(Poly);

  end;

end;

{ ***************************************************************************************************** }

function ConstructorPerson(const x, y, size: integer): TPerson;
var
  NewPerson: TPerson;
begin
  NewPerson.size := size;
  NewPerson.Center.x := x;
  NewPerson.Center.y := y;

  Result := NewPerson;
end;

procedure DrawPerson(const PersonToDraw: TPerson; flag: boolean = True);
begin
  with MainForm.imgMain.Canvas do
  begin
    Pen.Width := 2;
    Pen.Color := clBlack;
    Brush.Color := clWhite;

    {
      if flag then
      Pen.Mode := pmNotXor
      else
      Pen.Mode := pmCopy;
    }
    Brush.Style := bsSolid;

    PolyLine(PersonToDraw.LegLeft);
    PolyLine(PersonToDraw.LegRight);
    PolyLine(PersonToDraw.ArmLeft);
    PolyLine(PersonToDraw.ArmRight);
    PolyLine(PersonToDraw.Body);
    Ellipse(PersonToDraw.Head);
  end;

end;

procedure PersonFirstFrame(var currPerson: TPerson);
begin
  with currPerson, Center do
  begin
    Head.Create(x - 9 * size div 8, y - 2 * size, x + 3 * size div 8,
      y - size div 2);
    Body[1].Create(x - 2 * size div 10, y - size div 2);
    Body[2].Create(x, y);
    Body[3].Create(x + 2 * size div 10, y + 2 * size);

    ArmLeft[1].Create(x, y);
    ArmLeft[2].Create(x - size, y + size);
    ArmLeft[3].Create(x - 3 * size div 2, y + size div 4);

    ArmRight[1].Create(x, y);
    ArmRight[2].Create(x + size div 2, y + 9 * size div 10);
    ArmRight[3].Create(x + size div 2, y - size div 4);

    LegLeft[1].Create(Body[3].x, Body[3].y);
    with LegLeft[1] do
    begin
      LegLeft[2].Create(x - 3 * size div 2, y + size);
      LegLeft[3].Create(x - size div 2, y + 5 * size div 2);
    end;

    LegRight[1].Create(Body[3].x, Body[3].y);
    with LegRight[1] do
    begin
      LegRight[2].Create(x - size div 2, y + size);
      LegRight[3].Create(x + size div 2, y + 5 * size div 2);
    end;
  end;
end;

procedure PersonSecondFrame(var currPerson: TPerson);
begin
  with currPerson, Center do
  begin
    Head.Create(x - 9 * size div 8, y - 2 * size, x + 3 * size div 8,
      y - size div 2);
    Body[1].Create(x - 2 * size div 10, y - size div 2);
    Body[2].Create(x, y);
    Body[3].Create(x + 2 * size div 10, y + 2 * size);

    ArmLeft[1].Create(x, y);
    ArmLeft[2].Create(x - 3 * size div 4, y + size);
    ArmLeft[3].Create(x - 3 * size div 2, y + 3 * size div 4);

    ArmRight[1].Create(x, y);
    ArmRight[2].Create(x + size div 2, y + 9 * size div 10);
    ArmRight[3].Create(x - size div 10, y + 3 * size div 4);

    LegLeft[1].Create(Body[3].x, Body[3].y);
    with LegLeft[1] do
    begin
      LegLeft[2].Create(x - 3 * size div 2, y + size);
      LegLeft[3].Create(x - size div 2, y + 5 * size div 2);
    end;

    LegRight[1].Create(Body[3].x, Body[3].y);
    with LegRight[1] do
    begin
      LegRight[2].Create(x - size div 2, y + size);
      LegRight[3].Create(x + size div 2, y + 5 * size div 2);
    end;
  end;
end;

procedure PersonThirdFrame(var currPerson: TPerson);
begin
  with currPerson, Center do
  begin
    Head.Create(x - 9 * size div 8, y - 2 * size, x + 3 * size div 8,
      y - size div 2);
    Body[1].Create(x - 2 * size div 10, y - size div 2);
    Body[2].Create(x, y);
    Body[3].Create(x + 2 * size div 10, y + 2 * size);

    ArmLeft[1].Create(x, y);
    ArmLeft[2].Create(x - size div 2, y + size);
    ArmLeft[3].Create(x - size, y + 6 * size div 4);

    ArmRight[1].Create(x, y);
    ArmRight[2].Create(x + size div 2, y + 9 * size div 10);
    ArmRight[3].Create(x - size div 10, y + 6 * size div 4);

    LegLeft[1].Create(Body[3].x, Body[3].y);
    with LegLeft[1] do
    begin
      LegLeft[2].Create(x - 3 * size div 2, y + size);
      LegLeft[3].Create(x - size div 2, y + 5 * size div 2);
    end;

    LegRight[1].Create(Body[3].x, Body[3].y);
    with LegRight[1] do
    begin
      LegRight[2].Create(x - size div 2, y + size);
      LegRight[3].Create(x + size div 2, y + 5 * size div 2);
    end;
  end;
end;

procedure PersonForthFrame(var currPerson: TPerson);
begin
  with currPerson, Center do
  begin
    Head.Create(x - 2 * size div 4, y - 3 * size div 2, x + 2 * size div 4,
      y - size div 2);
    Body[1].Create(x, y - size div 2);
    Body[2].Create(x, y);
    Body[3].Create(x, y + 3 * size div 2);

    ArmLeft[1].Create(x, y);
    ArmLeft[2].Create(x - size div 2, y - size div 3);
    ArmLeft[3].Create(x - size, y - 3 * size div 3);

    ArmRight[1].Create(x, y);
    ArmRight[2].Create(x + size div 2, y - size div 3);
    ArmRight[3].Create(x + size, y - 3 * size div 3);

    LegLeft[1].Create(Body[3].x, Body[3].y);
    with LegLeft[1] do
    begin
      LegLeft[2].Create(x - size div 2, y + size div 2);
      LegLeft[3].Create(x - 2 * size div 5, y + 2 * size);
    end;

    LegRight[1].Create(Body[3].x, Body[3].y);
    with LegRight[1] do
    begin
      LegRight[2].Create(x + size div 2, y + size div 2);
      LegRight[3].Create(x + 2 * size div 5, y + 2 * size);
    end;
  end;
end;

procedure PersonFifthFrame(var currPerson: TPerson);
begin
  with currPerson, Center do
  begin
    Head.Create(x - 2 * size div 4, y - 3 * size div 2, x + 2 * size div 4,
      y - size div 2);
    Body[1].Create(x, y - size div 2);
    Body[2].Create(x, y);
    Body[3].Create(x, y + 3 * size div 2);

    ArmLeft[1].Create(x, y);
    ArmLeft[2].Create(x - size div 2, y + size div 5);
    ArmLeft[3].Create(x - size, y - size div 5);

    ArmRight[1].Create(x, y);
    ArmRight[2].Create(x + size div 2, y + size div 5);
    ArmRight[3].Create(x + size, y - size div 5);

    LegLeft[1].Create(Body[3].x, Body[3].y);
    with LegLeft[1] do
    begin
      LegLeft[2].Create(x - size div 2, y + size div 2);
      LegLeft[3].Create(x - 2 * size div 5, y + 2 * size);
    end;

    LegRight[1].Create(Body[3].x, Body[3].y);
    with LegRight[1] do
    begin
      LegRight[2].Create(x + size div 2, y + size div 2);
      LegRight[3].Create(x + 2 * size div 5, y + 2 * size);
    end;
  end;
end;

procedure PersonSixthFrame(var currPerson: TPerson);
begin
  with currPerson, Center do
  begin
    Head.Create(x - 2 * size div 4, y - 3 * size div 2, x + 2 * size div 4,
      y - size div 2);
    Body[1].Create(x, y - size div 2);
    Body[2].Create(x, y);
    Body[3].Create(x, y + 3 * size div 2);

    ArmLeft[1].Create(x, y);
    ArmLeft[2].Create(x - 1 * size div 3, y + 2 * size div 4);
    ArmLeft[3].Create(x - 2 * size div 4, y + 5 * size div 4);

    ArmRight[1].Create(x, y);
    ArmRight[2].Create(x + 1 * size div 3, y + 2 * size div 4);
    ArmRight[3].Create(x + 2 * size div 4, y + 5 * size div 4);

    LegLeft[1].Create(Body[3].x, Body[3].y);
    with LegLeft[1] do
    begin
      LegLeft[2].Create(x - size div 2, y + size div 2);
      LegLeft[3].Create(x - 2 * size div 5, y + 2 * size);
    end;

    LegRight[1].Create(Body[3].x, Body[3].y);
    with LegRight[1] do
    begin
      LegRight[2].Create(x + size div 2, y + size div 2);
      LegRight[3].Create(x + 2 * size div 5, y + 2 * size);
    end;
  end;
end;

procedure PersonOtherSideFirstFrame(var currPerson: TPerson);
begin
  with currPerson, Center do
  begin
    Head.Create(x - 3 * size div 8, y - 2 * size, x + 9 * size div 8,
      y - size div 2);
    Body[1].Create(x + 2 * size div 10, y - size div 2);
    Body[2].Create(x, y);
    Body[3].Create(x - 2 * size div 10, y + 2 * size);

    ArmLeft[1].Create(x, y);
    ArmLeft[2].Create(x + 3 * size div 5, y + 1 * size div 3);
    ArmLeft[3].Create(x + 3 * size div 2, y);

    ArmRight[1].Create(x, y);
    ArmRight[2].Create(x + size div 2, y + 2 * size div 2);
    ArmRight[3].Create(x + 3 * size div 2, y + size);

    LegLeft[1].Create(Body[3].x, Body[3].y);
    with LegLeft[1] do
    begin
      LegLeft[2].Create(x + 3 * size div 2, y + size);
      LegLeft[3].Create(x + 3 * size div 2, y + 4 * size div 2);
    end;

    LegRight[1].Create(Body[3].x, Body[3].y);
    with LegRight[1] do
    begin
      LegRight[2].Create(x + size div 2, y + size);
      LegRight[3].Create(x + size div 2, y + 5 * size div 2);
    end;
  end;
end;

procedure PersonOtherSideSecondFrame(var currPerson: TPerson);
begin
  with currPerson, Center do
  begin
    Head.Create(x - 3 * size div 8, y - 2 * size, x + 9 * size div 8,
      y - size div 2);
    Body[1].Create(x + 2 * size div 10, y - size div 2);
    Body[2].Create(x, y);
    Body[3].Create(x - 2 * size div 10, y + 2 * size);

    ArmLeft[1].Create(x, y);
    ArmLeft[2].Create(x + 3 * size div 6, y + 2 * size div 3);
    ArmLeft[3].Create(x + 3 * size div 2, y + 2 * size div 5);

    ArmRight[1].Create(x, y);
    ArmRight[2].Create(x + size div 2, y + 3 * size div 2);
    ArmRight[3].Create(x + 3 * size div 2, y + 7 * size div 5);

    LegLeft[1].Create(Body[3].x, Body[3].y);
    with LegLeft[1] do
    begin
      LegLeft[2].Create(x + 3 * size div 2, y + size);
      LegLeft[3].Create(x + 3 * size div 2, y + 4 * size div 2);
    end;

    LegRight[1].Create(Body[3].x, Body[3].y);
    with LegRight[1] do
    begin
      LegRight[2].Create(x + size div 2, y + size);
      LegRight[3].Create(x + size div 2, y + 5 * size div 2);
    end;
  end;
end;

procedure PersonOtherSideThirdFrame(var currPerson: TPerson);
begin
  with currPerson, Center do
  begin
    Head.Create(x - 3 * size div 8, y - 2 * size, x + 9 * size div 8,
      y - size div 2);
    Body[1].Create(x + 2 * size div 10, y - size div 2);
    Body[2].Create(x, y);
    Body[3].Create(x - 2 * size div 10, y + 2 * size);

    ArmLeft[1].Create(x, y);
    ArmLeft[2].Create(x + 3 * size div 6, y + 2 * size div 3);
    ArmLeft[3].Create(x + 3 * size div 2, y + 3 * size div 4);

    ArmRight[1].Create(x, y);
    ArmRight[2].Create(x + size div 2, y + 3 * size div 2);
    ArmRight[3].Create(x + 3 * size div 2, y + 2 * size);

    LegLeft[1].Create(Body[3].x, Body[3].y);
    with LegLeft[1] do
    begin
      LegLeft[2].Create(x + 3 * size div 2, y + size);
      LegLeft[3].Create(x + 3 * size div 2, y + 4 * size div 2);
    end;

    LegRight[1].Create(Body[3].x, Body[3].y);
    with LegRight[1] do
    begin
      LegRight[2].Create(x + size div 2, y + size);
      LegRight[3].Create(x + size div 2, y + 5 * size div 2);
    end;
  end;
end;

{ ***************************************************************************************************** }

function FormAnglesArm(angElbow, angPalm: single): TAnglesArm;
var
  arr: TAnglesArm;
begin
  arr[angleElbow] := angElbow;
  arr[anglePalm] := angPalm;
  Result := arr;
end;

function ReverseArmAngles(arr: TAnglesArm): TAnglesArm;
var
  i: AnglesArm;
begin
  for i := angleElbow to anglePalm do
  begin
    arr[i] := -arr[i];
  end;
  Result := arr;
end;

function CreateVPerson(x, y, i: integer): TVectorPerson;
var
  res: TVectorPerson;
begin
  res.ArmRight[shoulder].x := x;
  res.ArmRight[shoulder].y := y;
  res.height := i;
  Result := res;
end;

function Rotation(const startpoint, endPoint: TPoint; angle: single): TPoint;
var
  Rotated: TPoint;
begin
  Result := Rotated.Create(trunc(startpoint.x + ((endPoint.x - startpoint.x) *
    cos(angle) + (endPoint.y - startpoint.y) * sin(angle))),
    trunc(startpoint.y + (-(endPoint.x - startpoint.x) * sin(angle) +
    (endPoint.y - startpoint.y) * cos(angle))));

end;

function Moving(const startLine, endLine, base: TPoint): TPoint;
var
  res: TPoint;
begin
  Result := res.Create(base.x + (endLine.x - startLine.x),
    base.y + (endLine.y - startLine.y));
end;

function RotateHand(var person: TVectorPerson; const pivot: TPoint;
  const stayArm: TPointsArm; const stayAngle: TAnglesArm): TPointsArm;
var
  Arm: TPointsArm;
  newPalm: TPoint;
begin
  with person do
  begin
    Arm[shoulder] := Body[shoulderBod];
    Arm[elbow] := Rotation(Arm[shoulder], Moving(stayArm[shoulder],
      stayArm[elbow], Arm[shoulder]), stayAngle[angleElbow]);
    Arm[palm] := Rotation(Arm[elbow], Moving(stayArm[elbow], stayArm[palm],
      Arm[elbow]), stayAngle[anglePalm]);
  end;
  Result := Arm;
end;

procedure BuildVPersonStraighthand(var person: TVectorPerson);
var
  head1, head2: TPoint;
begin
  with person do
  begin
    Body[pach].Create(ArmRight[shoulder].x, ArmRight[shoulder].y + height);
    Body[adamsApple].Create(ArmRight[shoulder].x, ArmRight[shoulder].y -
      (height div 3));
    Body[shoulderBod].Create(ArmRight[shoulder].x, ArmRight[shoulder].y);

    ArmLeft[shoulder].Create(ArmRight[shoulder].x, ArmRight[shoulder].y);
    ArmLeft[elbow].Create(ArmRight[shoulder].x -
      trunc(0.4 * (Body[pach].y - Body[adamsApple].y)), ArmRight[shoulder].y);
    ArmLeft[palm].Create(ArmRight[shoulder].x -
      trunc(0.8 * (Body[pach].y - Body[adamsApple].y)), ArmRight[shoulder].y);

    ArmRight[shoulder].Create(ArmRight[shoulder].x, ArmRight[shoulder].y);
    ArmRight[elbow].Create(ArmRight[shoulder].x +
      trunc(0.4 * (Body[pach].y - Body[adamsApple].y)), ArmRight[shoulder].y);
    ArmRight[palm].Create(ArmRight[shoulder].x +
      trunc(0.8 * (Body[pach].y - Body[adamsApple].y)), ArmRight[shoulder].y);

    lengthLeg := (height shl 1 + height div 5);
    leg.Create(ArmRight[shoulder].x, ArmRight[shoulder].y + lengthLeg);
    LegLeft[ending].Create(ArmRight[shoulder].x, ArmRight[shoulder].y + height);
    LegLeft[ankle] := Rotation(LegLeft[ending], leg, -pi / 6);
    LegLeft[knee].Create(((LegLeft[ankle].x + LegLeft[ending].x) shr 1),
      (LegLeft[ankle].y + LegLeft[ending].y) shr 1);
    LegLeft[toe].Create(LegLeft[ankle].x - ((height) div 3), LegLeft[ankle].y);

    lengthFeet := abs(LegLeft[toe].x - LegLeft[ankle].x);

    LegRight[ending].Create(Body[pach].x, Body[pach].y);
    LegRight[ankle] := Rotation(LegRight[ending], leg, pi / 6);
    LegRight[knee].Create(((LegRight[ankle].x + LegRight[ending].x) shr 1),
      (LegRight[ankle].y + LegRight[ending].y) shr 1);
    LegRight[toe].Create(LegRight[ankle].x + ((height) div 3),
      LegRight[ankle].y);

    angleEnding := pi / 6;

    head1.Create(LegLeft[ankle].x, Body[adamsApple].y -
      (LegRight[ankle].x - LegLeft[ankle].x));
    head2.Create(LegRight[ankle].x, Body[adamsApple].y);
    Head.Create(head1, head2);
  end;

end;

procedure WriteVPerson(const person: TVectorPerson);
begin
  with MainForm.imgMain.Canvas do
  begin
    PolyLine(person.ArmRight);
    PolyLine(person.ArmLeft);
    PolyLine(person.LegLeft);
    PolyLine(person.LegRight);
    PolyLine(person.Body);
    Ellipse(person.Head);
  end;
end;

{ ***************************************************************************************************** }

function ConstructorEquip(const currPerson: TPerson): TEquipment;
var
  NewEquipment: TEquipment;
begin
  NewEquipment.size := currPerson.size;

  NewEquipment.SnowShoeLeft[2] := currPerson.LegLeft[3];
  NewEquipment.SnowShoeRight[2] := currPerson.LegRight[3];

  NewEquipment.SnowStickLeft[1] := currPerson.ArmLeft[3];
  NewEquipment.SnowStickRight[1] := currPerson.ArmRight[3];

  Result := NewEquipment;
end;

procedure DrawEquipment(const EquipToDraw: TEquipment; colour: TColor;
  flag: boolean = True);
begin
  with MainForm.imgMain.Canvas do
  begin

    Pen.Color := colour;
    {
      if flag then

      Pen.Mode := pmNotXor
      else
      Pen.Mode := pmCopy;
    }
    Brush.Color := clWhite;
    Brush.Style := bsClear;

    Pen.Width := 4;
    PolyLine(EquipToDraw.SnowShoeLeft);
    PolyLine(EquipToDraw.SnowShoeRight);

    Pen.Width := 2;
    PolyLine(EquipToDraw.SnowStickLeft);
    PolyLine(EquipToDraw.SnowStickRight);
  end;

end;

procedure EquipmentFirstFrame(var currEqupment: TEquipment);
begin
  with currEqupment do
  begin
    SnowShoeLeft[1].Create(SnowShoeLeft[2].x - 3 * size div 2,
      SnowShoeLeft[2].y + 3 * size div 2);
    SnowShoeLeft[3].Create(SnowShoeLeft[2].x + 3 * size div 2,
      SnowShoeLeft[2].y - 3 * size div 2);

    SnowShoeRight[1].Create(SnowShoeRight[2].x - 3 * size div 2,
      SnowShoeRight[2].y + 3 * size div 2);
    SnowShoeRight[3].Create(SnowShoeRight[2].x + 3 * size div 2,
      SnowShoeRight[2].y - 3 * size div 2);

    SnowStickLeft[2].Create(SnowStickLeft[1].x - size,
      SnowStickLeft[1].y + 4 * size);
    SnowStickRight[2].Create(SnowStickRight[1].x + size div 2,
      SnowStickRight[1].y + 4 * size);
  end;
end;

procedure EquipmentSecondFrame(var currEqupment: TEquipment);
begin
  with currEqupment do
  begin
    SnowShoeLeft[1].Create(SnowShoeLeft[2].x - 3 * size div 2,
      SnowShoeLeft[2].y + 3 * size div 2);
    SnowShoeLeft[3].Create(SnowShoeLeft[2].x + 3 * size div 2,
      SnowShoeLeft[2].y - 3 * size div 2);

    SnowShoeRight[1].Create(SnowShoeRight[2].x - 3 * size div 2,
      SnowShoeRight[2].y + 3 * size div 2);
    SnowShoeRight[3].Create(SnowShoeRight[2].x + 3 * size div 2,
      SnowShoeRight[2].y - 3 * size div 2);

    SnowStickLeft[2].Create(SnowStickLeft[1].x + size,
      SnowStickLeft[1].y + 3 * size);
    SnowStickRight[2].Create(SnowStickRight[1].x + size,
      SnowStickRight[1].y + 3 * size);
  end;
end;

procedure EquipmentThirdFrame(var currEqupment: TEquipment);
begin
  with currEqupment do
  begin
    SnowShoeLeft[1].Create(SnowShoeLeft[2].x - 3 * size div 2,
      SnowShoeLeft[2].y + 3 * size div 2);
    SnowShoeLeft[3].Create(SnowShoeLeft[2].x + 3 * size div 2,
      SnowShoeLeft[2].y - 3 * size div 2);

    SnowShoeRight[1].Create(SnowShoeRight[2].x - 3 * size div 2,
      SnowShoeRight[2].y + 3 * size div 2);
    SnowShoeRight[3].Create(SnowShoeRight[2].x + 3 * size div 2,
      SnowShoeRight[2].y - 3 * size div 2);

    SnowStickLeft[2].Create(SnowStickLeft[1].x + 2 * size,
      SnowStickLeft[1].y + 2 * size);
    SnowStickRight[2].Create(SnowStickRight[1].x + 2 * size,
      SnowStickRight[1].y + 2 * size);
  end;
end;

procedure EquipmentForthFrame(var currEqupment: TEquipment);
begin
  with currEqupment do
  begin
    SnowShoeLeft[1].Create(SnowShoeLeft[2].x - size div 10,
      SnowShoeLeft[2].y + 3 * size div 2);
    SnowShoeLeft[3].Create(SnowShoeLeft[2].x + size div 10,
      SnowShoeLeft[2].y - 3 * size div 2);

    SnowShoeRight[1].Create(SnowShoeRight[2].x + size div 10,
      SnowShoeRight[2].y + 3 * size div 2);
    SnowShoeRight[3].Create(SnowShoeRight[2].x - size div 10,
      SnowShoeRight[2].y - 3 * size div 2);

    SnowStickLeft[2].Create(SnowStickLeft[1].x - size div 5,
      SnowStickLeft[1].y + 4 * size);
    SnowStickRight[2].Create(SnowStickRight[1].x + size div 5,
      SnowStickRight[1].y + 4 * size);
  end;
end;

procedure EquipmentFifthFrame(var currEqupment: TEquipment);
begin
  with currEqupment do
  begin
    SnowShoeLeft[1].Create(SnowShoeLeft[2].x - size div 10,
      SnowShoeLeft[2].y + 3 * size div 2);
    SnowShoeLeft[3].Create(SnowShoeLeft[2].x + size div 10,
      SnowShoeLeft[2].y - 3 * size div 2);

    SnowShoeRight[1].Create(SnowShoeRight[2].x + size div 10,
      SnowShoeRight[2].y + 3 * size div 2);
    SnowShoeRight[3].Create(SnowShoeRight[2].x - size div 10,
      SnowShoeRight[2].y - 3 * size div 2);

    SnowStickLeft[2].Create(SnowStickLeft[1].x - size div 5,
      SnowStickLeft[1].y + 3 * size);
    SnowStickRight[2].Create(SnowStickRight[1].x + size div 5,
      SnowStickRight[1].y + 3 * size);
  end;
end;

procedure EquipmentSixthFrame(var currEqupment: TEquipment);
begin
  with currEqupment do
  begin
    SnowShoeLeft[1].Create(SnowShoeLeft[2].x - size div 10,
      SnowShoeLeft[2].y + 3 * size div 2);
    SnowShoeLeft[3].Create(SnowShoeLeft[2].x + size div 10,
      SnowShoeLeft[2].y - 3 * size div 2);

    SnowShoeRight[1].Create(SnowShoeRight[2].x + size div 10,
      SnowShoeRight[2].y + 3 * size div 2);
    SnowShoeRight[3].Create(SnowShoeRight[2].x - size div 10,
      SnowShoeRight[2].y - 3 * size div 2);

    SnowStickLeft[2].Create(SnowStickLeft[1].x - size div 5,
      SnowStickLeft[1].y - 3 * size);
    SnowStickRight[2].Create(SnowStickRight[1].x + size div 5,
      SnowStickRight[1].y - 3 * size);
  end;
end;

procedure EquipmentOtherSideFirstFrame(var currEqupment: TEquipment);
begin
  with currEqupment do
  begin
    SnowShoeLeft[1].Create(SnowShoeLeft[2].x - 5 * size div 2,
      SnowShoeLeft[2].y - size div 3);
    SnowShoeLeft[3].Create(SnowShoeLeft[2].x + 5 * size div 2,
      SnowShoeLeft[2].y + size div 3);

    SnowShoeRight[1].Create(SnowShoeRight[2].x - 5 * size div 2,
      SnowShoeRight[2].y - size div 3);
    SnowShoeRight[3].Create(SnowShoeRight[2].x + 5 * size div 2,
      SnowShoeRight[2].y + size div 3);

    SnowStickLeft[2].Create(SnowStickLeft[1].x - size div 2,
      SnowStickLeft[1].y + 3 * size);
    SnowStickRight[2].Create(SnowStickRight[1].x + size div 2,
      SnowStickRight[1].y + 3 * size);
  end;
end;

procedure EquipmentOtherSideSecondFrame(var currEqupment: TEquipment);
begin
  with currEqupment do
  begin
    SnowShoeLeft[1].Create(SnowShoeLeft[2].x - 5 * size div 2,
      SnowShoeLeft[2].y - size div 3);
    SnowShoeLeft[3].Create(SnowShoeLeft[2].x + 5 * size div 2,
      SnowShoeLeft[2].y + size div 3);

    SnowShoeRight[1].Create(SnowShoeRight[2].x - 5 * size div 2,
      SnowShoeRight[2].y - size div 3);
    SnowShoeRight[3].Create(SnowShoeRight[2].x + 5 * size div 2,
      SnowShoeRight[2].y + size div 3);

    SnowStickLeft[2].Create(SnowStickLeft[1].x - 3 * size div 2,
      SnowStickLeft[1].y + 6 * size div 2);
    SnowStickRight[2].Create(SnowStickRight[1].x - size div 2,
      SnowStickRight[1].y + 6 * size div 2);
  end;
end;

procedure EquipmentOtherSideThirdFrame(var currEqupment: TEquipment);
begin
  with currEqupment do
  begin
    SnowShoeLeft[1].Create(SnowShoeLeft[2].x - 5 * size div 2,
      SnowShoeLeft[2].y - size div 3);
    SnowShoeLeft[3].Create(SnowShoeLeft[2].x + 5 * size div 2,
      SnowShoeLeft[2].y + size div 3);

    SnowShoeRight[1].Create(SnowShoeRight[2].x - 5 * size div 2,
      SnowShoeRight[2].y - size div 3);
    SnowShoeRight[3].Create(SnowShoeRight[2].x + 5 * size div 2,
      SnowShoeRight[2].y + size div 3);

    SnowStickLeft[2].Create(SnowStickLeft[1].x - 5 * size div 2,
      SnowStickLeft[1].y + 3 * size);
    SnowStickRight[2].Create(SnowStickRight[1].x - 2 * size,
      SnowStickRight[1].y + 3 * size);
  end;
end;

{ ***************************************************************************************************** }

function AssignPonPonLeft(const person: TVectorPerson): TPonPon;
begin
  Result.x := person.ArmLeft[palm].x;
  Result.y := person.ArmLeft[palm].y;
end;

function AssignPonPonRight(const person: TVectorPerson): TPonPon;
begin
  Result.x := person.ArmRight[palm].x;
  Result.y := person.ArmRight[palm].y;
end;

procedure WritePonPon(const ponpon: TPonPon; colour: TColor);
var
  oldPen: TPen;
  oldBrush: TBrush;
begin
  with MainForm.imgMain.Canvas do
  begin
    oldPen := Pen;
    oldBrush := Brush;

    Pen.Color := colour;
    Brush.Color := colour;
    Pen.Mode := pmCopy;
    Brush.Style := bsSolid;

    if colour = clWhite then
      Ellipse(ponpon.x - 11, ponpon.y - 11, ponpon.x + 11, ponpon.y + 11)
    else
      Ellipse(ponpon.x - 10, ponpon.y - 10, ponpon.x + 10, ponpon.y + 10);

    Pen := oldPen;
    Brush := oldBrush;
  end;

end;

{ ***************************************************************************************************** }

procedure TMainForm.FirstPersonHDTimer(Sender: TObject);
begin
  with CheerPerson1 do
  begin
    angle1 := angle1 + baseAngle1;
    angleRightArm1 := FormAnglesArm(-DegToRad(angle1), -DegToRad(angle1));
    angleLeftArm1 := ReverseArmAngles(angleRightArm1);

    imgMain.Canvas.Pen.Color := clBtnFace;
    imgMain.Canvas.Pen.Width := 5;
    imgMain.Canvas.Brush.Color := clYellow;
    WriteVPerson(CheerPerson1);

    PonPonL1 := AssignPonPonLeft(CheerPerson1);
    PonPonR1 := AssignPonPonRight(CheerPerson1);
    WritePonPon(PonPonL1, clBtnFace);
    WritePonPon(PonPonR1, clBtnFace);

    ArmRight := RotateHand(CheerPerson1, ArmRight[shoulder], stayArmRight1,
      angleRightArm1);
    ArmLeft := RotateHand(CheerPerson1, ArmRight[shoulder], stayArmLeft1,
      angleLeftArm1);

    imgMain.Canvas.Pen.Color := clBlack;
    imgMain.Canvas.Pen.Width := 3;
    imgMain.Canvas.Brush.Color := clYellow;
    WriteVPerson(CheerPerson1);

    PonPonL1 := AssignPonPonLeft(CheerPerson1);
    PonPonR1 := AssignPonPonRight(CheerPerson1);
    WritePonPon(PonPonL1, clRed);
    WritePonPon(PonPonR1, clblue);

    if abs(angle1 - angleRotated1) < 0.0001 then
    begin
      angleRotated1 := 45;
      baseAngle1 := 5;
      angle1 := 0;

      BuildVPersonStraighthand(CheerPerson1);
      stayArmLeft1 := ArmLeft;
      stayArmRight1 := ArmRight;

      FirstPersonHD.Enabled := false;
      FirstPersonHU.Enabled := True;
    end;
  end;
end;

procedure TMainForm.FirstPersonHUTimer(Sender: TObject);
begin
  with CheerPerson1 do
  begin
    angle1 := angle1 + baseAngle1;
    angleRightArm1 := FormAnglesArm(DegToRad(angle1), DegToRad(angle1));
    angleLeftArm1 := ReverseArmAngles(angleRightArm1);

    imgMain.Canvas.Pen.Color := clBtnFace;
    imgMain.Canvas.Pen.Width := 5;
    imgMain.Canvas.Brush.Color := clYellow;
    WriteVPerson(CheerPerson1);

    PonPonL1 := AssignPonPonLeft(CheerPerson1);
    PonPonR1 := AssignPonPonRight(CheerPerson1);
    WritePonPon(PonPonL1, clBtnFace);
    WritePonPon(PonPonR1, clBtnFace);

    ArmRight := RotateHand(CheerPerson1, ArmRight[shoulder], stayArmRight1,
      angleRightArm1);
    ArmLeft := RotateHand(CheerPerson1, ArmRight[shoulder], stayArmLeft1,
      angleLeftArm1);

    imgMain.Canvas.Pen.Color := clBlack;
    imgMain.Canvas.Pen.Width := 3;
    imgMain.Canvas.Brush.Color := clYellow;
    WriteVPerson(CheerPerson1);

    PonPonL1 := AssignPonPonLeft(CheerPerson1);
    PonPonR1 := AssignPonPonRight(CheerPerson1);
    WritePonPon(PonPonL1, clRed);
    WritePonPon(PonPonR1, clblue);

    if abs(angle1 - angleRotated1) < 0.0001 then
    begin
      angleRotated1 := 45;
      baseAngle1 := 5;
      angle1 := 0;

      stayArmLeft1 := ArmLeft;
      stayArmRight1 := ArmRight;

      FirstPersonHU.Enabled := false;
      FirstPersonHD.Enabled := True;
    end;
  end;

end;

procedure TMainForm.FormCreate(Sender: TObject);
begin

  MainForm.ClientWidth := 1920;
  MainForm.ClientHeight := 1080;
  MainForm.imgMain.ClientWidth := 1920;
  MainForm.imgMain.ClientHeight := 1080;

  xc_start := 850;
  yc_start := 250;
  k := 0.6;

  InitVars(xc_start, yc_start, k);

  sign := True;

  timeStarter1.Interval := 1000;
  timeStarter2.Interval := 1000;
  timeStarter3.Interval := 1000;
  timeStarter4.Interval := 1000;

  timeStarter2.Interval := 500;
  // timeStarter2.Enabled := True;
  timeStarter3.Interval := 5000;
  timeStarter1.Enabled := True;
  //
  MediaPlayer1.FileName := 'Second.mp3';
  MediaPlayer1.Open;
  MediaPlayer1.Play;
  mpClap.FileName := 'Clap.mp3';
  mpClap.Open;
  // mpClap.Play;

  // timeDebug.Interval := 100;
  // timeDebug.Enabled := True;
end;

procedure TMainForm.SecondPersonHDTimer(Sender: TObject);
begin
  with CheerPerson2 do
  begin
    angle2 := angle2 + baseAngle2;
    angleRightArm2 := FormAnglesArm(-DegToRad(angle2), -DegToRad(angle2));
    angleLeftArm2 := ReverseArmAngles(angleRightArm2);

    imgMain.Canvas.Pen.Color := clBtnFace;
    imgMain.Canvas.Pen.Width := 5;
    imgMain.Canvas.Brush.Color := clYellow;
    WriteVPerson(CheerPerson2);

    PonPonL2 := AssignPonPonLeft(CheerPerson2);
    PonPonR2 := AssignPonPonRight(CheerPerson2);
    WritePonPon(PonPonL2, clBtnFace);
    WritePonPon(PonPonR2, clBtnFace);

    ArmRight := RotateHand(CheerPerson2, ArmRight[shoulder], stayArmRight2,
      angleRightArm2);
    ArmLeft := RotateHand(CheerPerson2, ArmRight[shoulder], stayArmLeft2,
      angleLeftArm2);

    imgMain.Canvas.Pen.Color := clBlack;
    imgMain.Canvas.Pen.Width := 3;
    imgMain.Canvas.Brush.Color := clYellow;
    WriteVPerson(CheerPerson2);

    PonPonL2 := AssignPonPonLeft(CheerPerson2);
    PonPonR2 := AssignPonPonRight(CheerPerson2);
    WritePonPon(PonPonL2, clRed);
    WritePonPon(PonPonR2, clblue);

    if abs(angle2 - angleRotated2) < 0.0001 then
    begin
      angleRotated2 := 45;
      baseAngle2 := 5;
      angle2 := 0;

      BuildVPersonStraighthand(CheerPerson2);
      stayArmLeft2 := ArmLeft;
      stayArmRight2 := ArmRight;

      SecondPersonHD.Enabled := false;
      SecondPersonHU.Enabled := True;
    end;
  end;

end;

procedure TMainForm.SecondPersonHUTimer(Sender: TObject);
begin
  with CheerPerson2 do
  begin
    angle2 := angle2 + baseAngle2;
    angleRightArm2 := FormAnglesArm(DegToRad(angle2), DegToRad(angle2));
    angleLeftArm2 := ReverseArmAngles(angleRightArm2);

    imgMain.Canvas.Pen.Color := clWhite;
    imgMain.Canvas.Pen.Width := 5;
    imgMain.Canvas.Brush.Color := clYellow;
    WriteVPerson(CheerPerson2);

    PonPonL2 := AssignPonPonLeft(CheerPerson2);
    PonPonR2 := AssignPonPonRight(CheerPerson2);
    WritePonPon(PonPonL2, clWhite);
    WritePonPon(PonPonR2, clWhite);

    ArmRight := RotateHand(CheerPerson2, ArmRight[shoulder], stayArmRight2,
      angleRightArm2);
    ArmLeft := RotateHand(CheerPerson2, ArmRight[shoulder], stayArmLeft2,
      angleLeftArm2);

    imgMain.Canvas.Pen.Color := clBlack;
    imgMain.Canvas.Pen.Width := 3;
    imgMain.Canvas.Brush.Color := clYellow;
    WriteVPerson(CheerPerson2);

    PonPonL2 := AssignPonPonLeft(CheerPerson2);
    PonPonR2 := AssignPonPonRight(CheerPerson2);
    WritePonPon(PonPonL2, clRed);
    WritePonPon(PonPonR2, clblue);

    if abs(angle2 - angleRotated2) < 0.0001 then
    begin
      angleRotated2 := 45;
      baseAngle2 := 5;
      angle2 := 0;

      stayArmLeft2 := ArmLeft;
      stayArmRight2 := ArmRight;

      SecondPersonHU.Enabled := false;
      SecondPersonHD.Enabled := True;
    end;
  end;

end;

procedure TMainForm.timeStarter1Timer(Sender: TObject);
begin
  DrawWhiteSpace;
  FramesCount := 120;
  CurrFrame := 0;

  SetLength(PersonAnimation, FramesCount);
  SetLength(EquipAnimation, FramesCount);

  for var i := Low(PersonAnimation) to High(PersonAnimation) do
  begin
    if i <= FramesCount div 2 then
    begin
      case i mod 3 of
        0:
          PersonAnimation[i] := @PersonForthFrame;
        1:
          PersonAnimation[i] := @PersonFifthFrame;
        2:
          PersonAnimation[i] := @PersonSixthFrame;
      end;

      case i mod 3 of
        0:
          EquipAnimation[i] := @EquipmentForthFrame;
        1:
          EquipAnimation[i] := @EquipmentFifthFrame;
        2:
          EquipAnimation[i] := @EquipmentSixthFrame;
      end;
    end
    else
    begin
      case i mod 3 of
        0:
          PersonAnimation[i] := @PersonFirstFrame;
        1:
          PersonAnimation[i] := @PersonSecondFrame;
        2:
          PersonAnimation[i] := @PersonThirdFrame;
      end;

      case i mod 3 of
        0:
          EquipAnimation[i] := @EquipmentFirstFrame;
        1:
          EquipAnimation[i] := @EquipmentSecondFrame;
        2:
          EquipAnimation[i] := @EquipmentThirdFrame;
      end;
    end;

  end;
  InitMovieBorders;

  DrawFirstBackground();

  FirstPerson := ConstructorPerson(GlobalX * 10, 3 * GlobalY div 2, 14);
  PersonForthFrame(FirstPerson);
  DrawPerson(FirstPerson);

  FirstEquip := ConstructorEquip(FirstPerson);
  EquipmentForthFrame(FirstEquip);
  DrawEquipment(FirstEquip, clRed);

  timeAnimation1.Interval := 100;
  timeAnimation1.Enabled := True;

  CheerPerson1 := CreateVPerson(1500, 200, 35);
  BuildVPersonStraighthand(CheerPerson1);

  with CheerPerson1 do
  begin
    stayArmLeft1 := ArmLeft;
    stayArmRight1 := ArmRight;
  end;
  WriteVPerson(CheerPerson1);

  CheerPerson2 := CreateVPerson(1600, 300, 40);
  BuildVPersonStraighthand(CheerPerson2);

  with CheerPerson2 do
  begin
    stayArmLeft2 := ArmLeft;
    stayArmRight2 := ArmRight;
  end;
  WriteVPerson(CheerPerson2);

  FirstPersonHU.Interval := 20;
  FirstPersonHD.Interval := 40;
  SecondPersonHU.Interval := 20;
  SecondPersonHD.Interval := 60;

  angleRotated1 := 45;
  baseAngle1 := 5;
  angle1 := 0;

  angleRotated2 := 45;
  baseAngle2 := 5;
  angle2 := 0;

  FirstPersonHU.Enabled := True;
  SecondPersonHU.Enabled := True;

  timeStarter1.Enabled := false;
end;

procedure TMainForm.timeStarter2Timer(Sender: TObject);
begin
  FirstPersonHU.Enabled := false;
  FirstPersonHD.Enabled := false;
  SecondPersonHU.Enabled := false;
  SecondPersonHD.Enabled := false;

  DrawWhiteSpace();

  FramesCount := 120;
  CurrFrame := 0;

  SetLength(PersonAnimation, FramesCount);
  SetLength(EquipAnimation, FramesCount);

  for var i := Low(PersonAnimation) to High(PersonAnimation) do
  begin
    case i mod 3 of
      0:
        PersonAnimation[i] := @PersonOtherSideFirstFrame;
      1:
        PersonAnimation[i] := @PersonOtherSideSecondFrame;
      2:
        PersonAnimation[i] := @PersonOtherSideThirdFrame;
    end;

    case i mod 3 of
      0:
        EquipAnimation[i] := @EquipmentOtherSideFirstFrame;
      1:
        EquipAnimation[i] := @EquipmentOtherSideSecondFrame;
      2:
        EquipAnimation[i] := @EquipmentOtherSideThirdFrame;
    end;

  end;

  InitMovieBorders;

  DrawSecondBackground();

  FirstPerson := ConstructorPerson(150, 300, 40);
  PersonOtherSideFirstFrame(FirstPerson);
  DrawPerson(FirstPerson);

  FirstEquip := ConstructorEquip(FirstPerson);
  EquipmentOtherSideFirstFrame(FirstEquip);
  DrawEquipment(FirstEquip, clRed);

  timeAnimation2.Interval := 120;
  timeAnimation2.Enabled := True;

  timeStarter2.Enabled := false;
end;

procedure TMainForm.timeStarter3Timer(Sender: TObject);
begin

  FramesCount := 120;
  CurrFrame2 := 0;

  SetLength(PersonAnimation, FramesCount);
  SetLength(EquipAnimation, FramesCount);

  for var i := Low(PersonAnimation) to High(PersonAnimation) do
  begin
    case i mod 3 of
      0:
        PersonAnimation[i] := @PersonOtherSideFirstFrame;
      1:
        PersonAnimation[i] := @PersonOtherSideSecondFrame;
      2:
        PersonAnimation[i] := @PersonOtherSideThirdFrame;
    end;

    case i mod 3 of
      0:
        EquipAnimation[i] := @EquipmentOtherSideFirstFrame;
      1:
        EquipAnimation[i] := @EquipmentOtherSideSecondFrame;
      2:
        EquipAnimation[i] := @EquipmentOtherSideThirdFrame;
    end;

  end;

  // InitMovieBorders;

  // DrawSecondBackground();

  SecondPerson := ConstructorPerson(150, 430, 40);
  PersonOtherSideFirstFrame(SecondPerson);
  DrawPerson(SecondPerson);

  SecondEquip := ConstructorEquip(SecondPerson);
  EquipmentOtherSideFirstFrame(SecondEquip);
  DrawEquipment(SecondEquip, clGreen);

  timeAnimation3.Interval := 70;
  timeAnimation3.Enabled := True;

  timeStarter3.Enabled := false;
end;

procedure TMainForm.timeStarter4Timer(Sender: TObject);
begin
  timeAnimation4.Interval := 120;
  MediaPlayer1.Pause;
  mpVictoryMusic.FileName := 'morgen.mp3';
  mpVictoryMusic.Open;
  mpVictoryMusic.Play;
  timeAnimation4.Enabled := True;
  timeStarter4.Enabled := false;
end;

procedure TMainForm.TrashTimer(Sender: TObject);
begin
  MainForm.imgMain.Canvas.Pen.Color := RGB(random(255), random(255),
    random(255));
  MainForm.imgMain.Canvas.Brush.Color := RGB(random(255), random(255),
    random(255));
  MainForm.imgMain.Canvas.Ellipse(random(ClientWidth), random(ClientHeight),
    random(ClientWidth), random(ClientHeight))
end;

procedure TMainForm.timeAnimation1Timer(Sender: TObject);
var
  deltaSize: integer;
  deltaPoint: TPoint;
begin

  if CurrFrame >= FramesCount - 1 then
  begin
    timeAnimation1.Enabled := false;

    timeStarter2.Interval := 500;
    timeStarter2.Enabled := True;
    timeStarter3.Interval := 5000;
    timeStarter3.Enabled := True;

  end
  else
  begin

    DrawWhiteSpace();
    DrawFirstBackground();

    if (CurrFrame < FramesCount div 3) then
      deltaSize := 1
    else
      deltaSize := 0;

    DrawPerson(FirstPerson);
    DrawEquipment(FirstEquip, clRed);

    if @PersonAnimation[CurrFrame] = @PersonFirstFrame then
      deltaPoint := TPoint.Create(-2, 2)
    else if @PersonAnimation[CurrFrame] = @PersonSecondFrame then
      deltaPoint := TPoint.Create(-2, 1)
    else if @PersonAnimation[CurrFrame] = @PersonThirdFrame then
      deltaPoint := TPoint.Create(-6, 9)
    else if @PersonAnimation[CurrFrame] = @PersonForthFrame then
      deltaPoint := TPoint.Create(0, 2)
    else if @PersonAnimation[CurrFrame] = @PersonFifthFrame then
      deltaPoint := TPoint.Create(0, 2)
    else if @PersonAnimation[CurrFrame] = @PersonSixthFrame then
      deltaPoint := TPoint.Create(0, 6);

    with FirstPerson do
      FirstPerson := ConstructorPerson(Center.x + deltaPoint.x,
        Center.y + deltaPoint.y, size + deltaSize);

    PersonAnimation[CurrFrame](FirstPerson);

    FirstEquip := ConstructorEquip(FirstPerson);
    EquipAnimation[CurrFrame](FirstEquip);

    // DrawPerson(FirstPerson);
    // DrawEquipment(FirstEquip, clRed);

    Inc(CurrFrame);
  end;
end;

procedure TMainForm.timeAnimation2Timer(Sender: TObject);
var
  deltaSize: integer;
  deltaPoint: TPoint;
begin
  if CurrFrame >= FramesCount - 1 then
  begin
    timeAnimation2.Enabled := false;
    Sleep(1000);
    timeStarter4.Enabled := True;
  end
  else
  begin

    DrawSecondBackground();

    DrawPerson(FirstPerson);
    DrawEquipment(FirstEquip, clRed);
    DrawPerson(SecondPerson);
    DrawEquipment(SecondEquip, clGreen);

    if @PersonAnimation[CurrFrame] = @PersonOtherSideFirstFrame then
      deltaPoint := TPoint.Create(10, 1)
    else if @PersonAnimation[CurrFrame] = @PersonOtherSideSecondFrame then
      deltaPoint := TPoint.Create(10, 1)
    else if @PersonAnimation[CurrFrame] = @PersonOtherSideThirdFrame then
      deltaPoint := TPoint.Create(20, 1);

    with FirstPerson do
      FirstPerson := ConstructorPerson(Center.x + deltaPoint.x,
        Center.y + deltaPoint.y, size);

    PersonAnimation[CurrFrame](FirstPerson);

    FirstEquip := ConstructorEquip(FirstPerson);
    EquipAnimation[CurrFrame](FirstEquip);

    // DrawPerson(FirstPerson);
    // DrawEquipment(FirstEquip, clRed);

    Inc(CurrFrame);
  end;

end;

procedure TMainForm.timeAnimation3Timer(Sender: TObject);
var
  deltaSize: integer;
  deltaPoint: TPoint;
begin
  if CurrFrame2 >= FramesCount - 1 then
  begin
    timeAnimation3.Enabled := false;
  end
  else
  begin

    DrawSecondBackground();
    DrawPerson(FirstPerson);
    DrawEquipment(FirstEquip, clRed);
    DrawPerson(SecondPerson);
    DrawEquipment(SecondEquip, clGreen);

    if @PersonAnimation[CurrFrame2] = @PersonOtherSideFirstFrame then
      deltaPoint := TPoint.Create(10, 1)
    else if @PersonAnimation[CurrFrame2] = @PersonOtherSideSecondFrame then
      deltaPoint := TPoint.Create(10, 1)
    else if @PersonAnimation[CurrFrame2] = @PersonOtherSideThirdFrame then
      deltaPoint := TPoint.Create(20, 1);

    with SecondPerson do
      SecondPerson := ConstructorPerson(Center.x + deltaPoint.x,
        Center.y + deltaPoint.y, size);

    PersonAnimation[CurrFrame2](SecondPerson);

    SecondEquip := ConstructorEquip(SecondPerson);
    EquipAnimation[CurrFrame2](SecondEquip);

    // DrawPerson(SecondPerson);
    // DrawEquipment(SecondEquip, clGreen);

    Inc(CurrFrame2);
  end;

end;

procedure TMainForm.timeAnimation4Timer(Sender: TObject);
begin

  DrawWhiteSpace();
  DrawThirdBackground();

  Inc(i);
  if sign then
    k := k + 0.02
  else
    k := k - 0.02;

  FrameHandler(i, k, sign, imgMain.Canvas);

  // if i=14 then fps.Enabled:=false;

  if i = 14 then
  begin
    i := 0;
    sign := not sign;
  end;

end;

procedure TMainForm.timeDebugTimer(Sender: TObject);
begin
  DrawWhiteSpace;
  DrawLogo;

  timeDebug.Enabled := false;

end;

procedure TMainForm.ButtonClear(Sender: TObject);
begin
  timeStarter1.Enabled := false;
  timeAnimation1.Enabled := false;
  timeStarter2.Enabled := false;
  timeAnimation2.Enabled := false;
  timeAnimation3.Enabled := false;
  timeStarter3.Enabled := false;
  Repaint;

end;

{ ***************************************************************************************************** }

end.
