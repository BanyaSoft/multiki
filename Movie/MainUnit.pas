unit MainUnit;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
<<<<<<< Updated upstream
    TForm1 = class(TForm)
    btnSpawnStick: TButton;
        Edit1: TEdit;
        Edit2: TEdit;
        Edit3: TEdit;
        Timer1: TTimer;
    btnBackgroundTrack: TButton;
        btnPedestal: TButton;
        procedure btnSpawnStickClick(Sender: TObject);
        procedure btnBackgroundTrackClick(Sender: TObject);
        procedure Timer1Timer(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure btnPedestalClick(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

    TThreePoints = array [1 .. 3] of TPoint;
    TTwoPoints = array [1 .. 2] of TPoint;
    TPolygon = array of TPoint;

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

    TFrame = procedure(const currPerson: TPerson);
    TFrames = array of TFrame;
=======
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
    FirstPerson: TPerson;
    Cartoon: TFrames;
    FramesCount: integer;
    CurrFrame: integer;
=======
  FirstPerson: TPerson;
  FirstEquip: TEquipment;
  SecondPerson: TPerson;
  SecondEquip: TEquipment;
  PersonAnimation: TPersonFrames;
  EquipAnimation: TEquipFrames;
  FramesCount: integer;
  CurrFrame: integer;
  CurrFrame2: integer;
  { ***************************************************************************************************** }

procedure DrawWhiteSpace;
var
  Borders: TRect;
begin
  Borders.Create(TPoint.Create(GlobalX, GlobalY),
    TPoint.Create(LengthX - GlobalX, LengthY - GlobalY));

  with MainForm.Canvas do
  begin
    Brush.Color := MainForm.Color;
    Brush.Style := bsSolid;

    FillRect(Borders);
  end;
end;
>>>>>>> Stashed changes

procedure InitMovieBorders;
var
    Borders: TRect;
begin
<<<<<<< Updated upstream
    Borders.Create(TPoint.Create(GlobalX, GlobalY),
      TPoint.Create(GlobalX + LengthX, GlobalY + LengthY));
=======
  Borders.Create(TPoint.Create(GlobalX, GlobalY),
    TPoint.Create(LengthX - GlobalX, LengthY - GlobalY));
>>>>>>> Stashed changes

    with Form1.Canvas do
    begin
        Pen.Width := 6;
        Pen.Mode := pmCopy;
        Pen.Color := clBlack;
        Brush.Style := bsClear;

<<<<<<< Updated upstream
        Rectangle(GlobalX, GlobalY, GlobalX + LengthX, GlobalY + LengthY);
    end;
=======
    Rectangle(GlobalX, GlobalY, LengthX - GlobalX, LengthY - GlobalY);
  end;
>>>>>>> Stashed changes

end;

procedure DrawFirstBackground;
var
    Fence: TPolygon;
begin
<<<<<<< Updated upstream
    with Form1.Canvas do
    begin
        Pen.Width := 3;
        Pen.Color := clBlack;
        Brush.Style := bsVertical;
        Brush.Color := clBlack;
=======

  with MainForm.Canvas do
  begin

    Pen.Width := 3;
    Pen.Color := clBlack;
    Pen.Mode := pmCopy;
    Brush.Color := clBlack;
    Brush.Style := bsVertical;
>>>>>>> Stashed changes

        SetLength(Fence, 4);

<<<<<<< Updated upstream
        Fence[0] := TPoint.Create(GlobalX + 3 * LengthX div 8, GlobalY + 150);
        Fence[1] := TPoint.Create(GlobalX + 3 * LengthX div 8,
          GlobalY + 150 - 50);
        Fence[2] := TPoint.Create(GlobalX + LengthX div 8,
          GlobalY + LengthY - 50 - 200);
        Fence[3] := TPoint.Create(GlobalX + LengthX div 8,
          GlobalY + LengthY - 50);
        Polygon(Fence);

        Fence[0] := TPoint.Create(GlobalX + 5 * LengthX div 8, GlobalY + 150);
        Fence[1] := TPoint.Create(GlobalX + 5 * LengthX div 8,
          GlobalY + 150 - 50);
        Fence[2] := TPoint.Create(GlobalX + 7 * LengthX div 8,
          GlobalY + LengthY - 50 - 200);
        Fence[3] := TPoint.Create(GlobalX + 7 * LengthX div 8,
          GlobalY + LengthY - 50);
        Polygon(Fence);

        MoveTo(GlobalX + 3 * LengthX div 8, GlobalY + 150);
        LineTo(GlobalX + 5 * LengthX div 8, GlobalY + 150);

        Fence[0] := TPoint.Create(GlobalX + LengthX div 8,
          GlobalY + LengthY - 50 - 200);
        Fence[1] := TPoint.Create(GlobalX + LengthX div 8,
          GlobalY + LengthY - 50);
        Fence[2] := TPoint.Create(GlobalX, GlobalY + LengthY - 50);
        Fence[3] := TPoint.Create(GlobalX, GlobalY + LengthY - 50 - 200);
        Polygon(Fence);

        Fence[0] := TPoint.Create(GlobalX + 7 * LengthX div 8,
          GlobalY + LengthY - 50 - 200);
        Fence[1] := TPoint.Create(GlobalX + 7 * LengthX div 8,
          GlobalY + LengthY - 50);
        Fence[2] := TPoint.Create(GlobalX + LengthX, GlobalY + LengthY - 50);
        Fence[3] := TPoint.Create(GlobalX + LengthX,
          GlobalY + LengthY - 50 - 200);
        Polygon(Fence);

    end;
=======
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
>>>>>>> Stashed changes
end;

procedure DrawChristmasTree(x, y, n: integer); // (x,y) Root bottom right
begin
<<<<<<< Updated upstream
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
        Polygon([Point(x, y - 210), Point(x - 20, y - 210),
          Point(x + 50, y - 140), Point(x + 30, y - 140), Point(x + 100 - 10,
          y - 50), Point(x - 200, y - 50), Point(x - 130, y - 140),
          Point(x - 150, y - 140), Point(x - 80, y - 210),
          Point(x - 100, y - 210), Point(x - 50, y - 260)]);
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
=======
  With MainForm.Canvas do
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
>>>>>>> Stashed changes
        end;
    end;
end;

procedure DrawSnowMan(x, y, size: integer); // (x,y) head top center
begin
<<<<<<< Updated upstream
    with Form1.Canvas do
=======
  with MainForm.Canvas do
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
  with MainForm.Canvas do
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
  with MainForm.Canvas, MainForm do
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
>>>>>>> Stashed changes
    begin
        Pen.Color := clAqua;
        Brush.Color := clCream;

        Ellipse(x - 100, y + 150, x + 100, y + 350);
        Ellipse(x - 70, y + 50, x + 70, y + 160);
        Ellipse(x - 30, y, x + 30, y + 50);

        Pen.Color := clRed;
        Brush.Color := clRed;
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
<<<<<<< Updated upstream
end;

function ConstructorPerson(const x, y, Size: integer): TPerson;
=======

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

    Fence[0] := TPoint.Create(GlobalX + 85 * lenUnit, GlobalY + 18 * lenUnit
      - 6 + 20);
    Fence[1] := TPoint.Create(GlobalX + 80 * lenUnit,
      GlobalY + 17 * lenUnit + 20);
    Fence[2] := TPoint.Create(GlobalX + 70 * lenUnit, GlobalY + 33 * lenUnit
      - 5 + 20);
    Fence[3] := TPoint.Create(GlobalX + 75 * lenUnit, GlobalY + 34 * lenUnit
      - 11 + 20);
    Polygon(Fence);
  end;
end;

procedure DrawThirdBackground;
var
  lenUnit: integer;
begin
  with MainForm.Canvas, MainForm do
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

  with MainForm.Canvas do
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
>>>>>>> Stashed changes
var
    NewPerson: TPerson;
begin
<<<<<<< Updated upstream
    NewPerson.Size := Size;
    NewPerson.Center.x := x;
    NewPerson.Center.y := y;
=======
  NewPerson.size := size;
  NewPerson.Center.x := x;
  NewPerson.Center.y := y;
>>>>>>> Stashed changes

    Result := NewPerson;
end;

procedure PersonFirstFrame(const currPerson: TPerson);
begin
<<<<<<< Updated upstream
    with currPerson, Center do
    begin
        Head.Create(x - 9 * Size div 8, y - 2 * Size, x + 3 * Size div 8,
          y - Size div 2);
        Body[1].Create(x - 2 * Size div 10, y - Size div 2);
        Body[2].Create(x, y);
        Body[3].Create(x + 2 * Size div 10, y + 2 * Size);
=======
  with MainForm.Canvas do
  begin
    Pen.Width := 2;
    Pen.Color := clBlack;
    Brush.Color := clWhite;
    if flag then
      Pen.Mode := pmNotXor
    else
      Pen.Mode := pmCopy;
    Brush.Style := bsClear;
>>>>>>> Stashed changes

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
        Head.Create(x - 9 * Size div 8, y - 2 * Size, x + 3 * Size div 8,
          y - Size div 2);
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
        Head.Create(x - 9 * Size div 8, y - 2 * Size, x + 3 * Size div 8,
          y - Size div 2);
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
        Head.Create(x - 2 * Size div 4, y - 3 * Size div 2, x + 2 * Size div 4,
          y - Size div 2);
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
            LegLeft[3].Create(x - 2 * Size div 5, y + 2 * Size);
        end;

        LegRight[1].Create(Body[3].x, Body[3].y);
        with LegRight[1] do
        begin
            LegRight[2].Create(x + Size div 2, y + Size div 2);
            LegRight[3].Create(x + 2 * Size div 5, y + 2 * Size);
        end;
    end;
end;

procedure PersonFifthFrame(const currPerson: TPerson);
begin
    with currPerson, Center do
    begin
        Head.Create(x - 2 * Size div 4, y - 3 * Size div 2, x + 2 * Size div 4,
          y - Size div 2);
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
            LegLeft[3].Create(x - 2 * Size div 5, y + 2 * Size);
        end;

        LegRight[1].Create(Body[3].x, Body[3].y);
        with LegRight[1] do
        begin
            LegRight[2].Create(x + Size div 2, y + Size div 2);
            LegRight[3].Create(x + 2 * Size div 5, y + 2 * Size);
        end;
    end;
end;

procedure PersonSixthFrame(const currPerson: TPerson);
begin
    with currPerson, Center do
    begin
        Head.Create(x - 2 * Size div 4, y - 3 * Size div 2, x + 2 * Size div 4,
          y - Size div 2);
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
            LegLeft[3].Create(x - 2 * Size div 5, y + 2 * Size);
        end;

        LegRight[1].Create(Body[3].x, Body[3].y);
        with LegRight[1] do
        begin
            LegRight[2].Create(x + Size div 2, y + Size div 2);
            LegRight[3].Create(x + 2 * Size div 5, y + 2 * Size);
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

<<<<<<< Updated upstream
procedure TForm1.btnPedestalClick(Sender: TObject);
=======
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

function ConstructorEquip(const currPerson: TPerson): TEquipment;
>>>>>>> Stashed changes
var
    lenUnit: integer;
begin
<<<<<<< Updated upstream
    with Form1.Canvas do
=======
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
  with MainForm.Canvas do
  begin

    Pen.Color := colour;
    if flag then

      Pen.Mode := pmNotXor
    else
      Pen.Mode := pmCopy;
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

procedure TMainForm.FormCreate(Sender: TObject);
begin

  MainForm.ClientWidth := 1920;
  MainForm.ClientHeight := 1080;

  timeStarter1.Interval := 1000;
  timeStarter1.Enabled := True;

  MediaPlayer1.FileName := 'Second.mp3';
  MediaPlayer1.Open;
  MediaPlayer1.Play;

  // timeDebug.Interval := 100;
  // timeDebug.Enabled := True;
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
>>>>>>> Stashed changes
    begin
        Pen.Width := 10;
        Pen.Mode := pmCopy;
        Brush.Color := clBtnFace;
        lenUnit := ClientWidth div 100;

        Form1.Canvas.Rectangle(GlobalX, GlobalY, ClientWidth-GlobalX, ClientHeight-GlobalY);

        Form1.Canvas.Rectangle(GlobalX+10*lenUnit, LengthY-GlobalY*3, GlobalX+30*lenUnit, ClientHeight-GlobalY);
        Form1.Canvas.Rectangle(GlobalX+30*lenUnit, LengthY-GlobalY*5, GlobalX+50*lenUnit, ClientHeight-GlobalY);
        Form1.Canvas.Rectangle(GlobalX+50*lenUnit, LengthY-GlobalY*4+50, GlobalX+70*lenUnit, ClientHeight-GlobalY);

        MoveTo(GlobalX+lenUnit*80, ClientHeight-GlobalY);
        LineTo(GlobalX+lenUnit*80, ClientHeight-6*GlobalY);
        Brush.Color := clBlue;
        Rectangle(GlobalX+lenUnit*80, ClientHeight-6*GlobalY, GlobalX+lenUnit*85, ClientHeight-3*GlobalY);
        Brush.Color := clBtnFace;
    end;

<<<<<<< Updated upstream
=======
  end;

  InitMovieBorders;

  DrawChristmasTree(600, 450, 1);
  DrawChristmasTree(525, 550, 2);
  DrawChristmasTree(450, 650, 2);
  DrawChristmasTree(375, 750, 1);
  DrawChristmasTree(300, 850, 2);
  DrawFirstBackground();

  DrawSnowMan(LengthX - 2 * GlobalX, GlobalY * 4, 6);

  FirstPerson := ConstructorPerson(GlobalX * 10, 3 * GlobalY div 2, 14);
  PersonForthFrame(FirstPerson);
  DrawPerson(FirstPerson);

  FirstEquip := ConstructorEquip(FirstPerson);
  EquipmentForthFrame(FirstEquip);
  DrawEquipment(FirstEquip, clRed);

  timeAnimation1.Interval := 100;
  timeAnimation1.Enabled := True;

  timeStarter1.Enabled := False;
>>>>>>> Stashed changes
end;

procedure TForm1.btnSpawnStickClick(Sender: TObject);
begin
<<<<<<< Updated upstream
    CurrFrame := 0;
    FirstPerson := ConstructorPerson(StrToInt(Edit1.Text), StrToInt(Edit2.Text),
      StrToInt(Edit3.Text));
=======
  DrawWhiteSpace;

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

  timeStarter2.Enabled := False;
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

  timeStarter3.Enabled := False;
end;

procedure TMainForm.timeStarter4Timer(Sender: TObject);
begin
  DrawThirdBackground();
  timeStarter4.Enabled := False;
end;

procedure TMainForm.TrashTimer(Sender: TObject);
begin
  MainForm.Canvas.Pen.Color := RGB(random(255), random(255), random(255));
  MainForm.Canvas.Brush.Color := RGB(random(255), random(255), random(255));
  MainForm.Canvas.Ellipse(random(ClientWidth), random(ClientHeight),
    random(ClientWidth), random(ClientHeight))
end;

procedure TMainForm.timeAnimation1Timer(Sender: TObject);
var
  deltaSize: integer;
  deltaPoint: TPoint;
begin

  if CurrFrame >= FramesCount - 1 then
  begin
    timeAnimation1.Enabled := False;

    timeStarter2.Interval := 500;
    timeStarter2.Enabled := True;
    timeStarter3.Interval := 5500;
    timeStarter3.Enabled := True;

  end
  else
  begin
    if (CurrFrame < FramesCount div 3) then
      deltaSize := 1
    else
      deltaSize := 0;
>>>>>>> Stashed changes

    PersonThirdFrame(FirstPerson);
    DrawPerson(FirstPerson);

<<<<<<< Updated upstream
    Timer1.Enabled := True;
    Timer1.Interval := 500;
=======
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
>>>>>>> Stashed changes

end;

procedure TForm1.btnBackgroundTrackClick(Sender: TObject);
begin
    DrawFirstBackground();

    InitMovieBorders;

    DrawChristmasTree(400, 400, 1);
    DrawSnowMan(1100, 50);
    btnBackgroundTrack.Enabled := false; // Button is not clickable more after frist click
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
<<<<<<< Updated upstream
        FirstPerson := ConstructorPerson(Center.x - 5, Center.y + 10, Size + 1);
=======
      FirstPerson := ConstructorPerson(Center.x + deltaPoint.x,
        Center.y + deltaPoint.y, size + deltaSize);

    PersonAnimation[CurrFrame](FirstPerson);

    FirstEquip := ConstructorEquip(FirstPerson);
    EquipAnimation[CurrFrame](FirstEquip);

    DrawPerson(FirstPerson);
    DrawEquipment(FirstEquip, clRed);

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
    timeAnimation2.Enabled := False;
    sleep(2000);
    Trash.Enabled := True;
  end
  else
  begin
    DrawPerson(FirstPerson);
    DrawEquipment(FirstEquip, clRed);

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

    DrawPerson(FirstPerson);
    DrawEquipment(FirstEquip, clRed);

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
    timeAnimation3.Enabled := False;
  end
  else
  begin
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

    DrawPerson(SecondPerson);
    DrawEquipment(SecondEquip, clGreen);

    Inc(CurrFrame2);
  end;

end;

procedure TMainForm.timeDebugTimer(Sender: TObject);
begin
  DrawWhiteSpace;
  DrawLogo;

  timeDebug.Enabled := False;

end;

procedure TMainForm.ButtonClear(Sender: TObject);
begin
  timeStarter1.Enabled := False;
  timeAnimation1.Enabled := False;
  timeStarter2.Enabled := False;
  timeAnimation2.Enabled := False;
  timeAnimation3.Enabled := False;
  timeStarter3.Enabled := False;
  Repaint;
>>>>>>> Stashed changes

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
