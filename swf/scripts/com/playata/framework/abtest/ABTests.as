package com.playata.framework.abtest
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.collection.StringMap;
   
   public class ABTests
   {
       
      
      private var _abTests:StringMap;
      
      public function ABTests(param1:TypedObject = null)
      {
         _abTests = new StringMap();
         super();
         updateData(param1);
      }
      
      public function dispose() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _abTests;
         for each(var _loc1_ in _abTests)
         {
            _loc1_.dispose();
         }
         _abTests = new StringMap();
      }
      
      public function updateData(param1:TypedObject) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc4_:int = 0;
         var _loc3_:* = param1.keys;
         for each(var _loc2_ in param1.keys)
         {
            if(_abTests.exists(_loc2_))
            {
               (_abTests.getData(_loc2_) as ABTest).updateData(param1.getTypedObject(_loc2_));
            }
            else
            {
               _abTests.setData(_loc2_,new ABTest(_loc2_,param1.getTypedObject(_loc2_)));
            }
         }
      }
      
      public function hasABTest(param1:String) : Boolean
      {
         return _abTests.exists(param1);
      }
      
      public function getABTest(param1:String) : ABTest
      {
         if(!hasABTest(param1))
         {
            return null;
         }
         return _abTests.getData(param1);
      }
   }
}
