package com.playata.application.data.guild
{
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.localization.LocText;
   
   public class GuildCompetitionItem
   {
       
      
      private var _identifier:String;
      
      public function GuildCompetitionItem(param1:String)
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
         return LocText.current.text("guild_competition_item/" + identifier + "/name");
      }
      
      public function get description() : String
      {
         return LocText.current.text("guild_competition_item/" + identifier + "/description");
      }
      
      public function get iconImageUrl() : String
      {
         return ServerInfo.assetURL("guild_competition_items/" + identifier + "_i","png");
      }
   }
}
