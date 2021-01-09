package starling.textures
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import starling.display.Image;
   import starling.utils.StringUtil;
   
   public class TextureAtlas
   {
      
      private static const NAME_REGEX:RegExp = /(.+?)\d+$/;
      
      private static var sNames:Vector.<String> = new Vector.<String>(0);
       
      
      private var _atlasTexture:Texture;
      
      private var _subTextures:Dictionary;
      
      private var _subTextureNames:Vector.<String>;
      
      public function TextureAtlas(param1:Texture, param2:* = null)
      {
         super();
         _subTextures = new Dictionary();
         _atlasTexture = param1;
         if(param2)
         {
            parseAtlasData(param2);
         }
      }
      
      public function dispose() : void
      {
         _atlasTexture.dispose();
      }
      
      protected function parseAtlasData(param1:*) : void
      {
         if(param1 is XML)
         {
            parseAtlasXml(param1 as XML);
            return;
         }
         throw new ArgumentError("TextureAtlas only supports XML data");
      }
      
      protected function parseAtlasXml(param1:XML) : void
      {
         var _loc13_:* = null;
         var _loc14_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc8_:* = null;
         var _loc20_:* = null;
         var _loc17_:* = null;
         var _loc3_:Number = _atlasTexture.scale;
         var _loc19_:Rectangle = new Rectangle();
         var _loc21_:Rectangle = new Rectangle();
         var _loc18_:Dictionary = new Dictionary();
         var _loc24_:int = 0;
         var _loc23_:* = param1.SubTexture;
         for each(var _loc12_ in param1.SubTexture)
         {
            _loc13_ = StringUtil.clean(_loc12_.@name);
            _loc14_ = parseFloat(_loc12_.@x) / _loc3_ || 0;
            _loc16_ = parseFloat(_loc12_.@y) / _loc3_ || 0;
            _loc15_ = parseFloat(_loc12_.@width) / _loc3_ || 0;
            _loc22_ = parseFloat(_loc12_.@height) / _loc3_ || 0;
            _loc4_ = parseFloat(_loc12_.@frameX) / _loc3_ || 0;
            _loc9_ = parseFloat(_loc12_.@frameY) / _loc3_ || 0;
            _loc11_ = parseFloat(_loc12_.@frameWidth) / _loc3_ || 0;
            _loc2_ = parseFloat(_loc12_.@frameHeight) / _loc3_ || 0;
            _loc7_ = parseFloat(_loc12_.@pivotX) / _loc3_ || 0;
            _loc6_ = parseFloat(_loc12_.@pivotY) / _loc3_ || 0;
            _loc5_ = StringUtil.parseBoolean(_loc12_.@rotated);
            _loc19_.setTo(_loc14_,_loc16_,_loc15_,_loc22_);
            _loc21_.setTo(_loc4_,_loc9_,_loc11_,_loc2_);
            if(_loc11_ > 0 && _loc2_ > 0)
            {
               addRegion(_loc13_,_loc19_,_loc21_,_loc5_);
            }
            else
            {
               addRegion(_loc13_,_loc19_,null,_loc5_);
            }
            if(_loc7_ != 0 || _loc6_ != 0)
            {
               Image.bindPivotPointToTexture(getTexture(_loc13_),_loc7_,_loc6_);
               _loc18_[_loc13_] = new Point(_loc7_,_loc6_);
            }
         }
         var _loc28_:int = 0;
         var _loc27_:* = _loc18_;
         for(var _loc10_ in _loc18_)
         {
            _loc8_ = _loc10_.match(NAME_REGEX);
            if(_loc8_ && _loc8_.length > 0)
            {
               _loc20_ = _loc8_[1];
               _loc17_ = _loc18_[_loc10_];
               var _loc26_:int = 0;
               var _loc25_:* = _subTextures;
               for(_loc13_ in _subTextures)
               {
                  if(_loc13_.indexOf(_loc20_) == 0 && !(_loc13_ in _loc18_))
                  {
                     Image.bindPivotPointToTexture(_subTextures[_loc13_],_loc17_.x,_loc17_.y);
                  }
               }
               continue;
            }
         }
      }
      
      public function getTexture(param1:String) : Texture
      {
         return _subTextures[param1];
      }
      
      public function getTextures(param1:String = "", param2:Vector.<Texture> = null) : Vector.<Texture>
      {
         if(param2 == null)
         {
            param2 = new Vector.<Texture>(0);
         }
         var _loc5_:int = 0;
         var _loc4_:* = getNames(param1,sNames);
         for each(var _loc3_ in getNames(param1,sNames))
         {
            param2[param2.length] = getTexture(_loc3_);
         }
         sNames.length = 0;
         return param2;
      }
      
      public function getNames(param1:String = "", param2:Vector.<String> = null) : Vector.<String>
      {
         var _loc3_:* = null;
         if(param2 == null)
         {
            param2 = new Vector.<String>(0);
         }
         if(_subTextureNames == null)
         {
            _subTextureNames = new Vector.<String>(0);
            var _loc5_:int = 0;
            var _loc4_:* = _subTextures;
            for(_subTextureNames[_subTextureNames.length] in _subTextures)
            {
            }
            _subTextureNames.sort(1);
         }
         var _loc7_:int = 0;
         var _loc6_:* = _subTextureNames;
         for each(_loc3_ in _subTextureNames)
         {
            if(_loc3_.indexOf(param1) == 0)
            {
               param2[param2.length] = _loc3_;
            }
         }
         return param2;
      }
      
      public function getRegion(param1:String) : Rectangle
      {
         var _loc2_:SubTexture = _subTextures[param1];
         return !!_loc2_?_loc2_.region:null;
      }
      
      public function getFrame(param1:String) : Rectangle
      {
         var _loc2_:SubTexture = _subTextures[param1];
         return !!_loc2_?_loc2_.frame:null;
      }
      
      public function getRotation(param1:String) : Boolean
      {
         var _loc2_:SubTexture = _subTextures[param1];
         return !!_loc2_?_loc2_.rotated:false;
      }
      
      public function addRegion(param1:String, param2:Rectangle, param3:Rectangle = null, param4:Boolean = false) : void
      {
         addSubTexture(param1,new SubTexture(_atlasTexture,param2,false,param3,param4));
      }
      
      public function addSubTexture(param1:String, param2:SubTexture) : void
      {
         if(param2.root != _atlasTexture.root)
         {
            throw new ArgumentError("SubTexture\'s root must be atlas texture.");
         }
         _subTextures[param1] = param2;
         _subTextureNames = null;
      }
      
      public function removeRegion(param1:String) : void
      {
         var _loc2_:SubTexture = _subTextures[param1];
         if(_loc2_)
         {
            _loc2_.dispose();
         }
         delete _subTextures[param1];
         _subTextureNames = null;
      }
      
      public function removeRegions(param1:String = "") : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = _subTextures;
         for(var _loc2_ in _subTextures)
         {
            if(param1 == "" || _loc2_.indexOf(param1) == 0)
            {
               removeRegion(_loc2_);
            }
         }
      }
      
      public function get texture() : Texture
      {
         return _atlasTexture;
      }
   }
}
