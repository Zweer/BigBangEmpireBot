package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   import com.playata.framework.data.DataObjectArray;
   
   public class DOBonusInfo extends DataObject
   {
       
      
      public function DOBonusInfo(param1:Object)
      {
         super(param1);
      }
      
      public function get bonusDatas() : DataObjectArray
      {
         if(hasData("bonus_datas",true))
         {
            return new DataObjectArray(getArray("bonus_datas"),DOBonusInfoDay);
         }
         return null;
      }
   }
}
