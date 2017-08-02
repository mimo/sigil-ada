pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

--Sound, Input, and Graphics Integration Library (SIGIL) 0.9.0
--Geoff Nagy
--

package sl_h is

   -- text alignment symbolic constants
   type Text_Alignement is (SL_ALIGN_CENTER, SL_ALIGN_RIGHT, SL_ALIGN_LEFT);
   for Text_Alignement use (SL_ALIGN_CENTER => 0,
                            SL_ALIGN_RIGHT  => 1,
                            SL_ALIGN_LEFT   => 2);
   for Text_Alignement'Size use Interfaces.C.int'Size;

   -- input key symbolic constants
   --  unsupported macro: SL_KEY_ESCAPE 256
   --  unsupported macro: SL_KEY_ENTER 257
   --  unsupported macro: SL_KEY_TAB 258
   --  unsupported macro: SL_KEY_BACKSPACE 259
   --  unsupported macro: SL_KEY_INSERT 260
   --  unsupported macro: SL_KEY_DELETE 261
   --  unsupported macro: SL_KEY_RIGHT 262
   --  unsupported macro: SL_KEY_LEFT 263
   --  unsupported macro: SL_KEY_DOWN 264
   --  unsupported macro: SL_KEY_UP 265
   --  unsupported macro: SL_KEY_PAGE_UP 266
   --  unsupported macro: SL_KEY_PAGE_DOWN 267
   --  unsupported macro: SL_KEY_HOME 268
   --  unsupported macro: SL_KEY_END 269
   --  unsupported macro: SL_KEY_CAPS_LOCK 280
   --  unsupported macro: SL_KEY_SCROLL_LOCK 281
   --  unsupported macro: SL_KEY_NUM_LOCK 282
   --  unsupported macro: SL_KEY_PRINT_SCREEN 283
   --  unsupported macro: SL_KEY_PAUSE 284
   --  unsupported macro: SL_KEY_F1 290
   --  unsupported macro: SL_KEY_F2 291
   --  unsupported macro: SL_KEY_F3 292
   --  unsupported macro: SL_KEY_F4 293
   --  unsupported macro: SL_KEY_F5 294
   --  unsupported macro: SL_KEY_F6 295
   --  unsupported macro: SL_KEY_F7 296
   --  unsupported macro: SL_KEY_F8 297
   --  unsupported macro: SL_KEY_F9 298
   --  unsupported macro: SL_KEY_F10 299
   --  unsupported macro: SL_KEY_F11 300
   --  unsupported macro: SL_KEY_F12 301
   --  unsupported macro: SL_KEY_F13 302
   --  unsupported macro: SL_KEY_F14 303
   --  unsupported macro: SL_KEY_F15 304
   --  unsupported macro: SL_KEY_F16 305
   --  unsupported macro: SL_KEY_F17 306
   --  unsupported macro: SL_KEY_F18 307
   --  unsupported macro: SL_KEY_F19 308
   --  unsupported macro: SL_KEY_F20 309
   --  unsupported macro: SL_KEY_F21 310
   --  unsupported macro: SL_KEY_F22 311
   --  unsupported macro: SL_KEY_F23 312
   --  unsupported macro: SL_KEY_F24 313
   --  unsupported macro: SL_KEY_F25 314
   --  unsupported macro: SL_KEY_KEYPAD_0 320
   --  unsupported macro: SL_KEY_KEYPAD_1 321
   --  unsupported macro: SL_KEY_KEYPAD_2 322
   --  unsupported macro: SL_KEY_KEYPAD_3 323
   --  unsupported macro: SL_KEY_KEYPAD_4 324
   --  unsupported macro: SL_KEY_KEYPAD_5 325
   --  unsupported macro: SL_KEY_KEYPAD_6 326
   --  unsupported macro: SL_KEY_KEYPAD_7 327
   --  unsupported macro: SL_KEY_KEYPAD_8 328
   --  unsupported macro: SL_KEY_KEYPAD_9 329
   --  unsupported macro: SL_KEY_KEYPAD_DECIMAL 330
   --  unsupported macro: SL_KEY_KEYPAD_DIVIDE 331
   --  unsupported macro: SL_KEY_KEYPAD_MULTIPLY 332
   --  unsupported macro: SL_KEY_KEYPAD_SUBTRACT 333
   --  unsupported macro: SL_KEY_KEYPAD_ADD 334
   --  unsupported macro: SL_KEY_KEYPAD_ENTER 335
   --  unsupported macro: SL_KEY_KEYPAD_EQUAL 336
   --  unsupported macro: SL_KEY_LEFT_SHIFT 340
   --  unsupported macro: SL_KEY_LEFT_CONTROL 341
   --  unsupported macro: SL_KEY_LEFT_ALT 342
   --  unsupported macro: SL_KEY_LEFT_SUPER 343
   --  unsupported macro: SL_KEY_RIGHT_SHIFT 344
   --  unsupported macro: SL_KEY_RIGHT_CONTROL 345
   --  unsupported macro: SL_KEY_RIGHT_ALT 346
   --  unsupported macro: SL_KEY_RIGHT_SUPER 347
 
   -- mouse input symbolic constants
   type Mouse_Buttons is (SL_MOUSE_BUTTON_1, SL_MOUSE_BUTTON_2, SL_MOUSE_BUTTON_3,
                          SL_MOUSE_BUTTON_4, SL_MOUSE_BUTTON_5, SL_MOUSE_BUTTON_6,
                          SL_MOUSE_BUTTON_7, SL_MOUSE_BUTTON_8);

   for Mouse_Buttons use (SL_MOUSE_BUTTON_1 => 0,
                          SL_MOUSE_BUTTON_2 => 1,
                          SL_MOUSE_BUTTON_3 => 2,
                          SL_MOUSE_BUTTON_4 => 3,
                          SL_MOUSE_BUTTON_5 => 4,
                          SL_MOUSE_BUTTON_6 => 5,
                          SL_MOUSE_BUTTON_7 => 6,
                          SL_MOUSE_BUTTON_8 => 7);
   for Mouse_Buttons'Size use Interfaces.C.int'Size;

   SL_MOUSE_BUTTON_LEFT : constant := Mouse_Buttons'Pos (SL_MOUSE_BUTTON_1);
   SL_MOUSE_BUTTON_RIGHT : constant := Mouse_Buttons'Pos (SL_MOUSE_BUTTON_2);
   SL_MOUSE_BUTTON_MIDDLE : constant := Mouse_Buttons'Pos (SL_MOUSE_BUTTON_3);

  -- initialization commands
   procedure slWindow
     (width : int;
      height : int;
      title : Interfaces.C.Strings.chars_ptr;
      fullScreen : int);  -- /usr/local/include/sl.h:109
   pragma Import (C, slWindow, "slWindow");

   procedure slShowCursor (showCursor : int);  -- /usr/local/include/sl.h:110
   pragma Import (C, slShowCursor, "slShowCursor");

   procedure slClose;  -- /usr/local/include/sl.h:111
   pragma Import (C, slClose, "slClose");

   function slShouldClose return int;  -- /usr/local/include/sl.h:112
   pragma Import (C, slShouldClose, "slShouldClose");

  -- simple input
   function slGetKey (key : int) return int;  -- /usr/local/include/sl.h:116
   pragma Import (C, slGetKey, "slGetKey");

   function slGetMouseButton (button : int) return int;  -- /usr/local/include/sl.h:118
   pragma Import (C, slGetMouseButton, "slGetMouseButton");

   function slGetMouseX return int;  -- /usr/local/include/sl.h:119
   pragma Import (C, slGetMouseX, "slGetMouseX");

   function slGetMouseY return int;  -- /usr/local/include/sl.h:120
   pragma Import (C, slGetMouseY, "slGetMouseY");

  -- simple frame timing
   function slGetDeltaTime return double;  -- /usr/local/include/sl.h:124
   pragma Import (C, slGetDeltaTime, "slGetDeltaTime");

   function slGetTime return double;  -- /usr/local/include/sl.h:125
   pragma Import (C, slGetTime, "slGetTime");

  -- rendering commands
   procedure slRender;  -- /usr/local/include/sl.h:129
   pragma Import (C, slRender, "slRender");

  -- color control
   procedure slSetBackColor
     (red : double;
      green : double;
      blue : double);  -- /usr/local/include/sl.h:133
   pragma Import (C, slSetBackColor, "slSetBackColor");

   procedure slSetForeColor
     (red : double;
      green : double;
      blue : double;
      alpha : double);  -- /usr/local/include/sl.h:134
   pragma Import (C, slSetForeColor, "slSetForeColor");

  -- blending control
   procedure slSetAdditiveBlend (additiveBlend : int);  -- /usr/local/include/sl.h:138
   pragma Import (C, slSetAdditiveBlend, "slSetAdditiveBlend");

  -- transformations
   procedure slPush;  -- /usr/local/include/sl.h:142
   pragma Import (C, slPush, "slPush");

   procedure slPop;  -- /usr/local/include/sl.h:143
   pragma Import (C, slPop, "slPop");

   procedure slTranslate (x : double; y : double);  -- /usr/local/include/sl.h:145
   pragma Import (C, slTranslate, "slTranslate");

   procedure slRotate (degrees : double);  -- /usr/local/include/sl.h:146
   pragma Import (C, slRotate, "slRotate");

   procedure slScale (x : double; y : double);  -- /usr/local/include/sl.h:147
   pragma Import (C, slScale, "slScale");

  -- texture loading
   function slLoadTexture (filename : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/local/include/sl.h:151
   pragma Import (C, slLoadTexture, "slLoadTexture");

  -- sound loading and playing
   function slLoadWAV (filename : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/local/include/sl.h:155
   pragma Import (C, slLoadWAV, "slLoadWAV");

   function slSoundPlay (sound : int) return int;  -- /usr/local/include/sl.h:156
   pragma Import (C, slSoundPlay, "slSoundPlay");

   function slSoundLoop (sound : int) return int;  -- /usr/local/include/sl.h:157
   pragma Import (C, slSoundLoop, "slSoundLoop");

   procedure slSoundPause (sound : int);  -- /usr/local/include/sl.h:158
   pragma Import (C, slSoundPause, "slSoundPause");

   procedure slSoundStop (sound : int);  -- /usr/local/include/sl.h:159
   pragma Import (C, slSoundStop, "slSoundStop");

   procedure slSoundPauseAll;  -- /usr/local/include/sl.h:160
   pragma Import (C, slSoundPauseAll, "slSoundPauseAll");

   procedure slSoundResumeAll;  -- /usr/local/include/sl.h:161
   pragma Import (C, slSoundResumeAll, "slSoundResumeAll");

   procedure slSoundStopAll;  -- /usr/local/include/sl.h:162
   pragma Import (C, slSoundStopAll, "slSoundStopAll");

   function slSoundPlaying (sound : int) return int;  -- /usr/local/include/sl.h:163
   pragma Import (C, slSoundPlaying, "slSoundPlaying");

   function slSoundLooping (sound : int) return int;  -- /usr/local/include/sl.h:164
   pragma Import (C, slSoundLooping, "slSoundLooping");

  -- simple shape commands
   procedure slTriangleFill
     (x : double;
      y : double;
      width : double;
      height : double);  -- /usr/local/include/sl.h:168
   pragma Import (C, slTriangleFill, "slTriangleFill");

   procedure slTriangleOutline
     (x : double;
      y : double;
      width : double;
      height : double);  -- /usr/local/include/sl.h:169
   pragma Import (C, slTriangleOutline, "slTriangleOutline");

   procedure slRectangleFill
     (x : double;
      y : double;
      width : double;
      height : double);  -- /usr/local/include/sl.h:171
   pragma Import (C, slRectangleFill, "slRectangleFill");

   procedure slRectangleOutline
     (x : double;
      y : double;
      width : double;
      height : double);  -- /usr/local/include/sl.h:172
   pragma Import (C, slRectangleOutline, "slRectangleOutline");

   procedure slCircleFill
     (x : double;
      y : double;
      radius : double;
      numVertices : int);  -- /usr/local/include/sl.h:174
   pragma Import (C, slCircleFill, "slCircleFill");

   procedure slCircleOutline
     (x : double;
      y : double;
      radius : double;
      numVertices : int);  -- /usr/local/include/sl.h:175
   pragma Import (C, slCircleOutline, "slCircleOutline");

   procedure slSemiCircleFill
     (x : double;
      y : double;
      radius : double;
      numVertices : int;
      degrees : double);  -- /usr/local/include/sl.h:177
   pragma Import (C, slSemiCircleFill, "slSemiCircleFill");

   procedure slSemiCircleOutline
     (x : double;
      y : double;
      radius : double;
      numVertices : int;
      degrees : double);  -- /usr/local/include/sl.h:178
   pragma Import (C, slSemiCircleOutline, "slSemiCircleOutline");

   procedure slPoint (x : double; y : double);  -- /usr/local/include/sl.h:180
   pragma Import (C, slPoint, "slPoint");

   procedure slLine
     (x1 : double;
      y1 : double;
      x2 : double;
      y2 : double);  -- /usr/local/include/sl.h:182
   pragma Import (C, slLine, "slLine");

   procedure slSetSpriteTiling (x : double; y : double);  -- /usr/local/include/sl.h:184
   pragma Import (C, slSetSpriteTiling, "slSetSpriteTiling");

   procedure slSetSpriteScroll (x : double; y : double);  -- /usr/local/include/sl.h:185
   pragma Import (C, slSetSpriteScroll, "slSetSpriteScroll");

   procedure slSprite
     (texture : int;
      x : double;
      y : double;
      width : double;
      height : double);  -- /usr/local/include/sl.h:186
   pragma Import (C, slSprite, "slSprite");

  -- text commands
   procedure slSetTextAlign (fontAlign : int);  -- /usr/local/include/sl.h:190
   pragma Import (C, slSetTextAlign, "slSetTextAlign");

   function slGetTextWidth (text : Interfaces.C.Strings.chars_ptr) return double;  -- /usr/local/include/sl.h:191
   pragma Import (C, slGetTextWidth, "slGetTextWidth");

   function slGetTextHeight (text : Interfaces.C.Strings.chars_ptr) return double;  -- /usr/local/include/sl.h:192
   pragma Import (C, slGetTextHeight, "slGetTextHeight");

   function slLoadFont (fontFilename : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/local/include/sl.h:193
   pragma Import (C, slLoadFont, "slLoadFont");

   procedure slSetFont (font : int; fontSize : int);  -- /usr/local/include/sl.h:194
   pragma Import (C, slSetFont, "slSetFont");

   procedure slSetFontSize (fontSize : int);  -- /usr/local/include/sl.h:195
   pragma Import (C, slSetFontSize, "slSetFontSize");

   procedure slText
     (x : double;
      y : double;
      text : Interfaces.C.Strings.chars_ptr);  -- /usr/local/include/sl.h:196
   pragma Import (C, slText, "slText");

  -- closing brace for extern "C"
end sl_h;
