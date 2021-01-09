package com.playata.application.ui.elements.bonus
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.filter.SaturationFilter;
   import visuals.ui.elements.bonus.SymbolDailyBonusRewardButtonGeneric;
   
   public class UiDailyBonusButton
   {
       
      
      private var _container:SymbolDailyBonusRewardButtonGeneric = null;
      
      private var _progressBar:IDisplayObject = null;
      
      private var _targetValue:int = 0;
      
      private var _dailyRewardToltip:UiDailyBonusRewardTooltip = null;
      
      public function UiDailyBonusButton(param1:SymbolDailyBonusRewardButtonGeneric, param2:IDisplayObject)
      {
         super();
         _container = param1;
         _progressBar = param2;
         _dailyRewardToltip = new UiDailyBonusRewardTooltip(param1);
      }
      
      public function refresh(param1:int, param2:int, param3:int, param4:int, param5:TypedObject) : void
      {
         _targetValue = param1;
         _container.x = _progressBar.x + (_progressBar.width - 10) * param1 / param3;
         _container.line.visible = param1 < param3;
         if(_container.line.visible)
         {
            _container.x = _container.x - 5;
         }
         _container.removeAllFilters();
         if(param2 < param1)
         {
            _container.addFilter(new SaturationFilter(-0.6));
         }
         _container.iconQuestEnergy.visible = param5.getInt("reward_type") == 1;
         _container.iconXp.visible = param5.getInt("reward_type") == 2 || param5.getInt("reward_type") == 8;
         _container.iconStatPoints.visible = param5.getInt("reward_type") == 4;
         _container.iconPremiumCurrency.visible = param5.getInt("reward_type") == 5;
         _container.iconFans.visible = param5.getInt("reward_type") == 6;
         _container.iconStreamingResource.visible = param5.getInt("reward_type") == 7;
         _container.iconHead.visible = false;
         _container.iconLegs.visible = false;
         _container.iconChest.visible = false;
         _container.iconBelt.visible = false;
         _container.iconBoots.visible = false;
         _container.iconRing.visible = false;
         _container.iconNecklace.visible = false;
         _container.iconPiercing.visible = false;
         _container.iconGadget.visible = false;
         _container.iconMissile.visible = false;
         _container.iconItem.visible = false;
         if(param5.getInt("reward_type") == 3)
         {
            var _loc6_:* = param5.getString("reward_identifier");
            switch(_loc6_)
            {
               case "random_epic_head":
                  _container.iconHead.visible = true;
                  break;
               case "random_epic_legs":
                  _container.iconLegs.visible = true;
                  break;
               case "random_epic_chest":
                  _container.iconChest.visible = true;
                  break;
               case "random_epic_belt":
                  _container.iconBelt.visible = true;
                  break;
               case "random_epic_boots":
                  _container.iconBoots.visible = true;
                  break;
               case "random_epic_ring":
                  _container.iconRing.visible = true;
                  break;
               case "random_epic_necklace":
                  _container.iconNecklace.visible = true;
                  break;
               case "random_epic_piercing":
                  _container.iconPiercing.visible = true;
                  break;
               case "random_epic_gadget":
                  _container.iconGadget.visible = true;
                  break;
               case "random_epic_missiles":
                  _container.iconMissile.visible = true;
                  break;
               default:
                  _container.iconItem.visible = true;
            }
         }
         _dailyRewardToltip.refresh(param2,param1,param4,param5.getInt("reward_type"),param5.getInt("reward_value"),param5.getString("reward_identifier"));
      }
      
      public function dispose() : void
      {
         _container = null;
         _dailyRewardToltip.dispose();
         _dailyRewardToltip = null;
      }
   }
}
