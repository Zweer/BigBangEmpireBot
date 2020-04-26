package com.playata.application.data.guild
{
   import com.playata.application.data.dataobject.DOGuildListEntry;
   import com.playata.framework.application.Environment;
   
   public class GuildSearchResult extends DOGuildListEntry
   {
       
      
      private var _emblemSettings:GuildEmblemSettings = null;
      
      public function GuildSearchResult(param1:DOGuildListEntry)
      {
         super(param1);
      }
      
      override public function get locale() : String
      {
         if(super.locale == "")
         {
            return Environment.info.defaultLocale;
         }
         return super.locale;
      }
      
      public function get fullTotalPercentage() : int
      {
         return Math.floor(totalPercentage * 100);
      }
      
      public function get isOpen() : Boolean
      {
         return applyOpen;
      }
      
      public function get emblemSettings() : GuildEmblemSettings
      {
         if(_emblemSettings == null)
         {
            _emblemSettings = GuildEmblemSettings.fromGuildSearchResult(this);
         }
         return _emblemSettings;
      }
   }
}
