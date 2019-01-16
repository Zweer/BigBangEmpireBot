package com.playata.application.ui.elements.guild
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.constants.CGuildBooster;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.guild_booster.SymbolGuildBoosterGeneric;
   
   public class UiGuildBoosterIcon
   {
       
      
      private var _container:SymbolGuildBoosterGeneric = null;
      
      private var _type:int = 0;
      
      private var _boosterId:String = null;
      
      private var _expirationTimestamp:int = 0;
      
      private var _tooltip:UiTextTooltip = null;
      
      public function UiGuildBoosterIcon(param1:SymbolGuildBoosterGeneric, param2:int)
      {
         super();
         _container = param1;
         _type = param2;
         _tooltip = new UiTextTooltip(_container,"");
      }
      
      public static function getExpirationDateTime(param1:int) : String
      {
         var _loc2_:String = "";
         if(TimeUtil.localDateTime.isToday(param1))
         {
            _loc2_ = LocText.current.text("general/date_time_format",LocText.current.text("general/today"),AppDateTime.timestampToLocalString(param1,LocText.current.text("general/time_format_hm"),true));
         }
         else if(TimeUtil.localDateTime.isTomorrow(param1))
         {
            _loc2_ = LocText.current.text("general/date_time_format",LocText.current.text("general/tomorrow"),AppDateTime.timestampToLocalString(param1,LocText.current.text("general/time_format_hm"),true));
         }
         else
         {
            _loc2_ = LocText.current.text("general/date_time_format",AppDateTime.timestampToLocalString(param1,AppDateTime.dateFormat),AppDateTime.timestampToLocalString(param1,LocText.current.text("general/time_format_hm"),true));
         }
         return _loc2_;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get boosterId() : String
      {
         return _boosterId;
      }
      
      public function get container() : SymbolGuildBoosterGeneric
      {
         return _container;
      }
      
      public function dispose() : void
      {
         _container = null;
         _tooltip.dispose();
         _tooltip = null;
      }
      
      public function refresh(param1:String, param2:int) : void
      {
         var _loc5_:* = null;
         _boosterId = param1;
         _expirationTimestamp = param2;
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc6_:String = UiGuildBoosterIcon.getExpirationDateTime(param2);
         if(_boosterId != "")
         {
            _loc5_ = CGuildBooster.fromId(_boosterId);
            _loc4_ = _loc5_.amount;
            _loc3_ = _loc5_.duration;
         }
         if(_expirationTimestamp != -1)
         {
            if(_expirationTimestamp < TimeUtil.now)
            {
               _loc4_ = 0;
            }
         }
         _container.type1Strength1.visible = _type == 1 && _loc4_ == 10;
         _container.type2Strength1.visible = _type == 2 && _loc4_ == 10;
         if(param2 == -1)
         {
            _tooltip.text = "";
            return;
         }
         switch(int(_type) - 1)
         {
            case 0:
               if(_loc4_ == 0)
               {
                  _tooltip.text = LocText.current.text("general/guild_boost_quest_tooltip");
               }
               else
               {
                  _tooltip.text = LocText.current.text("general/guild_boost_quest_active_tooltip",_loc4_,_loc6_);
               }
               break;
            case 1:
               if(_loc4_ == 0)
               {
                  _tooltip.text = LocText.current.text("general/guild_boost_duel_tooltip");
                  break;
               }
               _tooltip.text = LocText.current.text("general/guild_boost_duel_active_tooltip",_loc4_,_loc6_);
               break;
         }
      }
   }
}
