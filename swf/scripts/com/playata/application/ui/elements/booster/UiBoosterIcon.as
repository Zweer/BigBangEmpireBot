package com.playata.application.ui.elements.booster
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CBooster;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.booster.SymbolBoosterGeneric;
   
   public class UiBoosterIcon extends InteractiveDisplayObject
   {
       
      
      private var _container:SymbolBoosterGeneric = null;
      
      private var _type:int = 0;
      
      private var _boosterId:String = null;
      
      private var _expirationTimestamp:int = 0;
      
      private var _tooltip:UiTextTooltip = null;
      
      public function UiBoosterIcon(param1:SymbolBoosterGeneric, param2:int)
      {
         _container = param1;
         _type = param2;
         super(_container);
         _tooltip = new UiTextTooltip(this,"");
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
      
      public function get container() : SymbolBoosterGeneric
      {
         return _container;
      }
      
      override public function dispose() : void
      {
         _container = null;
         _tooltip.dispose();
         _tooltip = null;
         super.dispose();
      }
      
      public function refresh(param1:String, param2:int, param3:Character = null) : void
      {
         var _loc6_:* = null;
         _boosterId = param1;
         _expirationTimestamp = param2;
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc7_:String = UiBoosterIcon.getExpirationDateTime(param2);
         if(_boosterId != "")
         {
            _loc6_ = CBooster.fromId(_boosterId);
            _loc5_ = _loc6_.amount;
            _loc4_ = _loc6_.duration;
         }
         if(_expirationTimestamp != -1)
         {
            if(_expirationTimestamp < TimeUtil.now)
            {
               _loc5_ = 0;
            }
         }
         _container.type1Silhouette.visible = _type == 1 && _loc5_ == 0;
         _container.type2Silhouette.visible = _type == 2 && _loc5_ == 0;
         _container.type3Silhouette.visible = _type == 3 && _loc5_ == 0;
         _container.type1Strength1.visible = _type == 1 && _loc5_ == 10;
         _container.type1Strength2.visible = _type == 1 && _loc5_ == 25;
         _container.type1Strength3.visible = _type == 1 && _loc5_ == 50;
         _container.type2Strength1.visible = _type == 2 && _loc5_ == 10;
         _container.type2Strength2.visible = _type == 2 && _loc5_ == 25;
         _container.type2Strength3.visible = _type == 2 && _loc5_ == 50;
         _container.type3Strength1.visible = _type == 3 && _loc5_ == 10;
         _container.type3Strength2.visible = _type == 3 && _loc5_ == 25;
         _container.type3Strength3.visible = _type == 3 && _loc5_ == 50;
         if(param2 == -1 && param3 == null)
         {
            _tooltip.text = "";
            return;
         }
         switch(int(_type) - 1)
         {
            case 0:
               if(_loc5_ == 0 && param3 == null)
               {
                  _tooltip.text = LocText.current.text("general/boost_quest_tooltip");
               }
               else if(_loc5_ == 0 && param3 != null)
               {
                  _tooltip.text = LocText.current.text("general/boost_quest_enemy_tooltip",param3.name);
               }
               else if(param3)
               {
                  _tooltip.text = LocText.current.text("general/boost_quest_active_custom_tooltip",_loc5_);
               }
               else
               {
                  _tooltip.text = LocText.current.text("general/boost_quest_active_tooltip",_loc5_,_loc7_);
               }
               break;
            case 1:
               if(_loc5_ == 0 && param3 == null)
               {
                  _tooltip.text = LocText.current.text("general/boost_stat_tooltip");
               }
               else if(_loc5_ == 0 && param3 != null)
               {
                  _tooltip.text = LocText.current.text("general/boost_stat_enemy_tooltip",param3.name);
               }
               else if(param3)
               {
                  _tooltip.text = LocText.current.text("general/boost_stat_active_custom_tooltip",_loc5_);
               }
               else
               {
                  _tooltip.text = LocText.current.text("general/boost_stat_active_tooltip",_loc5_,_loc7_);
               }
               break;
            case 2:
               if(_loc5_ == 0 && param3 == null)
               {
                  _tooltip.text = LocText.current.text("general/boost_work_tooltip");
                  break;
               }
               if(_loc5_ == 0 && param3 != null)
               {
                  _tooltip.text = LocText.current.text("general/boost_work_enemy_tooltip",param3.name);
                  break;
               }
               if(param3)
               {
                  _tooltip.text = LocText.current.text("general/boost_work_active_custom_tooltip",_loc5_);
                  break;
               }
               _tooltip.text = LocText.current.text("general/boost_work_active_tooltip",_loc5_,_loc7_);
               break;
         }
      }
   }
}
