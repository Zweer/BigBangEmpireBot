package com.playata.application.data.herobook
{
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.localization.LocText;
   
   public class HerobookItem
   {
       
      
      private var _identifier:String;
      
      public function HerobookItem(param1:String)
      {
         super();
         _identifier = param1;
      }
      
      public function get identifier() : String
      {
         return _identifier;
      }
      
      public function get name() : String
      {
         return LocText.current.text("herobook_item/" + identifier + "/name");
      }
      
      public function get description() : String
      {
         return LocText.current.text("herobook_item/" + identifier + "/description");
      }
      
      public function get iconImageUrl() : String
      {
         return ServerInfo.assetURL("herobook_items/" + identifier,"png");
      }
   }
}
