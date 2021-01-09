package com.playata.application.data.event
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CEventQuest;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.localization.LocText;
   
   public class EventQuestObjective
   {
       
      
      private var _eventQuest:EventQuest = null;
      
      private var _identifier:String;
      
      public function EventQuestObjective(param1:EventQuest, param2:String)
      {
         super();
         _eventQuest = param1;
         _identifier = param2;
      }
      
      public function get identifier() : String
      {
         return _identifier;
      }
      
      public function get index() : int
      {
         return CEventQuest.fromId(_eventQuest.identifier).getObjective(identifier).index;
      }
      
      public function get type() : int
      {
         return CEventQuest.fromId(_eventQuest.identifier).getObjective(identifier).type;
      }
      
      public function get reference() : String
      {
         return CEventQuest.fromId(_eventQuest.identifier).getObjective(identifier).reference;
      }
      
      public function get value() : int
      {
         return CEventQuest.fromId(_eventQuest.identifier).getObjective(identifier).value;
      }
      
      public function get rewardType() : int
      {
         return CEventQuest.fromId(_eventQuest.identifier).getObjective(identifier).rewardType;
      }
      
      public function get genericRewardType() : int
      {
         switch(int(rewardType) - 1)
         {
            case 0:
               return 1;
            case 1:
               return 0;
            case 2:
               return 4;
            case 3:
               return 2;
            case 4:
               return 5;
         }
      }
      
      public function get rewardFactor() : Number
      {
         return CEventQuest.fromId(_eventQuest.identifier).getObjective(identifier).rewardFactor;
      }
      
      public function get rewardReference() : String
      {
         return CEventQuest.fromId(_eventQuest.identifier).getObjective(identifier).rewardReference;
      }
      
      public function get rewardItem() : Item
      {
         return _eventQuest.getObjectiveItemRewardByIndex(index);
      }
      
      public function get isCollectable() : Boolean
      {
         return currentValue == value;
      }
      
      public function get isCollected() : Boolean
      {
         return currentValue > value;
      }
      
      public function get name() : String
      {
         return LocText.current.text("event_quest/objective/" + identifier + "/name");
      }
      
      public function get progressText() : String
      {
         return LocText.current.formatHugeNumber(Math.min(currentValue,value)) + "/" + LocText.current.formatHugeNumber(value);
      }
      
      public function get shortDescription() : String
      {
         return getValueText("event_quest/objective/" + identifier + "/progress");
      }
      
      public function get longDescription() : String
      {
         return getValueText("event_quest/objective/" + identifier + "/description");
      }
      
      public function getValueText(param1:String) : String
      {
         var _loc2_:String = LocText.current.text(param1);
         var _loc4_:String = null;
         var _loc3_:int = 0;
         var _loc5_:String = null;
         if(_loc2_.indexOf("[v:<target_value>") != -1)
         {
            _loc4_ = LocText.current.getParameterString(_loc2_,1,"<target_value>");
            _loc3_ = value;
            _loc5_ = LocText.current.getPluralForm(_loc4_,_loc3_,LocText.current.formatHugeNumber(_loc3_));
            _loc2_ = StringUtil.replace(_loc2_,_loc4_,_loc5_);
         }
         else
         {
            _loc2_ = StringUtil.replace(_loc2_,"<target_value>",LocText.current.formatHugeNumber(value));
         }
         if(_loc2_.indexOf("[v:<progress_value>") != -1)
         {
            _loc4_ = LocText.current.getParameterString(_loc2_,1,"<progress_value>");
            _loc3_ = Math.min(currentValue,value);
            _loc5_ = LocText.current.getPluralForm(_loc4_,_loc3_,LocText.current.formatHugeNumber(_loc3_));
            _loc2_ = StringUtil.replace(_loc2_,_loc4_,_loc5_);
         }
         _loc2_ = StringUtil.replace(_loc2_,"<progress_value>",LocText.current.formatHugeNumber(Math.min(currentValue,value)));
         return _loc2_;
      }
      
      public function get currentValue() : int
      {
         return _eventQuest.getObjectiveValueByIndex(index);
      }
      
      public function get progressValue() : int
      {
         return Math.round(currentValue / value * 100);
      }
      
      public function get progress() : Number
      {
         return currentValue / value;
      }
      
      public function get iconImageUrl() : String
      {
         return ServerInfo.assetURL("event_quest_objectives/" + identifier + "_i","png");
      }
      
      public function get rewardText() : String
      {
         var _loc1_:int = GameUtil.getEventQuestObjectiveRewardAmount(rewardType,rewardFactor,User.current.character.level);
         switch(int(rewardType) - 1)
         {
            case 0:
               return GameUtil.getGameCurrencyString(_loc1_);
            case 1:
               return GameUtil.getPremiumCurrencyString(_loc1_);
            case 2:
               return GameUtil.getStatPointString(_loc1_);
            case 3:
               return GameUtil.getXpString(_loc1_);
            case 4:
               return LocText.current.text("general/item_reward_text");
         }
      }
      
      public function get isPremiumCurrencyReward() : Boolean
      {
         return rewardType == 2;
      }
      
      public function get isGameCurrencyReward() : Boolean
      {
         return rewardType == 1;
      }
      
      public function get isXpReward() : Boolean
      {
         return rewardType == 4;
      }
      
      public function get isStatPointReward() : Boolean
      {
         return rewardType == 3;
      }
      
      public function get isItemReward() : Boolean
      {
         return rewardType == 5;
      }
   }
}
