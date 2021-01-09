package com.playata.application.data.payment
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.TypedObject;
   
   public class ItemOfferCategories
   {
      
      private static var _instance:ItemOfferCategories = null;
       
      
      private var _itemOfferCategories:Vector.<ItemOfferCategory>;
      
      public function ItemOfferCategories(param1:TypedObject)
      {
         _itemOfferCategories = new Vector.<ItemOfferCategory>();
         super();
         if(_instance != null)
         {
            throw new Error("Item offer categories can only have a single instance!");
         }
         _instance = this;
         setData(param1);
      }
      
      public static function get instance() : ItemOfferCategories
      {
         return _instance;
      }
      
      public static function getItemOfferCategory(param1:String) : ItemOfferCategory
      {
         var _loc2_:Vector.<ItemOfferCategory> = instance.itemOfferCategories;
         var _loc5_:int = 0;
         var _loc4_:* = _loc2_;
         for each(var _loc3_ in _loc2_)
         {
            if(_loc3_.identifier == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function setData(param1:TypedObject) : void
      {
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc4_:Boolean = false;
         var _loc7_:* = null;
         if(param1)
         {
            _itemOfferCategories = new Vector.<ItemOfferCategory>();
            var _loc11_:int = 0;
            var _loc10_:* = param1.keys;
            for each(var _loc2_ in param1.keys)
            {
               _loc5_ = param1.getTypedObject(_loc2_);
               if(_loc5_.hasData("locales"))
               {
                  _loc3_ = _loc5_.getArray("locales");
                  _loc4_ = false;
                  var _loc9_:int = 0;
                  var _loc8_:* = _loc3_;
                  for each(var _loc6_ in _loc3_)
                  {
                     if(_loc6_ == "all" || _loc6_ == Environment.info.defaultLocale)
                     {
                        _loc4_ = true;
                        break;
                     }
                  }
                  if(!_loc4_)
                  {
                     continue;
                  }
               }
               _loc7_ = new ItemOfferCategory(_loc2_,param1.getData(_loc2_));
               _itemOfferCategories.push(_loc7_);
            }
            _itemOfferCategories.sort(sortByIndex);
         }
      }
      
      public function dispose() : void
      {
         _instance = null;
         _itemOfferCategories = null;
      }
      
      public function get itemOfferCategories() : Vector.<ItemOfferCategory>
      {
         return _itemOfferCategories;
      }
      
      public function get hasOffers() : Boolean
      {
         return _itemOfferCategories != null && _itemOfferCategories.length > 0;
      }
      
      private function sortByIndex(param1:ItemOfferCategory, param2:ItemOfferCategory) : int
      {
         if(param1.index < param2.index)
         {
            return -1;
         }
         if(param1.index > param2.index)
         {
            return 1;
         }
         return 0;
      }
   }
}
