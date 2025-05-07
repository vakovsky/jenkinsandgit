program TV_MenuWindow;

uses
  Drivers, Views, Menus, App, MsgBox;

type
  TMyApp = object(TApplication)
    procedure InitMenuBar; virtual;
    procedure HandleEvent(var Event: TEvent); virtual;
  end;

const
  cmOpenWindow = 1001;

procedure TMyApp.InitMenuBar;
var
  R: TRect;
begin
  GetExtent(R);
  R.B.Y := R.A.Y + 1;  // Височина 1 ред
  MenuBar := New(PMenuBar, Init(R,
    NewMenu(
      NewSubMenu('~F~ile', hcNoContext, NewMenu(
        NewItem('~O~pen Window', '', kbF3, cmOpenWindow, hcNoContext,
        NewItem('~Q~uit', 'Alt+X', kbAltX, cmQuit, hcNoContext, nil))
      ), nil)
    )
  ));
end;

procedure TMyApp.HandleEvent(var Event: TEvent);
var
  Win: PWindow;
  R: TRect;
begin
  inherited HandleEvent(Event);
  if Event.What = evCommand then
  begin
    case Event.Command of
      cmOpenWindow:
        begin
          R.Assign(10, 4, 50, 15);
          Win := New(PWindow, Init(R, 'Примерен прозорец', wnNoNumber));
          if Win <> nil then Desktop^.Insert(Win);
        end;
    else
      Exit;
    end;
    ClearEvent(Event);
  end;
end;

var
  MyApp: TMyApp;

begin
  MyApp.Init;
  MyApp.Run;
  MyApp.Done;
end.
