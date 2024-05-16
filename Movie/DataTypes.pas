unit DataTypes;

interface

uses
  System.Types;

const
  GlobalX = 100;
  GlobalY = 100;
  LengthX = 1920;
  LengthY = 1080;

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


    ComponentsOfLeg = (ending, knee, ankle, toe);
  ComponentsOfArm = (shoulder, elbow, palm);
  AnglesArm = (angleElbow, anglePalm);
  AnglesLeg = (angleKnee, angleAnkle, angleToe);
  ComponentsOfBody = (pach, shoulderBod, adamsApple);


  TPointsLeg = array [ComponentsOfLeg] of TPoint;
  TPointsArm = array [ComponentsOfArm] of TPoint;
  TPointsBody = array [ComponentsOfBody] of TPoint;
  TAnglesArm = array [AnglesArm] of double;
  TAnglesLeg = array [AnglesLeg] of double;

  TVectorPerson = record
    height: integer;
    armleft, armRight: TPointsArm;
    legLeft, legRight: TPointsLeg;
    Body: TPointsBody;
    head: TRect;
  end;

     TPonPon = TPoint;

implementation

end.
