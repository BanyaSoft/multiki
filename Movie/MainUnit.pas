unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Types,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, 
  DataTypes, AudioRoutine;

type
<<<<<<< HEAD
  TMainForm = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Timer1: TTimer;
    btnBackgroundTrack: TButton;
    btnPedestal: TButton;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btnBackgroundTrackClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPedestalClick(Sender: TObject);
    procedure ButtonClear(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
=======
    TForm1 = class(TForm)
        Edit1: TEdit;
        Edit2: TEdit;
        Edit3: TEdit;
        Timer1: TTimer;
        btnBackgroundTrack: TButton;
        btnPedestal: TButton;
        btnFinishFence: TButton;
        procedure Button1Click(Sender: TObject);
        procedure btnBackgroundTrackClick(Sender: TObject);
        procedure Timer1Timer(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure btnPedestalClick(Sender: TObject);
        procedure btnFinishFenceClick(Sender: TObject);
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
>>>>>>> main

var
  MainForm: TMainForm;

implementation

{$R *.dfm}



var
  FirstPerson: TPerson;
  FirstEquip: TEquipment;
  PersonAnimation: TPersonFrames;
  EquipAnimation: TEquipFrames;
  FramesCount: integer;
  CurrFrame: integer;
  
{*****************************************************************************************************}

procedure InitMovieBorders;
var
  Borders: TRect;
begin
  Borders.Create(TPoint.Create(GlobalX, GlobalY), TPoint.Create(GlobalX + LengthX, GlobalY + LengthY));

  with MainForm.Canvas do
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
  with MainForm.Canvas do
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

    MoveTo(GlobalX + LengthX div 8, GlobalY + LengthY - 50 - 200);
    LineTo(GlobalX + LengthX div 8, GlobalY + LengthY - 50);

    MoveTo(GlobalX + 7 * LengthX div 8, GlobalY + LengthY - 50 - 200);
    LineTo(GlobalX + 7 * LengthX div 8, GlobalY + LengthY - 50);

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
  With MainForm.Canvas do
  Begin
    Pen.Width := 1;
    Pen.Color := clWebSaddleBrown;
    Brush.Color := clWebSaddleBrown;
    Polygon([Point(x - 10, y - 50), Point(x - 10, y), Point(x - 90, y), Point(x - 90, y - 50)]);
    Pen.Width := 5;
    Pen.Color := clWebDarkgreen;
    Brush.Color := clWebDarkgreen;
    Polygon([Point(x, y - 210), Point(x - 20, y - 210), Point(x + 50, y - 140), Point(x + 30, y - 140),
      Point(x + 100 - 10, y - 50), Point(x - 200, y - 50), Point(x - 130, y - 140), Point(x - 150, y - 140),
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
  with MainForm.Canvas do
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
end;

{*****************************************************************************************************}

function ConstructorPerson(const x, y, Size: integer): TPerson;
var
  NewPerson: TPerson;
begin
  NewPerson.Size := Size;
  NewPerson.Center.x := x;
  NewPerson.Center.y := y;

  Result := NewPerson;
end;

procedure DrawPerson(const PersonToDraw: TPerson);
begin
  with MainForm.Canvas do
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

<<<<<<< HEAD
procedure PersonFirstFrame(var currPerson: TPerson);
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

procedure PersonSecondFrame(var currPerson: TPerson);
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

procedure PersonThirdFrame(var currPerson: TPerson);
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

procedure PersonForthFrame(var currPerson: TPerson);
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

procedure PersonFifthFrame(var currPerson: TPerson);
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

procedure PersonSixthFrame(var currPerson: TPerson);
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

procedure PersonOtherSideFirstFrame(var currPerson: TPerson);
begin
  with currPerson, Center do
  begin
    Head.Create(x - 3 * Size div 8, y - 2 * Size, x + 9 * Size div 8, y - Size div 2);
    Body[1].Create(x + 2 * Size div 10, y - Size div 2);
    Body[2].Create(x, y);
    Body[3].Create(x - 2 * Size div 10, y + 2 * Size);

    ArmLeft[1].Create(x, y);
    ArmLeft[2].Create(x + 3 * Size div 5, y + 1 * Size div 3);
    ArmLeft[3].Create(x + 3 * Size div 2, y);

    ArmRight[1].Create(x, y);
    ArmRight[2].Create(x + Size div 2, y + 2 * Size div 2);
    ArmRight[3].Create(x + 3 * Size div 2, y + Size);

    LegLeft[1].Create(Body[3].x, Body[3].y);
    with LegLeft[1] do
    begin
      LegLeft[2].Create(x + 3 * Size div 2, y + Size);
      LegLeft[3].Create(x + 3 * Size div 2, y + 4 * Size div 2);
    end;

    LegRight[1].Create(Body[3].x, Body[3].y);
    with LegRight[1] do
    begin
      LegRight[2].Create(x + Size div 2, y + Size);
      LegRight[3].Create(x + Size div 2, y + 5 * Size div 2);
    end;
  end;
end;

procedure PersonOtherSideSecondFrame(var currPerson: TPerson);
begin
  with currPerson, Center do
  begin
    Head.Create(x - 3 * Size div 8, y - 2 * Size, x + 9 * Size div 8, y - Size div 2);
    Body[1].Create(x + 2 * Size div 10, y - Size div 2);
    Body[2].Create(x, y);
    Body[3].Create(x - 2 * Size div 10, y + 2 * Size);

    ArmLeft[1].Create(x, y);
    ArmLeft[2].Create(x + 3 * Size div 6, y + 2 * Size div 3);
    ArmLeft[3].Create(x + 3 * Size div 2, y + 2 * Size div 5);

    ArmRight[1].Create(x, y);
    ArmRight[2].Create(x + Size div 2, y + 3 * Size div 2);
    ArmRight[3].Create(x + 3 * Size div 2, y + 7 * Size div 5);

    LegLeft[1].Create(Body[3].x, Body[3].y);
    with LegLeft[1] do
    begin
      LegLeft[2].Create(x + 3 * Size div 2, y + Size);
      LegLeft[3].Create(x + 3 * Size div 2, y + 4 * Size div 2);
    end;

    LegRight[1].Create(Body[3].x, Body[3].y);
    with LegRight[1] do
    begin
      LegRight[2].Create(x + Size div 2, y + Size);
      LegRight[3].Create(x + Size div 2, y + 5 * Size div 2);
    end;
  end;
end;

procedure PersonOtherSideThirdFrame(var currPerson: TPerson);
begin
  with currPerson, Center do
  begin
    Head.Create(x - 3 * Size div 8, y - 2 * Size, x + 9 * Size div 8, y - Size div 2);
    Body[1].Create(x + 2 * Size div 10, y - Size div 2);
    Body[2].Create(x, y);
    Body[3].Create(x - 2 * Size div 10, y + 2 * Size);

    ArmLeft[1].Create(x, y);
    ArmLeft[2].Create(x + 3 * Size div 6, y + 2 * Size div 3);
    ArmLeft[3].Create(x + 3 * Size div 2, y + 3 * Size div 4);

    ArmRight[1].Create(x, y);
    ArmRight[2].Create(x + Size div 2, y + 3 * Size div 2);
    ArmRight[3].Create(x + 3 * Size div 2, y + 2 * Size);


    LegLeft[1].Create(Body[3].x, Body[3].y);
    with LegLeft[1] do
    begin
      LegLeft[2].Create(x + 3 * Size div 2, y + Size);
      LegLeft[3].Create(x + 3 * Size div 2, y + 4 * Size div 2);
    end;

    LegRight[1].Create(Body[3].x, Body[3].y);
    with LegRight[1] do
    begin
      LegRight[2].Create(x + Size div 2, y + Size);
      LegRight[3].Create(x + Size div 2, y + 5 * Size div 2);
    end;
  end;
end;

{*****************************************************************************************************}

function ConstructorEquip(const currPerson: TPerson): TEquipment;
=======
procedure DrawLittleFlag(x, y, Size: integer);
begin
    with Form1.Canvas do
    begin
        MoveTo(x, y + size);
        LineTo(x, y);
        LineTo(x+size div 2, y+size div 4);
        LineTo(x, y + size div 3);
    end;

end;

procedure TForm1.btnFinishFenceClick(Sender: TObject);
var
    i, lenUnit: integer;
    currX: integer;
    currY: integer;
begin
    with Form1.Canvas do
    begin
        Pen.Width := 2;
        Pen.Mode := pmCopy;
        Brush.Color := clBtnFace;
        lenUnit := ClientWidth div 100;

        Form1.Canvas.Rectangle(GlobalX, GlobalY, ClientWidth - GlobalX,
          ClientHeight - GlobalY);

        MoveTo(GlobalX + lenUnit, ClientHeight - GlobalY - lenUnit * 20);
        LineTo(GlobalX + lenUnit * 90, ClientHeight - GlobalY - lenUnit * 10);
        LineTo(GlobalX + lenUnit * 90, ClientHeight - GlobalY - lenUnit * 2);
        LineTo(GlobalX + lenUnit, ClientHeight - GlobalY - lenUnit * 12);
        LineTo(GlobalX + lenUnit, ClientHeight - GlobalY - lenUnit * 20);

        MoveTo(GlobalX + lenUnit, ClientHeight - GlobalY - lenUnit * 45);
        LineTo(GlobalX + lenUnit * 90, ClientHeight - GlobalY - lenUnit * 35);
        LineTo(GlobalX + lenUnit * 90, ClientHeight - GlobalY - lenUnit * 27);
        LineTo(GlobalX + lenUnit, ClientHeight - GlobalY - lenUnit * 37);
        LineTo(GlobalX + lenUnit, ClientHeight - GlobalY - lenUnit * 45);

        currX := GlobalX + lenUnit;
        currY := ClientHeight - GlobalY - lenUnit * 45;

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
        currY := ClientHeight - GlobalY - lenUnit * 20;
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

        DrawLittleFlag(GlobalX+lenUnit, ClientHeight-GlobalY-5*lenUnit-75, 75);
        DrawLittleFlag(GlobalX+12*lenUnit, ClientHeight-GlobalY-4*lenUnit-75, 75);
        DrawLittleFlag(GlobalX+24*lenUnit, ClientHeight-GlobalY-3*lenUnit-75, 75);
        DrawLittleFlag(GlobalX+36*lenUnit, ClientHeight-GlobalY-2*lenUnit-75, 75);
        DrawLittleFlag(GlobalX+48*lenUnit, ClientHeight-GlobalY-1*lenUnit-75, 75);

        DrawLittleFlag(GlobalX+50*lenUnit, GlobalY+5*lenUnit-75, 75);
        DrawLittleFlag(GlobalX+62*lenUnit, GlobalY+6*lenUnit-75, 75);
        DrawLittleFlag(GlobalX+74*lenUnit, GlobalY+7*lenUnit-75, 75);
        DrawLittleFlag(GlobalX+86*lenUnit, GlobalY+8*lenUnit-75, 75);

        Brush.Color := clBlack;
        Pen.Width := 4;
        MoveTo(GlobalX + 80*lenUnit, GlobalY + 17 * lenUnit);
        LineTo(GlobalX + 70*lenUnit, GlobalY + 33 * lenUnit-5);
        MoveTo(GlobalX + 85*lenUnit, GlobalY + 18 * lenUnit-6);
        LineTo(GlobalX + 75*lenUnit, GlobalY + 34 * lenUnit-11);
        Pen.Width := 2;
    end;
end;

procedure TForm1.btnPedestalClick(Sender: TObject);
>>>>>>> main
var
  NewEquipment: TEquipment;
begin
  NewEquipment.Size := currPerson.Size;

<<<<<<< HEAD
  NewEquipment.SnowShoeLeft[2] := currPerson.LegLeft[3];
  NewEquipment.SnowShoeRight[2] := currPerson.LegRight[3];

  NewEquipment.SnowStickLeft[1] := currPerson.ArmLeft[3];
  NewEquipment.SnowStickRight[1] := currPerson.ArmRight[3];

  Result := NewEquipment;
end;

procedure DrawEquipment(const EquipToDraw: TEquipment);
begin
  with MainForm.Canvas do
  begin
    Pen.Color := clRed;
    Pen.Mode := pmNotXor;
    Brush.Style := bsClear;

    PolyLine(EquipToDraw.SnowShoeLeft);
    PolyLine(EquipToDraw.SnowShoeRight);
    PolyLine(EquipToDraw.SnowStickLeft);
    PolyLine(EquipToDraw.SnowStickRight);
  end;
=======
        Form1.Canvas.Rectangle(GlobalX, GlobalY, ClientWidth - GlobalX,
          ClientHeight - GlobalY);

        Form1.Canvas.Rectangle(GlobalX + 10 * lenUnit, LengthY - GlobalY * 3,
          GlobalX + 30 * lenUnit, ClientHeight - GlobalY);
        Form1.Canvas.Rectangle(GlobalX + 30 * lenUnit, LengthY - GlobalY * 5,
          GlobalX + 50 * lenUnit, ClientHeight - GlobalY);
        Form1.Canvas.Rectangle(GlobalX + 50 * lenUnit, LengthY - GlobalY * 4 +
          50, GlobalX + 70 * lenUnit, ClientHeight - GlobalY);

        MoveTo(GlobalX + lenUnit * 80, ClientHeight - GlobalY);
        LineTo(GlobalX + lenUnit * 80, ClientHeight - 6 * GlobalY);
        Brush.Color := clblue;
        Rectangle(GlobalX + lenUnit * 80, ClientHeight - 6 * GlobalY,
          GlobalX + lenUnit * 85, ClientHeight - 3 * GlobalY);
        Brush.Color := clBtnFace;
    end;
>>>>>>> main

end;

procedure EquipmentFirstFrame(var currEqupment: TEquipment);
begin
  with currEqupment do
  begin
    SnowShoeLeft[1].Create(SnowShoeLeft[2].x - 3 * Size div 2, SnowShoeLeft[2].y + 3 * Size div 2);
    SnowShoeLeft[3].Create(SnowShoeLeft[2].x + 3 * Size div 2, SnowShoeLeft[2].y - 3 * Size div 2);

    SnowShoeRight[1].Create(SnowShoeRight[2].x - 3 * Size div 2, SnowShoeRight[2].y + 3 * Size div 2);
    SnowShoeRight[3].Create(SnowShoeRight[2].x + 3 * Size div 2, SnowShoeRight[2].y - 3 * Size div 2);

    SnowStickLeft[2].Create(SnowStickLeft[1].x - Size, SnowStickLeft[1].y + 4 * Size);
    SnowStickRight[2].Create(SnowStickRight[1].x + Size div 2, SnowStickRight[1].y + 4 * Size);
  end;
end;

procedure EquipmentSecondFrame(var currEqupment: TEquipment);
begin
  with currEqupment do
  begin
    SnowShoeLeft[1].Create(SnowShoeLeft[2].x - 3 * Size div 2, SnowShoeLeft[2].y + 3 * Size div 2);
    SnowShoeLeft[3].Create(SnowShoeLeft[2].x + 3 * Size div 2, SnowShoeLeft[2].y - 3 * Size div 2);

    SnowShoeRight[1].Create(SnowShoeRight[2].x - 3 * Size div 2, SnowShoeRight[2].y + 3 * Size div 2);
    SnowShoeRight[3].Create(SnowShoeRight[2].x + 3 * Size div 2, SnowShoeRight[2].y - 3 * Size div 2);

    SnowStickLeft[2].Create(SnowStickLeft[1].x + Size, SnowStickLeft[1].y + 3 * Size);
    SnowStickRight[2].Create(SnowStickRight[1].x + Size, SnowStickRight[1].y + 3 * Size);
  end;
end;

procedure EquipmentThirdFrame(var currEqupment: TEquipment);
begin
  with currEqupment do
  begin
    SnowShoeLeft[1].Create(SnowShoeLeft[2].x - 3 * Size div 2, SnowShoeLeft[2].y + 3 * Size div 2);
    SnowShoeLeft[3].Create(SnowShoeLeft[2].x + 3 * Size div 2, SnowShoeLeft[2].y - 3 * Size div 2);

    SnowShoeRight[1].Create(SnowShoeRight[2].x - 3 * Size div 2, SnowShoeRight[2].y + 3 * Size div 2);
    SnowShoeRight[3].Create(SnowShoeRight[2].x + 3 * Size div 2, SnowShoeRight[2].y - 3 * Size div 2);

    SnowStickLeft[2].Create(SnowStickLeft[1].x + 2 * Size, SnowStickLeft[1].y + 2 * Size);
    SnowStickRight[2].Create(SnowStickRight[1].x + 2 * Size, SnowStickRight[1].y + 2 * Size);
  end;
end;

procedure EquipmentForthFrame(var currEqupment: TEquipment);
begin
  with currEqupment do
  begin
    SnowShoeLeft[1].Create(SnowShoeLeft[2].x - Size div 10, SnowShoeLeft[2].y + 3 * Size div 2);
    SnowShoeLeft[3].Create(SnowShoeLeft[2].x + Size div 10, SnowShoeLeft[2].y - 3 * Size div 2);

    SnowShoeRight[1].Create(SnowShoeRight[2].x + Size div 10, SnowShoeRight[2].y + 3 * Size div 2);
    SnowShoeRight[3].Create(SnowShoeRight[2].x - Size div 10, SnowShoeRight[2].y - 3 * Size div 2);

    SnowStickLeft[2].Create(SnowStickLeft[1].x - Size div 5, SnowStickLeft[1].y + 4 * Size);
    SnowStickRight[2].Create(SnowStickRight[1].x + Size div 5, SnowStickRight[1].y + 4 * Size);
  end;
end;

procedure EquipmentFifthFrame(var currEqupment: TEquipment);
begin
  with currEqupment do
  begin
    SnowShoeLeft[1].Create(SnowShoeLeft[2].x - Size div 10, SnowShoeLeft[2].y + 3 * Size div 2);
    SnowShoeLeft[3].Create(SnowShoeLeft[2].x + Size div 10, SnowShoeLeft[2].y - 3 * Size div 2);

    SnowShoeRight[1].Create(SnowShoeRight[2].x + Size div 10, SnowShoeRight[2].y + 3 * Size div 2);
    SnowShoeRight[3].Create(SnowShoeRight[2].x - Size div 10, SnowShoeRight[2].y - 3 * Size div 2);

    SnowStickLeft[2].Create(SnowStickLeft[1].x - Size div 5, SnowStickLeft[1].y + 3 * Size);
    SnowStickRight[2].Create(SnowStickRight[1].x + Size div 5, SnowStickRight[1].y + 3 * Size);
  end;
end;

procedure EquipmentSixthFrame(var currEqupment: TEquipment);
begin
  with currEqupment do
  begin
    SnowShoeLeft[1].Create(SnowShoeLeft[2].x - Size div 10, SnowShoeLeft[2].y + 3 * Size div 2);
    SnowShoeLeft[3].Create(SnowShoeLeft[2].x + Size div 10, SnowShoeLeft[2].y - 3 * Size div 2);

    SnowShoeRight[1].Create(SnowShoeRight[2].x + Size div 10, SnowShoeRight[2].y + 3 * Size div 2);
    SnowShoeRight[3].Create(SnowShoeRight[2].x - Size div 10, SnowShoeRight[2].y - 3 * Size div 2);

    SnowStickLeft[2].Create(SnowStickLeft[1].x - Size div 5, SnowStickLeft[1].y - 3 * Size);
    SnowStickRight[2].Create(SnowStickRight[1].x + Size div 5, SnowStickRight[1].y - 3 * Size);
  end;
end;

procedure EquipmentOtherSideFirstFrame(var currEqupment: TEquipment);
begin
  with currEqupment do
  begin
    SnowShoeLeft[1].Create(SnowShoeLeft[2].x - 4 * Size div 2, SnowShoeLeft[2].y - Size div 2);
    SnowShoeLeft[3].Create(SnowShoeLeft[2].x + 4 * Size div 2, SnowShoeLeft[2].y + Size div 2);

    SnowShoeRight[1].Create(SnowShoeRight[2].x - 4 * Size div 2, SnowShoeRight[2].y - Size div 2);
    SnowShoeRight[3].Create(SnowShoeRight[2].x + 4 * Size div 2, SnowShoeRight[2].y + Size div 2);

    SnowStickLeft[2].Create(SnowStickLeft[1].x - Size div 2, SnowStickLeft[1].y + 3 * Size);
    SnowStickRight[2].Create(SnowStickRight[1].x + Size div 2, SnowStickRight[1].y + 3 * Size);
  end;
end;

procedure EquipmentOtherSideSecondFrame(var currEqupment: TEquipment);
begin
  with currEqupment do
  begin
    SnowShoeLeft[1].Create(SnowShoeLeft[2].x - 4 * Size div 2, SnowShoeLeft[2].y - Size div 2);
    SnowShoeLeft[3].Create(SnowShoeLeft[2].x + 4 * Size div 2, SnowShoeLeft[2].y + Size div 2);

    SnowShoeRight[1].Create(SnowShoeRight[2].x - 4 * Size div 2, SnowShoeRight[2].y - Size div 2);
    SnowShoeRight[3].Create(SnowShoeRight[2].x + 4 * Size div 2, SnowShoeRight[2].y + Size div 2);

    SnowStickLeft[2].Create(SnowStickLeft[1].x - 3 * Size div 2, SnowStickLeft[1].y + 6 * Size div 2);
    SnowStickRight[2].Create(SnowStickRight[1].x - Size div 2, SnowStickRight[1].y + 6 * Size div 2);
  end;
end;

procedure EquipmentOtherSideThirdFrame(var currEqupment: TEquipment);
begin
  with currEqupment do
  begin
    SnowShoeLeft[1].Create(SnowShoeLeft[2].x - 4 * Size div 2, SnowShoeLeft[2].y - Size div 2);
    SnowShoeLeft[3].Create(SnowShoeLeft[2].x + 4 * Size div 2, SnowShoeLeft[2].y + Size div 2);

    SnowShoeRight[1].Create(SnowShoeRight[2].x - 4 * Size div 2, SnowShoeRight[2].y - Size div 2);
    SnowShoeRight[3].Create(SnowShoeRight[2].x + 4 * Size div 2, SnowShoeRight[2].y + Size div 2);

    SnowStickLeft[2].Create(SnowStickLeft[1].x - 5 * Size div 2, SnowStickLeft[1].y + 3 * Size);
    SnowStickRight[2].Create(SnowStickRight[1].x - 2 * Size, SnowStickRight[1].y + 3 * Size);
  end;
end;

{*****************************************************************************************************}

procedure TMainForm.btnPedestalClick(Sender: TObject);
var
  lenUnit: integer;
begin
  with MainForm.Canvas do
  begin
    Pen.Width := 10;
    Pen.Mode := pmCopy;
    Brush.Color := clBtnFace;
    lenUnit := ClientWidth div 100;

    MainForm.Canvas.Rectangle(GlobalX, GlobalY, ClientWidth - GlobalX, ClientHeight - GlobalY);

    MainForm.Canvas.Rectangle(GlobalX + 10 * lenUnit, LengthY - GlobalY * 3, GlobalX + 30 * lenUnit,
      ClientHeight - GlobalY);
    MainForm.Canvas.Rectangle(GlobalX + 30 * lenUnit, LengthY - GlobalY * 5, GlobalX + 50 * lenUnit,
      ClientHeight - GlobalY);
    MainForm.Canvas.Rectangle(GlobalX + 50 * lenUnit, LengthY - GlobalY * 4 + 50, GlobalX + 70 * lenUnit,
      ClientHeight - GlobalY);

    MoveTo(GlobalX + lenUnit * 80, ClientHeight - GlobalY);
    LineTo(GlobalX + lenUnit * 80, ClientHeight - 6 * GlobalY);
    Brush.Color := clblue;
    Rectangle(GlobalX + lenUnit * 80, ClientHeight - 6 * GlobalY, GlobalX + lenUnit * 85,
      ClientHeight - 3 * GlobalY);
    Brush.Color := clBtnFace;
  end;

end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  CurrFrame := 0;

  FirstPerson := ConstructorPerson(StrToInt(Edit1.Text), StrToInt(Edit2.Text), StrToInt(Edit3.Text));
  PersonThirdFrame(FirstPerson);
  DrawPerson(FirstPerson);

  FirstEquip := ConstructorEquip(FirstPerson);
  EquipmentFirstFrame(FirstEquip);
  DrawEquipment(FirstEquip);

  Timer1.Enabled := True;
  Timer1.Interval := 100;

end;

procedure TMainForm.btnBackgroundTrackClick(Sender: TObject);
begin
  DrawFirstBackground();

  InitMovieBorders;

  DrawChristmasTree(400, 400, 1);
  DrawSnowMan(1100, 50);
  btnBackgroundTrack.Enabled := false; // Button is not clickable more after frist click
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FramesCount := 30;
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

end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  Canvas.Pen.Mode := pmNotXor;
  DrawPerson(FirstPerson);
  DrawEquipment(FirstEquip);

  with FirstPerson do
    FirstPerson := ConstructorPerson(Center.x + 5, Center.y + 1, Size + 1);

  if CurrFrame >= FramesCount - 1 then
    Timer1.Enabled := false
  else
  begin
    PersonAnimation[CurrFrame](FirstPerson);

    FirstEquip := ConstructorEquip(FirstPerson);
    EquipAnimation[CurrFrame](FirstEquip);

    DrawEquipment(FirstEquip);
    DrawPerson(FirstPerson);
    inc(CurrFrame);
  end;
end;

procedure TMainForm.ButtonClear(Sender: TObject);
begin
  Timer1.Enabled := false;
  Repaint;

<<<<<<< HEAD
=======
    InitMovieBorders;

    DrawChristmasTree(400, 400, 1);
    DrawSnowMan(1100, 50);
    btnBackgroundTrack.Enabled := false;
    // Button is not clickable more after frist click
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
>>>>>>> main
end;

end.
