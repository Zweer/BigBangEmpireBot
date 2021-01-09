package com.playata.application.data.fan_foto
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.dataobject.DOFanFoto;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.Constants;
   
   public class FanFoto extends DOFanFoto
   {
       
      
      private var _fotosOfTag:Object;
      
      public function FanFoto(param1:Object)
      {
         super(param1);
      }
      
      public static function get isAvailable() : Boolean
      {
         return AppConfig.fanFotoEnabled && AppEnvironment.appPlatform.isHidePantiesAllowed && AppEnvironment.appPlatform.fanFotoFeatureEnabled;
      }
      
      override public function get unlockedFotos() : String
      {
         return null;
      }
      
      public function get unlockedFotosObject() : Object
      {
         return getData("unlocked_fotos");
      }
      
      override public function update(param1:TypedObject) : void
      {
         super.update(param1);
         _fotosOfTag = null;
      }
      
      public function get tags() : Array
      {
         return getData("selected_tags") as Array;
      }
      
      public function get unlockedFotosCount() : int
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = unlockedFotosObject;
         for(var _loc1_ in unlockedFotosObject)
         {
            _loc2_++;
         }
         return _loc2_;
      }
      
      public function getResourceCost(param1:int) : int
      {
         var _loc2_:int = Math.max(Math.min(CConstant.fan_foto_cost * unlockedFotosCount - 1,CConstant.fan_foto_max_cost),1);
         if(param1 == 2)
         {
            _loc2_ = _loc2_ * CConstant.fan_foto_25_increase;
         }
         if(param1 == 3)
         {
            _loc2_ = _loc2_ * CConstant.fan_foto_100_increase;
         }
         return _loc2_;
      }
      
      public function get fotoCountByTag() : Object
      {
         if(_fotosOfTag != null)
         {
            return _fotosOfTag;
         }
         var _loc5_:Object = unlockedFotosObject;
         var _loc2_:Object = {};
         var _loc3_:Object = Constants.current.constant("fan_foto_tag_count");
         var _loc7_:* = 0;
         var _loc6_:* = _loc3_;
         for(var _loc4_ in _loc3_)
         {
            _loc2_[parseInt(_loc4_)] = 0;
         }
         var _loc12_:int = 0;
         var _loc11_:* = _loc5_;
         for(var _loc1_ in _loc5_)
         {
            var _loc10_:int = 0;
            var _loc9_:* = _loc5_[_loc1_]["tags"];
            for(_loc4_ in _loc5_[_loc1_]["tags"])
            {
               _loc7_ = _loc2_;
               _loc6_ = _loc5_[_loc1_]["tags"][_loc4_];
               var _loc8_:* = Number(_loc7_[_loc6_]) + 1;
               _loc7_[_loc6_] = _loc8_;
            }
            _loc7_ = _loc2_;
            _loc6_ = 0;
            _loc8_ = Number(_loc7_[_loc6_]) + 1;
            _loc7_[_loc6_] = _loc8_;
         }
         _fotosOfTag = _loc2_;
         return _fotosOfTag;
      }
      
      public function get fotosAvailableForTags() : Boolean
      {
         var _loc1_:Object = fotoCountByTag;
         var _loc2_:Object = Constants.current.constant("fan_foto_tag_count");
         var _loc5_:int = 0;
         var _loc4_:* = _loc2_;
         for(var _loc3_ in _loc2_)
         {
            if(tags.indexOf(parseInt(_loc3_)) >= 0 && _loc2_[_loc3_]["count"] > _loc1_[parseInt(_loc3_)])
            {
               return true;
            }
         }
         return false;
      }
      
      public function get fotosAvailable() : Boolean
      {
         var _loc1_:int = Constants.current.constant("fan_foto_tag_count")[0]["count"];
         return fotoCountByTag[0] < _loc1_;
      }
   }
}
