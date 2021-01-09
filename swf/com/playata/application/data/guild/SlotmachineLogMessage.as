package com.playata.application.data.guild
{
   import com.playata.application.data.item.LinkedBooster;
   import com.playata.application.data.item.LinkedItem;
   import com.playata.application.ui.elements.guild.UiGuildChatTab;
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
         var _loc4_:Boolean = false;
         var _loc6_:* = null;
         var _loc2_:Boolean = false;
         var _loc3_:* = null;
         var _loc1_:String = "";
         var _loc7_:int = LocText.current.gender;
         var _loc8_:String = characterName;
         if(!selfTriggered && characterName)
         {
            if(characterId > 0)
            {
               _loc8_ = "<a href=\'event:character;" + characterId + "\'>" + characterName + "</a>";
            }
            else
            {
               _loc8_ = characterName;
            }
         }
         if(characterLevel > 0)
         {
            _loc8_ = _loc8_ + (" (" + LocText.current.text("general/level_general_tooltip",characterLevel) + ")");
         }
         LocText.current.gender = characterLocGender;
         var _loc5_:String = null;
         switch(int(type) - 501)
         {
            case 0:
               _loc1_ = LocText.current.text("guild/event/slotmachine_reward_game_currency",_loc8_,LocText.current.formatHugeNumber(parseInt(value1)),"(notes)");
               break;
            case 1:
               _loc4_ = true;
               if(_loc4_)
               {
                  _loc1_ = LocText.current.text("guild/event/slotmachine_reward_item",_loc8_,value1);
               }
               else if(UiGuildChatTab.ITEM_PATTERN.test(value1))
               {
                  _loc5_ = UiGuildChatTab.ITEM_PATTERN.exec(value1);
                  _loc6_ = new LinkedItem(_loc5_);
                  _loc1_ = LocText.current.text("guild/event/slotmachine_reward_item",_loc8_,_loc6_.name);
               }
               else
               {
                  _loc1_ = "";
               }
               break;
            case 2:
               _loc2_ = true;
               if(_loc2_)
               {
                  _loc1_ = LocText.current.text("guild/event/slotmachine_reward_booster",_loc8_,value1);
               }
               else if(UiGuildChatTab.BOOSTER_Pattern.test(value1))
               {
                  _loc5_ = UiGuildChatTab.BOOSTER_Pattern.exec(value1);
                  _loc3_ = new LinkedBooster(_loc5_);
                  _loc1_ = LocText.current.text("guild/event/slotmachine_reward_booster",_loc8_,_loc3_.rewardName);
               }
               else
               {
                  _loc1_ = "";
               }
               break;
            case 3:
               _loc1_ = LocText.current.text("guild/event/slotmachine_reward_stat_points",_loc8_,value1,"(statpoint)");
               break;
            case 4:
               _loc1_ = LocText.current.text("guild/event/slotmachine_reward_xp",_loc8_,LocText.current.formatHugeNumber(parseInt(value1)),"(level)");
               break;
            case 5:
               _loc1_ = LocText.current.text("guild/event/slotmachine_reward_energy",_loc8_,value1,"(energy)");
         }
         LocText.current.gender = _loc7_;
         return _loc1_;
      }
      
      public function equal(param1:Object) : Boolean
      {
         return timestamp == param1.timestamp as int && characterId == param1.character_id as int && type == param1.type as int && value1 == param1.value1 as String;
      }
   }
}
