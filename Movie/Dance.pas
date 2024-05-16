unit Dance;

interface

uses Vcl.Graphics;

procedure PictureDraw1(canva: TCanvas);
procedure PictureDraw2(canva: TCanvas);
procedure PictureDraw3(canva: TCanvas);
procedure PictureDraw4(canva: TCanvas);
procedure PictureDraw5(canva: TCanvas);
procedure PictureDraw6(canva: TCanvas);
procedure PictureDraw7(canva: TCanvas);
procedure PictureDraw8(canva: TCanvas);
procedure PictureDraw9(canva: TCanvas);
procedure PictureDraw10(canva: TCanvas);
procedure PictureDraw11(canva: TCanvas);
procedure PictureDraw12(canva: TCanvas);
procedure PictureDraw13(canva: TCanvas);
procedure PictureDraw14(canva: TCanvas);
procedure InitVars(xStart, yStart: integer; ks: real);
procedure FrameHandler(frame: integer; hz: real; flag: boolean; canva: TCanvas);

implementation

uses AudioRoutine;

var
  i, xc_start, yc_start: integer;
  k: real;
  sign: boolean = true;

procedure FrameHandler;
begin

  i := frame;
  k := hz;
  sign := flag;

  case i of
    1:
      PictureDraw1(canva);
    2:
      PictureDraw2(canva);

    3:

      PictureDraw3(canva);

    4:
      begin
        PictureDraw4(canva);
        ClapSoundPlay;
      end;

    5:

      PictureDraw5(canva);
    6:

      PictureDraw6(canva);

    7:

      PictureDraw7(canva);

    8:

      PictureDraw8(canva);

    9:

      PictureDraw9(canva);

    10:

      PictureDraw10(canva);

    11:
      begin
        PictureDraw11(canva);
        ClapSoundPlay;
      end;
    12:

      PictureDraw12(canva);

    13:

      PictureDraw13(canva);

    14:

      PictureDraw14(canva);

  end;

end;

procedure InitVars(xStart, yStart: integer; ks: real);
begin

  xc_start := xStart;
  yc_start := yStart;
  k := ks;
end;

procedure PictureDraw1(canva: TCanvas);
var
  xc, yc, xLb, yLb: integer;

begin

  canva.Pen.Width := round(3 * k);
  xc := xc_start;
  yc := yc_start;
  // head
  canva.Ellipse(xc - round(40 * k), yc - round(40 * k), xc + round(40 * k),
    yc + round(40 * k));

  // face
  canva.Ellipse(xc - round(17 * k), yc + round(6 * k), xc - round(20 * k),
    yc + round(3 * k));
  canva.Ellipse(xc + round(17 * k), yc - round(2 * k), xc + round(20 * k),
    yc - round(5 * k));
  canva.MoveTo(xc - round(20 * k), yc + round(18 * k));
  canva.LineTo(xc + round(25 * k), yc + round(5 * k));

  // body
  yc := yc + round(40 * k);
  canva.MoveTo(xc, yc);
  canva.LineTo(xc - round(20 * k), yc + round(160 * k));
  xLb := xc - round(20 * k);
  yLb := yc + round(160 * k);
  // left hip
  canva.LineTo(xLb - round(30 * k), yLb + round(80 * k));
  // left shin
  canva.LineTo(xLb - round(80 * k), yLb + round(180 * k));
  // left foot
  canva.LineTo(xLb - round(30 * k), yLb + round(200 * k));
  canva.MoveTo(xLb, yLb);
  // right hip
  canva.LineTo(xLb + round(90 * k), yLb + round(80 * k));
  // right shin
  canva.LineTo(xLb + round(80 * k), yLb + round(180 * k));
  // right foot
  canva.LineTo(xLb + round(110 * k), yLb + round(200 * k));
  canva.MoveTo(xc, yc);
  // left shoulder
  canva.LineTo(xc - round(70 * k), yc + round(110 * k));
  // left forearm
  canva.LineTo(xc + round(5 * k), yc + round(25 * k));
  // left wrist
  canva.LineTo(xc + round(5 * k), yc + round(5 * k));
  canva.MoveTo(xc, yc);
  // right shoulder
  canva.LineTo(xc + round(75 * k), yc - round(35 * k));
  // right forearm
  canva.LineTo(xc + round(100 * k), yc - round(20 * k));
  // right wrist
  canva.LineTo(xc + round(95 * k), yc);
end;

procedure PictureDraw2(canva: TCanvas);
var
  xc, yc, xLb, yLb: integer;

begin

  canva.Pen.Width := round(k * 3);
  xc := xc_start;
  yc := yc_start + round(10 * k);
  // head
  canva.Ellipse(xc - round(40 * k), yc - round(40 * k), xc + round(40 * k),
    yc + round(40 * k));
  // face
  canva.Ellipse(xc - round(k * 12), yc - round(k * 5), xc - round(k * 15),
    yc - round(k * 8));
  canva.Ellipse(xc + round(k * 20), yc - round(k * 15), xc + round(k * 23),
    yc - round(k * 18));
  canva.MoveTo(xc - round(k * 5), yc + round(k * 2));
  canva.LineTo(xc + round(k * 25), yc - round(k * 10));
  // body
  yc := yc + round(k * 40);
  canva.MoveTo(xc, yc);
  canva.LineTo(xc, yc + round(k * 160));
  xLb := xc;
  yLb := yc + round(k * 160);
  // left hip
  canva.LineTo(xLb - round(k * 30), yLb + round(k * 80));
  // left shin
  canva.LineTo(xLb - round(k * 140), yLb + round(k * 50));
  // left foot
  canva.LineTo(xLb - round(k * 150), yLb + round(k * 85));
  canva.MoveTo(xLb, yLb);
  // right hip
  canva.LineTo(xLb + round(k * 70), yLb + round(k * 80));
  // right shin
  canva.LineTo(xLb + round(k * 60), yLb + round(k * 180));
  // right foot
  canva.LineTo(xLb + round(k * 90), yLb + round(k * 200));
  canva.MoveTo(xc, yc);
  // left shoulder
  canva.LineTo(xc - round(k * 30), yc + round(k * 20));
  // left forearm
  canva.LineTo(xc - round(k * 10), yc + round(k * 115));
  // left wrist
  canva.LineTo(xc + round(k * 5), yc + round(k * 5));
  canva.MoveTo(xc, yc);
  // right shoulder
  canva.LineTo(xc + round(k * 75), yc + round(k * 45));
  // right forearm
  canva.LineTo(xc + round(k * 100), yc + round(k * 55));
  // right wrist
  canva.LineTo(xc + round(k * 95), yc);

end;

procedure PictureDraw3(canva: TCanvas);
var
  xc, yc, xLb, yLb: integer;

begin
  canva.Pen.Width := round(k * 3);
  xc := xc_start;
  yc := yc_start;
  // head
  canva.Ellipse(xc - round(k * 40), yc - round(k * 40), xc + round(k * 40),
    yc + round(k * 40));

  // face
  canva.Ellipse(xc - round(k * 12), yc + round(k * 6), xc - round(k * 15),
    yc + round(k * 3));
  canva.Ellipse(xc + round(k * 20), yc - round(k * 2), xc + round(k * 23),
    yc - round(k * 5));
  canva.MoveTo(xc - round(k * 20), yc + round(k * 18));
  canva.LineTo(xc + round(k * 5), yc + round(k * 15));
  canva.LineTo(xc + round(k * 25), yc + round(k * 5));

  // body
  yc := yc + round(k * 40);
  canva.MoveTo(xc, yc);
  canva.LineTo(xc + round(k * 20), yc + round(k * 145));
  xLb := xc + round(k * 20);
  yLb := yc + round(k * 145);
  // left hip
  canva.LineTo(xLb - round(k * 30), yLb + round(k * 80));
  // left shin
  canva.LineTo(xLb - round(k * 130), yLb + round(k * 10));
  // left foot
  canva.LineTo(xLb - round(k * 140), yLb + round(k * 45));
  canva.MoveTo(xLb, yLb);
  // right hip
  canva.LineTo(xLb + round(k * 70), yLb + round(k * 60));
  // right shin
  canva.LineTo(xLb + round(k * 45), yLb + round(k * 180));
  // right foot
  canva.LineTo(xLb + round(k * 90), yLb + round(k * 200));
  canva.MoveTo(xc, yc);
  // left shoulder
  canva.LineTo(xc + round(k * 30), yc + round(k * 20));
  // left forearm
  canva.LineTo(xc + round(k * 55), yc - round(k * 45));
  // left wrist
  canva.LineTo(xc + round(k * 50), yc - round(k * 65));
  canva.MoveTo(xc, yc);
  // right shoulder
  canva.LineTo(xc + round(k * 75), yc + round(k * 30));
  // right forearm
  canva.LineTo(xc + round(k * 90), yc - round(k * 50));
  // right wrist
  canva.LineTo(xc + round(k * 85), yc - round(k * 70));
end;

procedure PictureDraw4(canva: TCanvas);
var
  xc, yc, xLb, yLb: integer;

begin
  canva.Pen.Width := round(k * 3);
  xc := xc_start;
  yc := yc_start;
  // head
  canva.Ellipse(xc - round(k * 40), yc - round(k * 40), xc + round(k * 40),
    yc + round(k * 40));

  // face
  canva.Ellipse(xc - round(k * 18), yc - round(k * 6), xc - round(k * 15),
    yc - round(k * 3));
  canva.Ellipse(xc + round(k * 17), yc + round(k * 2), xc + round(k * 20),
    yc + round(k * 5));
  canva.MoveTo(xc - round(k * 20), yc + round(k * 8));
  canva.LineTo(xc + round(k * 20), yc + round(k * 18));

  // body
  yc := yc + round(k * 40);
  canva.MoveTo(xc, yc);
  canva.LineTo(xc + round(k * 30), yc + round(k * 140));
  xLb := xc + round(k * 30);
  yLb := yc + round(k * 140);
  // left hip
  canva.LineTo(xLb - round(k * 20), yLb + round(k * 80));
  // left shin
  canva.LineTo(xLb - round(k * 100), yLb + round(k * 150));
  // left foot
  canva.LineTo(xLb - round(k * 105), yLb + round(k * 185));
  canva.MoveTo(xLb, yLb);
  // right hip
  canva.LineTo(xLb + round(k * 70), yLb + round(k * 60));
  // right shin
  canva.LineTo(xLb + round(k * 45), yLb + round(k * 180));
  // right foot
  canva.LineTo(xLb + round(k * 90), yLb + round(k * 200));
  canva.MoveTo(xc, yc);
  // left shoulder
  canva.LineTo(xc + round(k * 30), yc + round(k * 70));
  // left forearm
  canva.LineTo(xc + round(k * 45), yc - round(k * 15));
  // left wrist
  canva.LineTo(xc + round(k * 45), yc - round(k * 45));
  canva.MoveTo(xc, yc);
  // right shoulder
  canva.LineTo(xc + round(k * 75), yc + round(k * 45));
  // right forearm
  canva.LineTo(xc + round(k * 47), yc - round(k * 15));
  // right wrist
  canva.LineTo(xc + round(k * 47), yc - round(k * 45));
  // clapEffect
  canva.MoveTo(xc + round(k * 60), yc - round(k * 55));
  canva.LineTo(xc + round(k * 75), yc - round(k * 80));
  canva.MoveTo(xc + round(k * 70), yc - round(k * 40));
  canva.LineTo(xc + round(k * 95), yc - round(k * 45));
  canva.MoveTo(xc + round(k * 60), yc - round(k * 25));
  canva.LineTo(xc + round(k * 85), yc - round(k * 5));
  canva.MoveTo(xc + round(k * 30), yc - round(k * 55));
  canva.LineTo(xc + round(k * 10), yc - round(k * 80));
  canva.MoveTo(xc + round(k * 30), yc - round(k * 40));
  canva.LineTo(xc + round(k * 10), yc - round(k * 45));
  canva.MoveTo(xc + round(k * 35), yc - round(k * 25));
  canva.LineTo(xc + round(k * 15), yc - round(k * 15));
end;

procedure PictureDraw5(canva: TCanvas);
var
  xc, yc, xLb, yLb: integer;

begin
  canva.Pen.Width := round(k * 3);
  xc := xc_start;
  yc := yc_start;
  // head
  canva.Ellipse(xc - round(k * 40), yc - round(k * 40), xc + round(k * 40),
    yc + round(k * 40));

  // face
  canva.Ellipse(xc - round(k * 14), yc - round(k * 3), xc - round(k * 11), yc);
  canva.Ellipse(xc + round(k * 20), yc - round(k * 3), xc + round(k * 23), yc);
  canva.MoveTo(xc - round(k * 16), yc + round(k * 10));
  canva.LineTo(xc + round(k * 26), yc + round(k * 13));

  // body
  yc := yc + round(k * 40);
  canva.MoveTo(xc, yc);
  canva.LineTo(xc + round(k * 20), yc + round(k * 145));
  xLb := xc + round(k * 20);
  yLb := yc + round(k * 145);
  // left hip
  canva.LineTo(xLb - round(k * 20), yLb + round(k * 80));
  // left shin
  canva.LineTo(xLb - round(k * 60), yLb + round(k * 195));
  // left foot
  canva.LineTo(xLb - round(k * 25), yLb + round(k * 200));
  canva.MoveTo(xLb, yLb);
  // right hip
  canva.LineTo(xLb + round(k * 70), yLb + round(k * 60));
  // right shin
  canva.LineTo(xLb + round(k * 45), yLb + round(k * 180));
  // right foot
  canva.LineTo(xLb + round(k * 90), yLb + round(k * 200));
  canva.MoveTo(xc, yc);
  // left shoulder
  canva.LineTo(xc - round(k * 25), yc + round(k * 90));
  // left forearm
  canva.LineTo(xc + round(k * 45), yc + round(k * 25));
  // left wrist
  canva.LineTo(xc + round(k * 50), yc + round(k * 50));
  canva.MoveTo(xc, yc);
  // right shoulder
  canva.LineTo(xc + round(k * 68), yc + round(k * 55));
  // right forearm
  canva.LineTo(xc + round(k * 43), yc - round(k * 15));
  // right wrist
  canva.LineTo(xc + round(k * 15), yc);
end;

procedure PictureDraw6(canva: TCanvas);
var
  xc, yc, xLb, yLb: integer;

begin
  canva.Pen.Width := round(k * 3);
  xc := xc_start;
  yc := yc_start;
  // head
  canva.Ellipse(xc - round(k * 40), yc - round(k * 40), xc + round(k * 40),
    yc + round(k * 40));

  // face
  canva.Ellipse(xc - round(k * 22), yc - round(k * 7), xc - round(k * 19),
    yc - round(k * 4));
  canva.Ellipse(xc + round(k * 13), yc - round(k * 3), xc + round(k * 15), yc);
  canva.MoveTo(xc - round(k * 27), yc + round(k * 10));
  canva.LineTo(xc + round(k * 2), yc + round(k * 13));
  canva.LineTo(xc + round(k * 22), yc + round(k * 12));

  // body
  yc := yc + round(k * 40);
  canva.MoveTo(xc, yc);
  canva.LineTo(xc, yc + round(k * 150));
  xLb := xc;
  yLb := yc + round(k * 150);
  // left hip
  canva.LineTo(xLb - round(k * 35), yLb + round(k * 90));
  // left shin
  canva.LineTo(xLb - round(k * 25), yLb + round(k * 160));
  // left foot
  canva.LineTo(xLb - round(k * 35), yLb + round(k * 175));
  canva.MoveTo(xLb, yLb);
  // right hip
  canva.LineTo(xLb + round(k * 65), yLb + round(k * 60));
  // right shin
  canva.LineTo(xLb + round(k * 45), yLb + round(k * 200));
  // right foot
  canva.LineTo(xLb + round(k * 80), yLb + round(k * 200));
  canva.MoveTo(xc, yc);
  // left shoulder
  canva.LineTo(xc - round(k * 65), yc + round(k * 80));
  // left forearm
  canva.LineTo(xc - round(k * 60), yc + round(k * 140));
  // left wrist
  canva.LineTo(xc - round(k * 45), yc + round(k * 150));
  canva.MoveTo(xc, yc);
  // right shoulder
  canva.LineTo(xc + round(k * 38), yc + round(k * 95));
  // right forearm
  canva.LineTo(xc - round(k * 20), yc + round(k * 45));
  // right wrist
  canva.LineTo(xc - round(k * 35), yc + round(k * 55));
end;

procedure PictureDraw7(canva: TCanvas);
var
  xc, yc, xLb, yLb: integer;

begin
  canva.Pen.Width := round(k * 3);
  xc := xc_start;
  yc := yc_start;
  // head
  canva.Ellipse(xc - round(k * 40), yc - round(k * 40), xc + round(k * 40),
    yc + round(k * 40));

  // face
  canva.Ellipse(xc - round(k * 25), yc - round(k * 1), xc - round(k * 22),
    yc - round(k * 4));
  canva.Ellipse(xc + round(k * 10), yc, xc + round(k * 13), yc + round(k * 3));
  canva.MoveTo(xc - round(k * 27), yc + round(k * 10));
  canva.LineTo(xc + round(k * 17), yc + round(k * 12));

  // body
  yc := yc + round(k * 40);
  canva.MoveTo(xc, yc);
  canva.LineTo(xc, yc + round(k * 150));
  xLb := xc;
  yLb := yc + round(k * 150);
  // left hip
  canva.LineTo(xLb - round(k * 35), yLb + round(k * 90));
  // left shin
  canva.LineTo(xLb - round(k * 25), yLb + round(k * 180));
  // left foot
  canva.LineTo(xLb - round(k * 35), yLb + round(k * 195));
  canva.MoveTo(xLb, yLb);
  // right hip
  canva.LineTo(xLb + round(k * 65), yLb + round(k * 60));
  // right shin
  canva.LineTo(xLb + round(k * 45), yLb + round(k * 200));
  // right foot
  canva.LineTo(xLb + round(k * 80), yLb + round(k * 200));
  canva.MoveTo(xc, yc);
  // left shoulder
  canva.LineTo(xc - round(k * 70), yc - round(k * 5));
  // left forearm
  canva.LineTo(xc - round(k * 120), yc + round(k * 40));
  // left wrist
  canva.LineTo(xc - round(k * 120), yc + round(k * 45));
  canva.MoveTo(xc, yc);
  // right shoulder
  canva.LineTo(xc + round(k * 30), yc + round(k * 55));
  // right forearm
  canva.LineTo(xc - round(k * 50), yc + round(k * 40));
  // right wrist
  canva.LineTo(xc - round(k * 65), yc + round(k * 45));
end;

procedure PictureDraw8(canva: TCanvas);
var
  xc, yc, xLb, yLb: integer;

begin
  canva.Pen.Width := round(k * 3);
  xc := xc_start;
  yc := yc_start - round(k * 10);
  // head
  canva.Ellipse(xc - round(k * 40), yc - round(k * 40), xc + round(k * 40),
    yc + round(k * 40));

  // face
  canva.Ellipse(xc - round(k * 17), yc + round(k * 6), xc - round(k * 20),
    yc + round(k * 3));
  canva.Ellipse(xc + round(k * 17), yc - round(k * 2), xc + round(k * 20),
    yc - round(k * 5));
  canva.MoveTo(xc - round(k * 20), yc + round(k * 18));
  canva.LineTo(xc + round(k * 25), yc + round(k * 5));

  // body
  yc := yc + round(k * 40);
  canva.MoveTo(xc, yc);
  canva.LineTo(xc + round(k * 20), yc + round(k * 160));
  xLb := xc + round(k * 20);
  yLb := yc + round(k * 160);
  // left hip
  canva.LineTo(xLb + round(k * 30), yLb + round(k * 80));
  // left shin
  canva.LineTo(xLb + round(k * 80), yLb + round(k * 180));
  // left foot
  canva.LineTo(xLb + round(k * 30), yLb + round(k * 200));
  canva.MoveTo(xLb, yLb);
  // right hip
  canva.LineTo(xLb - round(k * 90), yLb + round(k * 80));
  // right shin
  canva.LineTo(xLb - round(k * 80), yLb + round(k * 180));
  // right foot
  canva.LineTo(xLb - round(k * 110), yLb + round(k * 200));
  canva.MoveTo(xc, yc);
  // left shoulder
  canva.LineTo(xc + round(k * 70), yc + round(k * 110));
  // left forearm
  canva.LineTo(xc - round(k * 5), yc + round(k * 25));
  // left wrist
  canva.LineTo(xc - round(k * 5), yc + round(k * 5));
  canva.MoveTo(xc, yc);
  // right shoulder
  canva.LineTo(xc - round(k * 75), yc - round(k * 35));
  // right forearm
  canva.LineTo(xc - round(k * 100), yc - round(k * 20));
  // right wrist
  canva.LineTo(xc - round(k * 95), yc);
end;

procedure PictureDraw9(canva: TCanvas);
var
  xc, yc, xLb, yLb: integer;

begin
  canva.Pen.Width := round(k * 3);
  xc := xc_start;
  yc := yc_start + round(k * 10);
  // head
  canva.Ellipse(xc - round(k * 40), yc - round(k * 40), xc + round(k * 40),
    yc + round(k * 40));
  // face
  canva.Ellipse(xc + round(k * 12), yc - round(k * 5), xc + round(k * 15),
    yc - round(k * 8));
  canva.Ellipse(xc - round(k * 20), yc - round(k * 15), xc - round(k * 23),
    yc - round(k * 18));
  canva.MoveTo(xc + round(k * 5), yc + round(k * 2));
  canva.LineTo(xc - round(k * 25), yc - round(k * 10));
  // body
  yc := yc + round(k * 40);
  canva.MoveTo(xc, yc);
  canva.LineTo(xc, yc + round(k * 160));
  xLb := xc;
  yLb := yc + round(k * 160);
  // left hip
  canva.LineTo(xLb + round(k * 30), yLb + round(k * 80));
  // left shin
  canva.LineTo(xLb + round(k * 140), yLb + round(k * 50));
  // left foot
  canva.LineTo(xLb + round(k * 150), yLb + round(k * 85));
  canva.MoveTo(xLb, yLb);
  // right hip
  canva.LineTo(xLb - round(k * 70), yLb + round(k * 80));
  // right shin
  canva.LineTo(xLb - round(k * 60), yLb + round(k * 180));
  // right foot
  canva.LineTo(xLb - round(k * 90), yLb + round(k * 200));
  canva.MoveTo(xc, yc);
  // left shoulder
  canva.LineTo(xc + round(k * 30), yc + round(k * 20));
  // left forearm

  canva.LineTo(xc + round(k * 10), yc + round(k * 115));
  // left wrist
  canva.LineTo(xc - round(k * 5), yc + round(k * 5));
  canva.MoveTo(xc, yc);
  // right shoulder
  canva.LineTo(xc - round(k * 75), yc + round(k * 45));
  // right forearm
  canva.LineTo(xc - round(k * 100), yc + round(k * 55));
  // right wrist
  canva.LineTo(xc - round(k * 95), yc);
end;

procedure PictureDraw10(canva: TCanvas);
var
  xc, yc, xLb, yLb: integer;

begin
  canva.Pen.Width := round(k * 3);
  xc := xc_start;
  yc := yc_start;
  // head
  canva.Ellipse(xc - round(k * 40), yc - round(k * 40), xc + round(k * 40),
    yc + round(k * 40));

  // face
  canva.Ellipse(xc + round(k * 12), yc + round(k * 6), xc + round(k * 15),
    yc + round(k * 3));
  canva.Ellipse(xc - round(k * 20), yc - round(k * 2), xc - round(k * 23),
    yc - round(k * 5));
  canva.MoveTo(xc + round(k * 20), yc + round(k * 18));
  canva.LineTo(xc - round(k * 5), yc + round(k * 15));
  canva.LineTo(xc - round(k * 25), yc + round(k * 5));

  // body
  yc := yc + round(k * 40);
  canva.MoveTo(xc, yc);
  canva.LineTo(xc - round(k * 20), yc + round(k * 145));
  xLb := xc - round(k * 20);
  yLb := yc + round(k * 145);
  // left hip
  canva.LineTo(xLb + round(k * 30), yLb + round(k * 80));
  // left shin
  canva.LineTo(xLb + round(k * 130), yLb + round(k * 10));
  // left foot
  canva.LineTo(xLb + round(k * 140), yLb + round(k * 45));
  canva.MoveTo(xLb, yLb);
  // right hip
  canva.LineTo(xLb - round(k * 70), yLb + round(k * 60));
  // right shin
  canva.LineTo(xLb - round(k * 45), yLb + round(k * 180));
  // right foot
  canva.LineTo(xLb - round(k * 90), yLb + round(k * 200));
  canva.MoveTo(xc, yc);
  // left shoulder
  canva.LineTo(xc - round(k * 30), yc + round(k * 20));
  // left forearm
  canva.LineTo(xc - round(k * 55), yc - round(k * 45));
  // left wrist
  canva.LineTo(xc - round(k * 50), yc - round(k * 65));
  canva.MoveTo(xc, yc);
  // right shoulder
  canva.LineTo(xc - round(k * 75), yc + round(k * 30));
  // right forearm
  canva.LineTo(xc - round(k * 90), yc - round(k * 50));
  // right wrist
  canva.LineTo(xc - round(k * 85), yc - round(k * 70));
end;

procedure PictureDraw11(canva: TCanvas);
var
  xc, yc, xLb, yLb: integer;

begin
  canva.Pen.Width := round(k * 3);
  xc := xc_start;
  yc := yc_start;
  // head
  canva.Ellipse(xc - round(k * 40), yc - round(k * 40), xc + round(k * 40),
    yc + round(k * 40));

  // face
  canva.Ellipse(xc + round(k * 18), yc - round(k * 6), xc + round(k * 15),
    yc - round(k * 3));
  canva.Ellipse(xc - round(k * 17), yc + round(k * 2), xc - round(k * 20),
    yc + round(k * 5));
  canva.MoveTo(xc + round(k * 20), yc + round(k * 8));
  canva.LineTo(xc - round(k * 20), yc + round(k * 18));

  // body
  yc := yc + round(k * 40);
  canva.MoveTo(xc, yc);
  canva.LineTo(xc - round(k * 30), yc + round(k * 140));
  xLb := xc - round(k * 30);
  yLb := yc + round(k * 140);
  // left hip
  canva.LineTo(xLb + round(k * 20), yLb + round(k * 80));
  // left shin
  canva.LineTo(xLb + round(k * 100), yLb + round(k * 150));
  // left foot
  canva.LineTo(xLb + round(k * 105), yLb + round(k * 185));
  canva.MoveTo(xLb, yLb);
  // right hip
  canva.LineTo(xLb - round(k * 70), yLb + round(k * 60));
  // right shin
  canva.LineTo(xLb - round(k * 45), yLb + round(k * 180));
  // right foot
  canva.LineTo(xLb - round(k * 90), yLb + round(k * 200));
  canva.MoveTo(xc, yc);
  // left shoulder
  canva.LineTo(xc - round(k * 30), yc + round(k * 70));
  // left forearm
  canva.LineTo(xc - round(k * 45), yc - round(k * 15));
  // left wrist
  canva.LineTo(xc - round(k * 45), yc - round(k * 45));
  canva.MoveTo(xc, yc);
  // right shoulder
  canva.LineTo(xc - round(k * 75), yc + round(k * 45));
  // right forearm
  canva.LineTo(xc - round(k * 47), yc - round(k * 15));
  // right wrist
  canva.LineTo(xc - round(k * 47), yc - round(k * 45));
  // clapEffect
  canva.MoveTo(xc - round(k * 60), yc - round(k * 55));
  canva.LineTo(xc - round(k * 75), yc - round(k * 80));
  canva.MoveTo(xc - round(k * 70), yc - round(k * 40));
  canva.LineTo(xc - round(k * 95), yc - round(k * 45));
  canva.MoveTo(xc - round(k * 60), yc - round(k * 25));
  canva.LineTo(xc - round(k * 85), yc - round(k * 5));
  canva.MoveTo(xc - round(k * 30), yc - round(k * 55));
  canva.LineTo(xc - round(k * 10), yc - round(k * 80));
  canva.MoveTo(xc - round(k * 30), yc - round(k * 40));
  canva.LineTo(xc - round(k * 10), yc - round(k * 45));
  canva.MoveTo(xc - round(k * 35), yc - round(k * 25));
  canva.LineTo(xc - round(k * 15), yc - round(k * 15));
end;

procedure PictureDraw12(canva: TCanvas);
var
  xc, yc, xLb, yLb: integer;

begin
  canva.Pen.Width := round(k * 3);
  xc := xc_start;
  yc := yc_start;
  // head
  canva.Ellipse(xc - round(k * 40), yc - round(k * 40), xc + round(k * 40),
    yc + round(k * 40));

  // face
  canva.Ellipse(xc + round(k * 14), yc - round(k * 3), xc + round(k * 11), yc);
  canva.Ellipse(xc - round(k * 20), yc - round(k * 3), xc - round(k * 23), yc);
  canva.MoveTo(xc + round(k * 16), yc + round(k * 10));
  canva.LineTo(xc - round(k * 26), yc + round(k * 13));

  // body
  yc := yc + round(k * 40);
  canva.MoveTo(xc, yc);
  canva.LineTo(xc - round(k * 20), yc + round(k * 145));
  xLb := xc - round(k * 20);
  yLb := yc + round(k * 145);
  // left hip
  canva.LineTo(xLb + round(k * 20), yLb + round(k * 80));
  // left shin
  canva.LineTo(xLb + round(k * 60), yLb + round(k * 195));
  // left foot
  canva.LineTo(xLb + round(k * 25), yLb + round(k * 200));
  canva.MoveTo(xLb, yLb);
  // right hip
  canva.LineTo(xLb - round(k * 70), yLb + round(k * 60));
  // right shin
  canva.LineTo(xLb - round(k * 45), yLb + round(k * 180));
  // right foot
  canva.LineTo(xLb - round(k * 90), yLb + round(k * 200));
  canva.MoveTo(xc, yc);
  // left shoulder
  canva.LineTo(xc + round(k * 25), yc + round(k * 90));
  // left forearm
  canva.LineTo(xc - round(k * 45), yc + round(k * 25));
  // left wrist
  canva.LineTo(xc - round(k * 50), yc + round(k * 50));
  canva.MoveTo(xc, yc);
  // right shoulder
  canva.LineTo(xc - round(k * 68), yc + round(k * 55));
  // right forearm
  canva.LineTo(xc - round(k * 43), yc - round(k * 15));
  // right wrist
  canva.LineTo(xc - round(k * 15), yc);
end;

procedure PictureDraw13(canva: TCanvas);
var
  xc, yc, xLb, yLb: integer;

begin
  canva.Pen.Width := round(k * 3);
  xc := xc_start;
  yc := yc_start;
  // head
  canva.Ellipse(xc - round(k * 40), yc - round(k * 40), xc + round(k * 40),
    yc + round(k * 40));

  // face
  canva.Ellipse(xc + round(k * 22), yc - round(k * 7), xc + round(k * 19),
    yc - round(k * 4));
  canva.Ellipse(xc - round(k * 13), yc - round(k * 3), xc - round(k * 15), yc);
  canva.MoveTo(xc + round(k * 27), yc + round(k * 10));
  canva.LineTo(xc - round(k * 2), yc + round(k * 13));
  canva.LineTo(xc - round(k * 22), yc + round(k * 12));

  // body
  yc := yc + round(k * 40);
  canva.MoveTo(xc, yc);
  canva.LineTo(xc, yc + round(k * 150));
  xLb := xc;
  yLb := yc + round(k * 150);
  // left hip
  canva.LineTo(xLb + round(k * 35), yLb + round(k * 90));
  // left shin
  canva.LineTo(xLb + round(k * 25), yLb + round(k * 160));
  // left foot
  canva.LineTo(xLb + round(k * 35), yLb + round(k * 175));
  canva.MoveTo(xLb, yLb);
  // right hip
  canva.LineTo(xLb - round(k * 65), yLb + round(k * 60));
  // right shin
  canva.LineTo(xLb - round(k * 45), yLb + round(k * 200));
  // right foot
  canva.LineTo(xLb - round(k * 80), yLb + round(k * 200));
  canva.MoveTo(xc, yc);
  // left shoulder
  canva.LineTo(xc + round(k * 65), yc + round(k * 80));
  // left forearm
  canva.LineTo(xc + round(k * 60), yc + round(k * 140));
  // left wrist
  canva.LineTo(xc + round(k * 45), yc + round(k * 150));
  canva.MoveTo(xc, yc);
  // right shoulder
  canva.LineTo(xc - round(k * 38), yc + round(k * 95));
  // right forearm
  canva.LineTo(xc + round(k * 20), yc + round(k * 45));
  // right wrist
  canva.LineTo(xc + round(k * 35), yc + round(k * 55));
end;

procedure PictureDraw14(canva: TCanvas);
var
  xc, yc, xLb, yLb: integer;

begin
  canva.Pen.Width := round(k * 3);
  xc := xc_start;
  yc := yc_start;
  // head
  canva.Ellipse(xc - round(k * 40), yc - round(k * 40), xc + round(k * 40),
    yc + round(k * 40));

  // face
  canva.Ellipse(xc + round(k * 25), yc - round(k * 1), xc + round(k * 22),
    yc - round(k * 4));
  canva.Ellipse(xc - round(k * 10), yc, xc - round(k * 13), yc + round(k * 3));
  canva.MoveTo(xc + round(k * 27), yc + round(k * 10));
  canva.LineTo(xc - round(k * 17), yc + round(k * 12));

  // body
  yc := yc + round(k * 40);
  canva.MoveTo(xc, yc);
  canva.LineTo(xc, yc + round(k * 150));
  xLb := xc;
  yLb := yc + round(k * 150);
  // left hip
  canva.LineTo(xLb + round(k * 35), yLb + round(k * 90));
  // left shin
  canva.LineTo(xLb + round(k * 25), yLb + round(k * 180));
  // left foot
  canva.LineTo(xLb + round(k * 35), yLb + round(k * 195));
  canva.MoveTo(xLb, yLb);
  // right hip
  canva.LineTo(xLb - round(k * 65), yLb + round(k * 60));
  // right shin
  canva.LineTo(xLb - round(k * 45), yLb + round(k * 200));
  // right foot
  canva.LineTo(xLb - round(k * 80), yLb + round(k * 200));
  canva.MoveTo(xc, yc);
  // left shoulder
  canva.LineTo(xc + round(k * 70), yc - round(k * 5));
  // left forearm
  canva.LineTo(xc + round(k * 120), yc + round(k * 40));
  // left wrist
  canva.LineTo(xc + round(k * 120), yc + round(k * 45));
  canva.MoveTo(xc, yc);
  // right shoulder
  canva.LineTo(xc - round(k * 30), yc + round(k * 55));
  // right forearm
  canva.LineTo(xc + round(k * 50), yc + round(k * 40));
  // right wrist
  canva.LineTo(xc + round(k * 65), yc + round(k * 45));
end;

end.
