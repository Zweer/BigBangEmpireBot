package com.playata.application.ui.elements.bonus
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CLevel;
   import com.playata.application.data.user.User;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.controls.Tooltip;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.bonus.SymbolUiDailyBonusRewardTooltipGeneric;
   
   public class UiDailyBonusRewardTooltip extends Tooltip
   {
       
      
      protected var _tooltip:SymbolUiDailyBonusRewardTooltipGeneric = null;
      
      private var _interactiveDisplayObject:IInteractiveDisplayObject = null;
      
      public function UiDailyBonusRewardTooltip(param1:IDisplayObject)
      {
         if(param1 is IInteractiveDisplayObject)
         {
            _interactiveDisplayObject = param1 as IInteractiveDisplayObject;
         }
         else if(param1)
         {
            _interactiveDisplayObject = new InteractiveDisplayObject(param1);
         }
         _tooltip = new SymbolUiDailyBonusRewardTooltipGeneric();
         _tooltip.visible = false;
         _tooltip.txtRewardsCaption.text = LocText.current.text("daily_bonus/reward_caption");
         _tooltip.txtRewards.autoFontSize = true;
         super(_interactiveDisplayObject,_tooltip);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _tooltip = null;
      }
      
      public function refresh(param1:int, param2:int, param3:int, param4:int, param5:int, param6:String) : void
      {
         var _loc10_:int = 0;
         var _loc9_:int = 0;
         var _loc8_:int = 0;
         _tooltip.visible = true;
         if(param1 >= param2)
         {
            switch(int(param3) - 1)
            {
               case 0:
                  _tooltip.tooltip.text = LocText.current.text("daily_bonus/herobook/tooltip_collected");
                  break;
               case 1:
                  _tooltip.tooltip.text = LocText.current.text("daily_bonus/duel_battles/tooltip_collected");
                  break;
               case 2:
                  _tooltip.tooltip.text = LocText.current.text("daily_bonus/quest_energy_spent/tooltip_collected");
            }
         }
         else
         {
            switch(int(param3) - 1)
            {
               case 0:
                  _tooltip.tooltip.text = LocText.current.text("daily_bonus/herobook/tooltip_not_collected",param1,param2);
                  break;
               case 1:
                  _tooltip.tooltip.text = LocText.current.text("daily_bonus/duel_battles/tooltip_not_collected",param1,param2);
                  break;
               case 2:
                  _tooltip.tooltip.text = LocText.current.text("daily_bonus/quest_energy_spent/tooltip_not_collected",param1,param2);
            }
         }
         _tooltip.tooltip.height = _tooltip.tooltip.textHeight + 10;
         _tooltip.iconQuestEnergy.visible = param4 == 1;
         _tooltip.iconXp.visible = param4 == 2 || param4 == 8;
         _tooltip.iconItem.visible = param4 == 3;
         _tooltip.iconStatPoints.visible = param4 == 4;
         _tooltip.iconPremiumCurrency.visible = param4 == 5;
         _tooltip.iconFans.visible = param4 == 6;
         _tooltip.iconStreamingResource.visible = param4 == 7;
         _tooltip.iconHead.visible = false;
         _tooltip.iconLegs.visible = false;
         _tooltip.iconChest.visible = false;
         _tooltip.iconBelt.visible = false;
         _tooltip.iconBoots.visible = false;
         _tooltip.iconRing.visible = false;
         _tooltip.iconNecklace.visible = false;
         _tooltip.iconPiercing.visible = false;
         _tooltip.iconGadget.visible = false;
         _tooltip.iconMissile.visible = false;
         _tooltip.iconItem.visible = false;
         var _loc7_:Character = User.current.character;
         switch(int(param4) - 1)
         {
            case 0:
               _tooltip.txtRewards.text = GameUtil.getEnergyString(param5);
               break;
            case 1:
               _tooltip.txtRewards.text = GameUtil.getXpString(param5);
               break;
            case 2:
               var _loc12_:* = param6;
               switch(_loc12_)
               {
                  case "random_epic_head":
                     _tooltip.txtRewards.text = LocText.current.text("daily_bonus/reward/random_epic_head");
                     _tooltip.iconHead.visible = true;
                     break;
                  case "random_epic_legs":
                     _tooltip.txtRewards.text = LocText.current.text("daily_bonus/reward/random_epic_legs");
                     _tooltip.iconLegs.visible = true;
                     break;
                  case "random_epic_chest":
                     _tooltip.txtRewards.text = LocText.current.text("daily_bonus/reward/random_epic_chest");
                     _tooltip.iconChest.visible = true;
                     break;
                  case "random_epic_belt":
                     _tooltip.txtRewards.text = LocText.current.text("daily_bonus/reward/random_epic_belt");
                     _tooltip.iconBelt.visible = true;
                     break;
                  case "random_epic_boots":
                     _tooltip.txtRewards.text = LocText.current.text("daily_bonus/reward/random_epic_boots");
                     _tooltip.iconBoots.visible = true;
                     break;
                  case "random_epic_ring":
                     _tooltip.txtRewards.text = LocText.current.text("daily_bonus/reward/random_epic_ring");
                     _tooltip.iconRing.visible = true;
                     break;
                  case "random_epic_necklace":
                     _tooltip.txtRewards.text = LocText.current.text("daily_bonus/reward/random_epic_necklace");
                     _tooltip.iconNecklace.visible = true;
                     break;
                  case "random_epic_piercing":
                     _tooltip.txtRewards.text = LocText.current.text("daily_bonus/reward/random_epic_piercing");
                     _tooltip.iconPiercing.visible = true;
                     break;
                  case "random_epic_gadget":
                     _tooltip.txtRewards.text = LocText.current.text("daily_bonus/reward/random_epic_gadget");
                     _tooltip.iconGadget.visible = true;
                     break;
                  case "random_epic_missiles":
                     _tooltip.txtRewards.text = LocText.current.text("daily_bonus/reward/random_epic_missile");
                     _tooltip.iconMissile.visible = true;
                     break;
                  default:
                     _tooltip.txtRewards.text = LocText.current.text("daily_bonus/reward/random_epic");
                     _tooltip.iconItem.visible = true;
               }
               break;
            case 3:
               _tooltip.txtRewards.text = GameUtil.getStatPointString(param5);
               break;
            case 4:
               _tooltip.txtRewards.text = GameUtil.getPremiumCurrencyString(param5);
               break;
            case 5:
               _tooltip.txtRewards.text = GameUtil.getFansString(param5);
               break;
            case 6:
               _tooltip.txtRewards.text = GameUtil.getStreamingResourceString(param5);
               break;
            case 7:
               _loc10_ = 0;
               if(CLevel.exists(_loc7_.level + 1))
               {
                  _loc9_ = CLevel.fromId(_loc7_.level).xp;
                  _loc8_ = CLevel.fromId(_loc7_.level + 1).xp;
                  _loc10_ = Math.ceil((_loc8_ - _loc9_) * (param5 / 100));
               }
               _tooltip.txtRewards.text = GameUtil.getXpString(_loc10_);
         }
         var _loc11_:Number = _tooltip.tooltip.y + _tooltip.tooltip.textHeight;
         _tooltip.txtRewardsCaption.y = _loc11_ + 6;
         _loc11_ = _tooltip.txtRewardsCaption.y + 20;
         _loc12_ = _loc11_;
         _tooltip.iconMissile.y = _loc12_;
         _loc12_ = _loc12_;
         _tooltip.iconGadget.y = _loc12_;
         _loc12_ = _loc12_;
         _tooltip.iconPiercing.y = _loc12_;
         _loc12_ = _loc12_;
         _tooltip.iconNecklace.y = _loc12_;
         _loc12_ = _loc12_;
         _tooltip.iconRing.y = _loc12_;
         _loc12_ = _loc12_;
         _tooltip.iconBoots.y = _loc12_;
         _loc12_ = _loc12_;
         _tooltip.iconBelt.y = _loc12_;
         _loc12_ = _loc12_;
         _tooltip.iconChest.y = _loc12_;
         _loc12_ = _loc12_;
         _tooltip.iconLegs.y = _loc12_;
         _tooltip.iconHead.y = _loc12_;
         _loc11_ = _loc11_ + 4;
         _tooltip.iconFans.y = _loc11_;
         _loc11_ = _loc11_ + 1;
         _tooltip.txtRewards.y = _loc11_;
         _loc11_ = _loc11_ + 1;
         _loc12_ = _loc11_;
         _tooltip.iconStatPoints.y = _loc12_;
         _loc12_ = _loc12_;
         _tooltip.iconPremiumCurrency.y = _loc12_;
         _loc12_ = _loc12_;
         _tooltip.iconItem.y = _loc12_;
         _tooltip.iconQuestEnergy.y = _loc12_;
         _loc11_ = _loc11_ + 2;
         _tooltip.iconXp.y = _loc11_;
         _loc11_ = _loc11_ + 7;
         _tooltip.iconStreamingResource.y = _loc11_;
         _loc11_ = _loc11_ + 40;
         _tooltip.background.height = _loc11_;
      }
   }
}
