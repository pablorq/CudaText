// SPDX-License-Identifier: LGPL-3.0-linking-exception
unit BGRAGraphics;
{=== Types imported from Graphics ===}
{$mode objfpc}{$H+}
{$I bgrabitmap.inc}

interface

{$IFDEF BGRABITMAP_USE_LCL}
uses Graphics, GraphType, FPImage, FPCanvas;

type
  PColor = Graphics.PColor;
  TColor = Graphics.TColor;
  TAntialiasingMode = Graphics.TAntialiasingMode;
  TGradientDirection = Graphics.TGradientDirection;
  TPenEndCap = Graphics.TPenEndCap;
  TPenJoinStyle = Graphics.TPenJoinStyle;
  TPenStyle = Graphics.TPenStyle;
  TPenMode = Graphics.TPenMode;

const
  amDontCare = Graphics.amDontCare;
  amOn = Graphics.amOn;
  amOff = Graphics.amOff;

  gdVertical = Graphics.gdVertical;
  gdHorizontal = Graphics.gdHorizontal;

  pecRound = Graphics.pecRound;
  pecSquare = Graphics.pecSquare;
  pecFlat = Graphics.pecFlat;

  pjsRound = Graphics.pjsRound;
  pjsBevel = Graphics.pjsBevel;
  pjsMiter = Graphics.pjsMiter;

  psSolid = Graphics.psSolid;
  psDash = Graphics.psDash;
  psDot = Graphics.psDot;
  psDashDot = Graphics.psDashDot;
  psDashDotDot = Graphics.psDashDotDot;
  psClear = Graphics.psClear;
  psInsideframe = Graphics.psInsideframe;
  psPattern = Graphics.psPattern;

  pmBlack = Graphics.pmBlack;
  pmWhite = Graphics.pmWhite;
  pmNop = Graphics.pmNop;
  pmNot = Graphics.pmNot;
  pmCopy = Graphics.pmCopy;
  pmNotCopy = Graphics.pmNotCopy;
  pmMergePenNot = Graphics.pmMergePenNot;
  pmMaskPenNot = Graphics.pmMaskPenNot;
  pmMergeNotPen = Graphics.pmMergeNotPen;
  pmMaskNotPen = Graphics.pmMaskNotPen;
  pmMerge = Graphics.pmMerge;
  pmNotMerge = Graphics.pmNotMerge;
  pmMask = Graphics.pmMask;
  pmNotMask = Graphics.pmNotMask;
  pmXor = Graphics.pmXor;
  pmNotXor = Graphics.pmNotXor;

  tmAuto = Graphics.tmAuto;
  tmFixed = Graphics.tmFixed;

type
  TPen = Graphics.TPen;
  TTextLayout = Graphics.TTextLayout;
  TTextStyle = Graphics.TTextStyle;

  TFillStyle = Graphics.TFillStyle;
  TFillMode = Graphics.TFillMode;
  TBrushStyle = Graphics.TBrushStyle;

const
  tlTop = Graphics.tlTop;
  tlCenter = Graphics.tlCenter;
  tlBottom = Graphics.tlBottom;

  fsSurface = GraphType.fsSurface;
  fsBorder = GraphType.fsBorder;

  fmAlternate = Graphics.fmAlternate;
  fmWinding = Graphics.fmWinding;

  bsSolid = Graphics.bsSolid;
  bsClear = Graphics.bsClear;
  bsHorizontal = Graphics.bsHorizontal;
  bsVertical = Graphics.bsVertical;
  bsFDiagonal = Graphics.bsFDiagonal;
  bsBDiagonal = Graphics.bsBDiagonal;
  bsCross = Graphics.bsCross;
  bsDiagCross = Graphics.bsDiagCross;
  bsImage = FPCanvas.bsImage;

type
  TBrush = Graphics.TBrush;
  TCanvas = Graphics.TCanvas;
  TGraphic = Graphics.TGraphic;
  TRawImage = GraphType.TRawImage;
  TBitmap = Graphics.TBitmap;

  TRasterImage = Graphics.TRasterImage;

  TFontStyle = Graphics.TFontStyle;
  TFontStyles = Graphics.TFontStyles;
  TFontQuality = Graphics.TFontQuality;

type
  TFont = Graphics.TFont;

const
  fsBold = Graphics.fsBold;
  fsItalic = Graphics.fsItalic;
  fsStrikeOut = Graphics.fsStrikeOut;
  fsUnderline = Graphics.fsUnderline;

  fqDefault = Graphics.fqDefault;
  fqDraft = Graphics.fqDraft;
  fqProof = Graphics.fqProof;
  fqNonAntialiased = Graphics.fqNonAntialiased;
  fqAntialiased = Graphics.fqAntialiased;
  fqCleartype = Graphics.fqCleartype;
  fqCleartypeNatural = Graphics.fqCleartypeNatural;

  clNone = Graphics.clNone;

  clBlack   = Graphics.clBlack;
  clMaroon  = Graphics.clMaroon;
  clGreen   = Graphics.clGreen;
  clOlive   = Graphics.clOlive;
  clNavy    = Graphics.clNavy;
  clPurple  = Graphics.clPurple;
  clTeal    = Graphics.clTeal;
  clGray    = Graphics.clGray;
  clSilver  = Graphics.clSilver;
  clRed     = Graphics.clRed;
  clLime    = Graphics.clLime;
  clYellow  = Graphics.clYellow;
  clBlue    = Graphics.clBlue;
  clFuchsia = Graphics.clFuchsia;
  clAqua    = Graphics.clAqua;
  clLtGray  = Graphics.clLtGray; // clSilver alias
  clDkGray  = Graphics.clDkGray; // clGray alias
  clWhite   = Graphics.clWhite;

function FPColorToTColor(const FPColor: TFPColor): TColor; inline;
function TColorToFPColor(const c: TColor): TFPColor; inline;
function ColorToRGB(c: TColor): TColor; inline;
function RGBToColor(R, G, B: Byte): TColor; inline;
procedure RedGreenBlue(rgb: TColor; out Red, Green, Blue: Byte); inline;// does not work on system color
function clRgbBtnHighlight: TColor;
function clRgbBtnShadow: TColor;

implementation

function FPColorToTColor(const FPColor: TFPColor): TColor;
begin
  result := Graphics.FPColorToTColor(FPColor);
end;

function TColorToFPColor(const c: TColor): TFPColor;
begin
  result := Graphics.TColorToFPColor(c);
end;

function ColorToRGB(c: TColor): TColor;
begin
  result := Graphics.ColorToRGB(c);
end;

function RGBToColor(R, G, B: Byte): TColor;
begin
  result := Graphics.RGBToColor(R, G, B);
end;

procedure RedGreenBlue(rgb: TColor; out Red, Green, Blue: Byte);
begin
  Graphics.RedGreenBlue(rgb, Red, Green, Blue);
end;

function clRgbBtnHighlight: TColor;
begin
  result := Graphics.ColorToRGB(clBtnHighlight);
end;

function clRgbBtnShadow: TColor;
begin
  result := Graphics.ColorToRGB(clBtnShadow);
end;

{$ELSE}

{$IFDEF BGRABITMAP_USE_MSEGUI}
  {$i bgramsegui_uses.inc}
{$ELSE}
  {$IFDEF BGRABITMAP_USE_FPGUI}
    {$i bgrafpgui_uses.inc}
  {$ELSE}
    {$i bgranogui_uses.inc}
  {$ENDIF}
{$ENDIF}

type
  TTransparentMode = (tmAuto, tmFixed);
  TGraphic = class;

{$DEFINE INCLUDE_INTERFACE}
{$IFDEF BGRABITMAP_USE_MSEGUI}
  {$i bgramsegui.inc}
{$ELSE}
  {$IFDEF BGRABITMAP_USE_FPGUI}
    {$i bgrafpgui.inc}
  {$ELSE}
    {$i bgranogui.inc}
  {$ENDIF}
{$ENDIF}

type
  {* Pointer to a ''TColor'' value }
  PColor = ^TColor;
  {* Contains a color stored as RGB. The red/green/blue values
   range from 0 to 255. The formula to get the color value is:
   * ''color'' = ''red'' + (''green'' '''shl''' 8) + (''blue'' '''shl''' 16)
   *except with fpGUI where it is:
   * ''color'' = (''red'' '''shl''' 16) + (''green'' '''shl''' 8) + ''blue'' }{import
  TColor = Int32;
  }
  {** Converts a ''TFPColor'' into a ''TColor'' value }
  function FPColorToTColor(const FPColor: TFPColor): TColor;
  {** Converts a ''TColor'' into a ''TFPColor'' value }
  function TColorToFPColor(const c: TColor): TFPColor;

  function RGBToColor(R, G, B: Byte): TColor; inline;
  procedure RedGreenBlue(rgb: TColor; out Red, Green, Blue: Byte); // does not work on system color

type
  {* Direction of change in a gradient }
  TGradientDirection = (
    {** Color changes vertically }
    gdVertical,
    {** Color changes horizontally }
    gdHorizontal);

  {* Antialiasing mode for a Canvas }
  TAntialiasingMode = (
    {** It does not matter if there is antialiasing or not }
    amDontCare,
    {** Antialiasing is required (BGRACanvas provide it) }
    amOn,
    {** Antialiasing is disabled }
    amOff);

type
  {* Vertical position of a text }
  TTextLayout = (tlTop, tlCenter, tlBottom);
  {* Styles to describe how a text is drawn in a rectangle }
  TTextStyle = packed record
    {** Horizontal alignment }
    Alignment : TAlignment;

    {** Vertical alignment }
    Layout    : TTextLayout;

    {** If WordBreak is false then process #13, #10 as
        standard chars and perform no Line breaking }
    SingleLine: boolean;

    {** Clip Text to passed Rectangle }
    Clipping  : boolean;

    {** Replace #9 by apropriate amount of spaces (default is usually 8) }
    ExpandTabs: boolean;

    {** Process first single '&' per line as an underscore and draw '&&' as '&' }
    ShowPrefix: boolean;

    {** If line of text is too long too fit between left and right boundaries
        try to break into multiple lines between words. See also ''EndEllipsis'' }
    Wordbreak : boolean;

    {** Fills background with current brush }
    Opaque    : boolean;

    {** Use the system font instead of canvas font }
    SystemFont: Boolean;

    {** For RightToLeft text reading (Text Direction) }
    RightToLeft: Boolean;

    {** If line of text is too long to fit between left and right boundaries
        truncates the text and adds "...". If Wordbreak is set as well,
        Workbreak will dominate }
    EndEllipsis: Boolean;
  end;

  {* Option for floodfill (used in BGRACanvas) }
  TFillStyle =
    (
      {** Fill up to the color (it fills all except the specified color) }
      fsSurface,
      {** Fill the specified color (it fills only connected pixels of this color) }
      fsBorder
    );
  {* How to handle polygons that intersect with themselves and
     overlapping polygons }
  TFillMode = (
    {** Each time a boundary is found, it enters or exit the filling zone }
    fmAlternate,
    {** Adds or subtract 1 depending on the order of the points of the
        polygons (clockwise or counter clockwise) and fill when the
        result is non-zero. So, to draw a hole, you must specify the points
        of the hole in the opposite order }
    fmWinding);

  {$IFNDEF TFontStyle}
type
  {* Available font styles }
  TFontStyle = (
    {** Font is bold }
    fsBold,
    {** Font is italic }
    fsItalic,
    {** An horizontal line is drawn in the middle of the text }
    fsStrikeOut,
    {** Text is underlined }
    fsUnderline);
  {** A combination of font styles }
  TFontStyles = set of TFontStyle;
  {$ENDIF}
  {$IFNDEF TFontQuality}
type
  {* Quality to use when font is rendered by the system }
  TFontQuality = (fqDefault, fqDraft, fqProof, fqNonAntialiased, fqAntialiased, fqCleartype, fqCleartypeNatural);
  {$ENDIF}

{$IFDEF BGRABITMAP_USE_FPCANVAS}
{$DEFINE INCLUDE_INTERFACE}
{$i bgrafpcanvas.inc}
{$ENDIF}

type
  {$IFNDEF TCanvas}
  { TCanvas }
  {* A surface on which to draw }
  TCanvas = class
  private
    procedure SetFont(AValue: TFont);
  protected
    FCanvas: TGUICanvas;
    FFont: TFont;
  public
    constructor Create(ACanvas: TGUICanvas);
    {** Draw an image with top-left corner at (''x'',''y'') }
    procedure Draw(x,y: integer; AImage: TGraphic);
    {** Draw and stretch an image within the rectangle ''ARect'' }
    procedure StretchDraw(ARect: TRect; AImage: TGraphic);
    property GUICanvas: TGUICanvas read FCanvas;
    property Font: TFont read FFont write SetFont;
  end;
  {$ENDIF}

  { TGraphic }
  {* A class containing any element that can be drawn within rectangular bounds }
  TGraphic = class(TPersistent)
  protected
    procedure Draw(ACanvas: TCanvas; const Rect: TRect); virtual; abstract;
    function GetEmpty: Boolean; virtual; abstract;
    function GetHeight: Integer; virtual; abstract;
    function GetWidth: Integer; virtual; abstract;
    function GetTransparent: Boolean; virtual; abstract;
    procedure SetTransparent(Value: Boolean); virtual; abstract;
    procedure SetHeight(Value: Integer); virtual; abstract;
    procedure SetWidth(Value: Integer); virtual; abstract;
    function GetMimeType: string; virtual;
    procedure Changed(Sender: TObject); virtual;
  public
    constructor Create; virtual;
    {** Load the content from a given file }
    procedure LoadFromFile({%H-}const Filename: string); virtual;
    {** Load the content from a given stream }
    procedure LoadFromStream(Stream: TStream); virtual; abstract;
    {** Saves the content to a file }
    procedure SaveToFile({%H-}const Filename: string); virtual;
    {** Saves the content into a given stream }
    procedure SaveToStream(Stream: TStream); virtual; abstract;
    {** Returns the list of possible file extensions }
    class function GetFileExtensions: string; virtual;
    {** Clears the content }
    procedure Clear; virtual;
  public
    {** Returns if the content is completely empty }
    property Empty: Boolean read GetEmpty;
    {** Returns the height of the bounding rectangle }
    property Height: Integer read GetHeight write SetHeight;
    {** Returns the width of the bounding rectangle }
    property Width: Integer read GetWidth write SetWidth;
    {** Gets or sets if it is drawn with transparency }
    property Transparent: Boolean read GetTransparent write SetTransparent;
  end;

  {$IFNDEF TBitmap}
  { TBitmap }
  {* Contains a bitmap }
  TBitmap = class(TGraphic)
  private
    FHeight: integer;
    FWidth: integer;
    FInDraw: boolean;
    FTransparent: boolean;
    FTransparentColor: TColor;
    FTransparentMode: TTransparentMode;
    function GetCanvas: TCanvas;
    function GetRawImage: TRawImage;
    procedure SetTransparentColor(AValue: TColor);
    procedure SetTransparentMode(AValue: TTransparentMode);
  protected
    FRawImage: TRawImage;
    procedure Draw(ACanvas: TCanvas; const Rect: TRect); override;
    function GetHeight: Integer; override;
    function GetWidth: Integer; override;
    procedure SetHeight(Value: Integer); override;
    procedure SetWidth(Value: Integer); override;
    function GetEmpty: Boolean; override;
    function GetTransparent: Boolean; override;
    procedure SetTransparent({%H-}Value: Boolean); override;
    function GetMimeType: string; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure LoadFromStream({%H-}Stream: TStream); override;
    procedure SaveToStream({%H-}Stream: TStream); override;
    {** Width of the bitmap in pixels }
    property Width: integer read GetWidth write SetWidth;
    {** Height of the bitmap in pixels }
    property Height: integer read GetHeight write SetHeight;
    property RawImage: TRawImage read GetRawImage;
    property Canvas: TCanvas read GetCanvas;
    property TransparentColor: TColor read FTransparentColor
             write SetTransparentColor default clDefault;
    property TransparentMode: TTransparentMode read FTransparentMode
             write SetTransparentMode default tmAuto;
  end;
  {$ENDIF}

{* Multiply and divide the number allowing big intermediate number and rounding the result }
function MulDiv(nNumber, nNumerator, nDenominator: Integer): Integer;
{* Round the number using math convention }
function MathRound(AValue: ValReal): Int64; inline;

implementation

uses sysutils, BGRAUTF8;

{$DEFINE INCLUDE_IMPLEMENTATION}
{$IFDEF BGRABITMAP_USE_MSEGUI}
  {$i bgramsegui.inc}
{$ELSE}
  {$IFDEF BGRABITMAP_USE_FPGUI}
    {$i bgrafpgui.inc}
  {$ELSE}
    {$i bgranogui.inc}
  {$ENDIF}
{$ENDIF}

function MathRound(AValue: ValReal): Int64; inline;
begin
  if AValue >= 0 then
    Result := Trunc(AValue + 0.5)
  else
    Result := Trunc(AValue - 0.5);
end;

function MulDiv(nNumber, nNumerator, nDenominator: Integer): Integer;
begin
  if nDenominator = 0 then
    Result := -1
  else
    Result := MathRound(int64(nNumber) * int64(nNumerator) / nDenominator);
end;

function FPColorToTColor(const FPColor: TFPColor): TColor;
begin
  {$IFDEF TCOLOR_BLUE_IN_LOW_BYTE}
  Result:=((FPColor.Blue shr 8) and $ff)
       or (FPColor.Green and $ff00)
       or ((FPColor.Red shl 8) and $ff0000);
  {$ELSE}
  Result:=((FPColor.Red shr 8) and $ff)
       or (FPColor.Green and $ff00)
       or ((FPColor.Blue shl 8) and $ff0000);
  {$ENDIF}
end;

function TColorToFPColor(const c: TColor): TFPColor;
begin
  {$IFDEF TCOLOR_BLUE_IN_LOW_BYTE}
  Result.Blue:=(c and $ff);
  Result.Blue:=Result.Blue+(Result.Blue shl 8);
  Result.Green:=(c and $ff00);
  Result.Green:=Result.Green+(Result.Green shr 8);
  Result.Red:=(c and $ff0000) shr 8;
  Result.Red:=Result.Red+(Result.Red shr 8);
  {$ELSE}
  Result.Red:=(c and $ff);
  Result.Red:=Result.Red+(Result.Red shl 8);
  Result.Green:=(c and $ff00);
  Result.Green:=Result.Green+(Result.Green shr 8);
  Result.Blue:=(c and $ff0000) shr 8;
  Result.Blue:=Result.Blue+(Result.Blue shr 8);
  {$ENDIF}
  Result.Alpha:=FPImage.alphaOpaque;
end;

procedure RedGreenBlue(rgb: TColor; out Red, Green, Blue: Byte);
begin
  {$IFDEF TCOLOR_BLUE_IN_LOW_BYTE}
  Blue := rgb and $000000ff;
  Green := (rgb shr 8) and $000000ff;
  Red := (rgb shr 16) and $000000ff;
  {$ELSE}
  Red := rgb and $000000ff;
  Green := (rgb shr 8) and $000000ff;
  Blue := (rgb shr 16) and $000000ff;
  {$ENDIF}
end;

function RGBToColor(R, G, B: Byte): TColor;
begin
  {$IFDEF TCOLOR_BLUE_IN_LOW_BYTE}
  Result := (R shl 16) or (G shl 8) or B;
  {$ELSE}
  Result := (B shl 16) or (G shl 8) or R;
  {$ENDIF}
end;

{ TGraphic }

function TGraphic.GetMimeType: string;
begin
  result := '';
end;

procedure TGraphic.Changed(Sender: TObject);
begin
  //nothing
end;

constructor TGraphic.Create;
begin
  //nothing
end;

procedure TGraphic.LoadFromFile(const Filename: string);
var
  Stream: TStream;
begin
  Stream := TFileStreamUTF8.Create(Filename, fmOpenRead or fmShareDenyWrite);
  try
    LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TGraphic.SaveToFile(const Filename: string);
var
  Stream: TStream;
begin
  Stream := TFileStreamUTF8.Create(Filename, fmCreate);
  try
    SaveToStream(Stream);
  finally
    Stream.Free;
  end;
end;

class function TGraphic.GetFileExtensions: string;
begin
  result := '';
end;

procedure TGraphic.Clear;
begin
  //nothing
end;

{$IFNDEF TCanvas}
{ TCanvas }

procedure TCanvas.SetFont(AValue: TFont);
begin
  if FFont=AValue then Exit;
  FFont.Assign(AValue);
end;

constructor TCanvas.Create(ACanvas: TGUICanvas);
begin
  FCanvas := ACanvas;
  FFont := TFont.Create;
end;

procedure TCanvas.Draw(x, y: integer; AImage: TGraphic);
begin
  if AImage is TBitmap then
    FCanvas.DrawImage(x,y, TBitmap(AImage).RawImage)
  else
    AImage.Draw(self, rect(x,y,x+AImage.Width,y+AImage.Height));
end;

procedure TCanvas.StretchDraw(ARect: TRect; AImage: TGraphic);
begin
  if AImage is TBitmap then
    FCanvas.StretchDraw(ARect.Left,ARect.Top,ARect.Right-ARect.Left,ARect.Bottom-ARect.Top, TBitmap(AImage).RawImage)
  else
    AImage.Draw(self, ARect);
end;
{$ENDIF}

{$IFNDEF TBitmap}
{ TBitmap }

procedure TBitmap.SetWidth(Value: Integer);
begin
  if FWidth=Value then Exit;
  FWidth:=Value;
end;

function TBitmap.GetEmpty: Boolean;
begin
  result := (Width = 0) or (Height = 0);
end;

function TBitmap.GetTransparent: Boolean;
begin
  result := FTransparent;
end;

procedure TBitmap.SetTransparent(Value: Boolean);
begin
  if Value = FTransparent then exit;
  FTransparent:= Value;
end;

procedure TBitmap.SetTransparentColor(AValue: TColor);
begin
  if FTransparentColor = AValue then exit;
  FTransparentColor := AValue;

  if AValue = clDefault
  then FTransparentMode := tmAuto
  else FTransparentMode := tmFixed;
end;

procedure TBitmap.SetTransparentMode(AValue: TTransparentMode);
begin
  if AValue = TransparentMode then exit;
  FTransparentMode := AValue;

  if AValue = tmAuto
  then TransparentColor := clDefault
end;

function TBitmap.GetMimeType: string;
begin
  Result:= 'image/bmp';
end;

procedure TBitmap.LoadFromStream(Stream: TStream);
begin
  raise exception.Create('Not implemented');
end;

procedure TBitmap.SaveToStream(Stream: TStream);
begin
  raise exception.Create('Not implemented');
end;

procedure TBitmap.SetHeight(Value: Integer);
begin
  if FHeight=Value then Exit;
  FHeight:=Value;
end;

function TBitmap.GetRawImage: TRawImage;
begin
  FRawImage.BGRASetSizeAndTransparency(FWidth, FHeight, FTransparent);
  result := FRawImage;
end;

procedure TBitmap.Draw(ACanvas: TCanvas; const Rect: TRect);
begin
  if FInDraw then exit;
  FInDraw := true;
  ACanvas.StretchDraw(Rect, self);
  FInDraw := false;
end;

function TBitmap.GetHeight: Integer;
begin
  result := FHeight;
end;

function TBitmap.GetWidth: Integer;
begin
  result := FWidth;
end;

function TBitmap.GetCanvas: TCanvas;
begin
  result := nil;
  raise exception.Create('Canvas not available');
end;

constructor TBitmap.Create;
begin
  FRawImage := TRawImage.Create;
  FTransparent:= false;
end;

destructor TBitmap.Destroy;
begin
  FRawImage.Free;
  inherited Destroy;
end;

procedure TBitmap.Assign(Source: TPersistent);
var
  src: TBitmap;
begin
  if Source is TBitmap then
  begin
    src := TBitmap(Source);
    RawImage.Assign(src.RawImage);
  end else
    inherited Assign(Source);
end;

{$ENDIF}

{$IFDEF BGRABITMAP_USE_FPCANVAS}
{$DEFINE INCLUDE_IMPLEMENTATION}
{$i bgrafpcanvas.inc}
{$ENDIF}

{$ENDIF}

end.

