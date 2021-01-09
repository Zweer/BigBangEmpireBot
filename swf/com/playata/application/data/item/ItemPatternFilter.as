package com.playata.application.data.item
{
   import com.playata.framework.core.TypedObject;
   
   public class ItemPatternFilter extends TypedObject
   {
       
      
      public function ItemPatternFilter(param1:Object)
      {
         super(param1);
      }
      
      public function get showStatRewards() : Boolean
      {
         return getBoolean("ssr");
      }
      
      public function get showItemRewards() : Boolean
      {
         return getBoolean("sir");
      }
      
      public function get showEnergyRewards() : Boolean
      {
         return getBoolean("ser");
      }
      
      public function get showTitleRewards() : Boolean
      {
         return getBoolean("str");
      }
      
      public function get showEventItem() : Boolean
      {
         if(hasData("ssdi"))
         {
            return getBoolean("sei");
         }
         return true;
      }
      
      public function get showStoryDungeonItem() : Boolean
      {
         if(hasData("ssdi"))
         {
            return getBoolean("ssdi");
         }
         return true;
      }
      
      public function get showOtherItem() : Boolean
      {
         if(hasData("soi"))
         {
            return getBoolean("soi");
         }
         return true;
      }
      
      public function get showCommon() : Boolean
      {
         if(hasData("ssdi"))
         {
            return getBoolean("srci");
         }
         return true;
      }
      
      public function get showRare() : Boolean
      {
         if(hasData("ssdi"))
         {
            return getBoolean("srri");
         }
         return true;
      }
      
      public function get showEpic() : Boolean
      {
         if(hasData("ssdi"))
         {
            return getBoolean("srei");
         }
         return true;
      }
   }
}
