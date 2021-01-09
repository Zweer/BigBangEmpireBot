package com.playata.application
{
   import com.playata.framework.core.Core;
   import com.playata.framework.core.TypedObject;
   
   public final class AppConfig
   {
       
      
      public function AppConfig()
      {
         super();
      }
      
      public static function get gameId() : String
      {
         return Core.config.getString("game_id");
      }
      
      public static function get serverId() : String
      {
         return Core.config.getString("server_id");
      }
      
      public static function get applicationTitle() : String
      {
         return Core.config.getString("applicationTitle");
      }
      
      public static function get appName() : String
      {
         return Core.config.getString("applicationTitle");
      }
      
      public static function get currentVersionMobile() : int
      {
         return Core.config.getInt("current_version_mobile");
      }
      
      public static function get urlRequestServer() : String
      {
         return Core.config.getString("urlRequestServer");
      }
      
      public static function get urlDomain() : String
      {
         return Core.config.getString("url_domain");
      }
      
      public static function get urlPublic() : String
      {
         return Core.config.getString("urlPublic");
      }
      
      public static function get urlPlatformRequest() : String
      {
         return Core.config.getString("urlPlatformRequest");
      }
      
      public static function get urlChangelog() : String
      {
         return Core.config.getString("url_changelog");
      }
      
      public static function get urlFacebook() : String
      {
         return Core.config.getString("url_facebook");
      }
      
      public static function get registrationSource() : String
      {
         return Core.config.getString("registrationSource");
      }
      
      public static function get urlForumTeams() : String
      {
         return Core.config.getString("url_forum_teams");
      }
      
      public static function get urlForum() : String
      {
         return Core.config.getString("url_forum");
      }
      
      public static function get urlSupport() : String
      {
         return Core.config.getString("url_support");
      }
      
      public static function get urlAppRating() : String
      {
         return Core.config.getString("url_app_rating");
      }
      
      public static function get urlToS() : String
      {
         return Core.config.getString("url_tos");
      }
      
      public static function get urlToSUgc() : String
      {
         return Core.config.getString("url_tos_ugc");
      }
      
      public static function get urlPolicy() : String
      {
         return Core.config.getString("url_policy");
      }
      
      public static function get urlSwfMain() : String
      {
         return Core.config.getString("urlSwfMain");
      }
      
      public static function get urlSwfCharacter() : String
      {
         return Core.config.getString("urlSwfCharacter");
      }
      
      public static function get urlSwfUi() : String
      {
         return Core.config.getString("urlSwfUi");
      }
      
      public static function get urlSwfMovieCover() : String
      {
         return Core.config.getString("urlSwfMovieCover");
      }
      
      public static function get urlStorePlayata() : String
      {
         return Core.config.getString("urlStorePlayata");
      }
      
      public static function get localeVersion() : String
      {
         return Core.config.getString("localeVersion");
      }
      
      public static function get constantsVersion() : String
      {
         return Core.config.getString("constantsVersion");
      }
      
      public static function get dungeonsEnabled() : Boolean
      {
         return Core.config.getBoolean("dungeons_enabled");
      }
      
      public static function get titlesEnabled() : Boolean
      {
         return Core.config.getBoolean("titles_enabled");
      }
      
      public static function get itemsetsEnabled() : Boolean
      {
         return Core.config.getBoolean("itemsets_enabled");
      }
      
      public static function get customGuildBackgroundsEnabled() : Boolean
      {
         return Core.config.getBoolean("custom_guild_backgrounds_enabled");
      }
      
      public static function get fanFotoEnabled() : Boolean
      {
         return Core.config.getBoolean("fan_foto_enabled");
      }
      
      public static function get battleSkillsEnabled() : Boolean
      {
         return Core.config.getBoolean("battle_skills_enabled");
      }
      
      public static function get multitaskingBoosterEnabled() : Boolean
      {
         return Core.config.getBoolean("multitasking_booster_enabled");
      }
      
      public static function get movieTournamentsEnabled() : Boolean
      {
         return Core.config.getBoolean("movie_tournaments_enabled");
      }
      
      public static function get hidePantiesAllowed() : Boolean
      {
         return Core.config.getBoolean("hide_panties_allowed");
      }
      
      public static function get datingEnabled() : Boolean
      {
         return Core.config.getBoolean("dating_enabled");
      }
      
      public static function get isFriendbarSupported() : Boolean
      {
         return Core.config.getBoolean("isFriendbarSupported");
      }
      
      public static function get emoticonsEnabled() : Boolean
      {
         return Core.config.getBoolean("emoticons_enabled");
      }
      
      public static function get blockRegistration() : Boolean
      {
         return Core.config.getBoolean("blockRegistration");
      }
      
      public static function get registrationEnabled() : Boolean
      {
         return Core.config.getBoolean("registration_enabled");
      }
      
      public static function get videoAdvertismentEnabled() : Boolean
      {
         return Core.config.getBoolean("video_advertisment_enabled");
      }
      
      public static function get videoAdvertismentCooldownTooltipEnabled() : Boolean
      {
         return Core.config.getBoolean("video_advertisment_cooldown_tooltip_enabled");
      }
      
      public static function get secureRequestsEnabled() : Boolean
      {
         return Core.config.getBoolean("secure_requests_enabled");
      }
      
      public static function get teamLocaleEnabled() : Boolean
      {
         return Core.config.getBoolean("team_locale_enabled");
      }
      
      public static function get dailyBonusHerobookEnabled() : Boolean
      {
         return Core.config.getBoolean("daily_bonus_herobook_enabled");
      }
      
      public static function get dailyBonusDuelEnabled() : Boolean
      {
         return Core.config.getBoolean("daily_bonus_duel_enabled");
      }
      
      public static function get dailyBonusQuestEnergyEnabled() : Boolean
      {
         return Core.config.getBoolean("daily_bonus_quest_energy_enabled");
      }
      
      public static function get specialOfferShopEnabled() : Boolean
      {
         return Core.config.getBoolean("special_offer_shop_enabled");
      }
      
      public static function get offerwallEnabled() : Boolean
      {
         return Core.config.getBoolean("offerwall_enabled");
      }
      
      public static function get locales() : Vector.<String>
      {
         return Core.config.getStringVector("locales");
      }
      
      public static function get localeMap() : TypedObject
      {
         return Core.config.getTypedObject("locale_map");
      }
      
      public static function get localeNames() : TypedObject
      {
         return Core.config.getTypedObject("locale_names");
      }
      
      public static function get localeCountryNames() : TypedObject
      {
         return Core.config.getTypedObject("locale_country_names");
      }
      
      public static function get alternativeLocales() : Vector.<String>
      {
         return Core.config.getStringVector("alternative_locales");
      }
      
      public static function get paymentAlternativeLocales() : Vector.<String>
      {
         return Core.config.getStringVector("payment_alternative_locales");
      }
      
      public static function get streamingEnabled() : Boolean
      {
         return Core.config.getBoolean("streaming_enabled");
      }
      
      public static function get userStoryQuestsEnabled() : Boolean
      {
         if(!AppEnvironment.appPlatform.isPlayata)
         {
            return false;
         }
         return Core.config.getBoolean("user_story_quests_enabled");
      }
      
      public static function get userStoryIsGlobal() : Boolean
      {
         return Core.config.getBoolean("user_story_is_global");
      }
      
      public static function get userStoryLocales() : Vector.<String>
      {
         return Core.config.getStringVector("user_story_locales");
      }
   }
}
