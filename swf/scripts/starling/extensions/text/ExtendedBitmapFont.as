package starling.extensions.text
{
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import starling.display.MeshBatch;
   import starling.text.BitmapChar;
   import starling.text.BitmapFont;
   import starling.text.CharLocation;
   import starling.text.TextFormat;
   import starling.text.TextOptions;
   import starling.textures.SubTexture;
   import starling.textures.Texture;
   import starling.utils.AssetManager;
   
   public class ExtendedBitmapFont extends BitmapFont
   {
      
      public static const MISC_SYMBOLS_START_ID:int = 9728;
      
      public static const MISC_SYMBOLS_END_ID:int = 9984;
      
      public static const COLOR_TAG_START:String = "[[color=";
      
      public static const COLOR_TAG_END:String = "]]";
       
      
      private var _emoticons:Dictionary;
      
      private var _colorLookup:Dictionary;
      
      private var _assetManager:AssetManager;
      
      public function ExtendedBitmapFont(param1:AssetManager, param2:Texture = null, param3:XML = null)
      {
         _emoticons = new Dictionary();
         _colorLookup = new Dictionary();
         _assetManager = param1;
         super(param2,param3);
      }
      
      public static function replace(param1:String, param2:String, param3:String) : String
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         if(param1 === null || param2 === null || param3 === null)
         {
            return param1;
         }
         if(param1 && param1.indexOf(param2) == -1)
         {
            return param1;
         }
         var _loc9_:String = new String();
         var _loc4_:Boolean = false;
         var _loc5_:int = param1.length;
         var _loc6_:int = param2.length;
         _loc7_ = 0;
         for(; _loc7_ < _loc5_; _loc7_++)
         {
            if(param1.charAt(_loc7_) == param2.charAt(0))
            {
               _loc4_ = true;
               _loc8_ = 0;
               while(_loc8_ < _loc6_)
               {
                  if(param1.charAt(_loc7_ + _loc8_) != param2.charAt(_loc8_))
                  {
                     _loc4_ = false;
                     break;
                  }
                  _loc8_++;
               }
               if(_loc4_)
               {
                  _loc9_ = _loc9_ + param3;
                  _loc7_ = _loc7_ + (_loc6_ - 1);
                  continue;
               }
            }
            _loc9_ = _loc9_ + param1.charAt(_loc7_);
         }
         return _loc9_;
      }
      
      public function get emoticons() : Dictionary
      {
         return _emoticons;
      }
      
      override public function fillMeshBatch(param1:MeshBatch, param2:Number, param3:Number, param4:String, param5:TextFormat, param6:TextOptions = null) : void
      {
         var _loc15_:* = null;
         var _loc13_:* = null;
         var _loc9_:int = 0;
         var _loc14_:* = null;
         _colorLookup = new Dictionary();
         var _loc12_:* = param4;
         var _loc10_:int = 0;
         while(_loc12_.indexOf("[[color=") != -1 && _loc12_.indexOf("]]") != -1)
         {
            _loc15_ = _loc12_.substring(_loc12_.indexOf("[[color="));
            _loc13_ = _loc12_.substring(_loc12_.indexOf("[[color=") + "[[color=".length);
            _loc10_ = replace(_loc12_," ","").indexOf("[[color=");
            if(_loc13_.indexOf("]]") != -1)
            {
               _loc13_ = _loc13_.substring(0,_loc13_.indexOf("]]"));
               if(_loc13_.indexOf("#") === 0)
               {
                  _loc13_ = _loc13_.replace("#","0x");
               }
               _colorLookup[_loc10_] = new uint(_loc13_);
               _loc15_ = _loc15_.substring(0,_loc15_.indexOf("]]") + 2);
               _loc12_ = _loc12_.replace(_loc15_,"");
               continue;
            }
            break;
         }
         var _loc7_:Vector.<CharLocation> = arrangeChars(param2,param3,_loc12_,param5,param6);
         var _loc11_:int = _loc7_.length;
         var _loc8_:uint = param5.color;
         _loc9_ = 0;
         while(_loc9_ < _loc11_)
         {
            _loc14_ = _loc7_[_loc9_];
            if(!§§pop())
            {
               _loc8_ = _colorLookup[_loc9_];
            }
            _helperImage.color = _loc14_.char.charID >= 9728 && _loc14_.char.charID < 9984?16777215:_loc8_;
            _helperImage.texture = _loc14_.char.texture;
            _helperImage.readjustSize();
            _helperImage.x = _loc14_.x;
            _helperImage.y = _loc14_.y;
            _helperImage.scale = _loc14_.scale;
            param1.addMesh(_helperImage);
            _loc9_++;
         }
         CharLocation.rechargePool();
      }
      
      override protected function parseFontXml(param1:XML) : void
      {
         super.parseFontXml(param1);
         var _loc5_:Vector.<String> = _assetManager.getTextureNames("emoticon_");
         var _loc4_:String = null;
         var _loc3_:SubTexture = null;
         var _loc9_:Rectangle = null;
         var _loc8_:int = 9728;
         var _loc6_:Number = _texture.scale;
         var _loc11_:Rectangle = _texture.frame;
         var _loc7_:Number = !!_loc11_?_loc11_.x:0;
         var _loc10_:Number = !!_loc11_?_loc11_.y:0;
         var _loc2_:Number = (_chars[65] as BitmapChar).yOffset;
         var _loc13_:int = 0;
         var _loc12_:* = _loc5_;
         for each(_loc4_ in _loc5_)
         {
            _loc3_ = _assetManager.getTexture(_loc4_) as SubTexture;
            if(_loc3_.root == _texture.root)
            {
               _loc9_ = _loc3_.region;
               addChar(_loc8_,new BitmapChar(_loc8_,_loc3_,0,_loc2_,_loc9_.width));
               _emoticons[_loc4_] = String.fromCharCode(_loc8_);
               _loc8_++;
            }
         }
      }
   }
}
