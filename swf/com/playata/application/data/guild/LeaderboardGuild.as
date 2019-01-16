package com.playata.application.data.guild
{
   import com.playata.application.data.dataobject.DOLeaderboardGuild;
   import com.playata.application.data.user.User;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.TypedObject;
   
   public class LeaderboardGuild extends DOLeaderboardGuild
   {
       
      
      private var _emblemSettings:GuildEmblemSettings = null;
      
      public function LeaderboardGuild(param1:DOLeaderboardGuild)
      {
         super(param1);
      }
      
      public function get name() : String
      {
         var _loc1_:String = n;
         if(_loc1_.indexOf("___") != -1)
         {
            _loc1_ = _loc1_.substr(_loc1_.indexOf("___") + 3);
         }
         return _loc1_;
      }
      
      public function get isMyGuild() : Boolean
      {
         if(!User.current.character.hasGuild)
         {
            return false;
         }
         return User.current.character.guild.id == id;
      }
      
      public function get emblemBackgroundShapeId() : int
      {
         return ebs;
      }
      
      public function get emblemBackgroundColorIndex() : int
      {
         return ebc;
      }
      
      public function get emblemBackgroundBorderColorIndex() : int
      {
         return ebbc;
      }
      
      public function get emblemIconShapeId() : int
      {
         return eis;
      }
      
      public function get emblemIconColorIndex() : int
      {
         return eic;
      }
      
      public function get emblemIconSize() : int
      {
         return eiz;
      }
      
      public function get rank() : int
      {
         return r;
      }
      
      public function get tournamentValue() : int
      {
         return v;
      }
      
      public function get honor() : int
      {
         return h;
      }
      
      public function get totalPercentage() : Number
      {
         return tp;
      }
      
      public function get fans() : int
      {
         return f;
      }
      
      public function get movies() : int
      {
         return m;
      }
      
      public function get artifactIds() : Vector.<int>
      {
         var _loc1_:Vector.<int> = new Vector.<int>();
         var _loc2_:String = ga;
         if(!_loc2_ || _loc2_ == "[]")
         {
            return _loc1_;
         }
         var _loc3_:TypedObject = TypedObject.fromJsonString(_loc2_);
         return _loc3_.valuesAsInt;
      }
      
      public function get hasArtifacts() : Boolean
      {
         var _loc1_:String = ga;
         if(!_loc1_ || _loc1_ == "[]")
         {
            return false;
         }
         return true;
      }
      
      public function get hasActiveDefense() : Boolean
      {
         return gbd > 0;
      }
      
      public function get acceptMembers() : Boolean
      {
         return am;
      }
      
      public function get isOpen() : Boolean
      {
         return ao;
      }
      
      public function get emblemSettings() : GuildEmblemSettings
      {
         if(_emblemSettings == null)
         {
            _emblemSettings = GuildEmblemSettings.fromLeaderboardGuild(this);
         }
         return _emblemSettings;
      }
      
      public function get locale() : String
      {
         if(l == "")
         {
            return Environment.info.defaultLocale;
         }
         return l;
      }
   }
}
