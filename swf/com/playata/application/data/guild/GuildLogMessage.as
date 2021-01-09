package com.playata.application.data.guild
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.item.LinkedBooster;
   import com.playata.application.data.item.LinkedGuildBooster;
   import com.playata.application.data.item.LinkedItem;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.guild.UiGuildChatTab;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.data.DataObject;
   import com.playata.framework.localization.LocText;
   
   public class GuildLogMessage extends DataObject
   {
       
      
      private var _id:String = null;
      
      public function GuildLogMessage(param1:Object = null, param2:String = null)
      {
         _id = param2;
         super(param1);
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function get logId() : String
      {
         var _loc1_:String = id;
         if(_loc1_.indexOf("_") != -1)
         {
            _loc1_ = _loc1_.substring(_loc1_.indexOf("_") + 1);
         }
         if(isEvent)
         {
            _loc1_ = "event" + _loc1_;
         }
         else
         {
            _loc1_ = "chat" + _loc1_;
         }
         return _loc1_;
      }
      
      public function get isEvent() : Boolean
      {
         return hasData("type");
      }
      
      public function get isPrivateMessage() : Boolean
      {
         if(isEvent)
         {
            return false;
         }
         return getInt("is_private") == 1;
      }
      
      public function get isOfficerMessage() : Boolean
      {
         if(isEvent)
         {
            return false;
         }
         return getInt("is_officer") == 1;
      }
      
      public function get isEmote() : Boolean
      {
         if(isEvent)
         {
            return false;
         }
         return getString("message").toLowerCase().indexOf("/me") == 0;
      }
      
      public function get timestamp() : int
      {
         return getInt("timestamp");
      }
      
      public function get characterId() : int
      {
         if(isEvent)
         {
            return getInt("character_id");
         }
         if(hasData("character_from_id"))
         {
            return getInt("character_from_id");
         }
         return -1;
      }
      
      public function get characterName() : String
      {
         if(isEvent)
         {
            return getString("character_name");
         }
         return getString("character_from_name");
      }
      
      public function get characterLocGender() : int
      {
         var _loc2_:String = characterName;
         if(!_loc2_)
         {
            return 1;
         }
         var _loc1_:GuildMember = User.current.character.guild.getMember(_loc2_);
         if(!_loc1_)
         {
            return 1;
         }
         return !!_loc1_.isMale?1:2;
      }
      
      public function get type() : int
      {
         if(!isEvent)
         {
            return 0;
         }
         return getInt("type");
      }
      
      public function get value1() : String
      {
         if(!isEvent)
         {
            return null;
         }
         return getString("value1");
      }
      
      public function get value2() : String
      {
         if(!isEvent)
         {
            return null;
         }
         return getString("value2");
      }
      
      public function get value3() : String
      {
         if(!isEvent)
         {
            return null;
         }
         return getString("value3");
      }
      
      public function get dateTime() : String
      {
         return AppDateTime.getPassedShortFormattedTimestamp(timestamp);
      }
      
      public function get selfTriggered() : Boolean
      {
         return characterName == User.current.character.name;
      }
      
      public function get message() : String
      {
         var _loc5_:* = null;
         var _loc9_:* = null;
         var _loc1_:int = 0;
         var _loc10_:* = null;
         var _loc15_:* = null;
         var _loc11_:int = 0;
         var _loc13_:int = 0;
         var _loc2_:Boolean = false;
         var _loc4_:* = null;
         var _loc7_:Boolean = false;
         var _loc8_:* = null;
         var _loc6_:String = "";
         var _loc12_:int = LocText.current.gender;
         var _loc14_:String = characterName;
         if(!selfTriggered && characterName)
         {
            if(User.current.character.guild.getMember(characterName,true) != null)
            {
               _loc14_ = "<a href=\'event:whisper;" + characterName + "\'>" + characterName + "</a>";
            }
            else if(characterId > 0)
            {
               _loc14_ = "<a href=\'event:character;" + characterId + "\'>" + characterName + "</a>";
            }
            else
            {
               _loc14_ = characterName;
            }
         }
         var _loc3_:String = null;
         if(!isEvent)
         {
            _loc5_ = getString("message");
            LocText.current.gender = characterLocGender;
            while(UiGuildChatTab.CHARACTER_ID_Pattern.test(_loc5_))
            {
               _loc3_ = UiGuildChatTab.CHARACTER_ID_Pattern.exec(_loc5_);
               _loc5_ = _loc5_.replace(_loc3_,getCharacterLinkFromPattern(_loc3_));
            }
            while(UiGuildChatTab.GUILD_ID_Pattern.test(_loc5_))
            {
               _loc3_ = UiGuildChatTab.GUILD_ID_Pattern.exec(_loc5_);
               _loc5_ = _loc5_.replace(_loc3_,getGuildLinkFromPattern(_loc3_));
            }
            if(_loc5_.toLowerCase().indexOf(UiGuildChatTab.CHAT_COMMAND_EMOTE + " ") == 0)
            {
               _loc5_ = _loc14_ + _loc5_.substr(UiGuildChatTab.CHAT_COMMAND_EMOTE.length);
               _loc6_ = LocText.current.text("guild/chat_message_emote_format",dateTime,_loc5_);
            }
            else if(isPrivateMessage)
            {
               _loc9_ = User.current.character.name;
               if(hasData("character_to_id"))
               {
                  _loc1_ = getInt("character_to_id");
                  if(_loc1_ != User.current.character.id)
                  {
                     _loc10_ = User.current.character.guild.getMemberById(_loc1_);
                     if(_loc10_)
                     {
                        _loc9_ = "<a href=\'event:whisper;" + _loc10_.name + "\'>" + _loc10_.name + "</a>";
                     }
                     else
                     {
                        _loc9_ = "-";
                     }
                  }
               }
               _loc6_ = LocText.current.text("guild/chat_message_private_format",dateTime,_loc14_,_loc9_,_loc5_);
            }
            else if(isOfficerMessage)
            {
               _loc6_ = LocText.current.text("guild/chat_message_officer_format",dateTime,_loc14_,_loc5_);
            }
            else
            {
               _loc6_ = LocText.current.text("guild/chat_message_format",dateTime,_loc14_,_loc5_);
            }
            LocText.current.gender = _loc12_;
            return _loc6_;
         }
         LocText.current.gender = characterLocGender;
         var _loc16_:* = type;
         switch(_loc16_)
         {
            case 1:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/member_joined",_loc14_));
               break;
            case 2:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/member_left",_loc14_));
               break;
            case 3:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/member_kicked",_loc14_,getCharacterLink(parseInt(value1),value2)));
               break;
            case 4:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/member_new_rank",_loc14_,getCharacterLink(parseInt(value1),value2),Guild.getRankName(parseInt(value3))));
               break;
            case 5:
               _loc15_ = "";
               _loc11_ = parseInt(value1);
               _loc13_ = parseInt(value2);
               if(_loc11_ > 0 && _loc13_ > 0)
               {
                  _loc15_ = LocText.current.text("guild/event_coins_and_premium_currency",GameUtil.getGameCurrencyString(_loc11_),GameUtil.getPremiumCurrencyString(_loc13_));
               }
               else if(_loc11_ > 0)
               {
                  _loc15_ = GameUtil.getGameCurrencyString(_loc11_);
               }
               else if(_loc13_ > 0)
               {
                  _loc15_ = GameUtil.getPremiumCurrencyString(_loc13_);
               }
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/member_donated",_loc14_,_loc15_));
               break;
            case 6:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/guild_stat_changed",_loc14_,Guild.getStatName(parseInt(value1)),value2));
               break;
            case 7:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/guild_description_changed",_loc14_));
               break;
            case 8:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/guild_note_changed",_loc14_));
               break;
            case 9:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/guild_emblem_changed",_loc14_));
               break;
            case 10:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/guild_member_deleted",_loc14_));
               break;
            case 11:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/guild_missiles_recharged",_loc14_,GameUtil.getGuildMissileString(parseInt(value1))));
               break;
            case 12:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/guild_name_changed",_loc14_,value1));
               break;
            case 13:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/guild_arena_changed",_loc14_));
               break;
            case 14:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/auto_joins_recharged",_loc14_,parseInt(value1)));
               break;
            case 15:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/artifact_released",_loc14_,new GuildArtifact(parseInt(value1)).name));
               break;
            case 16:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/guild_locale_changed",_loc14_,AppConfig.localeNames.getString(value1)));
               break;
            case 17:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/guild_officer_note_changed",_loc14_));
               break;
            case 101:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/guild_battle_attack",_loc14_,getGuildLink(parseInt(value1),value2),AppDateTime.getDateTimeString(TimeUtil.localDateTime,parseInt(value3),2)));
               break;
            case 102:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/guild_battle_defense",getGuildLink(parseInt(value1),value2),AppDateTime.getDateTimeString(TimeUtil.localDateTime,parseInt(value3),2)));
               break;
            case 105:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/guild_battle_won",getGuildLink(parseInt(value1),value2),AppDateTime.getDateTimeString(TimeUtil.localDateTime,parseInt(value3),2)));
               break;
            case 106:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/guild_battle_lost",getGuildLink(parseInt(value1),value2),AppDateTime.getDateTimeString(TimeUtil.localDateTime,parseInt(value3),2)));
               break;
            case 107:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/guild_battle_artifact_won",new GuildArtifact(parseInt(value1)).name));
               break;
            case 108:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/guild_battle_artifact_lost",getGuildLink(parseInt(value1),value2),new GuildArtifact(parseInt(value3)).name));
               break;
            case 109:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/guild_battle_aborted_attack",getGuildLink(parseInt(value1),value2),AppDateTime.getDateTimeString(TimeUtil.localDateTime,parseInt(value3),2)));
               break;
            case 110:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/guild_battle_aborted_defense",getGuildLink(parseInt(value1),value2),AppDateTime.getDateTimeString(TimeUtil.localDateTime,parseInt(value3),2)));
               break;
            case 111:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/guild_battle_premium_currency_reward",GameUtil.getPremiumCurrencyString(parseInt(value1))));
               break;
            case 301:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/voteout_started",_loc14_,value1));
               break;
            case 302:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/voteout_ended_same",value1));
               break;
            case 303:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/voteout_ended_new",value1));
               break;
            case 401:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/guild_competition_finished",value1,value2));
               break;
            case 402:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/guild_competition_finished_no_rewards",value1));
               break;
            case 403:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/guild_competition_finished_no_rank",value1));
               break;
            case 501:
               if(AppConfig.emoticonsEnabled && User.current.showGuildEmoticons)
               {
                  _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/slotmachine_reward_game_currency",_loc14_,LocText.current.formatHugeNumber(parseInt(value1)),"(notes)"));
               }
               else
               {
                  _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/slotmachine_reward_item",_loc14_,GameUtil.getGameCurrencyString(parseInt(value1))));
               }
               break;
            case 502:
               _loc2_ = true;
               if(AppConfig.emoticonsEnabled && User.current.showGuildEmoticons && _loc2_)
               {
                  _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/slotmachine_reward_item",_loc14_,value1));
               }
               else if(UiGuildChatTab.ITEM_PATTERN.test(value1))
               {
                  _loc3_ = UiGuildChatTab.ITEM_PATTERN.exec(value1);
                  _loc4_ = new LinkedItem(_loc3_);
                  _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/slotmachine_reward_item",_loc14_,_loc4_.name));
               }
               else
               {
                  _loc6_ = "";
               }
               break;
            case 503:
               _loc7_ = true;
               if(AppConfig.emoticonsEnabled && User.current.showGuildEmoticons && _loc7_)
               {
                  _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/slotmachine_reward_booster",_loc14_,value1));
               }
               else if(UiGuildChatTab.BOOSTER_Pattern.test(value1))
               {
                  _loc3_ = UiGuildChatTab.BOOSTER_Pattern.exec(value1);
                  _loc8_ = new LinkedBooster(_loc3_);
                  _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/slotmachine_reward_booster",_loc14_,_loc8_.rewardName));
               }
               else
               {
                  _loc6_ = "";
               }
               break;
            case 504:
               if(AppConfig.emoticonsEnabled && User.current.showGuildEmoticons)
               {
                  _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/slotmachine_reward_stat_points",_loc14_,value1,"(statpoint)"));
               }
               else
               {
                  _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/slotmachine_reward_item",_loc14_,GameUtil.getStatPointString(parseInt(value1))));
               }
               break;
            case 505:
               if(AppConfig.emoticonsEnabled && User.current.showGuildEmoticons)
               {
                  _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/slotmachine_reward_xp",_loc14_,LocText.current.formatHugeNumber(parseInt(value1)),"(level)"));
               }
               else
               {
                  _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/slotmachine_reward_item",_loc14_,GameUtil.getXpString(parseInt(value1))));
               }
               break;
            case 506:
               if(AppConfig.emoticonsEnabled && User.current.showGuildEmoticons)
               {
                  _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/slotmachine_reward_energy",_loc14_,value1,"(energy)"));
               }
               else
               {
                  _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/slotmachine_reward_item",_loc14_,GameUtil.getEnergyString(parseInt(value1))));
               }
               break;
            case 601:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/booster_bought",_loc14_,getGuildBoosterText(value1)));
               break;
            case 602:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/booster_extended",_loc14_,getGuildBoosterText(value1)));
               break;
            case 603:
               _loc6_ = LocText.current.text("guild/event_message_format",dateTime,LocText.current.text("guild/event/booster_expired",getGuildBoosterText(value1)));
         }
         LocText.current.gender = _loc12_;
         return _loc6_;
      }
      
      public function get needGuildSync() : Boolean
      {
         return isEvent;
      }
      
      public function needMemberListSync(param1:Boolean) : Boolean
      {
         if(type == 103 && param1 === false)
         {
            return true;
         }
         if(type == 104 && param1 === false)
         {
            return true;
         }
         return false;
      }
      
      public function get needOutputDelay() : Boolean
      {
         if(type == 105 || type == 106)
         {
            return true;
         }
         return false;
      }
      
      public function process(param1:Boolean) : void
      {
         if(type == 103 && param1 === false)
         {
            GuildBattle.addJoinedAttackMembers(characterId);
         }
         if(type == 104 && param1 === false)
         {
            GuildBattle.addJoinedDefenseMembers(characterId);
         }
         if((type == 3 || type == 2 || type == 10) && param1 === false)
         {
            GuildBattle.removeJoinedAttackMembers(characterId);
            GuildBattle.removeJoinedDefenseMembers(characterId);
         }
      }
      
      private function getGuildBoosterText(param1:String) : String
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:Boolean = true;
         if(AppConfig.emoticonsEnabled && User.current.showGuildEmoticons && _loc2_)
         {
            return param1;
         }
         if(UiGuildChatTab.GUILD_BOOSTER_Pattern.test(value1))
         {
            _loc3_ = UiGuildChatTab.GUILD_BOOSTER_Pattern.exec(value1);
            _loc4_ = new LinkedGuildBooster(_loc3_);
            return _loc4_.eventLogText;
         }
         return param1;
      }
      
      private function getGuildLink(param1:int, param2:String) : String
      {
         return "<a href=\'event:guild;" + param1 + "\'>" + param2 + "</a>";
      }
      
      private function getCharacterLink(param1:int, param2:String) : String
      {
         return "<a href=\'event:character;" + param1 + "\'>" + param2 + "</a>";
      }
      
      private function getGuildLinkFromPattern(param1:String) : String
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc8_:* = null;
         var _loc3_:Array = param1.split(";");
         var _loc6_:int = 0;
         var _loc5_:* = "";
         var _loc11_:int = 0;
         var _loc10_:* = _loc3_;
         for each(var _loc7_ in _loc3_)
         {
            _loc2_ = _loc7_.split(":");
            _loc4_ = _loc2_[0];
            _loc8_ = _loc2_[1];
            var _loc9_:* = _loc4_;
            switch(_loc9_)
            {
               case "(gid":
                  _loc6_ = parseInt(_loc8_);
                  continue;
               case "name":
                  _loc5_ = _loc8_;
                  continue;
               default:
                  continue;
            }
         }
         return LocText.current.text("guild/chat_message_guild_link",getGuildLink(_loc6_,_loc5_));
      }
      
      private function getCharacterLinkFromPattern(param1:String) : String
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc8_:* = null;
         var _loc3_:Array = param1.split(";");
         var _loc6_:int = 0;
         var _loc5_:* = "";
         var _loc11_:int = 0;
         var _loc10_:* = _loc3_;
         for each(var _loc7_ in _loc3_)
         {
            _loc2_ = _loc7_.split(":");
            _loc4_ = _loc2_[0];
            _loc8_ = _loc2_[1];
            var _loc9_:* = _loc4_;
            switch(_loc9_)
            {
               case "(cid":
                  _loc6_ = parseInt(_loc8_);
                  continue;
               case "name":
                  _loc5_ = _loc8_;
                  continue;
               default:
                  continue;
            }
         }
         return LocText.current.text("guild/chat_message_character_link",getCharacterLink(_loc6_,_loc5_));
      }
   }
}
