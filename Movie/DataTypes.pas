unit DataTypes;

interface

uses
  System.Types;

const
  GlobalX = 100;
  GlobalY = 100;
  LengthX = 2000;
  LengthY = 1100;

type
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
    Size: integer;
    SnowShoeLeft, SnowShoeRight: TThreePoints;
    SnowStickLeft, SnowStickRight: TTwoPoints;
  end;

  TPersonFrame  = procedure(var currPerson: TPerson);
  TPersonFrames = array of TPersonFrame;
  TEquipFrame   = procedure(var currEqupment: TEquipment);
  TEquipFrames  = array of TEquipFrame;

implementation

end.
