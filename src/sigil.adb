with Interfaces.C.Strings;

package body SIGIL is

   package IC renames Interfaces.C;

   procedure Window (Width, Height : Positive; Title : String; Fullscreen : Boolean) is
      use Interfaces.C.Strings;
      cTitle : chars_ptr := New_String(Title);
   begin
      sl_h.slWindow (width      => Interfaces.C.Int (width),
                     height     => Interfaces.C.Int (height),
                     title      => cTitle,
                     fullScreen => Boolean'Pos (Fullscreen));
   end Window;

   function ShouldClose return Boolean is
      use type IC.int;
      close : constant IC.int := sl_h.slShouldClose;
   begin
      if close = 0 then return False;
      else return True;
      end if;
   end ShouldClose;

   procedure Line (x1, y1, x2, y2 : Integer) is
   begin
      sl_h.slLine (Interfaces.C.Double(x1), Interfaces.C.Double(y1), Interfaces.C.Double(x2), Interfaces.C.Double(y2));
   end Line;

   procedure RectangleFill(x, y : Integer; Width, Height : Integer) is
      use type Interfaces.C.double;
   begin
      sl_h.slRectangleFill (IC.double(x) + IC.double(width/2),
                            IC.double(y) + IC.double(height/2),
                            IC.double(width),IC.double(height));
   end RectangleFill;

   procedure SetFontSize (Size : FontSize) is
   begin
      sl_h.slSetFontSize (IC.Int (Size));
   end SetFontSize;

   procedure Text(x, y : Float; Text : String) is
   begin
      sl_h.slText(IC.double(x), IC.Double(y), IC.Strings.New_String(Text));
   end Text;

   procedure Text(Text : String) is
   begin
      SIGIL.Text (0.0, 0.0, Text);
   end Text;

   procedure SetBackColor (R, G, B : Intensity) is
   begin
      sl_h.slSetBackColor (IC.double(R), IC.double(G), IC.double(B));
   end SetBackColor;

   procedure SetForeColor (R, G, B, A : Intensity) is
   begin
      sl_h.slSetForeColor (IC.double(R), IC.double(G), IC.double(B), IC.double(A));
   end SetForeColor;

end SIGIL;
