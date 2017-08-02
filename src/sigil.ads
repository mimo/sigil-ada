with sl_h;

package SIGIL is

   type Intensity is delta 0.1 range 0.0..1.0;
   type FontSize is range 6..72;
   FontSizes : constant array (Positive range <>) of FontSize :=
                     (6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
                     20, 22, 24, 26, 28, 32, 36, 40, 48, 56, 64, 72);

   procedure Window (Width, Height : Positive; Title : String; Fullscreen : Boolean);
   function ShouldClose return Boolean;

   procedure Line (x1, y1, x2, y2 : Integer);
   procedure RectangleFill(x, y : Integer; Width, Height : Integer);
   procedure SetForeColor (R, G, B, A : Intensity);
   procedure SetBackColor (R, G, B : Intensity);

   procedure SetFontSize (Size : FontSize);
   procedure Text(x, y : Float; Text : String);
   procedure Text(Text : String);

   procedure Render renames sl_h.slRender;
   procedure Close renames sl_h.slClose;

end SIGIL;
