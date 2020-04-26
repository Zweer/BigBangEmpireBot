package com.playata.application.ui.elements.bonus
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.bonus.DailyBonusLookup;
   import com.playata.application.data.bonus.DailyBonusReward;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.dialogs.DialogCollectDailyBonusReward;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.bonus.SymbolDailyBonusRewardButtonGeneric;
   
   public class UiDailyBonusBase
   {
       
      
      private var _container:IDisplayObject = null;
      
      private var _dailyBonusLookupType:int = 0;
      
      private var _rewardData:TypedObject;
      
      private var _dailyBonusLookup:DailyBonusLookup;
      
      private var _buttons:Vector.<UiDailyBonusButton>;
      
      private var _tooltip:UiTextTooltip = null;
      
      public function UiDailyBonusBase(param1:IDisplayObject, param2:int, param3:int)
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         _buttons = new Vector.<UiDailyBonusButton>();
         super();
         _container = param1;
         _dailyBonusLookupType = param2;
         _loc5_ = 0;
         while(_loc5_ < param3)
         {
            _loc4_ = new UiDailyBonusButton(getRewardButton(_loc5_),background);
            _buttons.push(_loc4_);
            _loc5_++;
         }
         _tooltip = new UiTextTooltip(frame,"");
         _container.visible = false;
         fill.width = 1;
      }
      
      protected function getRewardButton(param1:int) : SymbolDailyBonusRewardButtonGeneric
      {
         return null;
      }
      
      protected function get txtCount() : ILabel
      {
         return null;
      }
      
      protected function get background() : IDisplayObject
      {
         return null;
      }
      
      protected function get fill() : IDisplayObject
      {
         return null;
      }
      
      protected function get frame() : IDisplayObject
      {
         return null;
      }
      
      private function setRewardData(param1:TypedObject) : void
      {
         _rewardData = param1.getTypedObject(_dailyBonusLookupType.toString());
         refresh();
      }
      
      public function refresh() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         if(!_container)
         {
            return;
         }
         if(_dailyBonusLookupType == 1 && !AppConfig.dailyBonusHerobookEnabled)
         {
            return;
         }
         if(_dailyBonusLookupType == 2 && !AppConfig.dailyBonusDuelEnabled)
         {
            return;
         }
         if(!User.current.character.hasTutorialFlag("tutorial_finished"))
         {
            return;
         }
         _dailyBonusLookup = User.current.character.dailyBonusLookup;
         if(!_rewardData || !_dailyBonusLookup.rewardDataIsUpToDate)
         {
            _dailyBonusLookup.requestRewardData(setRewardData);
            _rewardData = null;
            return;
         }
         if(!_container.visible)
         {
            _container.alpha = 0;
            _container.visible = true;
            _container.tweenTo(0.5,{"alpha":1});
         }
         fill.tweenTo(0.5,{"width":(background.width - 10) * (currentValue / maxValue)});
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = _rewardData.keys;
         for each(var _loc4_ in _rewardData.keys)
         {
            _loc2_ = parseInt(_loc4_);
            if(_loc3_ < _buttons.length)
            {
               _buttons[_loc3_].refresh(_loc2_,currentValue,maxValue,_dailyBonusLookupType,_rewardData.getTypedObject(_loc2_.toString()));
               _loc3_++;
            }
            if(!DialogCollectDailyBonusReward._isOpen)
            {
               _loc1_ = _dailyBonusLookup.getReward(_dailyBonusLookupType,_loc2_);
               if(_loc1_)
               {
                  Environment.panelManager.showDialog(new DialogCollectDailyBonusReward(_loc1_));
               }
            }
         }
         txtCount.text = currentValue + "/" + maxValue;
         switch(int(_dailyBonusLookupType) - 1)
         {
            case 0:
               _tooltip.text = LocText.current.text("daily_bonus/herobook/info",currentValue,maxValue);
               break;
            case 1:
               _tooltip.text = LocText.current.text("daily_bonus/duel_battles/info",currentValue,maxValue);
         }
      }
      
      private function get currentValue() : int
      {
         var _loc1_:int = 0;
         switch(int(_dailyBonusLookupType) - 1)
         {
            case 0:
               _loc1_ = _dailyBonusLookup.herobookDailyCompleted;
               break;
            case 1:
               _loc1_ = _dailyBonusLookup.duelBattleWon;
         }
         return Math.min(_loc1_,maxValue);
      }
      
      private function get maxValue() : int
      {
         if(!_rewardData)
         {
            return 0;
         }
         var _loc2_:* = 0;
         var _loc1_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = _rewardData.keys;
         for each(var _loc3_ in _rewardData.keys)
         {
            _loc1_ = parseInt(_loc3_);
            if(_loc1_ > _loc2_)
            {
               _loc2_ = _loc1_;
            }
         }
         return _loc2_;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         _container = null;
         _dailyBonusLookup = null;
         _rewardData = null;
         _loc1_ = 0;
         while(_loc1_ < _buttons.length)
         {
            _buttons[_loc1_].dispose();
            _loc1_++;
         }
         _buttons.length = 0;
         _buttons = null;
      }
   }
}
