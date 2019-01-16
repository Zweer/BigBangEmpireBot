package com.playata.application.data.titles
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CEventQuest;
   import com.playata.application.data.goal.Goal;
   import com.playata.application.data.goal.GoalValue;
   import com.playata.application.data.goal.Goals;
   import com.playata.application.data.item_pattern.ItemPattern;
   import com.playata.application.data.item_pattern.ItemPatternValue;
   import com.playata.application.data.item_pattern.ItemPatterns;
   import com.playata.application.data.marriage.Marriage;
   import com.playata.application.data.marriage.Marriages;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.data.DataObject;
   import com.playata.framework.localization.LocText;
   
   public class Title extends DataObject
   {
       
      
      private var _identifier:String;
      
      private var _isNew:Boolean;
      
      public function Title(param1:String, param2:Object = null)
      {
         _identifier = param1;
         super(param2);
      }
      
      public function get identifier() : String
      {
         return _identifier;
      }
      
      public function set identifier(param1:String) : void
      {
         _identifier = param1;
      }
      
      public function get index() : int
      {
         return getInt("index");
      }
      
      public function getNameWithTitle(param1:String) : String
      {
         return LocText.current.text("character/name_with_title",param1,title);
      }
      
      public function get source() : int
      {
         return getInt("source");
      }
      
      public function get tooltipSource() : String
      {
         var _loc4_:* = null;
         switch(int(source) - 1)
         {
            case 0:
               var _loc10_:int = 0;
               var _loc9_:* = Goals.instance.goals;
               for each(var _loc2_ in Goals.instance.goals)
               {
                  var _loc8_:int = 0;
                  var _loc7_:* = _loc2_.values;
                  for each(var _loc1_ in _loc2_.values)
                  {
                     if(_loc1_.rewardTitle == identifier)
                     {
                        return LocText.current.text("title/source/goal/tooltip",_loc1_.title);
                     }
                  }
               }
               return "";
            case 1:
               return LocText.current.text("title/source/shop/tooltip");
            case 2:
               return LocText.current.text("title/source/secret/tooltip");
            case 3:
               var _loc14_:int = 0;
               var _loc13_:* = ItemPatterns.instance.itemPatterns;
               for each(var _loc5_ in ItemPatterns.instance.itemPatterns)
               {
                  var _loc12_:int = 0;
                  var _loc11_:* = _loc5_.values;
                  for each(var _loc3_ in _loc5_.values)
                  {
                     if(_loc3_.rewardTitle == identifier)
                     {
                        return LocText.current.text("title/source/item_pattern/tooltip",_loc5_.title);
                     }
                  }
               }
               return "";
            case 4:
               return LocText.current.text("title/source/movie_tournament/tooltip");
            case 5:
               var _loc16_:int = 0;
               var _loc15_:* = CEventQuest.ids;
               for each(var _loc6_ in CEventQuest.ids)
               {
                  _loc4_ = CEventQuest.fromId(_loc6_);
                  if(_loc4_.rewardTitleId == identifier)
                  {
                     return LocText.current.text("title/source/event_quest/tooltip",LocText.current.text("event_quest/" + _loc6_ + "/name"));
                  }
               }
               return "";
            case 6:
               return LocText.current.text("title/source/marriage/tooltip");
         }
      }
      
      public function get infoSource() : String
      {
         switch(int(source) - 1)
         {
            case 0:
               return LocText.current.text("title/source/goal/info");
            case 1:
               return LocText.current.text("title/source/shop/info");
            case 2:
               return LocText.current.text("title/source/secret/info");
            case 3:
               return LocText.current.text("title/source/item_pattern/info");
            case 4:
               return LocText.current.text("title/source/movie_tournament/info");
            case 5:
               return LocText.current.text("title/source/event_quest/info");
            case 6:
               return LocText.current.text("title/source/marriage/info");
         }
      }
      
      public function get title() : String
      {
         var _loc4_:String = identifier;
         var _loc2_:Marriage = null;
         var _loc3_:int = 0;
         if(identifier.indexOf("title_marriage") >= 0)
         {
            _loc3_ = parseInt(identifier.substr(15));
            _loc4_ = identifier.substr(0,14);
            _loc2_ = Marriages.instance.getMarriageWithId(_loc3_);
         }
         var _loc1_:String = LocText.current.text("title/" + _loc4_ + "/name");
         if(_loc3_ > 0)
         {
            if(_loc2_ != null)
            {
               _loc1_ = StringUtil.replace(_loc1_,"[NAME]",_loc2_.otherCharacterName);
               _loc1_ = StringUtil.replace(_loc1_,"[name]",_loc2_.otherCharacterName);
            }
            else
            {
               _loc1_ = StringUtil.replace(_loc1_,"[NAME]",LocText.current.text("general/character_deleted"));
               _loc1_ = StringUtil.replace(_loc1_,"[name]",LocText.current.text("general/character_deleted"));
            }
         }
         return _loc1_;
      }
      
      public function isCurrentTitle(param1:Character) : Boolean
      {
         if(!param1.hasTitle(this))
         {
            return false;
         }
         return param1.getString("title") == identifier;
      }
      
      public function dateCollected(param1:Character) : String
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(identifier.indexOf("title_marriage") >= 0)
         {
            _loc2_ = parseInt(identifier.substr(15));
            _loc3_ = Marriages.instance.getMarriageWithId(_loc2_);
            return AppDateTime.timestampToLocalString(_loc3_.tsCreation,AppDateTime.dateFormat);
         }
         return param1.titleCollectedDate(this);
      }
      
      public function infoCollectedDate(param1:Character) : String
      {
         return LocText.current.text("title/collected/info",dateCollected(param1));
      }
      
      public function tooltipCollected(param1:Character) : String
      {
         return LocText.current.text("title/collected/tooltip",tooltipSource,dateCollected(param1));
      }
      
      public function get isNew() : Boolean
      {
         return _isNew;
      }
      
      public function set isNew(param1:Boolean) : void
      {
         _isNew = param1;
      }
   }
}
