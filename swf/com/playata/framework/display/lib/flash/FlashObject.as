package com.playata.framework.display.lib.flash
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.ui.Align;
   
   public class FlashObject
   {
       
      
      public function FlashObject()
      {
         super();
      }
      
      protected function getNumberSetting(param1:String, param2:TypedObject, param3:Number) : Number
      {
         return getSetting(param1,param2,param3) as Number;
      }
      
      protected function getIntSetting(param1:String, param2:TypedObject, param3:int) : int
      {
         return getSetting(param1,param2,param3) as int;
      }
      
      protected function getStringSetting(param1:String, param2:TypedObject, param3:String) : String
      {
         return getSetting(param1,param2,param3) as String;
      }
      
      protected function getAlignSetting(param1:String, param2:TypedObject, param3:Align) : Align
      {
         if(!param2)
         {
            return param3;
         }
         if(!param2.hasData(param1))
         {
            return param3;
         }
         var _loc4_:Object = param2.getData(param1);
         if(_loc4_ is String)
         {
            return FlashTypeConverter.fromFlashAlign(_loc4_ as String);
         }
         return _loc4_ as Align;
      }
      
      protected function getBooleanSetting(param1:String, param2:TypedObject, param3:Boolean) : Boolean
      {
         return getSetting(param1,param2,param3) as Boolean;
      }
      
      protected function getTypedObjectSetting(param1:String, param2:TypedObject) : TypedObject
      {
         var _loc3_:Object = getSetting(param1,param2,null);
         if(_loc3_ === null)
         {
            return null;
         }
         return new TypedObject(_loc3_);
      }
      
      protected function getColorSetting(param1:String, param2:TypedObject, param3:uint) : uint
      {
         var _loc4_:* = null;
         if(hasSetting(param1,param2))
         {
            _loc4_ = getSetting(param1,param2,param3);
            if(typeof _loc4_ == "string")
            {
               _loc4_ = uint("0x" + (_loc4_ as String).substr(1));
            }
            return uint(_loc4_);
         }
         return param3;
      }
      
      protected function getSetting(param1:String, param2:TypedObject, param3:Object) : Object
      {
         if(!param2)
         {
            return param3;
         }
         if(!param2.hasData(param1))
         {
            return param3;
         }
         return param2.getData(param1);
      }
      
      protected function hasSetting(param1:String, param2:TypedObject) : Boolean
      {
         if(!param2)
         {
            return false;
         }
         if(!param2.hasData(param1))
         {
            return false;
         }
         return true;
      }
   }
}
