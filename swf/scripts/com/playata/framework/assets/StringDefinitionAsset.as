package com.playata.framework.assets
{
   public class StringDefinitionAsset implements IAsset
   {
       
      
      private var _string:String = null;
      
      public function StringDefinitionAsset(param1:String)
      {
         super();
         _string = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function get string() : String
      {
         return _string;
      }
   }
}
