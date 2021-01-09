package com.playata.application.data.dating
{
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.localization.LocText;
   
   public class DatingItem
   {
       
      
      private var _identifier:String;
      
      public function DatingItem(param1:String)
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
         return LocText.current.text("dating_item/" + identifier + "/name");
      }
      
      public function get description() : String
      {
         return LocText.current.text("dating_item/" + identifier + "/description");
      }
      
      public function get iconImageUrl() : String
      {
         return ServerInfo.assetURL("dating_items/" + identifier + "_i","png");
      }
   }
}
