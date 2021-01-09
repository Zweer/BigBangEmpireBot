package spine.atlas
{
   import flash.utils.ByteArray;
   
   public class Atlas
   {
       
      
      private var pages:Vector.<AtlasPage>;
      
      private var regions:Vector.<AtlasRegion>;
      
      private var textureLoader:TextureLoader;
      
      public function Atlas(param1:*, param2:TextureLoader)
      {
         pages = new Vector.<AtlasPage>();
         regions = new Vector.<AtlasRegion>();
         super();
         if(!param1)
         {
            return;
         }
         if(param1 is String)
         {
            load(String(param1),param2);
         }
         else if(param1 is ByteArray)
         {
            load(ByteArray(param1).readUTFBytes(ByteArray(param1).length),param2);
         }
         else
         {
            throw new ArgumentError("object must be a TextureAtlas or AttachmentLoader.");
         }
      }
      
      protected function load(param1:String, param2:TextureLoader) : void
      {
         var _loc5_:* = null;
         var _loc11_:* = null;
         var _loc10_:* = null;
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         var _loc7_:int = 0;
         var _loc12_:int = 0;
         if(param2 == null)
         {
            throw new ArgumentError("textureLoader cannot be null.");
         }
         this.textureLoader = param2;
         var _loc4_:Reader = new Reader(param1);
         var _loc3_:Array = [];
         _loc3_.length = 4;
         var _loc9_:AtlasPage = null;
         while(true)
         {
            _loc5_ = _loc4_.readLine();
            if(_loc5_ != null)
            {
               _loc5_ = _loc4_.trim(_loc5_);
               if(_loc5_.length == 0)
               {
                  _loc9_ = null;
               }
               else if(!_loc9_)
               {
                  _loc9_ = new AtlasPage();
                  _loc9_.name = _loc5_;
                  if(_loc4_.readTuple(_loc3_) == 2)
                  {
                     _loc9_.width = parseInt(_loc3_[0]);
                     _loc9_.height = parseInt(_loc3_[1]);
                     _loc4_.readTuple(_loc3_);
                  }
                  _loc9_.format = Format[_loc3_[0]];
                  _loc4_.readTuple(_loc3_);
                  _loc9_.minFilter = TextureFilter[_loc3_[0]];
                  _loc9_.magFilter = TextureFilter[_loc3_[1]];
                  _loc11_ = _loc4_.readValue();
                  _loc9_.uWrap = TextureWrap.clampToEdge;
                  _loc9_.vWrap = TextureWrap.clampToEdge;
                  if(_loc11_ == "x")
                  {
                     _loc9_.uWrap = TextureWrap.repeat;
                  }
                  else if(_loc11_ == "y")
                  {
                     _loc9_.vWrap = TextureWrap.repeat;
                  }
                  else if(_loc11_ == "xy")
                  {
                     var _loc13_:* = TextureWrap.repeat;
                     _loc9_.vWrap = _loc13_;
                     _loc9_.uWrap = _loc13_;
                  }
                  param2.loadPage(_loc9_,_loc5_);
                  pages[pages.length] = _loc9_;
               }
               else
               {
                  _loc10_ = new AtlasRegion();
                  _loc10_.name = _loc5_;
                  _loc10_.page = _loc9_;
                  _loc10_.rotate = _loc4_.readValue() == "true";
                  _loc4_.readTuple(_loc3_);
                  _loc6_ = parseInt(_loc3_[0]);
                  _loc8_ = parseInt(_loc3_[1]);
                  _loc4_.readTuple(_loc3_);
                  _loc7_ = parseInt(_loc3_[0]);
                  _loc12_ = parseInt(_loc3_[1]);
                  _loc10_.u = _loc6_ / _loc9_.width;
                  _loc10_.v = _loc8_ / _loc9_.height;
                  if(_loc10_.rotate)
                  {
                     _loc10_.u2 = (_loc6_ + _loc12_) / _loc9_.width;
                     _loc10_.v2 = (_loc8_ + _loc7_) / _loc9_.height;
                  }
                  else
                  {
                     _loc10_.u2 = (_loc6_ + _loc7_) / _loc9_.width;
                     _loc10_.v2 = (_loc8_ + _loc12_) / _loc9_.height;
                  }
                  _loc10_.x = _loc6_;
                  _loc10_.y = _loc8_;
                  _loc10_.width = Math.abs(_loc7_);
                  _loc10_.height = Math.abs(_loc12_);
                  if(_loc4_.readTuple(_loc3_) == 4)
                  {
                     _loc10_.splits = new Vector.<int>(parseInt(_loc3_[0]),parseInt(_loc3_[1]),parseInt(_loc3_[2]),parseInt(_loc3_[3]));
                     if(_loc4_.readTuple(_loc3_) == 4)
                     {
                        _loc10_.pads = new Vector.<int>(parseInt(_loc3_[0]),parseInt(_loc3_[1]),parseInt(_loc3_[2]),parseInt(_loc3_[3]));
                        _loc4_.readTuple(_loc3_);
                     }
                  }
                  _loc10_.originalWidth = parseInt(_loc3_[0]);
                  _loc10_.originalHeight = parseInt(_loc3_[1]);
                  _loc4_.readTuple(_loc3_);
                  _loc10_.offsetX = parseInt(_loc3_[0]);
                  _loc10_.offsetY = parseInt(_loc3_[1]);
                  _loc10_.index = parseInt(_loc4_.readValue());
                  param2.loadRegion(_loc10_);
                  regions[regions.length] = _loc10_;
               }
               continue;
            }
            break;
         }
      }
      
      public function findRegion(param1:String) : AtlasRegion
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = 0;
         _loc3_ = regions.length;
         while(_loc2_ < _loc3_)
         {
            if(regions[_loc2_].name == param1)
            {
               return regions[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = pages.length;
         while(_loc1_ < _loc2_)
         {
            textureLoader.unloadPage(pages[_loc1_]);
            _loc1_++;
         }
      }
   }
}

class Reader
{
    
   
   private var lines:Array;
   
   private var index:int;
   
   function Reader(param1:String)
   {
      super();
      lines = param1.split(/\r\n|\r|\n/);
   }
   
   public function trim(param1:String) : String
   {
      return param1.replace(/^\s+|\s+$/sg,"");
   }
   
   public function readLine() : String
   {
      if(index >= lines.length)
      {
         return null;
      }
      index = Number(index) + 1;
      return lines[Number(index)];
   }
   
   public function readValue() : String
   {
      var _loc1_:String = readLine();
      var _loc2_:int = _loc1_.indexOf(":");
      if(_loc2_ == -1)
      {
         throw new Error("Invalid line: " + _loc1_);
      }
      return trim(_loc1_.substring(_loc2_ + 1));
   }
   
   public function readTuple(param1:Array) : int
   {
      var _loc2_:int = 0;
      var _loc4_:String = readLine();
      var _loc5_:int = _loc4_.indexOf(":");
      if(_loc5_ == -1)
      {
         throw new Error("Invalid line: " + _loc4_);
      }
      var _loc6_:int = 0;
      var _loc3_:int = _loc5_ + 1;
      while(_loc6_ < 3)
      {
         _loc2_ = _loc4_.indexOf(",",_loc3_);
         if(_loc2_ != -1)
         {
            param1[_loc6_] = trim(_loc4_.substr(_loc3_,_loc2_ - _loc3_));
            _loc3_ = _loc2_ + 1;
            _loc6_++;
            continue;
         }
         break;
      }
      param1[_loc6_] = trim(_loc4_.substring(_loc3_));
      return _loc6_ + 1;
   }
}
