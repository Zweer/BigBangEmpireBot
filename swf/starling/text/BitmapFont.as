package starling.text
{
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import starling.display.Image;
   import starling.display.MeshBatch;
   import starling.display.Sprite;
   import starling.styles.DistanceFieldStyle;
   import starling.styles.MeshStyle;
   import starling.textures.Texture;
   import starling.utils.StringUtil;
   
   public class BitmapFont implements ITextCompositor
   {
      
      public static const NATIVE_SIZE:int = -1;
      
      public static const MINI:String = "mini";
      
      private static const CHAR_MISSING:int = 0;
      
      private static const CHAR_TAB:int = 9;
      
      private static const CHAR_NEWLINE:int = 10;
      
      private static const CHAR_CARRIAGE_RETURN:int = 13;
      
      private static const CHAR_SPACE:int = 32;
      
      private static const CHAR_NBSP:int = 160;
      
      private static var sLines:Array = [];
      
      private static var sDefaultOptions:TextOptions = new TextOptions();
       
      
      protected var _texture:Texture;
      
      protected var _chars:Dictionary;
      
      private var _name:String;
      
      private var _size:Number;
      
      private var _lineHeight:Number;
      
      private var _baseline:Number;
      
      private var _offsetX:Number;
      
      private var _offsetY:Number;
      
      private var _padding:Number;
      
      protected var _helperImage:Image;
      
      private var _type:String;
      
      private var _distanceFieldSpread:Number;
      
      public function BitmapFont(param1:Texture = null, param2:* = null)
      {
         super();
         if(param1 == null && param2 == null)
         {
            param1 = MiniBitmapFont.texture;
            param2 = MiniBitmapFont.xml;
         }
         else if(param1 == null || param2 == null)
         {
            throw new ArgumentError("Set both of the \'texture\' and \'fontData\' arguments to valid objects or leave both of them null.");
         }
         _name = "unknown";
         _baseline = 14;
         _size = 14;
         _lineHeight = 14;
         _padding = 0;
         _offsetY = 0;
         _offsetX = 0;
         _texture = param1;
         _chars = new Dictionary();
         _helperImage = new Image(param1);
         _type = "standard";
         _distanceFieldSpread = 0;
         addChar(0,new BitmapChar(0,null,0,0,0));
         parseFontData(param2);
      }
      
      public function dispose() : void
      {
         if(_texture)
         {
            _texture.dispose();
         }
      }
      
      protected function parseFontData(param1:*) : void
      {
         if(param1 is XML)
         {
            parseFontXml(param1);
            return;
         }
         throw new ArgumentError("BitmapFont only supports XML data");
      }
      
      protected function parseFontXml(param1:XML) : void
      {
         var _loc14_:int = 0;
         var _loc4_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc15_:* = null;
         var _loc5_:* = null;
         var _loc8_:* = null;
         var _loc16_:int = 0;
         var _loc10_:int = 0;
         var _loc3_:Number = NaN;
         var _loc6_:Number = _texture.scale;
         var _loc17_:Rectangle = _texture.frame;
         var _loc7_:Number = !!_loc17_?_loc17_.x:0;
         var _loc9_:Number = !!_loc17_?_loc17_.y:0;
         _name = StringUtil.clean(param1.info.@face);
         _size = parseFloat(param1.info.@size) / _loc6_;
         _lineHeight = parseFloat(param1.common.@lineHeight) / _loc6_;
         _baseline = parseFloat(param1.common.@base) / _loc6_;
         if(param1.info.@smooth.toString() == "0")
         {
            smoothing = "none";
         }
         if(_size <= 0)
         {
            trace("[Starling] Warning: invalid font size in \'" + _name + "\' font.");
            _size = _size == 0?16:Number(_size * -1);
         }
         if(param1.distanceField.length())
         {
            _distanceFieldSpread = parseFloat(param1.distanceField.@distanceRange);
            _type = param1.distanceField.@fieldType == "msdf"?"multiChannelDistanceField":"distanceField";
         }
         else
         {
            _distanceFieldSpread = 0;
            _type = "standard";
         }
         var _loc19_:int = 0;
         var _loc18_:* = param1.chars.char;
         for each(var _loc11_ in param1.chars.char)
         {
            _loc14_ = parseInt(_loc11_.@id);
            _loc4_ = parseFloat(_loc11_.@xoffset) / _loc6_;
            _loc2_ = parseFloat(_loc11_.@yoffset) / _loc6_;
            _loc13_ = parseFloat(_loc11_.@xadvance) / _loc6_;
            _loc15_ = new Rectangle();
            _loc15_.x = parseFloat(_loc11_.@x) / _loc6_ + _loc7_;
            _loc15_.y = parseFloat(_loc11_.@y) / _loc6_ + _loc9_;
            _loc15_.width = parseFloat(_loc11_.@width) / _loc6_;
            _loc15_.height = parseFloat(_loc11_.@height) / _loc6_;
            _loc5_ = Texture.fromTexture(_texture,_loc15_);
            _loc8_ = new BitmapChar(_loc14_,_loc5_,_loc4_,_loc2_,_loc13_);
            addChar(_loc14_,_loc8_);
            if(_loc14_ == 32)
            {
               addChar(160,_loc8_);
            }
         }
         var _loc21_:int = 0;
         var _loc20_:* = param1.kernings.kerning;
         for each(var _loc12_ in param1.kernings.kerning)
         {
            _loc16_ = parseInt(_loc12_.@first);
            _loc10_ = parseInt(_loc12_.@second);
            _loc3_ = parseFloat(_loc12_.@amount) / _loc6_;
            if(_loc10_ in _chars)
            {
               getChar(_loc10_).addKerning(_loc16_,_loc3_);
            }
         }
      }
      
      public function getChar(param1:int) : BitmapChar
      {
         return _chars[param1];
      }
      
      public function addChar(param1:int, param2:BitmapChar) : void
      {
         _chars[param1] = param2;
      }
      
      public function getCharIDs(param1:Vector.<int> = null) : Vector.<int>
      {
         if(param1 == null)
         {
            param1 = new Vector.<int>(0);
         }
         var _loc4_:int = 0;
         var _loc3_:* = _chars;
         for(param1[param1.length] in _chars)
         {
         }
         return param1;
      }
      
      public function hasChars(param1:String) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1 == null)
         {
            return true;
         }
         var _loc4_:int = param1.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc2_ = param1.charCodeAt(_loc3_);
            if(_loc2_ != 32 && _loc2_ != 9 && _loc2_ != 10 && _loc2_ != 13 && getChar(_loc2_) == null)
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      public function createSprite(param1:Number, param2:Number, param3:String, param4:TextFormat, param5:TextOptions = null) : Sprite
      {
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc8_:* = null;
         var _loc6_:Vector.<BitmapCharLocation> = arrangeChars(param1,param2,param3,param4,param5);
         var _loc12_:int = _loc6_.length;
         var _loc11_:String = this.smoothing;
         var _loc7_:Sprite = new Sprite();
         _loc9_ = 0;
         while(_loc9_ < _loc12_)
         {
            _loc10_ = _loc6_[_loc9_];
            _loc8_ = _loc10_.char.createImage();
            _loc8_.x = _loc10_.x;
            _loc8_.y = _loc10_.y;
            _loc8_.scale = _loc10_.scale;
            _loc8_.color = param4.color;
            _loc8_.textureSmoothing = _loc11_;
            _loc7_.addChild(_loc8_);
            _loc9_++;
         }
         BitmapCharLocation.rechargePool();
         return _loc7_;
      }
      
      public function fillMeshBatch(param1:MeshBatch, param2:Number, param3:Number, param4:String, param5:TextFormat, param6:TextOptions = null) : void
      {
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc7_:Vector.<BitmapCharLocation> = arrangeChars(param2,param3,param4,param5,param6);
         var _loc10_:int = _loc7_.length;
         _helperImage.color = param5.color;
         _loc8_ = 0;
         while(_loc8_ < _loc10_)
         {
            _loc9_ = _loc7_[_loc8_];
            _helperImage.texture = _loc9_.char.texture;
            _helperImage.readjustSize();
            _helperImage.x = _loc9_.x;
            _helperImage.y = _loc9_.y;
            _helperImage.scale = _loc9_.scale;
            param1.addMesh(_helperImage);
            _loc8_++;
         }
         BitmapCharLocation.rechargePool();
      }
      
      public function clearMeshBatch(param1:MeshBatch) : void
      {
         param1.clear();
      }
      
      public function getDefaultMeshStyle(param1:MeshStyle, param2:TextFormat, param3:TextOptions) : MeshStyle
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         if(_type == "standard")
         {
            return null;
         }
         _loc5_ = param2.size < 0?param2.size * -_size:Number(param2.size);
         _loc4_ = param1 as DistanceFieldStyle || new DistanceFieldStyle();
         _loc4_.multiChannel = _type == "multiChannelDistanceField";
         _loc4_.softness = _size / (_loc5_ * _distanceFieldSpread);
         return _loc4_;
      }
      
      public function arrangeChars(param1:Number, param2:Number, param3:String, param4:TextFormat, param5:TextOptions) : Vector.<BitmapCharLocation>
      {
         var _loc39_:* = null;
         var _loc32_:int = 0;
         var _loc18_:Number = NaN;
         var _loc35_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc30_:int = 0;
         var _loc28_:int = 0;
         var _loc24_:* = 0;
         var _loc37_:* = 0;
         var _loc36_:* = NaN;
         var _loc15_:* = NaN;
         var _loc20_:* = undefined;
         var _loc34_:Boolean = false;
         var _loc25_:int = 0;
         var _loc38_:* = null;
         var _loc33_:int = 0;
         var _loc14_:int = 0;
         var _loc12_:* = undefined;
         var _loc22_:int = 0;
         var _loc27_:* = null;
         var _loc31_:Number = NaN;
         var _loc23_:int = 0;
         if(param3 == null || param3.length == 0)
         {
            return BitmapCharLocation.vectorFromPool();
         }
         if(param5 == null)
         {
            param5 = sDefaultOptions;
         }
         var _loc6_:Boolean = param4.kerning;
         var _loc10_:Number = param4.leading;
         var _loc19_:Number = param4.letterSpacing;
         var _loc8_:String = param4.horizontalAlign;
         var _loc16_:String = param4.verticalAlign;
         var _loc40_:Number = param4.size;
         var _loc17_:Boolean = param5.autoScale;
         var _loc11_:Boolean = param5.wordWrap;
         var _loc29_:Boolean = false;
         if(_loc40_ < 0)
         {
            _loc40_ = _loc40_ * -_size;
         }
         while(!_loc29_)
         {
            sLines.length = 0;
            _loc13_ = _loc40_ / _size;
            _loc18_ = (param1 - 2 * _padding) / _loc13_;
            _loc35_ = (param2 - 2 * _padding) / _loc13_;
            if(_size <= _loc35_)
            {
               _loc24_ = -1;
               _loc37_ = -1;
               _loc36_ = 0;
               _loc15_ = 0;
               _loc20_ = BitmapCharLocation.vectorFromPool();
               _loc32_ = param3.length;
               _loc28_ = 0;
               for(; _loc28_ < _loc32_; _loc28_++)
               {
                  _loc34_ = false;
                  _loc25_ = param3.charCodeAt(_loc28_);
                  _loc38_ = getChar(_loc25_);
                  if(_loc25_ == 10 || _loc25_ == 13)
                  {
                     _loc34_ = true;
                  }
                  else
                  {
                     if(_loc38_ == null)
                     {
                        trace(StringUtil.format("[Starling] Character \'{0}\' (id: {1}) not found in \'{2}\'",param3.charAt(_loc28_),_loc25_,name));
                        _loc25_ = 0;
                        _loc38_ = getChar(0);
                     }
                     if(_loc25_ == 32 || _loc25_ == 9)
                     {
                        _loc24_ = _loc28_;
                     }
                     if(_loc6_)
                     {
                        _loc36_ = Number(_loc36_ + _loc38_.getKerning(_loc37_));
                     }
                     _loc39_ = BitmapCharLocation.instanceFromPool(_loc38_);
                     _loc39_.index = _loc28_;
                     _loc39_.x = _loc36_ + _loc38_.xOffset;
                     _loc39_.y = _loc15_ + _loc38_.yOffset;
                     _loc20_[_loc20_.length] = _loc39_;
                     _loc36_ = Number(_loc36_ + (_loc38_.xAdvance + _loc19_));
                     _loc37_ = _loc25_;
                     if(_loc39_.x + _loc38_.width > _loc18_)
                     {
                        if(_loc11_)
                        {
                           if(!(_loc17_ && _loc24_ == -1))
                           {
                              _loc33_ = _loc24_ == -1?1:Number(_loc28_ - _loc24_);
                              _loc30_ = 0;
                              while(_loc30_ < _loc33_)
                              {
                                 _loc20_.pop();
                                 _loc30_++;
                              }
                              if(_loc20_.length != 0)
                              {
                                 _loc28_ = _loc28_ - _loc33_;
                              }
                              break;
                           }
                           break;
                        }
                        if(!_loc17_)
                        {
                           _loc20_.pop();
                           while(_loc28_ < _loc32_ - 1 && param3.charCodeAt(_loc28_) != 10)
                           {
                              _loc28_++;
                           }
                        }
                        break;
                        _loc34_ = true;
                     }
                  }
                  if(_loc28_ == _loc32_ - 1)
                  {
                     sLines[sLines.length] = _loc20_;
                     _loc29_ = true;
                  }
                  else if(_loc34_)
                  {
                     sLines[sLines.length] = _loc20_;
                     if(_loc24_ == _loc28_)
                     {
                        _loc20_.pop();
                     }
                     if(_loc15_ + _lineHeight + _loc10_ + _size <= _loc35_)
                     {
                        _loc20_ = BitmapCharLocation.vectorFromPool();
                        _loc36_ = 0;
                        _loc15_ = Number(_loc15_ + (_lineHeight + _loc10_));
                        _loc24_ = -1;
                        _loc37_ = -1;
                        continue;
                     }
                     break;
                  }
               }
            }
            if(_loc17_ && !_loc29_ && _loc40_ > 3)
            {
               _loc40_ = _loc40_ - 1;
            }
            else
            {
               _loc29_ = true;
            }
         }
         var _loc21_:Vector.<BitmapCharLocation> = BitmapCharLocation.vectorFromPool();
         var _loc9_:int = sLines.length;
         var _loc26_:Number = _loc15_ + _lineHeight;
         var _loc7_:int = 0;
         if(_loc16_ == "bottom")
         {
            _loc7_ = _loc35_ - _loc26_;
         }
         else if(_loc16_ == "center")
         {
            _loc7_ = (_loc35_ - _loc26_) / 2;
         }
         _loc14_ = 0;
         while(_loc14_ < _loc9_)
         {
            _loc12_ = sLines[_loc14_];
            _loc32_ = _loc12_.length;
            if(_loc32_ != 0)
            {
               _loc22_ = 0;
               _loc27_ = _loc12_[_loc12_.length - 1];
               _loc31_ = _loc27_.x - _loc27_.char.xOffset + _loc27_.char.xAdvance;
               if(_loc8_ == "right")
               {
                  _loc22_ = _loc18_ - _loc31_;
               }
               else if(_loc8_ == "center")
               {
                  _loc22_ = (_loc18_ - _loc31_) / 2;
               }
               _loc23_ = 0;
               while(_loc23_ < _loc32_)
               {
                  _loc39_ = _loc12_[_loc23_];
                  _loc39_.x = _loc13_ * (_loc39_.x + _loc22_ + _offsetX) + _padding;
                  _loc39_.y = _loc13_ * (_loc39_.y + _loc7_ + _offsetY) + _padding;
                  _loc39_.scale = _loc13_;
                  if(_loc39_.char.width > 0 && _loc39_.char.height > 0)
                  {
                     _loc21_[_loc21_.length] = _loc39_;
                  }
                  _loc23_++;
               }
            }
            _loc14_++;
         }
         return _loc21_;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get size() : Number
      {
         return _size;
      }
      
      public function set size(param1:Number) : void
      {
         _size = param1;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      public function get distanceFieldSpread() : Number
      {
         return _distanceFieldSpread;
      }
      
      public function set distanceFieldSpread(param1:Number) : void
      {
         _distanceFieldSpread = param1;
      }
      
      public function get lineHeight() : Number
      {
         return _lineHeight;
      }
      
      public function set lineHeight(param1:Number) : void
      {
         _lineHeight = param1;
      }
      
      public function get smoothing() : String
      {
         return _helperImage.textureSmoothing;
      }
      
      public function set smoothing(param1:String) : void
      {
         _helperImage.textureSmoothing = param1;
      }
      
      public function get baseline() : Number
      {
         return _baseline;
      }
      
      public function set baseline(param1:Number) : void
      {
         _baseline = param1;
      }
      
      public function get offsetX() : Number
      {
         return _offsetX;
      }
      
      public function set offsetX(param1:Number) : void
      {
         _offsetX = param1;
      }
      
      public function get offsetY() : Number
      {
         return _offsetY;
      }
      
      public function set offsetY(param1:Number) : void
      {
         _offsetY = param1;
      }
      
      public function get padding() : Number
      {
         return _padding;
      }
      
      public function set padding(param1:Number) : void
      {
         _padding = param1;
      }
      
      public function get texture() : Texture
      {
         return _texture;
      }
   }
}
