package com.playata.application.ui.elements.event
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CBooster;
   import com.playata.application.data.titles.Titles;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.event.SymbolEventQuestRewardGeneric;
   
   public class UiEventQuestReward
   {
       
      
      private var _content:SymbolEventQuestRewardGeneric = null;
      
      private var _tooltip:UiTextTooltip = null;
      
      public function UiEventQuestReward(param1:SymbolEventQuestRewardGeneric)
      {
         super();
         _content = param1;
         _tooltip = new UiTextTooltip(_content,"");
      }
      
      public function dispose() : void
      {
         _tooltip.dispose();
         _tooltip = null;
      }
      
      public function refresh(param1:int, param2:Number, param3:String) : void
      {
         var _loc6_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _content.iconXP.visible = param1 == 4;
         _content.iconStatPoints.visible = param1 == 3;
         _content.iconPremiumCurrency.visible = param1 == 2;
         _content.iconGameCurrency.visible = param1 == 1;
         _content.iconBooster.visible = param1 == 5;
         _content.iconTitle.visible = param1 == 6;
         _content.iconItem.visible = false;
         _content.itemSlot.visible = false;
         switch(int(param1) - 1)
         {
            case 0:
               setValue(param1,"???",LocText.current.text("dialog/event_quest/reward/game_currency_tooltip"));
               break;
            case 1:
               setValue(param1,GameUtil.getPremiumCurrencyString(int(param2)),LocText.current.text("dialog/event_quest/reward/premium_currency_tooltip"));
               break;
            case 2:
               setValue(param1,GameUtil.getStatPointString(int(param2)),LocText.current.text("dialog/event_quest/reward/stat_points_tooltip"));
               break;
            case 3:
               setValue(param1,"???",LocText.current.text("dialog/event_quest/reward/xp_tooltip"));
               break;
            case 4:
               _loc6_ = CBooster.fromId(param3);
               _loc4_ = _loc6_.amount;
               _loc5_ = _loc6_.type;
               _content.txtValue.text = "+" + LocText.current.text("general/time_day",param2);
               switch(int(_loc5_) - 1)
               {
                  case 0:
                     _tooltip.text = LocText.current.text("general/boost_quest_active_custom_tooltip",_loc4_);
                     break;
                  case 1:
                     _tooltip.text = LocText.current.text("general/boost_stat_active_custom_tooltip",_loc4_);
                     break;
                  case 2:
                     _tooltip.text = LocText.current.text("general/boost_work_active_custom_tooltip",_loc4_);
               }
               _content.iconBooster.type1Silhouette.visible = false;
               _content.iconBooster.type2Silhouette.visible = false;
               _content.iconBooster.type3Silhouette.visible = false;
               _content.iconBooster.type1Strength1.visible = param3 == "booster_quest1";
               _content.iconBooster.type1Strength2.visible = param3 == "booster_quest2";
               _content.iconBooster.type1Strength3.visible = param3 == "booster_quest3";
               _content.iconBooster.type2Strength1.visible = param3 == "booster_stats1";
               _content.iconBooster.type2Strength2.visible = param3 == "booster_stats2";
               _content.iconBooster.type2Strength3.visible = param3 == "booster_stats3";
               _content.iconBooster.type3Strength1.visible = param3 == "booster_work1";
               _content.iconBooster.type3Strength2.visible = param3 == "booster_work2";
               _content.iconBooster.type3Strength3.visible = param3 == "booster_work3";
               break;
            case 5:
               setValue(param1,LocText.current.text("general/title"),LocText.current.text("dialog/sewing_machine/info_progress_title",Titles.instance.getNameWithTitle(User.current.character.name,param3)));
         }
      }
      
      public function setValue(param1:int, param2:String, param3:String = null) : void
      {
         _content.iconXP.visible = param1 == 4;
         _content.iconStatPoints.visible = param1 == 3;
         _content.iconPremiumCurrency.visible = param1 == 2;
         _content.iconGameCurrency.visible = param1 == 1;
         _content.iconBooster.visible = param1 == 5;
         _content.iconTitle.visible = param1 == 6;
         _content.iconItem.visible = false;
         _content.itemSlot.visible = false;
         _content.txtValue.text = param2;
         if(param3)
         {
            _tooltip.text = param3;
         }
      }
   }
}
