package com.playata.application.data.guild
{
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
         var _loc1_:String = "";
         var _loc2_:int = LocText.current.gender;
         var _loc3_:String = characterName;
         if(!selfTriggered && characterName)
         {
            if(characterId > 0)
            {
               _loc3_ = "<a href=\'event:character;" + characterId + "\'>" + characterName + "</a>";
            }
            else
            {
               _loc3_ = characterName;
            }
         }
         if(characterLevel > 0)
         {
            _loc3_ = _loc3_ + (" (" + LocText.current.text("general/level_general_tooltip",characterLevel) + ")");
         }
         LocText.current.gender = characterLocGender;
         switch(int(type) - 501)
         {
            case 0:
               _loc1_ = LocText.current.text("guild/event/slotmachine_reward_game_currency",_loc3_,LocText.current.formatHugeNumber(parseInt(value1)),"(notes)");
               break;
            case 1:
               _loc1_ = LocText.current.text("guild/event/slotmachine_reward_item",_loc3_,value1);
               break;
            case 2:
               _loc1_ = LocText.current.text("guild/event/slotmachine_reward_booster",_loc3_,value1);
               break;
            case 3:
               _loc1_ = LocText.current.text("guild/event/slotmachine_reward_stat_points",_loc3_,value1,"(statpoint)");
               break;
            case 4:
               _loc1_ = LocText.current.text("guild/event/slotmachine_reward_xp",_loc3_,LocText.current.formatHugeNumber(parseInt(value1)),"(level)");
               break;
            case 5:
               _loc1_ = LocText.current.text("guild/event/slotmachine_reward_energy",_loc3_,value1,"(energy)");
         }
         LocText.current.gender = _loc2_;
         return _loc1_;
      }
      
      public function equal(param1:Object) : Boolean
      {
         return timestamp == param1.timestamp as int && characterId == param1.character_id as int && type == param1.type as int && value1 == param1.value1 as String;
      }
   }
}
