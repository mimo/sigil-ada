with Sigil;

procedure Demo is

begin
   SIGIL.Window (640, 400, "SIGIL Demo", False);
   SIGIL.SetBackColor(0.5, 0.05, 0.05);

   while not SIGIL.ShouldClose loop
      SIGIL.Render;
   end loop;

   SIGIL.Close;
end Demo;
