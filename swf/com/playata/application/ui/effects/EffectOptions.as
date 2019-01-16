package com.playata.application.ui.effects
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.IDisplayObject;
   
   public class EffectOptions
   {
       
      
      public var emitter:IDisplayObject = null;
      
      public var imageUrl:String = null;
      
      public var texture:String = null;
      
      public var amount:int = 1;
      
      public var numSprites:int = 0;
      
      public var targetX:Number = 0;
      
      public var targetY:Number = 0;
      
      public var rawData:Object = null;
      
      public function EffectOptions()
      {
         super();
      }
      
      public static function fromData(param1:Object) : EffectOptions
      {
         var _loc3_:TypedObject = new TypedObject(param1);
         var _loc2_:EffectOptions = new EffectOptions();
         if(_loc3_.hasData("emitter"))
         {
            _loc2_.emitter = _loc3_.getData("emitter") as IDisplayObject;
         }
         if(_loc3_.hasData("imageUrl"))
         {
            _loc2_.imageUrl = _loc3_.getString("imageUrl");
         }
         if(_loc3_.hasData("amount"))
         {
            _loc2_.amount = _loc3_.getInt("amount");
         }
         if(_loc3_.hasData("numSprites"))
         {
            _loc2_.numSprites = _loc3_.getInt("numSprites");
         }
         _loc2_.rawData = param1;
         return _loc2_;
      }
   }
}
