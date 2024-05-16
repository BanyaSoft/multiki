unit AudioRoutine;

interface

uses
  DataTypes, MainUnit;
procedure ClapSoundPlay();

implementation

uses
  MMSYSTEM;

procedure ClapSoundPlay();
begin
  MainForm.mpClap.Play;
end;

end.
