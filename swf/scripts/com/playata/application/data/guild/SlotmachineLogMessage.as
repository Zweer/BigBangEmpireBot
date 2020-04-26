package com.playata.application.data.guild
{
   import com.playata.application.data.item.LinkedBooster;
   import com.playata.application.data.item.LinkedItem;
   import com.playata.application.ui.elements.guild.UiGuildChatTab;
   import com.playata.framework.application.Environment;
   import com.playata.framework.localization.LocText;
   
   public class SlotmachineLogMessage extends GuildLogMessage
   {
       
      
      public function SlotmachineLogMessage(param1:Object = null, param2:String = null)
      {
         super(param1,param2);
      }
      
      override public function get characterLocGender() : int
      {
         return getString("character_gender") == "m"?1:2;
      }
      
      public function get characterLevel() : int
      {
         if(hasData("character_level"))
         {
            return getInt("character_level");
         }
         return 0;
      }
      
      override public function get message() : String
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc1_:String = "";
         var _loc5_:int = LocText.current.gender;
         var _loc6_:String = characterName;
         if(!selfTriggered && characterName)
         {
            if(characterId > 0)
            {
               _loc6_ = "<a href=\'event:character;" + characterId + "\'>" + characterName + "</a>";
            }
            else
            {
               _loc6_ = characterName;
            }
         }
         if(characterLevel > 0)
         {
            _loc6_ = _loc6_ + (" (" + LocText.current.text("general/level_general_tooltip",characterLevel) + ")");
         }
         LocText.current.gender = characterLocGender;
         var _loc3_:String = null;
         switch(int(type) - 501)
         {
            case 0:
               _loc1_ = LocText.current.text("guild/event/slotmachine_reward_game_currency",_loc6_,LocText.current.formatHugeNumber(parseInt(value1)),"(notes)");
               break;
            case 1:
               if(!Environment.info.isTouchScreen)
               {
                  _loc1_ = LocText.current.text("guild/event/slotmachine_reward_item",_loc6_,value1);
               }
               else if(UiGuildChatTab.ITEM_PATTERN.test(value1))
               {
                  _loc3_ = UiGuildChatTab.ITEM_PATTERN.exec(value1);
                  _loc4_ = new LinkedItem(_loc3_);
                  _loc1_ = LocText.current.text("guild/event/slotmachine_reward_item",_loc6_,_loc4_.name);
               }
               else
               {
                  _loc1_ = "";
               }
               break;
            case 2:
               if(!Environment.info.isTouchScreen)
               {
                  _loc1_ = LocText.current.text("guild/event/slotmachine_reward_booster",_loc6_,value1);
               }
               else if(UiGuildChatTab.BOOSTER_Pattern.test(value1))
               {
                  _loc3_ = UiGuildChatTab.BOOSTER_Pattern.exec(value1);
                  _loc2_ = new LinkedBooster(_loc3_);
                  _loc1_ = LocText.current.text("guild/event/slotmachine_reward_booster",_loc6_,_loc2_.rewardName);
               }
               else
               {
                  _loc1_ = "";
               }
               break;
            case 3:
               _loc1_ = LocText.current.text("guild/event/slotmachine_reward_stat_points",_loc6_,value1,"(statpoint)");
               break;
            case 4:
               _loc1_ = LocText.current.text("guild/event/slotmachine_reward_xp",_loc6_,LocText.current.formatHugeNumber(parseInt(value1)),"(level)");
               break;
            case 5:
               _loc1_ = LocText.current.text("guild/event/slotmachine_reward_energy",_loc6_,value1,"(energy)");
         }
         LocText.current.gender = _loc5_;
         return _loc1_;
      }
      
      public function equal(param1:Object) : Boolean
      {
         return timestamp == param1.timestamp as int && characterId == param1.character_id as int && type == param1.type as int && value1 == param1.value1 as String;
      }
   }
}
