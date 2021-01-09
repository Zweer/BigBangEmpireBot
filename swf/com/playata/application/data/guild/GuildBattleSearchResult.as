package com.playata.application.data.guild
{
   import com.playata.application.data.dataobject.DOGuildBattleListEntry;
   import com.playata.framework.application.Environment;
   
   public class GuildBattleSearchResult extends DOGuildBattleListEntry
   {
       
      
      private var _emblemSettings:GuildEmblemSettings = null;
      
      public function GuildBattleSearchResult(param1:DOGuildBattleListEntry)
      {
         super(param1);
      }
      
      public function get emblemSettings() : GuildEmblemSettings
      {
         if(_emblemSettings == null)
         {
            _emblemSettings = GuildEmblemSettings.fromGuildBattleSearchResult(this);
         }
         return _emblemSettings;
      }
      
      override public function get locale() : String
      {
         if(super.locale == "")
         {
            return Environment.info.defaultLocale;
         }
         return super.locale;
      }
   }
}
